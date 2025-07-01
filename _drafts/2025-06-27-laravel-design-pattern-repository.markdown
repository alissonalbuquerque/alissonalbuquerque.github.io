---
layout     : post
title      : "Laravel - Design Pattern Repository"
describe   : "Implementação e injeção de dependências em projetos Laravel"
date       : 2025-06-27 10:24:41 -0300
categories : ['blog', 'laravel', 'php', 'design pattern']
thumbnail  : https://placehold.co/1600x900
---

O __Repository__ é um *Padrão de Projeto* responsável por tratar operações de acesso a recursos de uma aplicação de forma isolada, abstraída e desacoplada do restante do código, facilitando a manutenção e reuso caso seja necessário.
{:.--p}

No __Laravel__ não existe implementação nativa do repository, mas com poucas classes, interfaces e configurações é possível adicionar uma camada de persistência e consulta a partir de repositórios em sua aplicação. Esse post tem o objetivo de apresentar a implementação de repository em uma aplicação laravel com o uso de injeção de dependências com recursos nativos do framework.
{:.--p}

O __Repository__ é uma `classe` que implementa uma `interface` com as opções de acesso possíveis para o recurso que ela serve, um recurso pode se um model por exemplo, nesse caso vamos implementar um repository de `users` com as seguintes opções: create, update, delete e findById.
{:.--p}

`app\Repositories\Contracts\UserRepositoryInterface.php`
`app\Repositories\Eloquent\UserRepository.php`

```php
<?php

namespace App\Repositories\Contracts;

use App\Models\User;

interface UserRepositoryInterface {

    public function create(array $data): User
    public function update(string|int $id, array $data): ?User
    public function findById(string|int $id): ?User
    public function delete(string|int $id): bool|null
}
```