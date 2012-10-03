HkCodersCamp2012.controllers :ideas do
  get :index do
    # @ideas = Idea.all
    # TODO change it to map reduce later
    @archived_ideas = Idea.any_of({:shortlisted.exists => false}).any_of({:shortlisted => false})
    @shortlisted_ideas = Idea.where(shortlisted: true)
    render 'ideas/index'
  end

  get :new do
    @idea = current_account.published_ideas.new
    render 'ideas/new'
  end

  get :show, with: :id do
    @idea = Idea.find(params[:id])
    render 'ideas/show'
  end

  post :create do
    @idea = current_account.published_ideas.new(params[:idea])
    if @idea.save
      flash[:notice] = 'Idea was successfully created.'
      redirect url(:ideas, :index)
    else
      render 'ideas/new'
    end
  end

  get :edit, with: :id do
    @idea = current_account.published_ideas.find(params[:id])
    render 'ideas/edit'
  end

  put :update, with: :id do
    @idea = current_account.published_ideas.find(params[:id])
    if @idea.update_attributes(params[:idea])
      flash[:notice] = 'Idea was successfully updated.'
      redirect url(:ideas, :index)
    else
      render 'ideas/edit'
    end
  end

  post :up_vote, with: :id do
    @idea = Idea.find(params[:id])
    if !@idea.voter_ids.include?(current_account.id)
      @idea.voters << current_account
      @idea.save
    else
      flash[:error] = t('flash.error.same_vote')
    end
    redirect url(:ideas, :index)
  end

  post :join, with: :id do
    Idea.where(joined_coder_ids: current_account.id).pull(:joined_coder_ids, current_account.id)

    @idea = Idea.find(params[:id])
    if !@idea.joined_coder_ids.include?(current_account.id)
      @idea.joined_coders << current_account
      @idea.save
    end
    redirect url(:ideas, :index)
  end

  delete :destroy, with: :id do
    idea = Idea.find(params[:id])
    if idea.destroy
      flash[:notice] = 'Idea was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Idea!'
    end
    redirect url(:ideas, :index)
  end
end
