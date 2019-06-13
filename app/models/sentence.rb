class Sentence < ApplicationRecord
  has_many :likes, dependent: :destroy
  validates_presence_of :text

  def self.after(id, num_to_take=10)
    id_gt(id ||= 0).take(num_to_take)
  end

  def self.count_after(id)
    id_gt(id).count
  end

  private

  def self.id_gt(id)
    by_id.where("id > ?",  id)
  end

  def self.by_id
    self.order(:id)
  end
end
