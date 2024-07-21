class Schedule < ApplicationRecord
    validates :title , presence: true
    validates :start_time ,presence: true
    validates :end_time ,presence: true
    validate :validate_past
      def validate_past
        unless start_time == nil || end_time =nil
          self.start_time > self.end_time
        end
      end
end
