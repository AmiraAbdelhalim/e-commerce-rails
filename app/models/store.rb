class Store < ApplicationRecord
    belongs_to :admin_user

    # def display_name #to show the email insted of user object
    #     name
    # end
end
