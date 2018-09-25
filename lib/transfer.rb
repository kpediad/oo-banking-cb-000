class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    self.status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.sender.balance >= self.amount && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
    end

    def reverse_transfer
      if self.valid? && self.receiver.balance >= self.amount && self.status == "complete"
        self.receiver.balance -= self.amount
        self.sender.balance += self.amount
        self.status = "reversed"
      else
        self.status = "rejected"
      end
    end
  end

end
