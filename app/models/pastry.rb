class Pastry
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :price, type: Float

  has_many :pairings
  accepts_nested_attributes_for :pairings

  # has_many :beans, through: :pairings
  def beans
  	Bean.find(bean_ids)
  end

  def bean_ids
  	ret = []
  	self.pairings.each do |r|
  		ret << r.bean_id if r.bean_id
  	end
  	ret
  end

  def bean_ids=(list)
  	self.pairings.destroy
  	list.each do |bean_id|
  		self.pairings.create(bean_id: bean_id) unless bean_id.blank?
  	end
  end
end
