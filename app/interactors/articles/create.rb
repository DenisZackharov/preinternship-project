module Articles
  class Create
    include Interactor::Organizer
    include TransactionalInteractor

    organize Articles::SaveRecord
  end
end
