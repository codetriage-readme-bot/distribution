# Activity helper methods
module ActivitySpecHelper
  def create_activity_order(item, drone, order = 0)
    item = FactoryGirl.create(:item) if item.nil?
    Instructor::INSTRUCTION_ORDER.take(order).each do |e|
      FactoryGirl.create(:activity, progress: e, item: item, drone: drone)
    end
  end
end
