class Capture < ApplicationRecord
  belongs_to :server
  belongs_to :package_version
end
