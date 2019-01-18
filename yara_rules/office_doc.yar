private rule doc_has_entry_point{
	meta:
		description = "private rule to check if there is an entry point that will cause the document to run on open or close"
	strings:
		// excel specific
		$excel_1 = "auto_open"
		$excel_2 = "auto_close"
		$excel_3 = "workbook_open"
		$excel_4 = "workbook_activate"
		$excel_5 = "workbook_close"

		// word specific
		$word_1 = "autoopen"
		$word_2 = "autoclose"
		$word_3 = "document_beforeclose"
		$word_4 = "document_open"
		$word_5 = "document_close"

		// autoexec stuff. autoexec.main and autoexec.autoexit are examples.
		$autoexec_1 = "autoexec"
		$autoexec_2 = "autoexit"

		// callback functions that can be used instead of a traditional vba autorun entrypoint

		$callback_1 = "_BeforeNavigate2"
		$callback_2 = "_BeforeScriptExecute"
		$callback_3 = "_Change"
		$callback_4 = "_DocumentComplete"
		$callback_5 = "_DownloadBegin"
		$callback_6 = "_DownloadComplete"
		$callback_7 = "_FileDownload"
		$callback_8 = "_GotFocus"
		$callback_9 = "_Layout"
		$callback_10 = "_LostFocus"
		$callback_11 = "_MouseEnter"
		$callback_12 = "_MouseHover"
		$callback_13 = "_MouseLeave"
		$callback_14 = "_MouseMove"
		$callback_15 = "_NavigateComplete2"
		$callback_16 = "_NavigateError"
		$callback_17 = "_Painted"
		$callback_18 = "_Painting"
		$callback_19 = "_ProgressChange"
		$callback_20 = "_PropertyChange"
		$callback_21 = "_Resize"
		$callback_22 = "_SetSecureLockIcon"
		$callback_23 = "_StatusTextChange"
		$callback_24 = "_TitleChange"
		$callback_25 = "_Initialize"
		$callback_26 = "_Click"
		$callback_27 = "_BeforeClose"

	condition:
		any of them
}

private rule encrypted_office_document{
    meta:
		description = "private rule to identify encrypted office files"
    strings:

        $magic_number = { d0 cf 11 e0 a1 b1 1a e1 }
        
        $encryption_indicator_1 = "DataSpaces" wide
        $encryption_indicator_2 = "EncryptedPackage" wide
        $encryption_indicator_3 = "StrongEncryption" wide
   
    condition:
        $magic_number at 0 and all of ($encryption_indicator_*)
}
