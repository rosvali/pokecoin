class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = user_finder
    end

    # def edit
    #     render json: { wallet: current_user.balance}, status: 200
    # end

    # def update
    #     new_balance = current_user.balance + 50
    #     current_user.update(balance: new_balance)
    #     render json: current_user, status: 200
    # end

    # def transactions
    #     render json: current_user.transactions, status: 200
    # end
    private

    def user_finder
        User.find(params[:id])
    end
end
