module ApplicationHelper
  def full_title(page_title)
    base_title = 'bbs'
    if page_title.empty?
      base_title
    else
      "#{base_title} #{page_title}"
    end
  end

  def format_time(time)
    time.strftime('%Y-%m-%d %H:%M:%S')
  end
end
