class Account < ActiveRecord::Base
  belongs_to :person
  belongs_to :box
  belongs_to :contract

  KINDS = ["a pagar", "a receber"]

  validates_presence_of :kind, :person_id, :document, :price, :maturity_date, :box_id

end

