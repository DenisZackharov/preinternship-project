module Articles
  class Create
    include Interactor::Organizer

    organize Articles::SaveRecord
  end
end
