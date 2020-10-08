codeunit 50100 "Gen. Ledger Setup Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnRegister', '', false, false)]
    local procedure AddGeneralLedgerSetupWizard()
    var
        AssistedSetup: Codeunit "Assisted Setup";
        Language: Codeunit Language;
        CurrentGlobalLanguage: Integer;
    begin
        CurrentGlobalLanguage := GlobalLanguage;
        AssistedSetup.Add(GetAppId(), Page::"General Ledger Setup Wizard", SetupTxt,
                        "Assisted Setup Group"::GettingStarted, 'https://www.youtube.com/embed/hRLjl2u4I0w',
                        "Video Category"::Uncategorized,
                        'https://docs.microsoft.com/en-us/dynamics365/business-central/ui-get-ready-business');

        GlobalLanguage(Language.GetDefaultApplicationLanguageId());
        AssistedSetup.AddTranslation(Page::"General Ledger Setup Wizard", Language.GetDefaultApplicationLanguageId(), SetupTxt);
        GlobalLanguage(CurrentGlobalLanguage);
    end;

    local procedure GetAppId(): Guid
    var
        EmptyGuid: Guid;
    begin
        if Info.Id() = EmptyGuid then
            NavApp.GetCurrentModuleInfo(Info);
        exit(Info.Id());
    end;

    var
        Info: ModuleInfo;
        SetupTxt: Label 'Set up General Ledger Setup';
}