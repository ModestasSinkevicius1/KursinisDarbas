# frozen_string_literal: true

# Class used to handle models and POST and DELETE methods.
class ModelController < ApplicationController
  def create_news
    news = News.new(news_params)
    if news.save
      redirect_to session[:back_home]
    else
      flash[:register_errors] = news.errors.full_messages
    end
  end

  def create_dalykas
    dalykas = Dalykas.new(dalykas_params)
    if dalykas.save
      redirect_to session[:back_home]
    else
      flash[:register_errors] = dalykas.errors.full_messages
      redirect_to '/'
    end
  end

  def edit_dalykas
    dalykas = Dalykas.find(params[:primary_key])
    dalykas.update(dalykas_params)
    if dalykas.save
      redirect_to session[:back_second]
    else
      flash[:register_errors] = dalykas.errors.full_messages
      redirect_to '/'
    end
  end

  def delete_dalykas
    params = request.query_parameters
    Dalykas.find(params[:dalykas]).destroy
    redirect_to session[:back_home]
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:register_errors] = user.errors.full_messages
    end
  end
end
