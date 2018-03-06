# Fast Notas Ruby

Ruby toolkit para o [Gateway de emissão fiscal][link-doc-api] da [Fast Notas][link-fast-notas].

## Instalação

```ruby
gem 'fast_notas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fast_notas

## Uso
Os métodos da API estão disponíveis atraves dos métodos da instancia de um cliente

```ruby
  client = FastNotas::Client.new(API_KEY)
```

## Recursos
Esta biblioteca possibilita um acesso fácil e padronizado aos seguintes endpoints da [API][link-doc-api].

* [companies](http://docs.api.fastnotas.com/#companies)
* [customers](http://docs.api.fastnotas.com/#customer)
* [items](http://docs.api.fastnotas.com/#items)
* [documents](http://docs.api.fastnotas.com/#documents)
* [document_schemas](http://docs.api.fastnotas.com/#document-schemas)

### Recursos padrões
Os recursos são fornecidos através de nomenclaturas padrões, seguido do nome da entidade que deve ser acessada.
Exemplo: `list_customers`, `list_documents` ...

Abaixo temos a lista de recursos padrões e seus possíveis parâmetros:

* `list`
    1. Pode ser enviado um Hash multidimensional que será convertido em `query string` (opcional)
* `show`
    1. Id do registro
* `create`
    1. Hash com os dados para criação do registro
* `update`
    1. Id do registro
    2. Hash com os dados que serão alterados no registro
* `delete`
    1. Id do registro

### Exemplo

```ruby
  # Listando clientes de uma empresa
  client.list_customers
  # => [{:id=>"xxxxx-xxxxx-xxxxx-xxxxx", :name=>"Tales Galvão", ...

  # Consultando um cliente
  client.show_customer("xxxxx-xxxxx-xxxxx-xxxxx")
  # => {:id=>"xxxxx-xxxxx-xxxxx-xxxxx", :name=>"Tales Galvão", ...

  # Criando um cliente
  client.create_customer({name: 'Tales Galvão', registry_code: '12345678901234')
  # => {:id=>"xxxxx-xxxxx-xxxxx-xxxxx", :name=>"Tales de Paula Galvão", ...

  # Atualizando um cliente
  client.update_customer("xxxxx-xxxxx-xxxxx-xxxxx", {name: 'Tales de Paula Galvão'})
  # => {:id=>"xxxxx-xxxxx-xxxxx-xxxxx", :name=>"Tales de Paula Galvão", ...
```

### Acessando o último request HTTP completo

```ruby
  customers = client.list_customers
  response  = client.last_request
  status = response.status
  headers = response.headers
```

## Dúvidas
Caso necessite de informações sobre a plataforma ou API, por favor entre em contato com o [atendimento@fastnotas.com](mailto:atendimento@fastnotas.com).

## Créditos
- [Fast Notas][link-author]
- [Todos os Contribuidores][link-contributors]

## Licença
GNU GPLv3. Por favor, veja o [Arquivo de Licença](license.txt) para mais informações.

[link-fast-notas]: https://www.fastnotas.com
[link-doc-api]: http://doc.api.fastnotas.com
[link-author]: https://github.com/fast-notas
[link-contributors]: https://github.com/fast-notas/fast-notas-ruby/graphs/contributors
