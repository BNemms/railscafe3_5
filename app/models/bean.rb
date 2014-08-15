class Bean
  attr_accessor :bean_txt
  include Mongoid::Document
  field :name, type: String
  field :roast, type: String
  field :origin, type: String
  field :quantity, type: Float

  has_many :pairings
  accepts_nested_attributes_for :pairings

  # has_many :pastries, through: :pairings

  # Find all related pastries through pairings
  def pastries
  	Pastry.find(pastry_ids)
  end

  # Only find the pastry_ids for a given bean
  def pastry_ids
  	ret = []
  	self.pairings.each do |r|
  		ret << r.pastry_id if r.pastry_id
  	end
  	ret
  end

  # Reset the entire list of pastry_ids for a given bean
  def pastry_ids=(list)
    self.save
  	self.pairings.destroy
  	list.each do |pastry_id|
  		self.pairings.create(pastry_id: pastry_id) unless pastry_id.blank?
  	end
  end
end
