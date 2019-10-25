class IgnoresController < ApplicationController
    
    def create
        @ignore = Ignore.create(i_params)      
    end

    def destroy_all
        Ignore.where(user_id: params[:id]).destroy_all
    end

    private

    def i_params
        params.require(:ignore).permit(:user_id, :ignored_user)
    end

end
