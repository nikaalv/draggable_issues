class OrderIndexingController < ApplicationController
  unloadable

  def update
    results = []
    ordering_sequence = params[:ordering].presence || []
    ordering_sequence.each_with_index do |value, seq_index|
      index = value.gsub(/issue-/, '').to_s
      next if index.blank?
      results << Issue.find(index).order_position.update(index: seq_index)
    end

    render json: results
  end

end
