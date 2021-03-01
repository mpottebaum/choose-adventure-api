class StoryNodesController < ApplicationController

    def index
        story = Story.find(params[:story_id])

        render json: story.story_nodes, include: [ :choices ]
    end

    def create
        assign_choice_coordinates
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
        @story_node = StoryNode.find(params[:id])
        assign_choice_coordinates
        if story_node_params[:next_node_id] && @story_node.choices.length > 0
            @story_node.choices.destroy_all
        elsif story_node_params[:choices_attributes].length > 0 && @story_node.next_node_id
            @story_node.update(next_node_id: nil)
        end
        @story_node.update(story_node_params)

        if @story_node.valid?
            render json: @story_node, include: [ :choices ]
        else
            render json: @story_node.errors, status: 400
        end
    end

    def destroy
        story_node = StoryNode.find(params[:id])
        story_node.destroy

        render json: { message: 'success' }
    end

    private

    def assign_choice_coordinates
        story = Story.find(params[:story_node][:story_id])
        params[:story_node][:choices_attributes] = params[:story_node][:choices_attributes].map.with_index do |choice, i|
            if !choice[:grid_x] || !choice[:grid_y]
                coordinates = story.assign_choice_coordinates(
                    @story_node ? @story_node.grid_x : params[:story_node][:grid_x],
                    @story_node ? @story_node.grid_y : params[:story_node][:grid_y],
                    i
                )
                choice[:grid_x] = coordinates[:grid_x]
                choice[:grid_y] = coordinates[:grid_y]
            end
            choice
        end
    end

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
            :choices_attributes => [ :content, :next_node_id, :grid_x, :grid_y, :color, :id ]
        )
    end
end