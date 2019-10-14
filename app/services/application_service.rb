class ApplicationService

  def self.call(*args, &block)
    new(*args, &block).call
  rescue Exception => exception
    OpenStruct.new(success?: false, error: exception.message, status_code: 400)
  end
end
