class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = user_finder
        @transactions = @user.transactions
    end

    def update
        new_balance = current_user.balance + 50
        current_user.update(balance: new_balance)
        respond_to do |format|
			format.html { redirect_to root_path, notice: "PokeDollars ajoutés" }
			format.js {}
		end
    end

    private

    def user_finder
        User.find(params[:id])
    end
end
