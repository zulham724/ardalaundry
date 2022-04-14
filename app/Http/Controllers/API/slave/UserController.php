<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\File;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

/**
 * @group  Cabang SDM
 *
 * API untuk manajemen SDM di Cabang
 */

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return User::with('shop')->where('id', $id)->get();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $res = User::findOrFail($id);
        $res->fill($request->all());
        $res->update();

        $res->shop()->firstOrFail()->update(['name' => $request->shop['name']]);

        return $res->load('shop');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }

    /**
     * Mendaftarkan Pelanggan
     *
     * API untuk mendaftarkan pelanggan melalui Cabang
     *
     * @queryParam name Nama dari pelanggan. contoh: Agus
     */

    public function register_customer(Request $request)
    {
        $customer = new User($request->all());
        $customer->role_id = 6;
        $customer->password = bcrypt($request->password);
        $customer->save();
    }

    public function update_customer(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $user->fill($request->all());
        $user->update();

        return $user;
    }

    public function add_customer(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required',
        ]);

        $customer = new User();
        $customer->role_id = 6;
        $customer->name = $request->name;
        $customer->email = $request->email;
        $customer->password = bcrypt($request->password);
        $customer->save();
    }

    public function add_wa_number(Request $request)
    {
        // return response()->json($request->all());
        $user = User::findOrFail(auth('api')->user()->id);
        $user->update($request->all());
        return response()->json($user);
    }

    public function updateAvatar(Request $request, $id)
    {
        // return response()->json($request->hasFile('avatar'));
        $user = User::findOrFail($id);
        $user->fill($request->all());
        if ($request->hasFile('avatar')) {
            $path = $request->file('avatar')->store('avatar', ENV("FILESYSTEM_DRIVER"));
            // $avatar->src = $path;
            $user->avatar = $path;
        }
        $user->save();
        return response()->json($user);
    }

    public function updateAccount(Request $request, $id)
    {
        $res = User::findOrFail($id);
        $res->fill($request->all());
        $res->update();
        if ($request->has('shop')) {
            $res->shop()->firstOrFail()->update([
                'name' => $request->shop['name'],
                'description' => $request->shop['description'],
            ]);
        }

        return $res->load('shop');
    }

    public function changePassword(Request $request)
    {
        $user = User::findOrFail(auth('api')->user()->id);
        if (Hash::check($request->old_password, $user->password)) {
            $user->password = bcrypt($request->new_password);
            $user->update();
            return response()->json(['message' => 'Password berhasil diubah']);
        } else {
            return response()->json(['message' => 'Password lama tidak sesuai'], 422);
        }
    }

    public function login(Request $request)
    {
        return response()->json($request->all());
    }

    public function getProfileById($userid)
    {
        $user = User::findOrFail($userid);
        return response()->json($user->load('shop', 'master'));
    }
}
