module Articles
  class Update
    include Interactor::Organizer
    include TransactionalInteractor
    
    organize Articles::SaveRecord
  end
end
