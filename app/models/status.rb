class Status < ApplicationRecord
    belongs_to :user
    belongs_to :tamagotchi
    has_many :inventories
    has_many :items, through: :inventories

    def self.decrease_all
        self.all.each do |tama|
            if tama.happiness > 0
                tama.happiness -= 1
            end
            if tama.fullness > 0
                tama.fullness -= 1
            end
            tama.save
        end
    end
end
