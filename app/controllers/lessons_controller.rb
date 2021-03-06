class LessonsController < ApplicationController
	def create
		@lesson = Lesson.create(
			user_id: current_user.id,
			category_id: params[:category_id]
			)
		redirect_to new_lesson_answer_url(@lesson.id)
	end	

	def word
		@category_id = params[:category_id]
		if !@category_id.present? || @category_id.empty?
			@answers = current_user.answers
		else
			# @answers = Answer.joins(:lesson).where("lessons.category.id": params[:category_id], "lessons.user_id": current_user.id)
			@answers = current_user.answers.joins(:lesson).where("lessons.category.id": params[:category_id])
		end
		@answers = @answers.page(params[:page]).per(7)
	end

	
end
