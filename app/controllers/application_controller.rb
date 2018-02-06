class ApplicationController < ActionController::API

  def issue_token(user)
    token = JWT.encode({id: user.id}, 'secret', 'HS256')
  end

  def token
    begin
      JWT.decode(request.headers['Authorization'], 'secret', true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
      [{}]
    end
  end

  def user_id
    token.first["id"]
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

end
