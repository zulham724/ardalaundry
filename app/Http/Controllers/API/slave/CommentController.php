<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Comment;
use App\Models\Post;
use App\Models\Like;
use App\Models\ModuleContent;
use Illuminate\Http\Request;

class CommentController extends Controller
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
        // return response()->json($request->all());

        $post = Post::findOrFail($request->post_id);

        $comment = new Comment($request->all());
        $comment->user_id = auth('api')->user()->id;
        $post->comments()->save($comment);

        return response()->json($post->load(["comments.user", "comments.replies_comment", "comments_from_other", "author"]));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function show(Comment $comment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Comment $comment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Comment $comment)
    {
        //
    }

    public function like($commentId){
        $comment = Comment::findOrFail($commentId);

        $like = new Like();
        $like->user_id = auth('api')->user()->id;
        $comment->liked()->save($like);

        return response()->json($comment->loadCount("liked", "likes"));
    }

    public function dislike($commentId){
        $comment = Comment::findOrFail($commentId);

        $like = Like::where('likeable_id', $commentId)
                ->where('user_id', auth('api')->user()->id);
        $like->delete();

    return response()->json($comment->loadCount("liked", "likes"));
    }

    public function add_comment_course(Request $request){
        $content = ModuleContent::findOrFail($request->id);

        $comment = new Comment($request->all());
        $comment->user_id = auth('api')->user()->id;
        $content->comments()->save($comment);
        return response()->json($content->load(["comments.user", "comments.replies_comment", "comments_from_other"]));
    }

    public function get_comment_course($id){
        $content = ModuleContent::findOrFail($id);
        return response()->json($content->load(["comments.user", "comments.replies_comment", "comments_from_other"]));
    }
}
