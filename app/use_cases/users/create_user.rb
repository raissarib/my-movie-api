module Users
  class CreateUser
    def initialize(params)
      @params = params
    end

    def call
      user = User.new(@params)
      if user.save
        { success: true, user: user }
      else
        { success: false, errors: user.errors.full_messages }
      end
    end
  end
end
