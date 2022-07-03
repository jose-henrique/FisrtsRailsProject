class User < ApplicationRecord
    has_secure_password
    validates name, presence: true, length: {maximum: 60}, uniqueness: true
end
