   // N�mero do Documento
   CriaSQLFiltro(Query, edtNDocumento.Text, edtNDocumento.Text,
      'A', 'REC_DOC', 'S');   {TIAGO - 25/03/2021 / ALTERA��O FIREBIRD 2.5 ALIAS}

   // Data do Emiss�o
   if (lupEmissaoDE.Text <> '') and (lupEmissaoATE.Text <> '') then
      CriaSQLFiltro(Query, lupEmissaoDE.Text, lupEmissaoATE.Text, 'A',
         'REC_EMI', 'D');      {TIAGO - 25/03/2021 / ALTERA��O FIREBIRD 2.5 ALIAS}

   // Data do Vencimento
   if (lupVencimentoDE.Text <> '') and (lupVencimentoATE.Text <> '') then
      CriaSQLFiltro(Query, lupVencimentoDE.Text, lupVencimentoATE.Text,
         'A', 'REC_VEC', 'D');   {TIAGO - 25/03/2021 / ALTERA��O FIREBIRD 2.5 ALIAS}