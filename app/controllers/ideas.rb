HkCodersCamp2012.controllers :ideas do
  get :index do
    @ideas = Idea.all
    render 'ideas/index'
  end

  get :new do
    @idea = Idea.new
    render 'ideas/new'
  end

  post :create do
    @idea = Idea.new(params[:idea])
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
