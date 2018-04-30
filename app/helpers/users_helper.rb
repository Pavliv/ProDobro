module UsersHelper
  def show_user_role(user)
    user.roles.blank? ? 'none' : user.roles.first.name
  end

  def role_to_select(user)
    user.roles.any? ? user.roles.first.name : ''
  end

  def all_roles
    Role.all.map(&:name)
  end

  def confirmed?(user)
    user.confirmed_at.blank? ? false : true
  end

  def confirmed_btn(user)
    confirmed?(user) ? green : red
  end
end
