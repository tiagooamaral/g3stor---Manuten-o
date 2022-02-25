         begin
            vGroupBy := pCampoData + ',' + 'A.' + pIniciais + 'DOC, ' + 'A.' +
               pIniciais + 'VAL,' + 'A.' + pIniciais + 'DFP, ' + 'A.' +
               pIniciais + 'EMI,' + 'A.' + pIniciais + 'DAT, ' +
               'A.ATIVO, CDFOR.FOR_RED, CDCON.CON_NOM, CDTIPD.TIP_RED, CDTIPD.TIP_NOM, ' + 'A.' +
               pIniciais + 'FOR,' + 'A.' + pIniciais + 'OBS, CDCCUST.CUS_NOM, A.pag_cod,CDCHEQUES.che_cheque'; {A190618} // Mantis 00150
               {TIAGO - 16/03/2021 - ALTERA��O PARA MIGRAC�O FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
            if vModeloRelatorio = mrVencimentoFornecedor then
               pOrderBy := '12, 3 ' {A190703} // Mantis 150 11, 2
            else
               pOrderBy := '3, 12 '; {A190703} // Mantis 150 2, 11
         end;
      mrResumidoFornecedor:
         begin
            vGroupBy := 'CDFOR.FOR_RED'; {TIAGO - 16/03/2021 - ALTERA��O PARA MIGRAC�O FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
            pOrderBy := '1';
         end;


         begin
            vGroupBy := pCampoData + ',' + 'A.' + pIniciais + 'DOC, ' + 'A.' +
               pIniciais + 'VAL,' + 'A.' + pIniciais + 'DFP, ' + 'A.' +
               pIniciais + 'EMI,' + 'A.' + pIniciais + 'DAT, ' +
               'A.ATIVO, CDFOR.FOR_RED, CDCON.CON_NOM, CDTIPD.TIP_RED, CDTIPD.TIP_NOM,' + 'A.' +
               pIniciais + 'FOR,' + 'A.' + pIniciais + 'OBS, ';   {TIAGO - 16/03/2021 - ALTERA��O PARA MIGRAC�O FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
            //if ((vModeloRelatorio = 6) and ParametroUVERCUSTO2) then
            if (vModeloRelatorio = mrSeparadoCentro2) then
               vGroupBy := vGroupBy + ' CDCCUSTAUX.CUS_NOM, '
            else
               vGroupBy := vGroupBy + ' CDCCUST.CUS_NOM, ';
            vGroupBy := vGroupBy + ' A.pag_cod,CDCHEQUES.che_cheque'; {A190618} // Mantis 00150
            if vModeloRelatorio = mrSeparadoDocumento then
               pOrderBy := '15' {A190703} // Mantis 150  14
            else
               pOrderBy := '11'; {A190703} // Mantis 150 10
         end;
      mrSeparadoProjeto:
         begin
            vGroupBy := pCampoData + ',' + 'A.' + pIniciais + 'DOC, ' + 'A.' +
               pIniciais + 'VAL,' + 'A.' + pIniciais + 'DFP, ' + 'A.' +
               pIniciais + 'EMI,' + 'A.' + pIniciais + 'DAT, ' +
               'A.ATIVO, CDFOR.FOR_RED, CDCON.CON_NOM, CDTIPD.TIP_RED, CDTIPD.TIP_NOM, ' + 'A.' +
               pIniciais + 'FOR,' + 'A.' + pIniciais + 'OBS, CDCCUST.CUS_NOM, A.pag_cod,CDCHEQUES.che_cheque, CDPROJ.proj_nom'; {A190618} // Mantis 00150';
               {TIAGO - 16/03/2021 - ALTERA��O PARA MIGRAC�O FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
            pOrderBy := '17'; {A190703} // Mantis 150 16
         end;