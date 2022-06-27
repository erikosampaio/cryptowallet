module ApplicationHelper
  # Esse método não está mais sendo usado. Permanceu apenas para aprendizado
  def locale_idioma(locale)
    locale == :en ? "Estados Unidos" : "Português Brasil"
  end

  # Esse método não está mais sendo usado. Permanceu apenas para aprendizado
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def ambiente_rails
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Teste"
    end
  end
end
