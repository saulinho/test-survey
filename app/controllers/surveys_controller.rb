class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
    3.times { @survey.questions.build do |question|
      5.times { question.options.build }
    end }
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
                    questions_attributes: [[ :id, :description, :question_type_id, :_destroy,
                      options_attributes: [[ :id, :description, :_destroy ]]
                    ]]
                  ])    
  end
end