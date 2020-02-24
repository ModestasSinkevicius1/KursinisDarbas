# frozen_string_literal: true

# Class used to reach dalykai and other similar pages.
class DalykaiController < ApplicationController
  before_action :authorize

  before_action :check_role, except: %I[dalykai dalykas]

  before_action :check_role_destytojas, except:
  %I[dalykai_destytojas dalykas_destytojas dalyka_kurti dalyka_kurti]

  before_action :check_role_administratorius, except:
  %I[dalykai_administratorius dalykas_administratorius
     dalyka_redaguoti dalyka_kurti]

  def dalykai
    session[:back_home] = request.url
  end

  def dalykai_destytojas
    session[:back_home] = request.url
  end

  def dalykai_administratorius
    session[:back_home] = request.url
  end

  def dalykas
    session[:back_second] = request.url
  end

  def dalykas_administratorius
    session[:back_second] = request.url
  end

  def dalykas_destytojas
    session[:back_second] = request.url
  end

  def dalyka_redaguoti; end

  def dalyka_kurti; end
end
