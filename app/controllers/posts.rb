HkCodersCamp2012.controllers :posts do
  get :index do
    @posts = Post.order_by(:created_at => 1)
    render 'posts/index'
  end
  
  get :show, :with => :id do
    @post = Post.where(:id => params[:id]).first
    render 'posts/show'
  end
end