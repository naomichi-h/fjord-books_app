# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def default_url_options(options = {})
    options.merge({ locale: I18n.locale })
  end
end
