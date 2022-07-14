#A toujours mettre au début d'un fichier

require 'rspec'
require 'nokogiri'
require 'open-uri'


def create_hash()

#Il n'y a pas d'XPATH direct qui permet d'avoir toutes les valeurs d'une même colonne. 
#Toujours mettre URI.open !!

    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

    #je créé un array avec toutes les noms de cryptos dans ce fichier
    names_crypto = []
    #Ici, à l'aide l'inspection, j'ai seulement sélectionné le nom Bitcoin à l'intérieur du Bloc (sans le logo). 
    page.xpath('//tr//td[3]').each{|name| names_crypto.push(name.text)}
        
#A la lecture du code HTML <=> tr correspond à une ligne comprenant toutes les caractéristiques de la crypto.
#A la lecture du code HTML <=> td correspond à un bloc au sein de tr. C'est pour cela qu'on sélectionne la position dans l'ordre au sein de tr.
#Si tu veux récupérer les liens situés sous un titre h1 (même s'ils sont inclus dans un paragraphe, lui-même imbriqué dans une div), tape page.xpath('//h1//a').


#je créé un array avec toutes les valeurs de cryptos 
    valeur_crypto = []
    #Ici, j'ai sélectionné la valeur la plus précise : avec mon truc, la valeur est figé à l'instant t. 
    page.xpath('//tr//td[5]').each{|valeur| valeur_crypto.push(valeur.text)}

    array_crypto = names_crypto.zip(valeur_crypto).map! { |n, v| { n => v}}

#.zip : cela permet de constituer le nouvel array avec les value et le name fusionnés entre eux.
#.map! : cela permet d'incorporer un nouvel élément dans l'array : je ne sais pas si c'est cela qui instaure la flèche entre les deux noucvelles valeurs fusionnées. 

    puts array_crypto
    return array_crypto

end

create_hash

#Quand j'exécute mon programmme, il m'affiche que le top 20 des valeurs + nil + des erreurs : je ne trouve pas la source du problème.
#Il m'affiche régulièrement plusieurs hashs avec le top 20 car il prend des valeurs qui ont variées entre l'instant t et l'instant t'