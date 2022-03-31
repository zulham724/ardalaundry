<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Module;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ModuleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        $module = Module::has('contents')->with('banner', 'contents.video', 'contents.thumbnail')
            ->withCount(['contents as sum_duration' => function ($query) {
                $query->select(DB::raw('SUM(duration) as sum_duration'));
            }])
            ->withCount(['contents as count_is_read' => function ($query) {
                $query->select(DB::raw('COUNT(*) as count_is_read'))
                    ->whereHas('reads', function ($query) {
                        $query->where('user_id', auth('api')->user()->id);
                    });
            }])
            ->get();

        return response()->json($module);
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
     * @param  \App\Models\Module  $module
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $module = Module::with('contents.video', 'contents.thumbnail')->findOrFail($id);

        return response()->json($module);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Module  $module
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Module $module)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Module  $module
     * @return \Illuminate\Http\Response
     */
    public function destroy(Module $module)
    {
        //
    }
}
