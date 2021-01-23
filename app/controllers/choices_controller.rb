class ChoicesController < ApplicationController
    def show
        choice = Choice.find(params[:id])

        render json: choice
    end

    def update
        choice = Choice.find(params[:id])
        choice.assign_attributes(choices_params)


        render json: choice
    end

    def destroy
        choice = Choice.find(params[:id])
        choice.destroy

        render json: { message: 'success' }
    end

    private

    def choices_params
        params.require(:choice).permit(:content, :next_id)
    end
end