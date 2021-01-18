module OpinionsHelper
  def movie_image(opinion)
    if opinion.image.present?
      image_tag opinion.image, class: 'image'
    else
      link_to image_tag('movie.jpg', alt: 'Profile_picture', class: 'image')
    end
  end

  def follow_form(user)
    if current_user == user
      content_tag :div, current_user.user_name, class: 'font-weight-light color'
    elsif current_user.following?(user) && current_user != user
      render 'shared/form_for_unfollow'
    else
      render 'shared/form_for_follow'
    end
  end
end
