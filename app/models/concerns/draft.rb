# module Draft
#   extend ActiveSupport::Concern

#   VALID_STATUSES = ["public", "drafted", "archived"]

#   included do
#     validates :status, inclusion: { in: VALID_STATUSES }
#   end

#   def archived?
#     status == "archived"
#   end

#   def drafted?
#     status == "drafted"
#   end

#   def publish?
#     status == "public"
#   end

# end
