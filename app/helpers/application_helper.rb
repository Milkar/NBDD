# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Return a title on a per-page basis. # Documentation comment
  def title # Method definition
    base_title = "NBDD app" # Variable assignment
    if @title.nil? # Boolean test for nil
      base_title # Implicit return
    else      "#{base_title} | #{@title}" # String interpolation
    end
  end
end
