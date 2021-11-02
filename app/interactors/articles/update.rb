module Articles
  class Update
    include Interactor::Organizer
    
    organize Articles::SaveRecord
  end
end
