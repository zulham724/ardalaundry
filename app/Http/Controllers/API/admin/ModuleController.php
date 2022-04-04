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
            $query->with(['video', 'thumbnail', 'image_content']);
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
            'tittle' => 'required',
            'description' => 'required',
            'is_public' => 'required',
            'contents' => 'required',
            'contents.*.tittle' => 'required',
            'contents.*.description' => 'required',
            'contents.*.duration' => 'required',
        ]);
        $module = new Module($request->all());
        $module->save();
        if ($request->hasFile('thumbnail')) {
            $thumbnail = new File();
            $thumbnail->name = $request->file('thumbnail')->getClientOriginalName();
            $thumbnail->filetype = $request->file('thumbnail')->getClientMimeType();
            $thumbnail->key = "thumbnail";
            $path = $request->file('thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
            $thumbnail->src = $path;
            $module->thumbnail()->save($thumbnail);
        }
        foreach ($request->contents as $c => $item) {
            # code...
            // return $content['duration'];
            $content = new ModuleContent($item);

            $module->contents()->save($content);
            if ($request->hasFile('contents.' . $c . '.video')) {
                $video = new File();
                $video->name = $request->file('contents.' . $c . '.video')->getClientOriginalName();
                $video->filetype = $request->file('contents.' . $c . '.video')->getClientMimeType();
                $video->key = "video";
                $path = $request->file('contents.' . $c . '.video')->store('videos', ENV("FILESYSTEM_DRIVER"));
                $video->src = $path;
                $content->video()->save($video);
            }
            if ($request->hasFile('contents.' . $c . '.image_content')) {
                $image_content = new File();
                $image_content->name = $request->file('contents.' . $c . '.image_content')->getClientOriginalName();
                $image_content->filetype = $request->file('contents.' . $c . '.image_content')->getClientMimeType();
                $image_content->key = "image_content";
                $path = $request->file('contents.' . $c . '.image_content')->store('image_content', ENV("FILESYSTEM_DRIVER"));
                $image_content->src = $path;
                $content->image_content()->save($image_content);
            }

            if ($request->hasFile('contents.' . $c . '.thumbnail')) {
                $thumbnail = new File();
                $thumbnail->name = $request->file('contents.' . $c . '.thumbnail')->getClientOriginalName();
                $thumbnail->filetype = $request->file('contents.' . $c . '.thumbnail')->getClientMimeType();
                $thumbnail->key = "thumbnail";
                $path = $request->file('contents.' . $c . '.thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
                $thumbnail->src = $path;
                $content->thumbnail()->save($thumbnail);
            }

        }
        return response()->json($module->load(['contents.video', 'contents.image_content', 'contents.thumbnail', 'thumbnail']));
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
            $query->with(['video', 'thumbnail', 'image_content']);
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
        $res = $module->delete();
        return response()->json(['message' => 'Module deleted', 'status' => $res]);
    }
}
