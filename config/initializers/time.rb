module ActiveSupport
  class TimeWithZone
    def as_json(options = nil)
      time.to_i
    end
  end
end

