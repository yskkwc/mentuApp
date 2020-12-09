module ApplicationHelper
  BASE_TITLE = "MENTU <面子>".freeze
  def full_title(page_title: "")
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end
end
