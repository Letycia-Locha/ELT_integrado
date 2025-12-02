
-- Configuração de materialização: vamos criar como uma tabela física.
{{config(materialized = 'table')}}

WITH stg_kaggle AS (
    SELECT * FROM {{ref('stg_kaggle_survey')}}
),
stg_paises AS (
    SELECT * FROM {{ref('stg_paises')}}
)

SELECT stg_kaggle.PAIS,
       stg_paises.CODIGO_PAIS,
       stg_paises.REGIAO,
       stg_kaggle.NIVEL_EDUCACIONAL,
       stg_kaggle.ANOS_PROGRAMANDO,
       stg_kaggle.CARGO_ATUAL,
       stg_kaggle.ANOS_USANDO_ML,
       stg_kaggle.SALARIO_ANUAL_USD,
       stg_kaggle.LINGUAGENS_USADAS,
       stg_kaggle.BANCOS_DE_DADOS_USADOS,
       stg_kaggle.FERRAMENTAS_BI_USADAS
FROM stg_kaggle
   LEFT JOIN stg_paises ON stg_kaggle.PAIS = stg_paises.NOME_PAIS
