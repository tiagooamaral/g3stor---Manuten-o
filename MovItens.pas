begin
                                    vIdentPesq := 'CDPRO';
                                    f := TfrmPesquisaUniscom.Create(Self);
                                    f.vChaveTabela := 'PRO_COD';
                                    f.vNomeTabela := 'CDPRO';
                                    f.vDataSet := nil;
                                    f.vAlm := vALMVD1;
                                    f.vTraUnidadeProduto := Self.vTraUnidadeProduto;
                                    f.vSimboloMoeda := Self.vTraSimboloMoeda;
                                    f.vUsaNome2 := vTraUsaNome2;
                                    f.vFiltro := ' A.ATIVO=''A'' '; {A170508}
                                    if vTraProdFinal and vTraProdUsoInt then
                                       f.vFiltro := f.vFiltro + ' AND (PRO_PRODFINAL = ''T'' ' + {A200827} // Mudança FB 2.5 Tirando CDPRO.
                                          ' OR PRO_USOINTERNO = ''T'') '  {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
                                    else if vTraProdFinal then
                                       f.vFiltro := f.vFiltro + ' AND PRO_PRODFINAL = ''T'' ' {A200827} // Mudança FB 2.5 Tirando CDPRO.
                                    else if vTraProdUsoInt then
                                       f.vFiltro := f.vFiltro + ' AND PRO_USOINTERNO = ''T'' '; {A200827} // Mudança FB 2.5 Tirando CDPRO.

                                    if vMODOECF and not vAlmTributSimples then
                                       begin
                                          f.vNomeTabela2 := 'CDPROICMS';
                                          f.vFiltro := f.vFiltro +
                                             ' AND CDPRO.PRO_COD = CDPROICMS.ICM_PRO AND CDPROICMS.ICM_EST = ' +
                                             IntToStr(vEstado) +
                                             ' AND CDPROICMS.ICM_ALI IN ' +
                                             vFiltroAliquotas;
                                       end;


begin
               vIdentPesq := 'CDPRO';
               f := TfrmPesquisaUniscom.Create(Self);
               f.vChaveTabela := 'PRO_COD';
               f.vNomeTabela := 'CDPRO';
               f.vDataSet := nil;
               f.vFiltro := ' A.ATIVO=' + QuotedStr('A'); {A170508}
               if vTraProdFinal and vTraProdUsoInt then
                  f.vFiltro := f.vFiltro + ' AND (PRO_PRODFINAL = ''T'' ' + {A200827} // Mudança FB 2.5 Tirando CDPRO.
                     ' OR PRO_USOINTERNO = ''T'') ' {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
               else if vTraProdFinal then
                  f.vFiltro := f.vFiltro + ' AND PRO_PRODFINAL = ''T'' ' {A200827} // Mudança FB 2.5
               else if vTraProdUsoInt then
                  f.vFiltro := f.vFiltro + ' AND PRO_USOINTERNO = ''T'' '; {A200827} // Mudança FB 2.5
               f.vAlm := vALMVD1;
               f.vTraUnidadeProduto := Self.vTraUnidadeProduto;
               f.vSimboloMoeda := vTraSimboloMoeda;
               f.vUsaNome2 := vTraUsaNome2;
               if vMODOECF and not vAlmTributSimples then
                  begin
                     f.vNomeTabela2 := 'CDPROICMS';
                     f.vFiltro := f.vFiltro +
                        ' AND PRO_COD = ICM_PRO AND ICM_EST = ' + {A200827} // Mudança FB 2.5
                        IntToStr(vEstado) + ' AND ICM_ALI IN ' + {A200827} // Mudança FB 2.5
                        vFiltroAliquotas;
                  end;

begin
               SQL.Clear;
               SQL.Add('Select  ');
               SQL.Add('   ((Select ((Select vd1_valor_totalb from estmvvd1 where vd1_cod = estmvvd2.vd2_bol) * coalesce(vd3_dsp, 0) / 100.00) + coalesce(vd3_dsv, 0) from estmvvd3 where vd3_bol = estmvvd2.vd2_bol) * ');
               SQL.Add('   ((vd2_vlr - (vd2_vlr * COALESCE(DESCONTOITEM,0) / 100)) / COALESCE(NULLIF((Select vd1_valor_totalb from estmvvd1 where vd1_cod = estmvvd2.vd2_bol), 0), 1))) * 100 ' +
                  ' / COALESCE(NULLIF((vd2_vlr - (vd2_vlr * COALESCE(DESCONTOITEM,0) / 100)), 0), 1) as DESCONTO_PEDIDO, ');
               SQL.Add('   (vd2_vlr - (vd2_vlr * COALESCE(DESCONTOITEM,0) / 100)) as vd2_vlr, ');
               SQL.Add('       ESTMVVD2.*, COR_NOM, MED_NOM, ');
               SQL.Add('       (SELECT SUM(VD10_QTD) FROM ESTMVVD10, ESTMVVD9');
               SQL.Add('        WHERE VD9_COD = VD10_VD9');
               SQL.Add('        AND VD9_ASC = ESTMVVD2.VD2_BOL');
               SQL.Add('        AND VD9_ASC_ALM = ESTMVVD2.VD2_ALM');
               SQL.Add('        AND VD9_ASC_CAD = ESTMVVD2.VD2_CAD');
               SQL.Add('        AND ((VD10_PRO = ESTMVVD2.VD2_PRO');
               if ParametroUUsaCorEmProd then
                  SQL.Add('        AND VD10_COR = ESTMVVD2.VD2_COR ');
               if ParametroUUsaMedidaEmProd then
                  SQL.Add('        AND VD10_MED = ESTMVVD2.VD2_MED ');
               SQL.Add('             ) ');
               SQL.Add('        OR (VD10_SER = ESTMVVD2.VD2_SER)) ');
               SQL.Add('       ) AS QTDBAI, ');
               SQL.Add('   IPI_CST, PIS_CST, COF_CST, ');   {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
               SQL.Add('   IPI_ALQ, PIS_ALQ, COF_ALQ, ');   {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
               SQL.Add('   IPI_COD, PIS_COD, COF_COD ');    {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
               SQL.Add('From ESTMVVD2 LEFT JOIN CDPRO ON VD2_PRO = PRO_COD');
               SQL.Add('              LEFT JOIN CDCOR ON VD2_COR = COR_COD');
               SQL.Add('              LEFT JOIN CDMED ON VD2_MED = MED_COD');
               SQL.Add('              LEFT JOIN CDSITIPI SITIPI    ON (IPI_COD = COALESCE(NULLIF(ESTMVVD2.VD2_IPI_CST,0),CDPRO.PRO_CST_IPI)) ');   {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
               SQL.Add('              LEFT JOIN CDSITPIS SITPIS    ON (PIS_COD = COALESCE(NULLIF(ESTMVVD2.VD2_PIS_CST,0),CDPRO.PRO_CST_PIS)) ');    {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
               SQL.Add('              LEFT JOIN CDSITCOFINS COFINS ON (COF_COD = COALESCE(NULLIF(ESTMVVD2.VD2_COFINS_CST,0),CDPRO.PRO_CST_COFINS)) ');  {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/ADICIONADO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
               SQL.Add('Where VD2_BOL = ''' + vPedido.Pedido + '''');
               SQL.Add('  And VD2_ALM = ' + IntToStr(vPedido.Almoxarifado));
               SQL.Add('  And VD2_CAD = ''' + FormatDateTime('mm/dd/yyyy', vPedido.Data) + '''');
               SQL.Add('  And VD2_ITEM = ' + IntToStr(vPedido.Itens[vItem].Item));
               strCopiaSLQClipBoard(SQL.Text);
               Open;

begin
                           Close;
                           SQL.Clear;
                           SQL.Add(' SELECT A.*, B.SIGLA, B.UNI_USA_DIM_NO_PRECO, ');
                           SQL.Add('    E.*, F.*, PST.*  ');
                           if not ParametroUsaDimensaoEmProdutos then
                              begin
                                 SQL.Add('   ,C.SIGLA AS SIGLA_USO ');
                                 SQL.Add('   ,D.SIGLA AS SIGLA_CMP ');
                              end;
                           SQL.Add(' FROM CDPRO A ');
                           if ParametroUsaDimensaoEmProdutos then
                              SQL.Add(' LEFT JOIN CDUNIDADE B ON A.PRO_UNM = B.CODIGO')
                           else
                              begin
                                 SQL.Add(' LEFT JOIN CDUNIDADE B ON A.PRO_UNI = B.CODIGO');
                                 SQL.Add(' LEFT JOIN CDUNIDADE C ON A.PRO_UNI_USO = C.CODIGO');
                                 SQL.Add(' LEFT JOIN CDUNIDADE D ON A.PRO_UNI_CMP = D.CODIGO');
                              end;

                           SQL.Add(' LEFT JOIN CDPROSITTRIBUT PST ON (A.PRO_COD = PST.TRIB_PRO And PST.TRIB_ALM = ' + IntToStr(vALMVD1) + ') ');
                           SQL.Add(' LEFT JOIN CDSIT E ON (COALESCE(PST.TRIB_SIT, A.PRO_SIT) = E.SIT_COD) ');
                           SQL.Add(' LEFT JOIN CDCLA F ON (A.PRO_CLA = CLA_COD) '); {TIAGO - 16/03/2021 - ALTERAÇÃO PARA MIGRACÃO FIREBIRD 2.5/RETIRANDO NOME DA TABLE OU ALIAS ANTES DA COLUNA}
                           SQL.Add(' WHERE A.PRO_COD = ' + IntToStr(pCodigo));
                           Open;
