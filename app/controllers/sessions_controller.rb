# frozen_string_literal: true

# Class used to store cookies and handle POST, DELETE methods.
class SessionsController < ApplicationController
  def logout
    session[:user_id] = nil
    session[:role_id] = nil
    redirect_to '/'
  end

  def login
    user = User.find_by(name: login_params[:name])
    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id
      session[:role_id] = user.role_id
      detect_user(user)
    else
      flash[:login_errors] = ['neteisingas prisijungimas']
      redirect_to '/'
    end
  end

  def detect_user(user)
    if user.role.to_s.eql? 'Destytojas'
      redirect_to '/dalykai/dalykai_destytojas'
    end
    if user.role.to_s.eql? 'Administratorius'
      redirect_to '/dalykai/dalykai_administratorius'
    end
    redirect_to '/dalykai/dalykai' if user.role.to_s.eql? 'Studentas'
  end

  private

  def login_params
    params.require(:login).permit(:name, :password)
  end
end
