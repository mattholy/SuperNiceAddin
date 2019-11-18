Attribute VB_Name = "MyDev"
Sub ExportAllVBC()
    Dim ExportPath As String, ExtendName As String
    Dim vbc As VBComponent
    ExportPath = ThisWorkbook.Path
    For Each vbc In Application.VBE.ActiveVBProject.VBComponents
        Select Case vbc.Type
        Case vbext_ct_ClassModule, vbext_ct_Document    '�������Ϊ��ģ�顢EXCEL����
            ExtendName = ".Cls"    '���õ����ļ�����չ��
        Case vbext_ct_MSForm    '�������Ϊ����
            ExtendName = ".frm"
        Case vbext_ct_StdModule    '�������Ϊģ��ʱ
            ExtendName = ".Bas"
        End Select
        If ExtendName <> "" Then
            vbc.Export ExportPath & "\SourceCode\" & vbc.Name & ExtendName
        End If
    Next
    MsgBox "�������"
End Sub