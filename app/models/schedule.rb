class Schedule < ApplicationRecord
    validates :title , presence: true
    validates :start_time ,presence: true
    validates :end_time ,presence: true
    def validate_past
        if start_time > end_time
        end
    end
end
