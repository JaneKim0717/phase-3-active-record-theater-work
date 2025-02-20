class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        find = self.auditions.find{|audition| audition.hired == true}
        find ? find : "no actor has been hired for this role"
    end

    def understudy
        find = self.auditions.find{|audition| audition.hired == true}[1]
        find ? find : "no actor has been hired for understudy for this role"
    end
end 