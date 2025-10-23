class RepliesController < ApplicationController
  def new
    @survey_share = SurveyShare.find_by(token: params[:token])
    if @survey_share.present? == false
      render plain: "Invalid survey link." and return
    end
    if @survey_share.used?
      render plain: "This survey has already been answered. Thank you!" and return
    end
    @questions = Question.where(survey_id: @survey_share.survey_id)
    @questions.each do |question|
      @survey_share.replies.build(question: question)
      @options = Option.where(question_id: question.id)
      @options.each do |option|
        @survey_share.replies.last.reply_options.build(option: option)
      end 
    end
  end

  def create
    debugger
    @survey_share = SurveyShare.find_by(token: params[:survey_share][:token])
    @survey_share.used = true
    if @survey_share.update(reply_params)
      render plain: "Thank you for your replies!"
    else
      render :new
    end
  end

  private

  def reply_params
    params.require(:survey_share).permit(:token, replies_attributes: [:id, :description, :question_id, :_destroy, reply_options_attributes: [:id, :option_id, :checked, :reply_id, :_destroy]])
  end
end
