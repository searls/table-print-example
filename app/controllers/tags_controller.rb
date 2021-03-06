class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
    post = Post.find(params[:post][:post_id])
    author = Author.find(params[:author][:author_id])
    post.tag_post!(params[:tag_name], author)

    flash[:notice] = "Tag '#{params[:tag_name]}' applied to '#{post.title}'"
  rescue
    flash[:notice] = 'Tag creation failed.'
  ensure
    render :new
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'Tag was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :author_id)
    end
end
