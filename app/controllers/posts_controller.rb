class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

#comes from the posts#new
def new
end


#comes from the posts#create
def create

  @post = Post.create(post_params)

  if @post.valid?
    redirect_to @post
  else
    render 'new'

   # feedback = params[:content]
   # title = params[:title]
   #  render text: params[:post].inspect
 end
end

def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])

  if @post.update(params[:post].permit(:title, :content))
    redirect_to @post
  else
    render 'edit'
    @errors = ["Error, you gone made mm'steak.", "Error you a silly.", "Error I'm a robot", "Error the dog says woof.", "Error you a turd."]
  end
end

private
def post_params
  params.require(:post).permit(:title, :content)
end

end
