begin

   Result := False;
   vDataSet := CarregarDadosDB(
      'Select ESTMVVD1.*, ESTMVVD5.*, '#13#10 +
      '   ALM_EMIT.ALM_FANT, ALM_EMIT.ALM_NOM, ALM_EMIT.ALM_CGC, ALM_EMIT.ALM_IES, ALM_EMIT.ALM_IM, '#13#10 +
      '   ALM_EMIT.ALM_TEL, ALM_EMIT.ALM_CEP, ALM_EMIT.ALM_END, ALM_EMIT.ALM_NUM, ALM_EMIT.ALM_BAI, ALM_EMIT.ALM_CID, '#13#10 +
      '   ALM_EMIT.ALM_EST, ALM_EMIT.ALM_NFE_CERTIFICADO, ALM_EMIT.ALM_NFE_AMBIENTE, ALM_EMIT.ALM_NFE_FORMA_EMISSAO, '#13#10 +
      '   TRA_NOM, TRA_INF, TRA_NRCASASDEC_PRO, TRA_NRCASASDEC_PRECO_PRO, TRA_OBS, '#13#10 +                                          {TIAGO - 23/04/2021 - ADICIONADO CAMPO TRA_OBS}
      '   ALM_EMIT.ALM_TRIB_SIMPLES, ALM_EMIT.ALM_SIMPLES_CRED_ICMS, ALM_EMIT.DAT_ATU AS DATA_SCAN, '#13#10 +
      '   COALESCE(TRA_OBS1_CUP, ''OBS1'') AS TRA_OBS1_CUP, '#13#10 +
      '   COALESCE(TRA_OBS2_CUP, ''OBS2'') AS TRA_OBS2_CUP, '#13#10 +
      '   COALESCE(TRA_OBS3_CUP, ''OBS3'') AS TRA_OBS3_CUP, '#13#10 +
      '   COALESCE(TRA_OBS4_CUP, ''OBS4'') AS TRA_OBS4_CUP, '#13#10 +
      '   TRA_DIGITA_ICMS, TRA_DIGITA_IPI, '#13#10 +
      '   CFO_NOM, CFO_CFO, CFO_MSG1, CFO_MSG2, CFO_MSG3, CFO_MSG4, CFO_MSG5, '#13#10 +
      '   CLIENTE.CLI_RED, CLIENTE.CLI_NOM, CLIENTE.CLI_TEL, CLIENTE.CLI_EMA, CLIENTE.EMA_ENT, CLIENTE.CLI_SIMPLES_NACIONAL, '#13#10 +
      '   CLIENTE.NOM_ENT, CLIENTE.CGC_ENT, CLIENTE.END_ENT, CLIENTE.NUM_ENT, CLIENTE.COM_ENT, CLIENTE.BAI_ENT, CLIENTE.CID_ENT, CLIENTE.EST_ENT, CLIENTE.CEP_ENT, '#13#10 +
      '   LEASING.CLI_RED LEASING_RED, LEASING.CLI_NOM LEASING_NOM, LEASING.CLI_TEL LEASING_TEL, LEASING.CLI_EMA LEASING_EMA, LEASING.EMA_ENT LEASING_EMA_ENT, '#13#10 +
      '   FOR_RED, FOR_RZS, FOR_TEL, FOR_EMA, '#13#10 +
      '   ALM_TRANSF.ALM_FANT TRANSF_FANT, ALM_TRANSF.ALM_NOM TRANSF_NOM, ALM_TRANSF.ALM_TRIB_SIMPLES TRANSF_SIMPLES, ALM_TRANSF.ALM_CGC TRANSF_CGC, ALM_TRANSF.ALM_IES TRANSF_IES, '#13#10 +
      '   ALM_TRANSF.ALM_LOG TRANSF_LOG, ALM_TRANSF.ALM_END TRANSF_END, ALM_TRANSF.ALM_NUM TRANSF_NUM, ALM_TRANSF.ALM_COP TRANSF_COP, '#13#10 +
      '   ALM_TRANSF.ALM_BAI TRANSF_BAI, ALM_TRANSF.ALM_CID TRANSF_CID, ALM_TRANSF.ALM_EST TRANSF_EST, ALM_TRANSF.ALM_CEP TRANSF_CEP, ALM_TRANSF.ALM_TEL TRANSF_TEL, '#13#10 +
      '   TRS_RED, TRS_NOM, TRS_CGC, TRS_IES, TRS_TE1, TRS_CEP, '#13#10 +
      '   TRS_END, TRS_NUM, TRS_COP, TRS_BAI, TRS_CID, TRS_EST, '#13#10 +
      '   NFE_ID, NFE_STATUS, NFE_ARQUIVO, NFE_RESPOSTA, '#13#10 +
      '   (SELECT MAX(OUTROS) '#13#10 +
      '      FROM CDIMPRESO, CDFORM, CDTRA3 '#13#10 +
      '     WHERE CDFORM.FORM_COD = CDTRA3.TRA_FORM '#13#10 +
      '       AND CDFORM.FORM_ALM = ALM_EMIT.ALM_COD '#13#10 +
      '       AND CDTRA3.TRA_TRA = CDTRA1.TRA_COD '#13#10 +
      '       AND CDFORM.FORM_IMPRESSO = CDIMPRESO.NOME '#13#10 +
      '       AND CDIMPRESO.CAMPO_INT = ''Modelo_de_Danfe'' '#13#10 +
      '   ) MODELO, '#13#10 +
      '   (SELECT SERIE_NUMERO '#13#10 +
      '      FROM CDSERIENF, CDFORM, CDTRA3 '#13#10 +
      '     WHERE CDFORM.FORM_COD = CDTRA3.TRA_FORM '#13#10 +
      '       AND CDFORM.FORM_ALM = ALM_EMIT.ALM_COD '#13#10 +
      '       AND CDTRA3.TRA_TRA = CDTRA1.TRA_COD '#13#10 +
      '       AND CDFORM.FORM_SERIE = CDSERIENF.SERIE_COD '#13#10 +
      '   ) SERIE_NUMERO, '#13#10 +
      '   (Select RESULT From LISTAR_CUPONS_RELACIONADOS(ESTMVVD1.VD1_COD)) LANCAMENTOS, '#13#10 +
      '   CDTRANFE.TRA_DEVOLUCAO, ALM_EMIT.ALM_NFE_FOTO '#13#10 +
      'From ESTMVVD1 '#13#10 +
      '   Left join CDALM ALM_EMIT on (CDALM.ALM_COD = ESTMVVD1.VD1_ALM) '#13#10 +
      '   Left join CDTRA1 on (CDTRA1.TRA_COD = ESTMVVD1.VD1_TRA) '#13#10 +
      '   Left join CDCFO on (CDCFO.CFO_COD = ESTMVVD1.VD1_CFOP) '#13#10 +
      '   Left join CDCLI CLIENTE on (CLIENTE.CLI_COD = ESTMVVD1.VD1_CLI) '#13#10 +
      '   Left join CDCLI LEASING on (LEASING.CLI_COD = ESTMVVD1.VD1_CLI_LEASING) '#13#10 +
      '   Left join CDFOR on (CDFOR.FOR_COD = ESTMVVD1.VD1_FOR) '#13#10 +
      '   Left join CDTRS on (CDTRS.TRS_COD = ESTMVVD1.VD1_TRS) '#13#10 +
      '   Left join CDALM ALM_TRANSF on (ALM_TRANSF.ALM_COD = ESTMVVD1.VD1_ALM_TRANSF) '#13#10 +
      '   Left join ESTMVVD5 on (ESTMVVD5.VD5_BOL = ESTMVVD1.VD1_COD AND (ESTMVVD5.VD5_TIP <> ''ENT'') AND ((COALESCE(ESTMVVD1.VD1_CLI,0) = 0) OR (ESTMVVD5.VD5_TIP = ''FAT''))) '#13#10 +
      '   Left join MVNFE on (MVNFE.NFE_VD1 = ESTMVVD1.VD1_COD) '#13#10 +
      '   Left join CDTRANFE on (CDTRANFE.TRA_TRA = CDTRA1.TRA_COD) '#13#10 +
      'Where VD1_COD = :COD', [FNumeroCupom]);

