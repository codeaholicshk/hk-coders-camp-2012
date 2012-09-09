HkCodersCamp2012.controllers :comments do
  post :create, with: :idea_id do
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.build(params[:comment])    
    @comment.commented_by_account_id = current_account.id
    @comment.save
    redirect url(:ideas, :show, id: @idea.id)
  end
end