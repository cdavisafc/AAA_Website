class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  #respond_to :html

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.where(event_id: params[:event_id])
    puts events_url
    puts events_path
    puts :event_id
    @event = Event.find(params[:event_id])
    #respond_with(@comments)
  end

  # GET /comments/1
  # GET /comments/1.json

  def show
    #respond_with(@comment)
  end

  # GET /comments/new
  def new
    @comment = Comment.new(event_id: params[:event_id ])

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      #format.html { redirect_to comments_url (:event_id => @event), notice: 'Comment was successfully destroyed.' }
      format.html { redirect_to events_url+"?event_id="+@comment.event_id.to_s, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:event_id, :details, :author)
    end
end