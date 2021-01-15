module OpinionsHelper
  def movie_image(opinion)
    if opinion.image.attached?
      image_tag opinion.image, class: 'image'
    else
      link_to image_tag('movie.jpg', alt: 'Profile_picture', class: 'image')
    end
  end
end
