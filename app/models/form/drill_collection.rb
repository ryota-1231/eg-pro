class Form::DrillCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :drills

  def initialize(attributes = {})
    super attributes
    self.drills = DEFAULT_ITEM_COUNT.times.map { Form::Drill.new } unless drills.present?
  end

  def drills_attributes=(attributes)
    self.drills = attributes.map do |_, drill_attributes|
      Form::Drill.new(drill_attributes)
    end
  end

  def save
    return false unless valid?
    Drill.transaction { target_drills.each(&:save!) }
    true
  end

  def target_drills
    self.drills.select { |v| v.valid? == true }
  end

end

