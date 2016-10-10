module Payola
  class ChangeSubscriptionPlan
    def self.call(subscription, plan)
      secret_key = Payola.secret_key_for_sale(subscription)
      old_plan = subscription.plan

      begin
        customer = Stripe::Customer.retrieve(subscription.stripe_customer_id, secret_key)
        sub = customer.subscriptions.retrieve(subscription.stripe_id)

        prorate = plan.respond_to?(:should_prorate?) ? plan.should_prorate?(subscription) : true

        sub.plan = plan.stripe_id
        sub.prorate = prorate
        sub.save

        subscription.plan = plan
        subscription.save!

        subscription.instrument_plan_changed(old_plan)

      rescue RuntimeError, Stripe::StripeError => e
        subscription.errors[:base] << e.message
      end

      subscription
    end
  end
end
