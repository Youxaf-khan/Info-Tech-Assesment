class PagesController < ApplicationController
  # index is a public page
  def index; end

  # secret is a private page, only logged-in user can enter
  def notes
    render plain: '401 Unauthorized', status: :unauthorized if current_user.blank?
  end
end
