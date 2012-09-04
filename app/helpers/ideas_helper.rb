# encoding: utf-8

HkCodersCamp2012.helpers do
  def up_vote_link(idea)
    content = "▲#{idea.voters.size}"
    if current_account
      link_to content, url(:ideas, :up_vote, :id => idea.id), :method => :post
    else
      content
    end
  end
end