FTRA := vDataSet.FieldByName('TRA_OBS').AsString; {TIAGO - 23/04/2021 - ADICIONANDO OBSERVAÇÃO DO CUPOM}

   FID := vDataSet.FieldByName('NFE_ID').AsString;
   if vDataSet.FieldByName('NFE_STATUS').AsString = 'REG' then
      FStatus := sstRegistrado
   else if vDataSet.FieldByName('NFE_STATUS').AsString = 'PROC' then
      FStatus := sstEmProcessamento
   else if vDataSet.FieldByName('NFE_STATUS').AsString = 'CANC' then
      FStatus := sstCancelado
   else if vDataSet.FieldByName('NFE_STATUS').AsString = 'INUT' then
      FStatus := sstInutilizada
   else if vDataSet.FieldByName('NFE_STATUS').AsString = 'DEN' then
      FStatus := sstDenegada
   else
      FStatus := sstNaoRegistrado;


                         {TIAGO - 23/04/2021 - ADICIONANDO OBSERVAÇÃO DO CUPOM}
            if FTRA <> '' then
              FCupomFiscal.InfAdic.infCpl := ConverterRichPlainText(FTRA)
            else
              FCupomFiscal.InfAdic.infCpl := 'Desenvolvido com o componente ACBrSAT, www.projetoacbr.com.br.';

            CarregarItens();
            CarregarParcelas();
         end;

begin
                     if (vDataSet.FieldByName('TIP_DOC').AsString = 'CDC') then
                        cMP := mpCartaodeCredito
                     else if (vDataSet.FieldByName('TIP_DOC').AsString = 'CHQ') then
                        cMP := mpCheque
                     else if (vDataSet.FieldByName('TIP_DOC').AsString = 'CBB') then
                        cMP := mpOutros
                     else if (vDataSet.FieldByName('TIP_DOC').AsString = 'DIN') then
                        cMP := mpDinheiro
                     else if (vDataSet.FieldByName('TIP_DOC').AsString = 'OTR') then
                        cMP := mpOutros
                     else if (vDataSet.FieldByName('TIP_DOC').AsString = 'DEV') then
                        cMP := mpCreditoLoja
                     else if (vDataSet.FieldByName('TIP_DOC').AsString = 'CDD') then        {TIAGO - 23/04/2021 - ADICIONANDO OPÇÃO DE CARTAO DE DEBITO}
                        cMP := mpCartaodeDebito
                     else
                        cMP := mpOutros;
                     vMP := vDataSet.FieldByName('VD4_VAL').AsFloat;
                     vDataSet.Next;
                  end;
