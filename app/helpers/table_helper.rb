module TableHelper
  def get_page_range(games)
    if games.first_page? || games.current_page < 4
      1..6
    elsif games.current_page + 2 > games.total_pages
      games.total_pages - 3..games.total_pages
    elsif games.last_page?
      games.current_page - 3..games.current_page
    else
      games.current_page - 3..games.current_page + 3
    end
end
end
