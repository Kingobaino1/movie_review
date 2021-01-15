# rubocop:disable Style/GuardClause
module UsersHelper
  def cover_image(user)
    if user.cover_image.present?
      image_tag(user.cover_image, class: 'b_image w-100')
    else
      image_tag('background_image', alt: 'Cover image', class: 'b_image w-100')
    end
  end

  def photo_image(user)
    if user.photo.present?
      image_tag(user.photo, class: 'show_image')
    else
      image_tag('profile_image', alt: 'Profile_picture', class: 'show_image')
    end
  end

  def current_user_photo(user)
    if user.photo.present?
      image_tag(user.photo, class: 'p_image m')
    else
      image_tag('profile_image', alt: 'Profile_picture', class: 'p_image m')
    end
  end

  def follow_user(user)
    return who_to_follow(user) unless @current_user.following?(user)
  end

  private

  def photo(user)
    if user.photo.present?
      image_tag(user.photo, class: 'image_follow')
    else
      image_tag('profile_image', alt: 'Profile_picture', class: 'image_follow')
    end
  end

  def who_to_follow(user)
    if user != @current_user
      content_tag :div, class: 'd-flex' do
        content_tag(:div, photo(user)) +
          content_tag(:span, (link_to user.full_name.to_s, user_path(user), class: 'review_content name
                                                                                    font-weight-light'
                             ))
      end
    end
  end
end

# rubocop:enable Style/GuardClause
