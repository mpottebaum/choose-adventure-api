class StoryNodesController < ApplicationController

    def index
        story = Story.find(params[:story_id])

        render json: story.story_nodes, include: [ :choices, :paragraphs ]
    end

    def create
        assign_choice_coordinates
        story_node = StoryNode.create(story_node_params)

        if story_node.valid?
            render json: story_node, include: [ :choices, :paragraphs ]
        else
            render json: story_node.errors, status: 400
        end
    end

    def show
        story_node = StoryNode.find(params[:id])

        render json: story_node, include: [ :choices, :paragraphs ]
    end
    
    def update
        @story_node = StoryNode.find(params[:id])
        if story_node_params[:choices_attributes]
            assign_choice_coordinates
        end
        if story_node_params[:next_node_id] && @story_node.choices.length > 0
            @story_node.choices.destroy_all
        elsif (story_node_params[:choices_attributes] && story_node_params[:choices_attributes].length > 0) && @story_node.next_node_id
            @story_node.update(next_node_id: nil)
        end
        @story_node.update(story_node_params)

        if @story_node.valid?
            render json: @story_node, include: [ :choices, :paragraphs ]
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
        story = params[:story_node][:story_id] ? Story.find(params[:story_node][:story_id]) : @story_node.story
        params[:story_node][:choices_attributes] = params[:story_node][:choices_attributes].map.with_index do |choice, i|
            if !choice[:x] || !choice[:y]
                coordinates = story.assign_choice_coordinates(
                    @story_node ? @story_node.x : params[:story_node][:x].to_i,
                    @story_node ? @story_node.y : params[:story_node][:y].to_i,
                    i
                )
                choice[:x] = coordinates[:x]
                choice[:y] = coordinates[:y]
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
            :x,
            :y,
            :choices_attributes => [ :content, :next_node_id, :x, :y, :color, :story_node_id, :id ],
            :paragraphs_attributes => [ :content, :story_node_id, :id ]
        )
    end
end