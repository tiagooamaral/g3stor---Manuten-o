procedure TfrmMenuPrincipal.mnuEscolhaImpressoraClick(Sender: TObject);  {TIAGO - 16/03/2021 - ALTERA��O PARA PROBLEMAS DE IMPRESS�O}
begin
   with TfrmImpressoraPadrao.Create(Self) do
      try
         ShowModal;
      finally
         Free;
      end;
end;