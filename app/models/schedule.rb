class Schedule < ApplicationRecord
    validates :title , presence: true, length: { maximum: 20 }
    validates :start_time ,presence: true
    validates :end_time ,presence: true
    validates :memo , length: { maximum:500 }
    validate :validate_past, if: :not_nil

      def not_nil
        start_time != nil && end_time != nil
      end
      
      def validate_past
        if start_time > end_time
        errors.add(:end_time, "は開始日より前にできません")
        end
      end
end
