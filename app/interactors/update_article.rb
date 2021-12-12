class UpdateArticle
  include Interactor::Organizer
  include TransactionalInteractor

  organize Articles::SaveRecord
end
