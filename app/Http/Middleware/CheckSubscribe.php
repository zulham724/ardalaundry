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
        $errors = [];
        $pass = true;
        $master = \App\Models\User::whereHas('slaves', function ($query) use ($request) {
            $query->where('slave_id', $request->user()->id);
        })
            ->withCount(['slaves'])
            ->with(['active_package_user' => function ($query) {
                $query->with('payment', 'package.package_limits');
            }])
            ->has('active_package_user')
            ->firstOrFail();
        // return response($master, 500);

        foreach ($master->active_package_user->package->package_limits as $key => $limit) {
            # code...
            if ($master->{$limit->entity} > $limit->limit) {
                // return response()->json(['error' => 'Your package is expired'], 401);
                $errors["$limit->entity"] = "Your $limit->entity limit is exceeded";
                $pass = false;
            }
        }

        if ($master->isExpired) {
            $errors["package"] = "Your package is expired";
            $pass = false;
        }

        if ($pass) {
            return $next($request);
        } else {
            return response()->json([
                'message' => 'Masa Pakai Habis atau Melebihi syarat paket',
                'errors' => $errors,
            ], 500);
        }
    }
}
