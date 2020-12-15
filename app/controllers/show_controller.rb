# frozen_string_literal: true

class ShowController < ApplicationController
  def show
    @user = User.find_by email: params[:email]
  end
end
