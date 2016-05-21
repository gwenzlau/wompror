class WorkoutsController < ApplicationController
	before_action :set_workout, only: [:show, :edit, :update, :destroy]

	def index
    @workouts = Workout.all
  end

	
	 def new
    @workout = Workout.new
  	end

  	def shuffle
  		@workout = Exercises.limit(:duration).order("RANDOM()")
  	end


	def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Get ready!' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { render action: 'new' }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end



	def show
		@exercises = Exercise.limit(1).order("RANDOM()")
	end

	private
     # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end
	
	 # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:duration)
    end
end
