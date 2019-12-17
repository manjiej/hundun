require 'summarize'
require 'digest'

class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :new, :create]
  skip_before_action :verify_authenticity_token

  # GET /summaries
  # GET /summaries.json
  def index
    @user = current_user
    @user.summaries = Summary.all
  end

  # GET /summaries/1
  # GET /summaries/1.json
  def show
    @summary = Summary.find(params[:id])
    @related_summaries = @summary.find_related_categories
  end

  # GET /summaries/new
  def new
    @user = current_user
    @summary = Summary.new
    @summary.user = @user
  end

  # GET /summaries/1/edit
  # def edit
  # end

  # POST /summaries
  # POST /summaries.json

  def create
    article_url = params.dig(:summary, :article_url)
    @summary = Summary.new(article_url: article_url)

    scraped_summary = Summarize.scrape(article_url)

    @summary.title = scraped_summary["title"]
    @summary.text = scraped_summary["text"]
<<<<<<< HEAD
=======
    # @summary.image = scraped_summary["images"][0]["url"]
>>>>>>> eebf0bf1ebec2d24d28692e86c3b1c8547af1b8a

    title = scraped_summary["title"]
    text = scraped_summary["text"]

    @summary.digest = Summarize.digest(title, text)
    # @summary.article_author = Summarize.info(article_url)[:author]
    @summary.publish_date = Summarize.info(article_url)[:publishDate]
    @summary.image = scraped_summary["images"][0]["url"]
    @summary.site_name = scraped_summary["siteName"]

    @summary.tag_cloud = Summarize.keyword(article_url)

    @user = current_user
    @summary.user = @user

    respond_to do |format|
      if @summary.save
        format.json { render json: ["title": @summary.title, "text": @summary.text, "url": "https://hundundigest.herokuapp.com/summaries/#{@summary.id}", "image": "https://i.guim.co.uk/img/media/5e1ef6b193b314b29c8ed6b04472f51908ceb355/334_278_2639_1583/master/2639.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctbGl2ZS5wbmc&enable=upscale&s=beec8327bfdc6099c9feed3cc76a74ef"] }
        format.html { redirect_to @summary, notice: 'Summary was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render :create, status: :created, location: @summary }
      end
    end
  end

  # PATCH/PUT /summaries/1
  # PATCH/PUT /summaries/1.json
  def update
    respond_to do |format|
      if @summary.update(summary_params)
        format.html { redirect_to summaries_url, notice: 'Summary was successfully updated.' }
        format.js { head :no_content } #returning no content!!!
      else
        format.html { render :edit }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summaries/1
  # DELETE /summaries/1.json
  def destroy
    @summary.destroy
    respond_to do |format|
      format.html { redirect_to summaries_url, notice: 'Summary was successfully removed from Dashboard' }
      format.json { head :no_content }
    end
  end

  def favorite

  end


  def tagged
    if params[:tag].present?
      @summaries = Summary.tagged_with(params[:tag])
    else
      @summaries = Summary.all
    end
  end

  def add_tags
    @summary.tag_list.add(params[:tag])
    @summary.save
  end

  def remove_tags
    @summary.tag_list.remove(params[])
  end

private

    # Use callbacks to share common setup or constraints between actions.
    def set_summary
      @summary = Summary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summary_params
      params.require(:summary).permit(:user_id, :title, :text, :article_url, :category_list, :digest)
    end
end
