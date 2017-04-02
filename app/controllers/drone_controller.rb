# Drone Process update
class DroneController < ApplicationController
  before_action :find_drone, execpt: [:index]

  def index
    @drone = Drone.find_or_create_by(name: params[:name].downcase) if params[:name].present?
    redirect_to drone_path(@drone.id) unless @drone.nil?
  end

  def show
    if @drone.blank?
      flash[:success] = 'Welcome drone! Register your name.'
      redirect_to drones_path
    end
  end

  def item_activity
    redirect_to drone_path(@drone) and return unless command_center.next_instruction?
    @activity = command_center.last_completed_activity
    @activity = command_center.next_instruction if @activity.present? && @activity.completed?
    @item = @activity.item
  end

  def update_activity
    if params[:message].present? && command_center.next_activity_name == params[:message]
      @activity = command_center.next_instruction
      flash[:success] = 'Done well!!!' if @activity.completed?
      @item = @activity.item
    else
      @error = "Your next process should be #{command_center.next_activity_name}"
    end
  end

  private

  def find_drone
    @drone = Drone.where(id: params[:id]).first
    @drone = DroneDecorator.decorate(@drone) if @drone.present?
  end

  def command_center
    @p_center ||= CommandCenter.new(@drone)
  end
end
