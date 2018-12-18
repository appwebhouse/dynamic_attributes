ActiveRecord::Base.transaction do
  # root
  root = Category.create! name: 'Root', properties: {
    'Cena' => { type: 'decimal' }
  }

  # Elektronika
  a = Category.create! name: 'Elektronika', parent: root

  # Elektronika -> Telefony i akcesoria
  b = Category.create! name: 'Telefony i akcesoria', parent: a

  # Elektronika -> Smartfony i telefony komórkowe
  Category.create! name: 'Smartfony i telefony komórkowe', parent: b

  # Ogłoszenia i usługi
  a = Category.create! name:  'Ogłoszenia i usługi', parent: root

  # Ogłoszenia i usługi -> Motoryzacja
  b = Category.create! name: 'Motoryzacja', parent: a

  # Ogłoszenia i usługi -> Motoryzacja -> Samochody
  c = Category.create! name: 'Samochody', parent: b

  # Ogłoszenia i usługi -> Motoryzacja -> Samochody -> Osobowe
  Category.create! name: 'Osobowe', parent: c

  # Ogłoszenia i usługi -> Motoryzacja -> Samochody -> Autobusy
  Category.create! name: 'Autobusy', parent: c
end
