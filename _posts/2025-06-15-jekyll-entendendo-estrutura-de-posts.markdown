---
layout: post
title:  "Jekyll - Entendendo estrutura de Posts"
date:   2025-06-15 16:50:28 -0300
categories: 
describe: "Resumo do post com imagem."
thumbnail: 'https://placehold.co/1600x900'
---

# Documentação da Collection `site.posts`

A collection `site.posts` contém todos os posts localizados na pasta `_posts`.

## Campos disponíveis por post:

| Campo         | Tipo      | Descrição                                             |
|---------------|-----------|-------------------------------------------------------|
| `title`       | String    | Título do post (vindo do front matter)                |
| `url`         | String    | URL do post                                           |
| `date`        | DateTime  | Data do post                                          |
| `excerpt`     | String    | Trecho resumido do conteúdo                           |
| `content`     | String    | Conteúdo completo renderizado                         |
| `categories`  | Lista     | Categorias atribuídas (ex: `['blog', 'tutorial']`)    |
| `tags`        | Lista     | Tags do post                                          |
| `next`        | Post      | Próximo post em ordem cronológica                     |
| `previous`    | Post      | Post anterior em ordem cronológica                    |

## Exemplo de acesso em Liquid:

```liquid
{% raw %}
{% for post in site.posts %}
  <h2>{{ post.title }}</h2>
  <p>{{ post.date | date: "%d/%m/%Y" }}</p>
  <p>{{ post.excerpt }}</p>
  <a href="{{ post.url }}">Leia mais</a>
{% endfor %}
{% endraw %}
