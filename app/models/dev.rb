class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    self.freebies.exists?(item_name: item_name)
  end

  def give_away(dev, freebie)
    gift = self.freebies.find(freebie.id)
    gift.update(dev_id: dev.id)
  end
end
