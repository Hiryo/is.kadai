module UsersHelper
  def url_choose
    if action_name == 'new'
        users_path
    elsif action_name == 'edit'
        user_path
    end
  end

  def method_choose
    @user.id ? 'patch' : 'post'
  end
end

