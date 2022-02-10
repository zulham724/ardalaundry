<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\ModuleContent;
use App\Models\File;
use Illuminate\Support\Facades\Storage;
use Thumbnail;
use Illuminate\Http\Request;
use Lakshmaji\Thumbnail\Thumbnail as ThumbnailThumbnail;

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
        // return dd($request->video);
        $validate = $request->validate([
            'tittle' => 'required',
            'module_id' => 'required',
            'description' => 'required',
            'video' => 'required'
        ]);
        // return dd($request->all());

        if ($validate) {
            $moduleContent = new ModuleContent($request->all());
            $moduleContent->save();
            if ($request->hasFile('video')) {

                $file = new File();
                $path = $request->file('video')->store('videos', 'public');
                $file->src = $path;
                $file->filetype = $request->file('video')->getClientMimeType();
                $moduleContent->video()->save($file);

                //make Thumbnail
                //storage thumbnail
                $thumbnail_path =  public_path() . '/storage/thumbnails';

                //set thumbnail image name
                $timestamp = str_replace([' ', ':'], '-', \Carbon\Carbon::now()->toDateString());
                $thumbnail_image = 'admin_' . $timestamp . ".jpg";

                // get video length and process it
                // assign the value to time_to_image (which will get screenshot of video at that specified seconds)
                //  $time_to_image    = floor(($data['video_length'])/2);
                $time_to_image = 0.1;
                $thumbnail_status    = Thumbnail::getThumbnail($request->file('video'), $thumbnail_path, $thumbnail_image, $time_to_image);

                // $storagePublic = Storage::disk('public')->get('/thumbnails' . $thumbnail_image);

                // if($storagePublic){
                $thumbnail = new File();
                $thumbnail->src = '/thumbnails//' . $thumbnail_image;
                $thumbnail->filetype = 'image/jpeg';
                $moduleContent->thumbnail()->save($thumbnail);
                // }

            }
        }

        return response()->json($moduleContent->load(["video", "thumbnail"]));
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
        return ModuleContent::with('video')->findOrFail($id);
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
    public function destroy($id)
    {
        //
        return ModuleContent::findOrFail($id)->delete();
    }
}
