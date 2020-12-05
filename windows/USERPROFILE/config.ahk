; https://w.atwiki.jp/eamat/pages/17.html
IME_SET(SetSts, WinTitle="A")    {
	ControlGet,hwnd,HWND,,,%WinTitle%
	if	(WinActive(WinTitle))	{
		ptrSize := !A_PtrSize ? 4 : A_PtrSize
	    VarSetCapacity(stGTI, cbSize:=4+4+(PtrSize*6)+16, 0)
	    NumPut(cbSize, stGTI,  0, "UInt")   ;	DWORD   cbSize;
		hwnd := DllCall("GetGUIThreadInfo", Uint,0, Uint,&stGTI)
	             ? NumGet(stGTI,8+PtrSize,"UInt") : hwnd
	}

    return DllCall("SendMessage"
          , UInt, DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hwnd)
          , UInt, 0x0283  ;Message : WM_IME_CONTROL
          ,  Int, 0x006   ;wParam  : IMC_SETOPENSTATUS
          ,  Int, SetSts) ;lParam  : 0 or 1
}

; https://github.com/smzht/fakeymacs/blob/587cb88222a81cf37d75e24a5c8f68a113bc3099/config.py#L1398
~LAlt::Send {Blind}{vk07}
~RAlt::Send {Blind}{vk07}

LAlt up::
  if (A_PriorKey == "LAlt")
  {
    IME_SET(0)
  }
  Return

RAlt up::
  if (A_PriorKey == "RAlt")
  {
    IME_SET(1)
  }
  Return
