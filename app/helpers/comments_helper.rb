module CommentsHelper
  def user_allowed_to_manage(comment)
    user_signed_in? && (current_user.id == comment.user_id)
  end

  def user_full_name(comment)
    comment.user.name + ' ' + comment.user.surname
  end
end
