module PostsHelper
  def generate_like_link(post)
    check_for_like = post.likes.where(user_id: current_user[:id], post_id: post.id)
    if check_for_like.any?
      link = like_path(check_for_like.first.id)
      link_method = 'delete'
    else
      link = likes_path
      link_method = 'post'
    end
    return { link: link, link_method: link_method }
  end
end
