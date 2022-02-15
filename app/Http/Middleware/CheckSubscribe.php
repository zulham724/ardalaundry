<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckSubscribe
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $pass = true;
        $master = \App\Models\User::whereHas('slaves', function ($query) use ($request) {
            $query->where('slave_id', $request->user()->id);
        })
            ->withCount(['slaves'])
            ->with(['active_package_user' => function ($query) {
                $query->with('payment', 'package.package_limits');
            }])
            ->firstOrFail();
        // return response($master, 500);

        foreach ($master->active_package_user->package->package_limits as $key => $limit) {
            # code...
            if ($master->{$limit->entity} > $limit->limit) {
                $pass = false;
            }
        }

        $res = \App\Models\PackageUser::with('package')->where('user_id', $master->id)->orderBy('created_at', 'desc')->first();
        // return $res->expired_date;
        if (new \DateTime($res->expired_date) < new \DateTime()) {
            $pass = false;
        }

        if ($pass) {
            return response()->json(new \DateTime($res->expired_date), new \DateTime());
            return $next($request);
        } else {
            return response()->json($res);
            return response('Masa Pakai Habis atau Melebihi syarat paket', 500);
        }
    }
}
