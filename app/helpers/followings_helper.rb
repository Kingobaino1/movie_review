module FollowingsHelper
  def display_followers(user)
    user.followers.each do |follower|
      unless follower == current_user
        concat (
          content_tag :li, class: 'mt-2' do
            content_tag :div, class: 'd-flex' do
              content_tag(:div, follower_photo(follower)) +
              content_tag(:div, class: 'pl-2 d-flex f_dir_col') do
                content_tag(:div, follower.full_name) +
                content_tag(:div, follower.user_name, class: 'mx-auto color')
              end
            end
          end
        )
      end
    end
  end

  private

  def follower_photo(user)
    if user.photo.attached?
      image_tag user.photo, class: 'image_follow'
    else
      image_tag('profile_image', alt: 'Profile_picture', class: 'image_follow')
    end
  end
end
