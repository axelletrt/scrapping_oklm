require 'open-uri'
require 'nokogiri'

class StartScrap 

    def trader (url)
        page = Nokogiri::HTML(open(url))

        list_line = page.xpath('//*[@id="currencies-all"]/tbody/tr')
        list_currencies = Array.new

        list_line.each { | line |
            coin = Hash.new

            currency = line.xpath('td[2]/a')
            rates = line.xpath('td[8]')
        
            coin['currency'] = currency.text
            coin['rates'] = rates.text

            list_currencies.push( coin )
        }

        list_currencies 
    end

    def save 

        page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

        list_line = page.xpath('//*[@id="currencies-all"]/tbody/tr')
        # list_currencies = Array.new

        list_line.each { | line |

        @crypto = Crypto.new 

            currency = line.xpath('td[2]/a')
            rates = line.xpath('td[8]')
        
          @crypto.currency = currency.text 
          @crypto.rates = rates.text

           @crypto.save 
     
        } 
    end 

    def perform 
        trader("https://coinmarketcap.com/all/views/all/")
        save 
    end 

end 


#Class avec initialize, perform et save (comme demandé)

# class StartScrap

#     def initialize
#         @url= "https://coinmarketcap.com/all/views/all/"
#     end

#     def perform
#    page = Nokogiri::HTML(open(@url))

#    list_line = page.xpath('//*[@id="currencies-all"]/tbody/tr')
#    list_currencies = Array.new
#    list_line.each { | line |

#                 coin = Hash.new
#        currency = line.xpath('td[2]/a')
#        rates = line.xpath('td[8]')

#        coin['currency'] = currency.text
#        coin['rates'] = rates.text

#        list_currencies.push(coin)
#    }
#         return (list_currencies)
#     end

#     def save
#         list_currencies = perform
#         puts list_currencies
#         list_currencies.each do |hash|
#             Crypto.create(currency: hash['currency'], rates: hash['rates'])
#         end

#     end
# end



