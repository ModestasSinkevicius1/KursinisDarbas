# frozen_string_literal: true

# Class that can be reached globaly.
class ApplicationController < ActionController::Base
  def check_role
    redirect_to '/' if User.find(session[:user_id]).role == 'Studentas'
  end

  def check_role_destytojas
    redirect_to '/' if User.find(session[:user_id]).role == 'Destytojas'
  end

  def check_role_administratorius
    redirect_to '/' if User.find(session[:user_id]).role == 'Administratorius'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/' unless current_user
  end

  def fill_destytojas
    user = Destytojas.new(user_params_destytojas)
    if user.save
      session[:user_id] = user.id
      session[:role] = params[:role]
      redirect_to '/admin/registravimas_final'
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def fill_studentas
    user = Studentas.new(user_params_studentas)
    if user.save
      session[:user_id] = user.id
      session[:role] = params[:role]
      redirect_to '/admin/registravimas_final'
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def fill_administratorius
    user = Admin.new(user_params_administratorius)
    if user.save
      session[:user_id] = user.id
      session[:role] = params[:role]
      redirect_to '/admin/registravimas_final'
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def user_params_studentas
    params.require(:user).permit(:name, :surname,
                                 :phone, :program,
                                 :course, :group)
  end

  def user_params_administratorius
    params.require(:user).permit(:name, :surname, :phone)
  end

  def user_params_destytojas
    params.require(:user).permit(:name, :surname, :phone, :program)
  end

  def user_params
    params.require(:user).permit(:role_id, :name, :password, :role)
  end

  def dalykas_params
    params.require(:dalykas).permit(:name, :program,
                                    :lecturer, :course,
                                    :credit, :group,
                                    :duration_start, :duration_end,
                                    :description)
  end

  def news_params
    params.require(:news).permit(:user, :email, :date, :description)
  end
end
