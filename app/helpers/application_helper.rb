module ApplicationHelper
  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def convert_money(price)
    return price.to_s[0..-3].reverse!.scan(/.{1,3}/).join(',').reverse!
  end
end
