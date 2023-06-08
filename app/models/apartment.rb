class Apartment < ApplicationRecord
  has_many :stations, dependent: :destroy, inverse_of: :apartment
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :reject_both_blank

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:line].blank? and attributes[:station].blank? and attributes[:time].blank?
      !attributes[:line].blank? and attributes[:station].blank? and attributes[:time].blank?
    else
      attributes[:line].blank? and attributes[:station].blank? and attributes[:time].blank?
    end
  end
end
