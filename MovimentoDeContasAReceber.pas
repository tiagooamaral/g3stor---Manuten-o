         begin
            Close;
            SQL.Clear;
            SQL.ADD('UPDATE CDCLI SET CLI_PLA = ');
            SQL.ADD(cApostrofos +
               qryLookupPlanoCta.FieldByName('PLA_COD').AsString + cApostrofos);
            SQL.ADD(',CLI_TIP = ');
            SQL.ADD(cApostrofos + qryLookupTipDoc.FieldByName('TIP_COD').AsString
               + cApostrofos);
            SQL.ADD(',CLI_VEC = ');
            SQL.ADD(cApostrofos + FormatDateTime('mm"/"dd"/"yyyy',
               lupVec.Date) + cApostrofos);

            {SQL.ADD(',CLI_VAL = ');
            SQL.ADD(cApostrofos + TrocaVirgPPto(edtValor.Text) + cApostrofos);
            {TIAGO - 30/03/2021 / RETIRADA POIS OCORRENDO ERRO DE STRING}

            SQL.ADD(',CLI_CONTA = ');
            SQL.ADD(cApostrofos + qryLookUpCta.FieldByName('CON_COD').AsString +
               cApostrofos);
            SQL.ADD(',CLI_CCUSTO = ');
            SQL.ADD(cApostrofos + qryLookupCC.FieldByName('CUS_COD').AsString +
               cApostrofos);
            SQL.ADD('WHERE CLI_COD = ' +
               qryLookupCliente.FieldByName('CLI_COD').AsString);
            StrCopiaSlqClipboard(sql.text);
            ExecSql;
         end;