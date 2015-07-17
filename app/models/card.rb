class Card < ActiveRecord::Base
  has_many :users, through: :user_cards
  has_many :user_cards

  validates_presence_of :cnumber
  validates_format_of :cnumber, with: /\A[345]\d{11,}/

  validates :exmonth, presence: true, inclusion: { in: (1..12) }
  validates :exyear, presence: true, numericality: { greater_than_or_equal_to: 2015 }

  def set_expiration_date
    self.expiration_date = DateTime.new(self.expiration_year,
                                        self.expiration_month,
                                        28)
  end

  scope :expired, lambda {where('expiration_date < ?', Time.now)}

  before_save :set_ctype

  validates :users, presence: true

  def set_ctype
      first_num = self.cnumber[0]
      self.ctype = case first_num
      when '3'
        "Amex"
      when '4' 
        "Visa"
      when '5'
        "MasterCard"
      end
  end
  
  def destroy_solely_owned_cards
    all_my_cards = self.cards
    owned_cards = all_my_cards.select do |card|
                    card.users.length == 1
                  end
    owned_cards.each &:destroy!
  end



end
