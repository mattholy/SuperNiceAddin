Attribute VB_Name = "ģ��1"
Sub ��ť1_Click()

GetMyIP

End Sub

Public Sub GetMyIP()
Dim strComputer As String
Dim objWMI As Object
Dim colIP As Object
Dim IP As Object
Dim i As Integer
Dim LANstr As String, IPstr As String, MACstr As String
strComputer = "."
    Set objWMI = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colIP = objWMI.ExecQuery("Select * from Win32_NetworkAdapterConfiguration where IPEnabled=TRUE")
    For Each IP In colIP
        If Not IsNull(IP.IPAddress) Then
            For i = LBound(IP.IPAddress) To UBound(IP.IPAddress)
                LANstr = IP.Description(i)  '��������
                ThisWorkbook.Sheets("����").Range("����!C1" & i + 1).value = IP.IPAddress(i)  '����IP��ַ
                ThisWorkbook.Sheets("����").Range("����!C10").value = IP.MacAddress      '������MAC��ַ
                MsgBox "�������ƣ�" & LANstr & vbCrLf & "IP��ַ��" & IPstr & vbCrLf & "MAC��ַ��" & MACstr, vbInformation, LANstr
            Next
        End If
    Next
End Sub

