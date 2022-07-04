=begin
Problema: este patrón está creado para cuando tenemos que hacer ciertas operaciones antes y/o
después de la ejecución de un servicio. Por ejemplo, tenemos un servicio que se encarga dehacer una
transacción bancaria y antes de que se ejecute esta transacción queremos que valide los permisos
del usuario y que antes de finalizar la transacción guarde un log.

Solución: vamos a crear un objeto Proxy, este va a tener la misma interfaz del servicio de la
transacción bancaria y lo que va a hacer es delegarle la responsabilidad de esta transacción al
servicio, pero, antes y después de esto podremos añadir la lógica que nos haga falta; en este caso,
en primer lugar, queremos validar que el usuario tenga permisos de hacer esa transacción y,
posteriormente, queremos que se guarde un log de la misma.
=end

class BankTransactionService
  def call
    # Some logic for a bank transaction.
    puts '......Processing......'
    puts 'Done!'
  end
end

class BankTransactionServiceProxy
  attr_reader :real_service

  def initialize(real_service)
    @real_service = real_service
  end

  def call
    authorized_user?
    real_service.call
    save_transaction_log
  end

  private

  def authorized_user?
    # Logic to check if the user is valid for this transaction.
    true
  end

  def save_transaction_log
    # Logic to save a log record.
    puts 'Saved a log record for transaction #123'
  end
end

service = BankTransactionService.new
proxy = BankTransactionServiceProxy.new(service)
proxy.call
