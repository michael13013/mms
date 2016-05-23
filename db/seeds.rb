require 'open-uri'

Feed.destroy_all
Feed.create!(supplier: "Hugo Boss", adapter: "tradedoubler", url: 'https://gist.githubusercontent.com/michael13013/a5d0ff98977285c095b9/raw/ab37bdef70f7eba32a8edf0cce15d939477ee753/tradedoubler.xml')
Feed.create!(supplier: "Ünkut", adapter: "effiliation", url: 'https://gist.githubusercontent.com/michael13013/8fb8fa84c75d1e95d5f0/raw/cba2026cba3bd414fcdb188d383b804ae1d06240/unkut.xml')
Feed.create!(supplier: "Carnet de Vol", adapter: "carnetdevol", url: 'https://gist.githubusercontent.com/michael13013/afb2c73b3ca237b34112/raw/211b47a5770b93ef47a5d95574afd09e29b245b8/carnet_de_vol.xml')
Feed.create!(supplier: "Eden Park", adapter: "edenpark", url: 'https://gist.githubusercontent.com/michael13013/6cdac3427532572c27ce/raw/dd5b156cd991fce50ad4b1004e5170fa95553e9c/edenpark.xml')
Feed.create!(supplier: "Teddy Smith", adapter: "teddysmith", url: 'https://gist.githubusercontent.com/michael13013/adfe8aa901061d036ad7ab34087151e1/raw/794e434688f2f7042b3d87b100e4c58886340a49/teddysmith')

#Feed.create!(supplier: "Teddy Smith", adapter: "teddysmith", url: 'http://feeds.effiliation.com/myformat/13248330')

Product.destroy_all

# Un autre supplier (pas encore utilisé pour le moment)
# supplier.push({
#     name: 'Carnet de Vol',
#     url: 'http://url-de-mon-feed',
#     feed_type: 'Effiliation'
# })

# supplier.each do |s|
#   puts 'Importing from ' << s[:name] << ' (' << s[:feed_type] << ')'
#   # Gestion importation feed en provenance de tradedoubler
#   if s[:feed_type] == 'tradedoubler'
#     docs = Nokogiri::Slop(open(s[:url]))
#     products = docs.xpath('//product')
#     products[0..20].each do |p|
#       # Passe au suivant si l'ean n'est pas renseigné dans le flux
#       next unless p.css('ean').first
#       # Passe au suivante si c'est pas pour homme
#       next unless p.css('fields img_large').first.try(:content).try(:strip) == 'Men'
#       # On insere le produit que s'il n'existe pas (clé : ean)
#       product = Product.where(ean: p.css('ean').first.content.strip).first
#       if product
#         # On supprime les offres de ce produit pour ce supplier :
#         product.offers.where(supplier: s[:name]).each do |o|
#           o.destroy!
#         end
#       else
#         # Bon le search avec css c'est crado je pense mais j'ai pas le temps ...
#         product = Product.new
#         product.title = p.css('name').first.content.gsub(/\n/, '').strip
#         product.image = p.css('imageurl').first.content.strip unless p.css('imageurl').first.nil?
#         product.link = p.css('advertiserproducturl').first.content.strip
#         product.description = p.css('description').first.content.strip
#         product.ean = p.css('ean').first.content.strip
#         product.size = p.css('size').first.content.strip
#         product.color = p.css('fields colour').first.content.strip
#         product.brand = Brand.first_or_create!(name: p.css('brand').first.content.strip)
#         if category = p.css('TDCategoryID').first
#           product.category = tradedoubler_category_id_to_category_name[category.content.strip]
#         end
#         product.save!
#       end
#       # On insert l'offre
#       product.offers.new(supplier: s[:name], price: p.css('price').first.content.strip).save!
#     end
#   end
# end

# Seed User

user1 = User.first_or_create!(email: 'admin@admin.com', password: '12345678', admin: true)
user1.save
# Seed Look

Look.destroy_all
look1 = Look.create!( name: "BUSINESS", description: "Présentable en toutes circonstances", photo:"looks/look-9.png")
look2 = Look.create!( name: "DESIGNERS", description: "Les dernières nouveautés des créateurs", photo:"looks/look-2.png")
look3 =Look.create!( name: "DENIM", description: "Décontracté et jeans basiques", photo:"looks/look-3.png")
look4 =Look.create!( name: "LUXE", description: "Hautes gammes", photo:"looks/look-6.png")
Look.create!( name: "NAUTIQUE", description: "Look maritime", photo:"looks/look-0.png")
Look.create!( name: "ROCK", description: "Look branché pour rockers urbains", photo:"looks/look-7.png")
Look.create!( name: "SPORT", description: "Look sportif", photo: "looks/look-8.jpg")
Look.create!( name: "STREETWEAR", description: "Décontracté urbain", photo:"looks/look-1.jpeg")
Look.create!( name: "SURFWEAR", description: "Look on the beach", photo:"looks/look-4.jpg")
Look.create!( name: "TOUS LES LOOKS", description: "Voir tous les produits", photo:"looks/look-all.jpg")


Brand.all.each do |brand|
  brand.look = look1
  brand.save
end


# Seed Choice
choice1 = Choice.first_or_create!(user: user1, look: look1)


=begin
# Seed Product
20.times do
  Product.first_or_create!(title: Faker::Commerce.product_name,
    description: Faker::Hipster.sentences,
    size: Faker::Number.between(1, 10),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    brand: Faker::Lorem.word,
    product_type: Faker::Hipster.word)
end
=end
