class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.where(user: current_user, category_id: @category.id).order(updated_at: :desc)
    @total = Payment.where(user: current_user, category_id: @category.id).sum(:amount)
  end

  def show
    @category = Category.find(params[:category_id])
    @payment = Payment.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @payment = Payment.new
  end

  def edit; end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    @payment.category_id = params[:category_id]

    if @payment.save
      redirect_to category_payments_url(category_id: @payment.category_id),
                  notice: 'Payment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to payment_url(@payment), notice: 'Payment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_url, notice: 'Payment was successfully destroyed.'
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
