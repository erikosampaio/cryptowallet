namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://www.cryptocompare.com/media/19633/btc.png",
          mining_type: MiningType.find_by(acronym: 'PoW')
        },

        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://img2.gratispng.com/20180330/wae/kisspng-ethereum-bitcoin-cryptocurrency-logo-tether-bitcoin-5abdfe01b6f4b4.2459439115224007697494.jpg",
          mining_type: MiningType.all.sample
        },

        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://ih1.redbubble.net/image.565893629.7574/st,small,845x845-pad,1000x1000,f8f8f8.u2.jpg",
          mining_type: MiningType.all.sample
        },

        {
          description: "Iota",
          acronym: "IOT",
          url_image: "data:image/png;base64,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",
          mining_type: MiningType.all.sample
        },

        {
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://z.cash/wp-content/uploads/2020/03/zcash-icon-black.png",
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end
  
  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end