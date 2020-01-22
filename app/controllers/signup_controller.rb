class SignupController < ApplicationController
  before_action :validates_step1, only: :step2 # step1のバリデーション
  before_action :validates_step2, only: :step3 # step2のバリデーション
  before_action :validates_step3, only: :step4 # step3のバリデーション


  def index
  end

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    @user = User.new # 新規インスタンス作成
    if verify_recaptcha
    else
      render '/signup/step1'
    end
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end

  def step4
    session[:address_number] = user_params[:address_number]
    session[:address_prefecture] = user_params[:address_prefecture]
    session[:address_name] = user_params[:address_name]
    session[:address_block] = user_params[:address_block]
    session[:address_building] = user_params[:address_building]
    session[:address_phone_number] = user_params[:address_phone_number]
    @user = User.new # 新規インスタンス作成
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: session[:phone_number],
      address_number: session[:address_number],
      address_prefecture: session[:address_prefecture],
      address_name: session[:address_name],
      address_block: session[:address_block],
      address_building: session[:address_building],
      address_phone_number: session[:address_phone_number],
    )

    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      
      require "payjp"
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
      )
      @card = Card.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
      @card.save
      
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end

    def done
      sign_in User.find(session[:id]) unless user_signed_in?
    end
  end


  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation,
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :birthdate_year, 
      :birthdate_month, 
      :birthdate_day, 
      :phone_number,
      :address_number,
      :address_prefecture,
      :address_name,
      :address_block,
      :address_building,
      :address_phone_number,
  )
  end


  def validates_step1
    # step1で入力した値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthdate_year: session[:birthdate_year], 
      birthdate_month: session[:birthdate_month], 
      birthdate_day: session[:birthdate_day],
      phone_number: 12345678901,
      address_number: "000-0000", 
      address_prefecture: "北海道",
      address_name: "EE", 
      address_block: "FF",
      address_phone_number: 12345678901
    )
    render '/signup/step1' unless @user.valid?
  end


  def validates_step2
    # step2で入力した値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthdate_year: session[:birthdate_year], 
      birthdate_month: session[:birthdate_month], 
      birthdate_day: session[:birthdate_day],
      phone_number: session[:phone_number],
      address_number: "000-0000", 
      address_prefecture: "北海道",
      address_name: "EE", 
      address_block: "FF",
      address_phone_number: 12345678901
    )
    render '/signup/step2' unless @user.valid?
  end


  def validates_step3
    # addressで入力した値をsessionに保存
    session[:address_number] = user_params[:address_number]
    session[:address_prefecture] = user_params[:address_prefecture]
    session[:address_name] = user_params[:address_name]
    session[:address_block] = user_params[:address_block]
    session[:address_building] = user_params[:address_building]
    session[:address_phone_number] = user_params[:address_phone_number]
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthdate_year: session[:birthdate_year], 
      birthdate_month: session[:birthdate_month], 
      birthdate_day: session[:birthdate_day],
      phone_number: session[:phone_number],
      address_number: session[:address_number], 
      address_prefecture: session[:address_prefecture], 
      address_name: session[:address_name], 
      address_block: session[:address_block], 
      address_building: session[:address_building], 
      address_phone_number: session[:address_phone_number]
    )
    render '/signup/step3' unless @user.valid?
  end

end
