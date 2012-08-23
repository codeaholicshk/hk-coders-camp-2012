HkCodersCamp2012.controllers :ideas do
  get :index do
    # @ideas = Idea.all
    # TODO change it to map reduce later
    @ideas = Idea.all
    render 'ideas/index'
  end

  get :new do
    @idea = current_account.ideas.new
    @idea.cool_things = Array.new(3)
    render 'ideas/new'
  end

  get :show do
    @idea = Idea.find(params[:id])
    render 'ideas/show'
  end
  
  post :create do
    @idea = current_account.ideas.new(params[:idea])
    if @idea.save
      flash[:notice] = 'Idea was successfully created.'
      redirect url(:ideas, :edit, :id => @idea.id)
    else
      render 'ideas/new'
    end
  end
  
  get :edit, :with => :id do
    @idea = Idea.find(params[:id])
    render 'ideas/edit'
  end

  put :update, :with => :id do
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      flash[:notice] = 'Idea was successfully updated.'
      redirect url(:ideas, :edit, :id => @idea.id)
    else
      render 'ideas/edit'
    end
  end

  delete :destroy, :with => :id do
    idea = Idea.find(params[:id])
    if idea.destroy
      flash[:notice] = 'Idea was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Idea!'
    end
    redirect url(:ideas, :index)
  end  
end
