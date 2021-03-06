class Rt::EntitySubscribesController < ApplicationController
  include ActionView::Helpers::UrlHelper
  before_action :set_rt_entity_subscribe, only: [:show, :edit, :update, :destroy]
  # en el modelo se controla que no exista una solicitud con ese email
  # pero puede haberse dado de alta al usuario sin haber solicitud
  before_action :user_exists, only: [:create]
  respond_to :html, :js, :json

  def new
    @rt_entity_subscribe = Rt::EntitySubscribe.new
  end

  def create
    @rt_entity_subscribe = Rt::EntitySubscribe.new(rt_entity_subscribe_params)
    if @rt_entity_subscribe.save
      redirect_to entities_path, notice: t('entity_subscribe.response')
    else
      respond_with(@rt_entity_subscribe)
    end
  end

  protected

    def user_exists
      return unless User.where(email: rt_volunteer_subscribe_params[:email]).exists?
      redirect_to new_user_session_path, alert: I18n.t('user.exist')
    end

    def rt_entity_subscribe_params
      params.require(:rt_entity_subscribe).permit(:name, :vat_number, :email, :contact_name, :contact_last_name, :contact_last_name_alt, :representative_name, :representative_last_name, :representative_last_name_alt, :phone_number, :phone_number_alt, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province, :entity_type_id, :other_subscribe_reason, request_form_attributes: [:req_reason_id])
    end
end
