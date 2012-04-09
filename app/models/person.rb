class Person < ActiveRecord::Base
def nombrec
  apaterno+' '+amaterno+' '+nombre
end
end
