class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
    @survey.questions.build
    5.times { @survey.questions.first.options.build }
  end

  def create
    debugger
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  private

  def survey_params
    params.expect(survey: [ :description, 
                    questions_attributes: [[ :id, :description, :_destroy,
                      options_attributes: [[ :id, :description, :_destroy ]]
                    ]]
                  ])    
  end
end