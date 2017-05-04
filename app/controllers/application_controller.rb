# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404
    render file: Rails.root.join('public', '404'), layout: false, status: '404'
  end

  def after_sign_in_path_for(_resource)
    my_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def before_user_not_admin!
    return if !current_user.nil? && current_user.admin?
    flash['alert'] = 'アクセスに失敗しました'
    redirect_to my_path, status: '401', message: 'Unauthalized'
  end
end
