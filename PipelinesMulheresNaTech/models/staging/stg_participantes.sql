SELECT ID_PARTICIPANTE,
       NOME,
       PAIS_ORIGEM
FROM {{ source('dados_brutos', 'participantes') }}
