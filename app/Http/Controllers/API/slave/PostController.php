<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\File;
use App\Models\Like;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

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
            'comments.user',
            'files',
            'user.shop'
        ])
            ->has('author')
            ->withCount('comments', 'likes', 'liked', 'readers', 'hasRead as hasRead')
            ->orderBy('id', 'desc')
            ->paginate(2);
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
                $path = $request->file('files')[$f]->store('files', ENV('FILESYSTEM_DRIVER'));
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
            'files',
        ]));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return Post::with("comments.user.shop", "comments.replies_comment", "comments_from_other", "author.shop")
            ->findOrFail($id);
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

    public function like($postid)
    {
        $post = Post::findOrFail($postid);

        $like = new Like();
        $like->user_id = auth('api')->user()->id;
        $post->liked()->save($like);

        return response()->json($post->loadCount(["liked", "likes"]));
    }

    public function dislike($postid)
    {
        $post = Post::findOrFail($postid);
        $like = Like::where('user_id', auth('api')->user()->id)
            ->where('likeable_id', $postid)->first();
        $like->delete();
        return response()->json($post->loadCount(["liked", "likes"]));
    }

    public function getPostByUser($userid)
    {
        return Post::with([
            'images',
            'videos',
            'bookmarks',
            'bookmarked',
            'author',
            'comments.user',
            'files',
            'user.shop'
        ])
            ->has('author')
            ->withCount('comments', 'likes', 'liked', 'readers', 'hasRead as hasRead')
            ->where('author_id', $userid)
            ->orderBy('id', 'desc')
            ->paginate(2);
    }

    public function getLikedPostByUser($userid)
    {
        return Post::with([
            'images',
            'videos',
            'bookmarks',
            'bookmarked',
            'author',
            'comments.user',
            'files',
            'user.shop'
        ])
            ->has('author')
            ->withCount('comments', 'likes', 'liked', 'readers', 'hasRead as hasRead')
            ->whereHas('liked')
            ->orderBy('id', 'desc')
            ->paginate(2);
    }
}
