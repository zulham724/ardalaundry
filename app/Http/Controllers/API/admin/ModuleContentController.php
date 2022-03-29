<?php

namespace App\Http\Controllers\API\admin;

use App\Http\Controllers\Controller;
use App\Models\File;
use App\Models\ModuleContent;
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
        $request->validate([
            'module_id' => 'required',
            'title' => 'required',
            'description' => 'required',
            'image_contents' => 'required_if:type,image',
            'video' => 'required_if:type,video',
            'thumbnail' => 'required_if:type,image',
        ]);

        $content = new ModuleContent($request->all());
        $content->save();
        if ($request->hasFile('video')) {
            $video = new File();
            $video->name = $request->file('video')->getClientOriginalName();
            $video->type = $request->file('video')->getClientMimeType();
            $video->key = "video";
            $path = $request->file('video')->store('videos', ENV("FILESYSTEM_DRIVER"));
            $video->path = $path;
            $content->video()->save($video);
        }
        if ($request->hasFile('image_contents')) {
            foreach ($request->file('image_contents') as $ic => $imageContent) {
                # code...
                $image_content = new File();
                $image_content->name = $request->file('image_contents')[$ic]->getClientOriginalName();
                $image_content->type = $request->file('image_contents')[$ic]->getClientMimeType();
                $image_content->key = "image_contents";
                $path = $request->file('image_contents')[$ic]->store('images', ENV("FILESYSTEM_DRIVER"));
                $image_content->path = $path;
                $content->image_contents()->save($image_content);
            }
        }
        if ($request->hasFile('thumbnail')) {
            $thumbnail = new File();
            $thumbnail->name = $request->file('thumbnail')->getClientOriginalName();
            $thumbnail->type = $request->file('thumbnail')->getClientMimeType();
            $thumbnail->key = "thumbnail";
            $path = $request->file('thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
            $thumbnail->path = $path;
            $content->thumbnail()->save($thumbnail);
        }
        return response()->json($content->load('video', 'image_contents', 'thumbnail'));

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ModuleContent  $moduleContent
     * @return \Illuminate\Http\Response
     */
    public function show(ModuleContent $moduleContent)
    {
        //
        $moduleContent->load(['video', 'thumbnail', 'image_contents']);
        return response()->json($moduleContent);
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
        $request->validate([
            'module_id' => 'required',
            'title' => 'required',
            'description' => 'required',
            'image_contents' => 'required_if:type,image',
            'video' => 'required_if:type,video',
            'thumbnail' => 'required_if:type,image',
        ]);
        $moduleContent->update($request->all());
        if ($request->hasFile('video')) {
            $video = new File();
            $video->name = $request->file('video')->getClientOriginalName();
            $video->type = $request->file('video')->getClientMimeType();
            $video->key = "video";
            $path = $request->file('video')->store('videos', ENV("FILESYSTEM_DRIVER"));
            $video->path = $path;
            $moduleContent->video()->save($video);
        }
        if ($request->hasFile('thumbnail')) {
            $thumbnail = new File();
            $thumbnail->name = $request->file('thumbnail')->getClientOriginalName();
            $thumbnail->type = $request->file('thumbnail')->getClientMimeType();
            $thumbnail->key = "thumbnail";
            $path = $request->file('thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
            $thumbnail->path = $path;
            $moduleContent->thumbnail()->save($thumbnail);
        }
        return response()->json($moduleContent->load('video', 'thumbnail'));
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
        $moduleContent->delete();
        return response()->json($moduleContent);
    }
}
