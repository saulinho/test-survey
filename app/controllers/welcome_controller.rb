class WelcomeController < ApplicationController
  def index
    @survey = Survey.first
  end
end
