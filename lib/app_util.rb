# All the date mapper and fixed text
# value should be arragned here
module AppUtil
  def self.get_progress_text(name)
    { departed: 'You left from the center.',
      picked: 'Picked up the item?',
      reached: 'Have you reached the destination?',
      delivered: 'Delivered the goods?',
      arrived: 'Have you reached command center?' }[name.to_sym]
  end
end
