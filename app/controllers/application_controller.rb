class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def after_sign_in_path_for(resource)
    # （10/20 その）public/customersを作成していないため、顧客のマイページへの移動不可能
    # そのため一時的にtopページへの移動させています
    # public/customersを作成後に下記訂正予定
    # ↓10／23pathの後ろの(resource)を削除しました。urlにmy_page.1と表示されるため（しま）
    # 10/26マイページからトップページに飛ぶように設定しました。（りんたろう）
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    customers_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:telephone_number])
  end

end
