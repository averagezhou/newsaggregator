class FollowsController < ApplicationController
  def index
    @follows = Follow.all.order({ :created_at => :desc })

    render({ :template => "follows/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @follow = Follow.where({:id => the_id }).at(0)

    render({ :template => "follows/show.html.erb" })
  end

  def create
    @follow = Follow.new
    @follow.source_id = params.fetch("query_source_id")
    @follow.follower_id = params.fetch("query_follower_id")

    if @follow.valid?
      @follow.save
      redirect_to("/follows", { :notice => "Follow created successfully." })
    else
      redirect_to("/follows", { :notice => "Follow failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @follow = Follow.where({ :id => the_id }).at(0)

    @follow.source_id = params.fetch("query_source_id")
    @follow.follower_id = params.fetch("query_follower_id")

    if @follow.valid?
      @follow.save
      redirect_to("/follows/#{@follow.id}", { :notice => "Follow updated successfully."} )
    else
      redirect_to("/follows/#{@follow.id}", { :alert => "Follow failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @follow = Follow.where({ :id => the_id }).at(0)

    @follow.destroy

    redirect_to("/follows", { :notice => "Follow deleted successfully."} )
  end
end
