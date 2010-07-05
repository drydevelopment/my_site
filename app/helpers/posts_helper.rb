module PostsHelper
  def format_created_at_date(d)
    begin
      d.strftime("%B %d, %Y")
    rescue
      return "A Time object is expected."
    end
  end
end
