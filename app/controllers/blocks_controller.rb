class BlocksController < ApplicationController

    def create
        @block = Block.create(b_params)      
    end

    def destroy
        Block.find_by(user_id: params[:id]).destroy
    end

    private

    def b_params
        params.require(:block).permit(:user_id, :blocked_user)
    end

end
