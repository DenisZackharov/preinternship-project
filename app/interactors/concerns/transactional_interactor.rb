module TransactionalInteractor
  extend ActiveSupport::Concern

  included do
    around do |interactor|
      if ActiveRecord::Base.connection.open_transactions == Rails.application.secrets.open_transactions_count
        ActiveRecord::Base.transaction do
          interactor.call(context)
        end
      else
        interactor.call(context)
      end
    end

    def self.after_transaction(*hooks, &block)
      hooks << block if block
      hooks.each { |hook| after_transaction_hooks.unshift(hook) }
    end

    def self.after_transaction_hooks
      @after_transaction_hooks ||= []
    end

    def with_hooks
      send(:run_around_hooks) do
        send(:run_before_hooks)
        yield
        send(:run_after_hooks)
      end
      send(:run_after_transaction_hooks)
    end
  end

  def run_after_transaction_hooks
    send(:run_hooks, self.class.after_transaction_hooks)
  end
end