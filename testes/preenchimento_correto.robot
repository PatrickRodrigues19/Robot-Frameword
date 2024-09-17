*** Settings ***
Resource       ../resources/main.robot
Test Setup     Dado que eu acesse o Organo
Test Teardown  Fechar o navegador


*** Test Cases ***
Verificar se preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    Dado que preencha os campos do formulário
    E clique no botão criar card
    Então identificar o card dentro do time esperado

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
    Dado que preencha os campos do formulário
    E clique no botão criar card
    Então identificar três cards no time esperado

Verificar se é possivel criar um card para cada time disponivel se preenchermos os campos corretamente
    Dado que preencha os campos do formulário
    Então criar e identificar um card em cada time disponivel