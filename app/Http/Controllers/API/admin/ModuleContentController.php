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
        // return response()->json($request->hasFile('thumbnail'));
        // return response()->json($request->all());

        $request->validate([
            'module_id' => 'required',
            'tittle' => 'required',
            'description' => 'required',
            'type' => 'required',
            'image_content' => 'required_if:type,image',
            // 'video' => 'required|mimes:mp4,mov,ogg,qt|max:30000',
            'video' => 'required_if:type,video|max:30000',
            'thumbnail' => 'required_if:type,image',
        ]);

        $content = new ModuleContent($request->all());
        $content->save();
        if ($request->hasFile('video')) {
            $video = new File();
            $video->name = $request->file('video')->getClientOriginalName();
            $video->filetype = $request->file('video')->getClientMimeType();
            $video->key = "video";
            $path = $request->file('video')->store('videos', ENV("FILESYSTEM_DRIVER"));
            $video->src = $path;
            $content->video()->save($video);
        }
        if ($request->hasFile('image_content')) {
            $image_content = new File();
            $image_content->name = $request->file('image_content')->getClientOriginalName();
            $image_content->filetype = $request->file('image_content')->getClientMimeType();
            $image_content->key = "image_content";
            $path = $request->file('image_content')->store('images', ENV("FILESYSTEM_DRIVER"));
            $image_content->src = $path;
            $content->image_content()->save($image_content);
        }
        if ($request->hasFile('thumbnail')) {
            $thumbnail = new File();
            $thumbnail->name = $request->file('thumbnail')->getClientOriginalName();
            $thumbnail->filetype = $request->file('thumbnail')->getClientMimeType();
            $thumbnail->key = "thumbnail";
            $path = $request->file('thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
            $thumbnail->src = $path;
            $content->thumbnail()->save($thumbnail);
        }
        return response()->json($content->load(['video', 'image_content', 'thumbnail']));
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
    public function update(Request $request, $id)
    {
        //
        // return response()->json($request->all());
        // return response()->json($request->hasFile('image_content'));
        $request->validate([
            'module_id' => 'required',
            'tittle' => 'required',
            'description' => 'required',
            'duration' => 'required',
            'type' => 'required',
            'video' => 'required_if:type,video|max:30000',

            // 'image_content' => 'required_if:type,image',
            // 'video' => 'required_if:type,video',
            // 'thumbnail' => 'required_if:type,image',
        ]);

        $moduleContent = ModuleContent::findOrFail($id);
        $moduleContent->update($request->all());

        if ($request->hasFile('video')) {
            // return 'ada video';
            $moduleContent->video()->delete();
            $video = new File();
            $video->name = $request->file('video')->getClientOriginalName();
            $video->filetype = $request->file('video')->getClientMimeType();
            $video->key = "video";
            $path = $request->file('video')->store('videos', ENV("FILESYSTEM_DRIVER"));
            $video->src = $path;
            $moduleContent->video()->save($video);                
        }
        if ($request->hasFile('thumbnail')) {
            $moduleContent->thumbnail()->delete();
            $thumbnail = new File();
            $thumbnail->name = $request->file('thumbnail')->getClientOriginalName();
            $thumbnail->filetype = $request->file('thumbnail')->getClientMimeType();
            $thumbnail->key = "thumbnail";
            $path = $request->file('thumbnail')->store('thumbnails', ENV("FILESYSTEM_DRIVER"));
            $thumbnail->src = $path;
            $moduleContent->thumbnail()->save($thumbnail);
        }
        if ($request->hasFile('image_content')) {
            $moduleContent->image_content()->delete();
            $image_content = new File();
            $image_content->name = $request->file('image_content')->getClientOriginalName();
            $image_content->filetype = $request->file('image_content')->getClientMimeType();
            $image_content->key = "image_content";
            $path = $request->file('image_content')->store('images', ENV("FILESYSTEM_DRIVER"));
            $image_content->src = $path;
            $moduleContent->image_content()->save($image_content);
        }
        return response()->json($moduleContent->load('video', 'thumbnail', 'image_content'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ModuleContent  $moduleContent
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $moduleContent = ModuleContent::findOrFail($id);
        $delete = $moduleContent->delete();
        return response()->json($delete);
    }

    public function add_module_content(Request $request)
    {
        $content = new ModuleContent($request->all());
        $content->save();
    }

    public function delete_image_content($id)
    {
        $image_content = File::findOrFail($id);
        $delete = $image_content->delete();
        return response()->json($delete);
    }

    public function delete_thumbnail_content($id)
    {
        $thumbnail = File::findOrFail($id);
        $delete = $thumbnail->delete();
        return response()->json($delete);
    }

    public function delete_video_content($id)
    {
        $video = File::findOrFail($id);
        $delete = $video->delete();
        return response()->json($delete);
    }

    public function get_module_content_by_id($id)
    {
        $module_content = ModuleContent::findOrFail($id);
        // ->with(['video', 'thumbnail', 'image_content']);
        return response()->json($module_content->load('thumbnail', 'image_content'));
    }
}
