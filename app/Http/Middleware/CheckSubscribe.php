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

        $master = $request->user()->load('master')->master;

        if(count($master) == 0){
            return response('Akun ini tidak punya master', 500);
        }
        $res = \App\Models\PackageUser::with('package')->where('user_id',$master[0]->id)->orderBy('created_at')->first();
        // return $res->expired_date;
        if(new \DateTime($res->expired_date) < new \DateTime()){
            return response('Masa Pakai Habis',500);
        }
        return $next($request);
    }
}
