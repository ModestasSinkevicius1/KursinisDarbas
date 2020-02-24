# frozen_string_literal: true

# Class used to reach register pages for admin user.
class AdminController < ApplicationController
  before_action :authorize

  before_action :check_role_administratorius, except:
  %I[registravimas registravimas_final registruoti]

  def registravimas; end

  def registravimas_final; end

  def registruoti
    fill_destytojas if params[:role] == 'Destytojas'

    fill_studentas if params[:role] == 'Studentas'

    fill_administratorius if params[:role] == 'Administratorius'
  end
end
