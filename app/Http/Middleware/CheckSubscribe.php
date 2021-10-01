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
        $res = \App\Models\PackageUser::with('package')->where('user_id',$request->user()->id)->orderBy('created_at')->first();
        // return $res->expired_date;
        if(new \DateTime($res->expired_date) < new \DateTime()){
            return response('Masa Pakai Habis',500);
        }
        return $next($request);
    }
}
