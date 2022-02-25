procedure TfrmMenuPrincipal.mnuEscolhaImpressoraClick(Sender: TObject);  {TIAGO - 16/03/2021 - ALTERAÇÃO PARA PROBLEMAS DE IMPRESSÃO}
begin
   with TfrmImpressoraPadrao.Create(Self) do
      try
         ShowModal;
      finally
         Free;
      end;
end;