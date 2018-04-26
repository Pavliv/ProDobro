module UsersHelper
  def show_user_role (user)
    user.roles.blank? ? 'none' : user.roles.first.name
  end

  def role_to_select (user)
    user.roles.any? ? user.roles.first.name : ''
  end

  def all_roles
    Role.all.map { |r| r.name }
  end
end
