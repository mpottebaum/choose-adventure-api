class StoriesController < ApplicationController
    def create
        story = Story.create(story_params)

        render json: story
    end

    def show
        story = Story.find(params[:id])

        render json: story
    end
    
    def update
        story = Story.find(params[:id])
        story.update(story_params)

        render json: story
    end

    def destroy
        story = Story.find(params[:id])
        story.destroy

        render json: { message: 'success' }
    end

    private

    def story_params
        params.require(:story).permit(:title, :desc, :author_id, :start_node_id)
    end
end