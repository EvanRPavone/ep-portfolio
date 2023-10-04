module ProjectsHelper
  def project_ss project
    if project.screenshots.attached?
      image_tag project.screenshots[0]
    else
      # Assuming you have a default.jpg in your assets folder
      image_tag "default.jpg"
    end
  end
end
