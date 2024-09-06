*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary    Locale=pt-BR
Resource       setup_teardown.robot
Test Setup     Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao
${PROGRAMACAO}     //option[contains(.,'Programação')]
${FRONT-END}       //option[contains(.,'Front-End')]
${DADOS}           //option[contains(.,'Data Science')]
${DEVOPS}          //option[contains(.,'Devops')]
${UX}              //option[contains(.,'UX e Design')]
${MOBILE}          //option[contains(.,'Mobile')]
${INOVACAO}        //option[contains(.,'Inovação')]

*** Test Cases ***
Verificar se preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    
    Dado que preencha os campos do formulário
    E clique no botão criar card
    Então identificar o card dentro do time esperado

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
    Dado que preencha os campos do formulário
    E clique no botão criar card
    Então identificar três cards no time esperado

*** Keywords ***
Dado que preencha os campos do formulário
    ${Nome}        FakerLibrary.First Name   
    Input Text     ${CAMPO_NOME}     ${Nome}
    ${Cargo}       FakerLibrary.Job
    Input Text     ${CAMPO_CARGO}    ${Cargo}
    ${Imagem}      FakerLibrary.Image Url   
    Input Text     ${CAMPO_IMAGEM}   ${Imagem}
    Click Element  ${CAMPO_TIME}
    Click Element  ${PROGRAMACAO}
E clique no botão criar card
    Click Element    ${CAMPO_CARD}
Então identificar o card dentro do time esperado
    Element Should Be Visible    class:colaborador
Então identificar três cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulário
        E clique no botão criar card
    END
    Sleep    10s

