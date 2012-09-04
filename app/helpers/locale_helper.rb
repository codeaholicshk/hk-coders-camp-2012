HkCodersCamp2012.helpers do
  def locale_path
    (I18n.locale == :en) ? "" : "/zh"
  end
end