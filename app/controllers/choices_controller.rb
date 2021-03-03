class ChoicesController < ApplicationController
    def show
        choice = Choice.find(params[:id])

        render json: choice
    end

    def update
        choice = Choice.find(params[:id])
        choice.assign_attributes(choices_params)

        if choice.valid?
            choice.save
            render json: choice
        else
            render json: choice.errors, status: 400
        end
    end

    def destroy
        choice = Choice.find(params[:id])
        choice.destroy

        render json: { message: 'success' }
    end

    private

    def choices_params
        params.require(:choice).permit(:content, :next_node_id, :x, :y)
    end
end