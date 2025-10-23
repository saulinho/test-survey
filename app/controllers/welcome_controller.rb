class WelcomeController < ApplicationController
  def index
    @survey_share = SurveyShare.last
  end
end
