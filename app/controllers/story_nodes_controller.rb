class StoryNodesController < ApplicationController

    def index
        story = Story.find(params[:story_id])

        render json: story.story_nodes, include: [ :choices ]
    end

    def create
        story_node = StoryNode.create(story_node_params)

        if story_node.valid?
            render json: story_node, include: [ :choices ]
        else
            render json: story_node.errors, status: 400
        end
    end

    def show
        story_node = StoryNode.find(params[:id])

        render json: story_node, include: [ :choices ]
    end
    
    def update
        story_node = StoryNode.find(params[:id])
        story_node.update(story_node_params)

        if story_node.valid?
            render json: story_node, include: [ :choices ]
        else
            render json: story_node.errors, status: 400
        end
    end

    def destroy
        story_node = StoryNode.find(params[:id])
        story_node.destroy

        render json: { message: 'success' }
    end

    private

    def story_node_params
        params.require(:story_node)
        .permit(
            :name,
            :content,
            :next_node_id,
            :story_id,
            :end,
            :color,
            :grid_x,
            :grid_y,
            :choices_attributes => [ :content, :next_node_id ]
        )
    end
end