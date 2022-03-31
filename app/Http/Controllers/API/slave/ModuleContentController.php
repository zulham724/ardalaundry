<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Like;
use App\Models\ModuleContent;
use App\Models\Read;
use Illuminate\Http\Request;

class ModuleContentController extends Controller
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
     * @param  \App\Models\ModuleContent  $moduleContent
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $content = ModuleContent::with('thumbnail', 'video')
            ->withCount('liked')
            ->findOrFail($id);

        return response()->json($content);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ModuleContent  $moduleContent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ModuleContent $moduleContent)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ModuleContent  $moduleContent
     * @return \Illuminate\Http\Response
     */
    public function destroy(ModuleContent $moduleContent)
    {
        //
    }

    public function like($id)
    {
        // return response()->json($id);
        $content = ModuleContent::findOrFail($id);
        $like = new Like();
        $like->user_id = auth('api')->user()->id;
        $content->liked()->save($like);

        return response()->json($content->loadCount(['liked']));

    }

    public function dislike($id)
    {
        $content = ModuleContent::findOrFail($id);
        $like = Like::where('user_id', auth('api')->user()->id)
            ->where('likeable_id', $id);
        $like->delete();
        return response()->json($content->loadCount(['liked']));
    }

    public function read(Request $request, $id)
    {
        $content = ModuleContent::findOrFail($id);
        $read = new Read();
        $read->user_id = auth('api')->user()->id;
        $content->reads()->save($read);

        return response()->json($content->loadCount(['reads']));
    }
}
