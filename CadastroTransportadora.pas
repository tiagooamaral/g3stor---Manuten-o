procedure TfrmCadastroTransportadora.ACBrCEPBuscaEfetuada(Sender: TObject); {TIAGO - 16/03/2021 - BUSCA CEP VIA ACBR}
var i : integer;
begin
{A190129} // mantis 149
//   ConsultarCEP(qryCliente, edtCLI_CEP, edtCLI_END, edtCLI_BAI, cbxCLI_CID,
//      cbxCLI_EST, cbxCLI_LOG);
    if Trim(edtTRS_CEP.Text) <> EmptyStr then
     begin
        for I := 0 to ACBrCEP.Enderecos.Count - 1 do begin
          edtTRS_BAI.Text := ACBrCEP.Enderecos[i].Bairro;
          cbxTRS_CID.Text := ACBrCEP.Enderecos[i].Municipio;
          cbxTRS_EST.Text := ACBrCEP.Enderecos[i].UF;
          cbxTRS_LOG.Text := ACBrCEP.Enderecos[i].Tipo_Logradouro;
          edtTRS_END.Text := ACBrCEP.Enderecos[i].Logradouro;
         // edtref.Text := ACBrCEP.Enderecos[i].Complemento;
        end;
     end
end;

procedure TfrmCadastroTransportadora.btnConsultaCEPClick(Sender: TObject);
begin
   ACBRCEP.BuscarPorCEP(edtTRS_CEP.Text);     {TIAGO - 16/03/2021 - BUSCA CEP VIA ACBR}
   {ConsultarCEP(qryTransp, edtTRS_CEP, edtTRS_END, edtTRS_BAI, cbxTRS_CID,
      cbxTRS_EST, cbxTRS_LOG);}
end;