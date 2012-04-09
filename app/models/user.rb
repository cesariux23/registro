# -*- encoding : utf-8 -*-
require 'digest'
class User < ActiveRecord::Base
	has_many :people
  attr_accessor :password
	attr_accessible :username, :password, :enabled, :id_coord, :is_admin
	validates_presence_of :username, :password, :message => "Campo vacio"
	validates_presence_of :id_coord, :message => "Seleccione un valor"
	validates :username, :uniqueness => {:message=>"Ya existe en la base"}

   before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(id, submitted_password)
    user = find_by_username(id)
    return nil  if user.nil?
    return nil  if !user.enabled?
    return user if user.has_password?(submitted_password)
  end

   def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end


end
