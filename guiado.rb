
class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize (location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize (location,purpose,hour,min,day)

        super(location,purpose,hour,min)
        @day = day
    end

    def occurs_on?(day)
        self.day == day

    end

    def to_s
        "Reunion mensual en #{self.location} sobre #{self.purpose} el dia #{self.day} a la(s) #{self.hour}: #{self.min} "
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour,min)
        self.hour == hour && self.min
    end

    def to_s
        "Reunion diaria en #{self.location} sobre #{self.purpose} a las #{self.hour}: #{self.min}"
    end
end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
        def initialize(location,purpose,hour,min,day,month,year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day,month,year)
        self.day == day && self.month == month && self.year == year
    end
    
    def to_s
        "Reunion unica en #{self.location} sobre #{self.purpose} el #{self.day}/#{self.month}/#{self.year}"
    end
end