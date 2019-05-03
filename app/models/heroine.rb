class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, presence: true, uniqueness: true

    def self.search_by_power(name)
        heroines = Heroine.all.select do |heroine|
            heroine.power.name == name
        end

        if heroines.length > 0
            heroines
        else
            heroines = Heroine.all
        end
    end
end
