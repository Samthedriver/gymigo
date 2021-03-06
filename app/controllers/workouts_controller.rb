class WorkoutsController < ApplicationController
  before_action :require_login
  layout 'application'


  def menu
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
    @workout = Workout.new
  end

  def create
    @user = User.find(session[:user_id])
    @workout = Workout.new(workout_params)
    @workout.user_id = @user.id
    @workout.amigo_id = @user.id
    @workout.status = 'requested'
    @workout.save

    redirect_to workout_path(@workout)
  end

  def join_workout
    @workouts = Workout.requested
    render :join_workout
  end

  def book_workout
    @user = User.find(session[:user_id])
    @workout = Workout.find(params[:id])
    @workout.status = 'booked'
    @workout.amigo_id = session[:user_id]
    @workout.save
    render :show
  end

  def upcoming
    @workouts = Workout.booked(session[:user_id])
    render :upcoming
  end

  def completed
    @user = User.find(session[:user_id])
    @workouts = @user.completed
    render :completed
  end

  def awaiting
    @workouts = Workout.completed(session[:user_id])
    render :requested
  end

  def show
    @user = User.find(session[:user_id])
    @workout = Workout.find(params[:id])
  end

  def complete_workout
    @user = User.find(session[:user_id])
    @workout = Workout.find(params[:id])
    @workout.status = 'completed'
    @workout.save
    render :show
  end

  def edit
  end

  def update
  end

  private

  def workout_params
    params.require(:workout).permit(:start_time, :end_time, :description, :gym_id, :user_id, :amigo_id, :status, :date)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
