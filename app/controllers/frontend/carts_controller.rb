class CartsController < ApplicationController


  def add_item

    t = Ticket.find(params[:id])

    if !@cart.include?(t.id)
      @cart.push(t.id)
    end

    redirect_to list_items_path

  end

  def list_items

    @items = @cart

  end

  def remove_item

    @cart.delete_at(params[:id].to_i)

    redirect_to list_items_path


  end


end