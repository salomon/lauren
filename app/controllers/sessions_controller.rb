class SessionsController < ApplicationController
  def create
    if params[:username]
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url
      else
        flash[:notice] = "Invalid username or password"
        render 'users/login'
      end
    else
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in as #{user.name}"
    end
  end

  def failure
    redirect_to root_url, notice: "Log in Failed"
  end

  def destroy
  	session.clear
  	redirect_to root_url, :notice => "Logged out!"
  end
end


# --- !ruby/hash:OmniAuth::AuthHash provider: facebook uid: '1349447770' info: !ruby/hash:OmniAuth::AuthHash::InfoHash nickname: ryan.salomon.7 email: ryan5231@gmail.com name: Ryan Salomon first_name: Ryan last_name: Salomon image: http://graph.facebook.com/1349447770/picture?type=square urls: !ruby/hash:OmniAuth::AuthHash Facebook: https://www.facebook.com/ryan.salomon.7 location: Baton Rouge, Louisiana verified: true credentials: !ruby/hash:OmniAuth::AuthHash token: CAAHwbseUOAgBADMuXPXfCniKkqKo3zv0kFS9ZAi5PoFVRvdoWRm64EXxs7nTWKmmlO6iGX4T8Q8S15yJlf5cnKR04ZAwZBwaNIB76WBWjX6kKmxUFnLpTUxSKCYaZADOiqgscDS7cauRwdQyM7tA2XuAwgCQknNG0vLbgFZANfXj45zQFCiAu expires_at: 1389126603 expires: true extra: !ruby/hash:OmniAuth::AuthHash raw_info: !ruby/hash:OmniAuth::AuthHash id: '1349447770' name: Ryan Salomon first_name: Ryan last_name: Salomon link: https://www.facebook.com/ryan.salomon.7 username: ryan.salomon.7 hometown: !ruby/hash:OmniAuth::AuthHash id: '106566059380422' name: New Orleans, Louisiana location: !ruby/hash:OmniAuth::AuthHash id: '109739469044015' name: Baton Rouge, Louisiana quotes: you mudda! gender: male email: ryan5231@gmail.com timezone: -8 locale: en_US verified: true updated_time: '2013-07-08T18:30:00+0000'