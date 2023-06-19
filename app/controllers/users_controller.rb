class UsersController < ApplicationController
    def show
        render json: current_user, status: 200
    end

    def edit
        render json: { wallet: current_user.balance}, status: 200
    end

    def update
        new_balance = current_user.balance + 50
        current_user.update(balance: new_balance)
        render json: current_user, status: 200
    end

    def transactions
        render json: current_user.transactions, status: 200
    end
end
