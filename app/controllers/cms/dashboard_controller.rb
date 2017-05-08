class Cms::DashboardController < Cms::CmsController
  def index
  	@published_highlights = Highlight.published.all.order(id: :desc)
  end
end
