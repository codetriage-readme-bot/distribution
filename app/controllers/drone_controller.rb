# Drone Process update
class DroneController < ApplicationController
  before_action :find_drone, only: [:show, :update_activity]

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

  def update_activity
    command_center = CommandCenter.new(@drone)
    redirect_to drone_path(@drone) and return unless command_center.next_instruction?
    @activity = command_center.last_completed_activity
    @item = @activity.item
  end

  private

  def find_drone
    @drone = Drone.where(id: params[:id]).first
    @drone = DroneDecorator.decorate(@drone) if @drone.present?
  end
end
