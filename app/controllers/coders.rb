HkCodersCamp2012.controllers :coders do
  get :index do
    @coders = Account.where(role: "users").all
    render 'coders/index'
  end
end
