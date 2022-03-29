<?php

namespace App\Http\Controllers\API\admin;

use App\Http\Controllers\Controller;
use App\Models\File;
use App\Models\Module;
use App\Models\ModuleContent;
use Illuminate\Http\Request;

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
        $res = Module::with(['thumbnail', 'contents' => function ($query) {
            $query->with(['video', 'thumbnail', 'image_contents']);
        }])->get();
        return response()->json($res);
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
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'video' => 'required_if:type,video',
            'thumbnail' => 'required_if:type,image',
            'contents' => 'required',
        ]);
        $module = new Module($request->all());
        $module->save();
        if ($request->hasFile('thumbnail')) {
            $thumbnail = new File();
            $thumbnail->name = $request->file('thumbnail')->getClientOriginalName();
            $thumbnail->type = $request->file('thumbnail')->getClientMimeType();
            $thumbnail->key = "thumbnail";
            $path = $request->file('thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
            $thumbnail->path = $path;
            $module->thumbnail()->save($thumbnail);
        }
        foreach ($request->contents as $c => $content) {
            # code...
            $content = new ModuleContent($request->all());
            $content->save();
            if ($request->hasFile('contents.' . $c . '.video')) {
                $video = new File();
                $video->name = $request->file('contents.' . $c . '.video')->getClientOriginalName();
                $video->type = $request->file('contents.' . $c . '.video')->getClientMimeType();
                $video->key = "video";
                $path = $request->file('contents.' . $c . '.video')->store('videos', ENV("FILESYSTEM_DRIVER"));
                $video->path = $path;
                $content->video()->save($video);
            }
        }
        return response()->json($module->load('contents.video'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Module  $module
     * @return \Illuminate\Http\Response
     */
    public function show(Module $module)
    {
        //
        $module = Module::with(['thumbnail', 'contents' => function ($query) {
            $query->with(['video', 'thumbnail', 'image_contents']);
        }])->find($module->id);
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
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'video' => 'required_if:type,video',
            'thumbnail' => 'required_if:type,image',
        ]);
        $module->update($request->all());
        if ($request->hasFile('thumbnail')) {
            $thumbnail = new File();
            $thumbnail->name = $request->file('thumbnail')->getClientOriginalName();
            $thumbnail->type = $request->file('thumbnail')->getClientMimeType();
            $thumbnail->key = "thumbnail";
            $path = $request->file('thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
            $thumbnail->path = $path;
            $module->thumbnail()->save($thumbnail);
        }
        return response()->json($module->load(['thumbnail', 'contents.video']));
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
        $module->delete();
        return response()->json(['message' => 'Module deleted']);
    }
}
