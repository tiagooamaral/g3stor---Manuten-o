         Add(' From ' + pArquivo + ' A ');

         Add(' LEFT JOIN ' + pTabela + ' ON (' + ' A' + '.bai_' + pIniciais + ' = ' + pTabela + '.' + pIniciais + '_cod) ');     {TIAGO - 17/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}
         Add(' LEFT JOIN cdtipd ON (' + ' A' + '.bai_tip = cdtipd.tip_cod) '); {TIAGO - 17/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}
         Add(' LEFT JOIN cdcon ON (' + ' A' + '.bai_con = cdcon.con_cod) ');   {TIAGO - 17/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}
         if cbxCentroDeCustoDE.Text <> '' then
            Add(' LEFT JOIN cdccust ON (' + ' A' + '.bai_ccusto = cdccust.cus_cod) ');   {TIAGO - 17/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}
         if cbxPlanoDeContaDE.Text <> '' then
            Add(' LEFT JOIN cdpla ON (' + 'A' + '.bai_pla = cdpla.pla_cod) ');     {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

         if vOrigem = NomeDasTabelas('mvcorecb') then
            begin
               add(' LEFT JOIN cdcar ON (' + 'A' + '.bai_car = cdcar.car_cod) ');   {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}
               Add(' LEFT JOIN CDALM ON (' + 'A' + '.BAI_ORI = CDALM.ALM_COD)  ');  {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}
               Add(' LEFT JOIN CDGRUC GRUPO1 ON (' + pTabela + '.' + pIniciais + '_GRU = GRUPO1.GRU_COD)  ');
               Add(' LEFT JOIN CDGRUC GRUPO2 ON (' + pTabela + '.' + pIniciais + '_GRU2 = GRUPO2.GRU_COD)  ');
               Add(' LEFT JOIN CDGRUC GRUPO3 ON (' + pTabela + '.' + pIniciais + '_GRU3 = GRUPO3.GRU_COD)  ');
            end
         else
         Begin {A190618}  // Mantis --150
            Add(' LEFT JOIN CDGRUF GRUPO1 ON (' + pTabela + '.' + pIniciais + '_GRU = GRUPO1.GRU_COD)  ');
            Add(' LEFT JOIN CDCHEQUES ON (A.BAI_CHEQUE= CDCHEQUES.che_codigo) '); {A190618}  // Mantis --150
          end; {A190618}  // Mantis --150

         if ParametroUVERPLA2 then
            Add(' LEFT JOIN CDPLAAUX ON (' + 'A' + '.BAI_PLA2 = CDPLAAUX.PLA_COD)  ');   {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

         if ParametroUVERCUSTO2 then
            Add(' LEFT JOIN CDCCUSTAUX ON (' + 'A' + '.BAI_CCUSTO2 = CDCCUSTAUX.CUS_COD)  ');   {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

         if ParametroUVERPROJETO2 then
            begin
               Add(' LEFT JOIN CDPROJ2 ON ' + 'A' + '.BAI_PROJ2 = PROJ2_COD ');    {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}
               Add(' LEFT JOIN CDPROJ ON PROJ2_PROJ = PROJ_COD ');
            end;

         Add('Where ' + ' A'  + '.BAI_COD > 0 ');   {TIAGO - 17/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

   // N�mero do Documento
   CriaSQLFiltro(Query, edtNDocumento.Text, edtNDocumento.Text, 'A', 'BAI_DOC', 'S');   {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

   // Data do Emiss�o
   if (lupEmissaoDE.Text <> '') and (lupEmissaoATE.Text <> '') then
      CriaSQLFiltro(Query, lupEmissaoDE.Text, lupEmissaoATE.Text, 'A',
         'BAI_EMI', 'D');   {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

   // Data do Vencimento
   if (lupVencimentoDE.Text <> '') and (lupVencimentoATE.Text <> '') then
      CriaSQLFiltro(Query, lupVencimentoDE.Text, lupVencimentoATE.Text,
         'A', 'BAI_VEC', 'D');   {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

   // Data do Compensa��o
   if (lupCompensacaoDE.Text <> '') and (lupCompensacaoATE.Text <> '') then
      CriaSQLFiltro(Query, lupCompensacaoDE.Text, lupCompensacaoATE.Text,
         'A', 'BAI_OPE', 'D');     {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}

   // Data do Pagamento
   if (lupPagtoDE.Text <> '') and (lupPagtoATE.Text <> '') then
      CriaSQLFiltro(Query, lupPagtoDE.Text, lupPagtoATE.Text, 'A',
         'BAI_PGT', 'D');          {TIAGO - 24/03/2021 - ALTERA��O FIREBIRD 2.5 / RETIRADA pArquivo E ADIC�O ALIAS = A}