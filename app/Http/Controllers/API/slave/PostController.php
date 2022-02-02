<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\File;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Post::with([
            'images',
            'videos',
            'bookmarks',
            'bookmarked',
            'author',
            'files'
        ])
            ->withCount('comments', 'likes', 'liked', 'readers', 'hasRead as hasRead')
            ->orderBy('id', 'desc')
            ->paginate(3);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return dd($request->all());
        $post = new Post($request->all());
        $post->author_id = auth('api')->user()->id;
        $post->slug = Str::random(8);
        $post->save();
        if ($request->hasFile('files')) {
            foreach ($request->file('files') as $f => $file) {
                // return dd($request->file('files')[$f]->getClientMimeType());
                $file = new File();
                $path = $request->file('files')[$f]->store('files', 'public');
                $file->src = $path;
                $file->name =
                    $request->file('files')[$f]->getClientOriginalName();
                $file->filetype = $request->file('files')[$f]->getClientMimeType();
                $post->files()->save($file);
            }
        }

        return response()->json($post->load([
            'images',
            'videos',
            'files'
        ]));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        //
    }
}
