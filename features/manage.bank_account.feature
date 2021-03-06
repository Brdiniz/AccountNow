Feature: Manage bank account
In order to value
As a role
I want feature

  Scenario: Create a new Bank Account
    Given I have no BankAccount
    And I have a Bank with name "BankBoston" and code "4561"
    And I go to the list of bank_account
    When I follow "Criar Conta Bancária"
    And I select "BankBoston" from "bank_account_bank_id"
    And I fill in "Nome" with "Conta teste"
    And I fill in "Saldo Inicial" with "10"
    And I select "1" from "bank_account_opening_balance_date_3i"
    And I select "Abril" from "bank_account_opening_balance_date_2i"
    And I select "2010" from "bank_account_opening_balance_date_1i"
    And I press "Salvar"
    Then I should see "Criação de Conta Bancária realizada com sucesso!"
    And I should see "Conta teste"

  Scenario: List and remove Bank Account
    Given I have no BankAccount
    And I have a Bank with name "BankBoston" and code "4561"
    And I have a bank account with name "TesteBank" and Bank "BankBoston"
    When I go to the list of bank_account
    And I should see "Listagem de Contas Bancárias"
    And I should not see "ID"
    And I should see "Nome"
    And I should not see "Created at"
    And I should see "Visualizar"
    And I should see "Editar"
    And I should see "Remover"
    And I should see "TesteBank"
    And I should see "Listar Contas Bancárias"
    And I should see "Criar Conta Bancária"
    Then I follow "Remover"
    And I should not see "TestBank"
    And I should not see "Visualizar"
    And I should not see "Editar"
    And I should not see "Remover"
    
  Scenario: List Bank Account
    Given I have no BankAccount
    And I have a Bank with name "BankBoston" and code "4561"
    And I have a bank account with name "TesteBank" and Bank "BankBoston"
    When I go to the list of bank_account
    And I should see "TesteBank"
    Then I follow "Visualizar"
    And I should see "Conta Bancária TesteBank"
    And I should see "Contas"
    And I should see "ID"
    And I should see "Nome"
    And I should see "Caixa"
    And I should see "Data do vencimento"
    And I should see "Valor"
    And I should see "Saldo Realizado"
    And I should see "Saldo Estimado"
    And I should see "Saldo Anterior"
    And I should see "Saldo do Período"

  Scenario: Show and Delete account in the bank account
    Given I have no BankAccount
    And I have a Bank with name "Citibank" and code "999"
    And I have a bank account with name "Citibank pessoal" and Bank "Citibank"
    And The BankAccount named "Citibank pessoal" has an account
    And I go to the show first account in the bank_account "Citibank pessoal"
    When I should see "Conta Bancária Citibank pessoal"
    And I should see "Voltar para Conta Bancária"
    Then I follow "Remover"
    And I should see "Exclusão de Conta realizada com sucesso!"
    And I should see "Contas"
    And I should see "Conta Bancária Citibank pessoal"

  Scenario: Show and Editing account in the bank account
    Given I have no BankAccount
    And I have a Bank with name "Citibank" and code "999"
    And I have a bank account with name "Citibank pessoal" and Bank "Citibank"
    And The BankAccount named "Citibank pessoal" has an account
    And I go to the show first account in the bank_account "Citibank pessoal"
    When I should see "Conta Bancária Citibank pessoal"
    And I should see "Voltar para Conta Bancária"
    Then I follow "Editar"
    And I should see "Conta Bancária Citibank pessoal"
    And I should see "Alterar Conta"
    When I press "Salvar"
    And I should see "Alteração de Conta realizada com sucesso!"
    And I should see "Contas"
    And I should see "Conta Bancária Citibank pessoal"
  
  
  

