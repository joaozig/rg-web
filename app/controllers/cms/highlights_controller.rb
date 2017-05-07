class Cms::HighlightsController < Cms::CmsController
  before_action :set_highlight, only: [:show, :edit, :update, :destroy, :change_status]

  # GET /highlights
  # GET /highlights.json
  def index
    @highlights = Highlight.all.order(status: :desc, id: :desc)
  end

  # GET /highlights/1
  # GET /highlights/1.json
  def show
  end

  # GET /highlights/new
  def new
    @highlight = Highlight.new
  end

  # GET /highlights/1/edit
  def edit
  end

  # POST /highlights
  # POST /highlights.json
  def create
    @highlight = Highlight.new(highlight_params)

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to cms_highlights_path, notice: 'Highlight was successfully created.' }
        format.json { render :show, status: :created, location: @highlight }
      else
        format.html { render :new }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highlights/1
  # PATCH/PUT /highlights/1.json
  def update
    respond_to do |format|
      if @highlight.update(highlight_params)
        format.html { redirect_to cms_highlights_path, notice: 'Highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @highlight }
      else
        format.html { render :edit }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highlights/1
  # DELETE /highlights/1.json
  def destroy
    @highlight.destroy
    respond_to do |format|
      format.html { redirect_to cms_highlights_path, notice: 'Highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_status
    new_status = @highlight.unpublished? ? Highlight.statuses[:published] : Highlight.statuses[:unpublished];
    @highlight.status = new_status

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to cms_highlights_path, notice: 'Highlight status was successfully updated.' }
        format.json { render :show, status: :created, location: @highlight }
      else
        format.html { redirect_to cms_highlights_path, alert: 'Highlight status not updated.' }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highlight
      @highlight = Highlight.find(params[:id]) if params[:id].present?
      @highlight = Highlight.find(params[:highlight_id]) if params[:highlight_id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highlight_params
      params.fetch(:highlight, {}).permit(
        :title, :headline, :content, :footnote, :highlight_type,
        :franchise_id, :restaurant_id, :place_id, :category_id)
    end
end
