require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(URI.open("https://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Accueil_principal"))

puts page.class

