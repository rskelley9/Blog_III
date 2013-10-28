class PostsController < ApplicationController


#comes from the posts#new
def new
end


#comes from the posts#create
def create

  @post = Post.create(post_params)
  redirect_to @post

   # feedback = params[:content]
   # title = params[:title]
   #  render text: params[:post].inspect
 end

 def show
  @post = Post.find(params[:id])
end

private
def post_params
  params.require(:post).permit(:title, :content)
end

end
