class ServerPackage < ApplicationRecord
  belongs_to :server
  belongs_to :package
end
