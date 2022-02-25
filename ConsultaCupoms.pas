      if edtSerie.Text <> '' then
         s := Concat(s, ' AND EXISTS (SELECT VD2_BOL FROM ESTMVVD2 WHERE VD2_BOL = A.VD1_COD AND VD2_NSERIE LIKE ', QuotedStr(ValorLike(edtSerie.Text)) + ' ) ');
                         {TIAGO - 06/04/2021 - ALTERA��O MIGRA��O FIREBIRD 2.5 / ALIAS} 
      if edtServico.text <> '' then
         begin
            s := Concat(s,
               ' AND (EXISTS (SELECT * FROM ESTMVVD2 WHERE VD2_SER<>0 AND UPPER(VD2_DESCRICAO) LIKE ',
               QuotedStr(UpperCase(edtServico.text) + '%'));

