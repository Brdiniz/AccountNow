Feature: Manage box
In order to value
As a role
I want feature

	Scenario: Create a new Box
    Given I have no Box
    And I go to the list of Box
    When I follow "Criar caixa"
    And I fill in "Nome" with "Casa"
    And I press "Salvar"
    Then I should see "Box criado com sucesso!"
    And I should see "Casa"
    And I should have 1 box


