SELECT "name.common" AS NOME_PAIS,
       cca3          AS CODIGO_PAIS,
       region        AS REGIAO
FROM {{ source('dados_brutos', 'paises') }}
