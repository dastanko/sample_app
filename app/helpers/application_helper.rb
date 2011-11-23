module ApplicationHelper

  # Этот метод показывает страницу умно
  def title
    basic_title = "Ruby on Rails Tutorial Sample App"

    if @title.nil?
      basic_title
    else
      "#{basic_title} | #{@title}"
    end
  end
end
