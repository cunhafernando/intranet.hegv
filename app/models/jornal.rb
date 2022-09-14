class Jornal < ApplicationRecord
    belongs_to :user
    mount_uploader :materia, MateriaUploader
end
