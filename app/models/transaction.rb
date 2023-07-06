class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :pokemon

    enum action: {
    buy: 0,
    sell: 1,
  }

  def motif
    self.action == "buy" ? "Achat" : "Vente"
  end
end
