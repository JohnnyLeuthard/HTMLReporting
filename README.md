# Work
 function CyberForm {
#[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.drawing
#Form Setup
$form1 = New-Object System.Windows.Forms.Form
$Icon = [system.drawing.icon]::ExtractAssociatedIcon("D:\Testing\cyber.ico")
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

#ClearcheckboxP2s
$Clearcheckboxes_RunOnClick=
{  
    if ($checkboxP1.Checked) {$checkboxP1.CheckState = 0}
    if ($checkboxP2.Checked) {$checkboxP2.CheckState = 0}
    if ($checkBoxP3.Checked) {$checkBoxP3.CheckState = 0}
    if ($checkBoxU.Checked) {$checkBoxU.CheckState = 0}
    if ($checkBox5.Checked) {$checkBox5.CheckState = 0}
    if ($checkBox6.Checked) {$checkBox6.CheckState = 0}
    if ($checkBox7.Checked) {$checkBox7.CheckState = 0}
    if ($checkBox8.Checked) {$checkBox8.CheckState = 0}
    if ($checkBox9.Checked) {$checkBox9.CheckState = 0}
}

　
#Form Parameter
$form1.Text = "CyberArk GUI"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$Form1.Size = New-Object System.Drawing.Size(1125,750)
$Form1.Icon = $Icon

#start section group box
$startGroupBox = New-Object System.Windows.Forms.GroupBox
$startGroupBox.Location = New-Object System.Drawing.Size(15,15) 
$startGroupBox.size = New-Object System.Drawing.Size(220,80) 
$startGroupBox.text = "Start Options" 
$Form1.Controls.Add($startGroupBox)

#vault selection group box
$copyGroupBox = New-Object System.Windows.Forms.GroupBox
$copyGroupBox.Location = New-Object System.Drawing.Size(15,95) 
$copyGroupBox.size = New-Object System.Drawing.Size(220,110) 
$copyGroupBox.text = "Vault Selection" 
$Form1.Controls.Add($copyGroupBox)

#Login Options group box
$loginGroupBox = New-Object System.Windows.Forms.GroupBox
$loginGroupBox.Location = New-Object System.Drawing.Size(15,208) 
$loginGroupBox.size = New-Object System.Drawing.Size(220,175) 
$loginGroupBox.text = "Login Options" 
$Form1.Controls.Add($loginGroupBox)

#Onboarding options group box
$OnboardingGroupBox = New-Object System.Windows.Forms.GroupBox
$OnboardingGroupBox.Location = New-Object System.Drawing.Size(245,15) 
$OnboardingGroupBox.size = New-Object System.Drawing.Size(300,220) 
$OnboardingGroupBox.text = "Onboard Options" 
$Form1.Controls.Add($OnboardingGroupBox)

#Taskscheduler
$OpenGroupBox = New-Object System.Windows.Forms.GroupBox
$OpenGroupBox.Location = New-Object System.Drawing.Size(550,15) 
$OpenGroupBox.size = New-Object System.Drawing.Size(300,220) 
$OpenGroupBox.text = "Taskscheduler" 
$Form1.Controls.Add($OpenGroupBox)

#Spreadesheet options group box
#$SpreadesheetGroupBox = New-Object System.Windows.Forms.GroupBox
#$SpreadesheetGroupBox.Location = New-Object System.Drawing.Size(245,125) 
#$SpreadesheetGroupBox.size = New-Object System.Drawing.Size(220,110) 
#$SpreadesheetGroupBox.text = "Spreadsheet Options" 
#$Form1.Controls.Add($SpreadesheetGroupBox)

#Help Section
$HelpSection = New-Object System.Windows.Forms.GroupBox
$HelpSection.Location = New-Object System.Drawing.Size(15,385)
$HelpSection.size = New-Object System.Drawing.Size(220,295)
$HelpSection.text = "Help Section" 
$Form1.Controls.Add($HelpSection)

#Maintenance Section 
$MaintenanceGroupBox = New-Object System.Windows.Forms.GroupBox
$MaintenanceGroupBox.Location = New-Object System.Drawing.Size(875,550)
$MaintenanceGroupBox.size = New-Object System.Drawing.Size(220,150)
$MaintenanceGroupBox.text = "Maintenance Section"
$Form1.Controls.Add($MaintenanceGroupBox)

#Text fields

#Initalize Button
$Initializebtn = New-Object System.Windows.Forms.Button
$Initializebtn.Text = "Initialize PoshPacli"
$Initializebtn.Location = New-Object System.Drawing.Size(15,15)
$Initializebtn.Size = New-Object System.Drawing.Size(180,25)
$Initializebtn.BackColor = "Red"
#$test = "Run"
#$Initializebtn.add_mousehover($test)
$Initializebtn.add_Click({Initialize-PoShPACLI})
$startGroupBox.Controls.Add($Initializebtn)

#ToolTip for Initializebtn button: 
$ToolTip = New-Object System.Windows.Forms.ToolTip
$ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
$ToolTip.IsBalloon = $true
$ToolTip.InitialDelay = 500
$ToolTip.ReshowDelay = 500
$ToolTip.SetToolTip($Initializebtn, "Run only once when starting CyberGUI")

#StartPacli Button
$Startbtn = New-Object System.Windows.Forms.Button
$Startbtn.Text = "Start Pacli"
$Startbtn.Location = New-Object System.Drawing.Size(15,45)
$Startbtn.Size = New-Object System.Drawing.Size(180,25)
$Startbtn.add_Click({Start-PACLI})
$startGroupBox.Controls.Add($Startbtn)

#Vault Name label
$vaultLabel = New-Object System.Windows.Forms.Label
$vaultLabel.Text="Vault Name:"
$vaultLabel.Location = New-Object System.Drawing.Size(15,15) 
$vaultLabel.Size = New-Object System.Drawing.Size(170,15) 
$loginGroupBox.Controls.Add($vaultLabel)

#Vault Name
$vaultname = New-Object System.Windows.Forms.TextBox
$vaultname.Text=""
$vaultname.Location = New-Object System.Drawing.Size(15,30) 
$vaultname.Size = New-Object System.Drawing.Size(180,20) 
$loginGroupBox.Controls.Add($vaultname)

#Username label
$usernameLabel = New-Object System.Windows.Forms.Label
$usernameLabel.Text="Username:"
$usernameLabel.Location = New-Object System.Drawing.Size(15,55) 
$usernameLabel.Size = New-Object System.Drawing.Size(170,15) 
$loginGroupBox.Controls.Add($usernameLabel)

#Username input
$usernameTarget = New-Object System.Windows.Forms.TextBox
$usernameTarget.Text=""
$usernameTarget.Location = New-Object System.Drawing.Size(15,70) 
$usernameTarget.Size = New-Object System.Drawing.Size(180,30) 
$loginGroupBox.Controls.Add($usernameTarget)

#Password label
$psswdLabel = New-Object System.Windows.Forms.Label
$psswdLabel.Text="Password:"
$psswdLabel.Location = New-Object System.Drawing.Size(15,95) 
$psswdLabel.Size = New-Object System.Drawing.Size(170,15) 
$loginGroupBox.Controls.Add($psswdLabel)

#Password input
$psswdTarget = New-Object System.Windows.Forms.TextBox
$psswdTarget.Text=""
$psswdTarget.Location = New-Object System.Drawing.Size(15,110) 
$psswdTarget.Size = New-Object System.Drawing.Size(180,30) 
$loginGroupBox.Controls.Add($psswdTarget)

#Login Button
$loginbtn = New-Object System.Windows.Forms.Button
$loginbtn.Text="Login"
$loginbtn.Location = New-Object System.Drawing.Size(15,140) 
$loginbtn.Size = New-Object System.Drawing.Size(180,25) 
$loginGroupBox.Controls.Add($loginbtn)

#Clear checkboxes
$Clearcheckboxes = New-Object System.Windows.Forms.Button
$Clearcheckboxes.Text = "Clear checkboxes"
$Clearcheckboxes.Location = New-Object System.Drawing.Size(15,15)
$Clearcheckboxes.Size = New-Object System.Drawing.Size(180,25)
$Clearcheckboxes.add_Click($Clearcheckboxes_RunOnClick)
$MaintenanceGroupBox.Controls.Add($Clearcheckboxes)

#LogOff
$logoffbtn = New-Object System.Windows.Forms.Button
$logoffbtn.Text = "LogOff"
$logoffbtn.Location = New-Object System.Drawing.Size(15,45)
$logoffbtn.Size = New-Object System.Drawing.Size(180,25)
$MaintenanceGroupBox.Controls.Add($logoffbtn)

#Stop Pacli
$StopPaclibtn = New-Object System.Windows.Forms.Button
$StopPaclibtn.Text = "StopPacli"
$StopPaclibtn.Location = New-Object System.Drawing.Size(15,75)
$StopPaclibtn.Size = New-Object System.Drawing.Size(180,25)
$MaintenanceGroupBox.Controls.Add($StopPaclibtn)

#Close Form
$closebtn = New-Object System.Windows.Forms.Button
$closebtn.Text = "Close Form"
$closebtn.Location = New-Object System.Drawing.Size(15,105)
$closebtn.Size = New-Object System.Drawing.Size(180,25)
$closebtn.add_Click({$form1.Close()})
$MaintenanceGroupBox.Controls.Add($closebtn)

#Onboard Options
#Vault Name label
$vaultLabel = New-Object System.Windows.Forms.Label
$vaultLabel.Text="Vault Name:"
$vaultLabel.Location = New-Object System.Drawing.Size(15,15) 
$vaultLabel.Size = New-Object System.Drawing.Size(170,15) 
$OnboardingGroupBox.Controls.Add($vaultLabel)

#Vault Name
$vaultname = New-Object System.Windows.Forms.TextBox
$vaultname.Text=""
$vaultname.Location = New-Object System.Drawing.Size(15,30) 
$vaultname.Size = New-Object System.Drawing.Size(200,20) 
$OnboardingGroupBox.Controls.Add($vaultname)

#Username label
$usernameLabel = New-Object System.Windows.Forms.Label
$usernameLabel.Text="Username:"
$usernameLabel.Location = New-Object System.Drawing.Size(15,55) 
$usernameLabel.Size = New-Object System.Drawing.Size(170,15) 
$OnboardingGroupBox.Controls.Add($usernameLabel)

#Username input
$usernameTarget = New-Object System.Windows.Forms.TextBox
$usernameTarget.Text=""
$usernameTarget.Location = New-Object System.Drawing.Size(15,70) 
$usernameTarget.Size = New-Object System.Drawing.Size(200,30) 
$OnboardingGroupBox.Controls.Add($usernameTarget)

#Password label
$psswdLabel = New-Object System.Windows.Forms.Label
$psswdLabel.Text="Password:"
$psswdLabel.Location = New-Object System.Drawing.Size(15,95) 
$psswdLabel.Size = New-Object System.Drawing.Size(170,15) 
$OnboardingGroupBox.Controls.Add($psswdLabel)

#Password input
$psswdTarget = New-Object System.Windows.Forms.TextBox
$psswdTarget.Text=""
$psswdTarget.Location = New-Object System.Drawing.Size(15,110) 
$psswdTarget.Size = New-Object System.Drawing.Size(200,30) 
$OnboardingGroupBox.Controls.Add($psswdTarget)

#Taskscheduler
#Vault Name label
$vaultLabel = New-Object System.Windows.Forms.Label
$vaultLabel.Text="Vault Name:"
$vaultLabel.Location = New-Object System.Drawing.Size(15,15) 
$vaultLabel.Size = New-Object System.Drawing.Size(170,15) 
$OpenGroupBox.Controls.Add($vaultLabel)

#Vault Name
$HelpCommands = Get-Content D:\Cyber\List\rdplist.txt
$combobox1 = New-Object System.Windows.Forms.ComboBox
$combobox1.Location = New-Object System.Drawing.Point(15,30)
$combobox1.Size = New-Object System.Drawing.Size(250, 310)
foreach($command in $HelpCommands)
{
    $combobox1.Items.Add($command) | Out-Null
}

$OpenGroupBox.Controls.Add($combobox1)

#Username label
$usernameLabel = New-Object System.Windows.Forms.Label
$usernameLabel.Text="Username:"
$usernameLabel.Location = New-Object System.Drawing.Size(15,55) 
$usernameLabel.Size = New-Object System.Drawing.Size(170,15) 
$OpenGroupBox.Controls.Add($usernameLabel)

#Username input
$usernameTarget = New-Object System.Windows.Forms.TextBox
$usernameTarget.Text=""
$usernameTarget.Location = New-Object System.Drawing.Size(15,70) 
$usernameTarget.Size = New-Object System.Drawing.Size(200,30) 
$OpenGroupBox.Controls.Add($usernameTarget)

#Password label
$psswdLabel = New-Object System.Windows.Forms.Label
$psswdLabel.Text="Password:"
$psswdLabel.Location = New-Object System.Drawing.Size(15,95) 
$psswdLabel.Size = New-Object System.Drawing.Size(170,15) 
$OpenGroupBox.Controls.Add($psswdLabel)

#Password input
$psswdTarget = New-Object System.Windows.Forms.TextBox
$psswdTarget.Text=""
$psswdTarget.Location = New-Object System.Drawing.Size(15,110) 
$psswdTarget.Size = New-Object System.Drawing.Size(200,30) 
$OpenGroupBox.Controls.Add($psswdTarget)

　
#start copy options
$checkboxP1 = New-Object System.Windows.Forms.checkbox
$checkboxP1.Location = New-Object System.Drawing.Size(10,20)
$checkboxP1.Size = New-Object System.Drawing.Size(50,20)
$checkboxP1.Checked=$False
$checkboxP1.Text = "Prod"
$copyGroupBox.Controls.Add($checkboxP1)

$checkboxP2 = New-Object System.Windows.Forms.checkbox
$checkboxP2.Location = New-Object System.Drawing.Size(10,40)
$checkboxP2.Size = New-Object System.Drawing.Size(55,20)
$checkboxP2.Checked=$False
$checkboxP2.Text = "Prod2"
$copyGroupBox.Controls.Add($checkboxP2)

$checkboxP3 = New-Object System.Windows.Forms.checkbox
$checkboxP3.Location = New-Object System.Drawing.Size(10,60)
$checkboxP3.Size = New-Object System.Drawing.Size(55,20)
$checkboxP3.Checked=$False
$checkboxP3.Text = "Prod3"
$copyGroupBox.Controls.Add($checkboxP3)

$checkboxU = New-Object System.Windows.Forms.checkbox
$checkboxU.Location = New-Object System.Drawing.Size(10,80)
$checkboxU.Size = New-Object System.Drawing.Size(50,20)
$checkboxU.Checked=$False
$checkboxU.Text = "UAT"
$copyGroupBox.Controls.Add($checkboxU)

#COPY ALL file info (equivalent to /COPY:DATSOU)
$checkboxCOPYALL = New-Object System.Windows.Forms.checkbox
$checkboxCOPYALL.Location = New-Object System.Drawing.Size(70,20)
$checkboxCOPYALL.Size = New-Object System.Drawing.Size(80,20)
$checkboxCOPYALL.Checked=$False
$checkboxCOPYALL.Text = "##"
$copyGroupBox.Controls.Add($checkboxCOPYALL)

#COPY NO file info (useful with /PURGE)
$checkboxNOCOPY = New-Object System.Windows.Forms.checkbox
$checkboxNOCOPY.Location = New-Object System.Drawing.Size(70,40)
$checkboxNOCOPY.Size = New-Object System.Drawing.Size(80,20)
$checkboxNOCOPY.Checked=$False
$checkboxNOCOPY.Text = "##"
$copyGroupBox.Controls.Add($checkboxNOCOPY)

#FIX file SECurity on all files, even skipped files
$checkboxUFIX = New-Object System.Windows.Forms.checkbox
$checkboxUFIX.Location = New-Object System.Drawing.Size(70,60)
$checkboxUFIX.Size = New-Object System.Drawing.Size(80,20)
$checkboxUFIX.Checked=$False
$checkboxUFIX.Text = "##"
$copyGroupBox.Controls.Add($checkboxUFIX)

#delete dest files/dirs that no longer exist in source
$checkboxPURGE = New-Object System.Windows.Forms.checkbox
$checkboxPURGE.Location = New-Object System.Drawing.Size(70,80)
$checkboxPURGE.Size = New-Object System.Drawing.Size(80,20)
$checkboxPURGE.Checked=$False
$checkboxPURGE.Text = "##"
$copyGroupBox.Controls.Add($checkboxPURGE)

#MIRror a directory tree (equivalent to /E plus /PURGE)
$checkboxMIR = New-Object System.Windows.Forms.checkbox
$checkboxMIR.Location = New-Object System.Drawing.Size(157,20)
$checkboxMIR.Size = New-Object System.Drawing.Size(60,20)
$checkboxMIR.Checked=$False
$checkboxMIR.Text = "##"
$copyGroupBox.Controls.Add($checkboxMIR)

#MOVE files (delete from source after copying)
$checkboxMOV = New-Object System.Windows.Forms.checkbox
$checkboxMOV.Location = New-Object System.Drawing.Size(157,40)
$checkboxMOV.Size = New-Object System.Drawing.Size(60,20)
$checkboxMOV.Checked=$False
$checkboxMOV.Text = "##"
$copyGroupBox.Controls.Add($checkboxMOV)

#MOVE files AND dirs (delete from source after copying)
$checkboxMOVE = New-Object System.Windows.Forms.checkbox
$checkboxMOVE.Location = New-Object System.Drawing.Size(157,60)
$checkboxMOVE.Size = New-Object System.Drawing.Size(60,20)
$checkboxMOVE.Checked=$False
$checkboxMOVE.Text = "##"
$copyGroupBox.Controls.Add($checkboxMOVE)

#Do multi-threaded copies with n threads (default 8)
$BtnSelect = New-Object System.Windows.Forms.Button
$BtnSelect.Location = New-Object System.Drawing.Size(157,80)
$BtnSelect.Size = New-Object System.Drawing.Size(60,20)
$BtnSelect.Text = "Selection"
$BtnSelect.Add_Click({robohelp})
$copyGroupBox.Controls.Add($BtnSelect)

#end copy options
#start file selection options check boxes

#copy only files with the Archive attribute set
$checkboxA = New-Object System.Windows.Forms.checkbox
$checkboxA.Location = New-Object System.Drawing.Size(10,20)
$checkboxA.Size = New-Object System.Drawing.Size(50,20)
$checkboxA.Checked=$False
$checkboxA.Text = "/A"
$SpreadesheetGroupBox.Controls.Add($checkboxA)

#copy only files with the Archive attribute and reset it
$checkboxM = New-Object System.Windows.Forms.checkbox
$checkboxM.Location = New-Object System.Drawing.Size(10,40)
$checkboxM.Size = New-Object System.Drawing.Size(50,20)
$checkboxM.Checked=$False
$checkboxM.Text = "/M"
$SpreadesheetGroupBox.Controls.Add($checkboxM)

#eXclude changed files
$checkboxXC = New-Object System.Windows.Forms.checkbox
$checkboxXC.Location = New-Object System.Drawing.Size(10,60)
$checkboxXC.Size = New-Object System.Drawing.Size(50,20)
$checkboxXC.Checked=$False
$checkboxXC.Text = "/XC"
$SpreadesheetGroupBox.Controls.Add($checkboxXC)

#eXclude Newer files
$checkboxXN = New-Object System.Windows.Forms.checkbox
$checkboxXN.Location = New-Object System.Drawing.Size(10,80)
$checkboxXN.Size = New-Object System.Drawing.Size(50,20)
$checkboxXN.Checked=$False
$checkboxXN.Text = "/XN"
$SpreadesheetGroupBox.Controls.Add($checkboxXN)

#eXclude Older files
$checkboxXO = New-Object System.Windows.Forms.checkbox
$checkboxXO.Location = New-Object System.Drawing.Size(70,20)
$checkboxXO.Size = New-Object System.Drawing.Size(50,20)
$checkboxXO.Checked=$False
$checkboxXO.Text = "/XO"
$SpreadesheetGroupBox.Controls.Add($checkboxXO)

#eXclude eXtra files and directories
$checkboxXX = New-Object System.Windows.Forms.checkbox
$checkboxXX.Location = New-Object System.Drawing.Size(70,40)
$checkboxXX.Size = New-Object System.Drawing.Size(50,20)
$checkboxXX.Checked=$False
$checkboxXX.Text = "/XX"
$SpreadesheetGroupBox.Controls.Add($checkboxXX)

#eXclude Lonely files and directories
$checkboxXL = New-Object System.Windows.Forms.checkbox
$checkboxXL.Location = New-Object System.Drawing.Size(70,60)
$checkboxXL.Size = New-Object System.Drawing.Size(50,20)
$checkboxXL.Checked=$False
$checkboxXL.Text = "/XL"
$SpreadesheetGroupBox.Controls.Add($checkboxXL)

#Include Same files
$checkboxIS = New-Object System.Windows.Forms.checkbox
$checkboxIS.Location = New-Object System.Drawing.Size(70,80)
$checkboxIS.Size = New-Object System.Drawing.Size(50,20)
$checkboxIS.Checked=$False
$checkboxIS.Text = "/IS"
$SpreadesheetGroupBox.Controls.Add($checkboxIS)

#Include Tweaked files
$checkboxIT = New-Object System.Windows.Forms.checkbox
$checkboxIT.Location = New-Object System.Drawing.Size(130,20)
$checkboxIT.Size = New-Object System.Drawing.Size(50,20)
$checkboxIT.Checked=$False
$checkboxIT.Text = "/IT"
$SpreadesheetGroupBox.Controls.Add($checkboxIT)

#eXclude Junction points
$checkboxXJ = New-Object System.Windows.Forms.checkbox
$checkboxXJ.Location = New-Object System.Drawing.Size(130,40)
$checkboxXJ.Size = New-Object System.Drawing.Size(50,20)
$checkboxXJ.Checked=$False
$checkboxXJ.Text = "/XJ"
$SpreadesheetGroupBox.Controls.Add($checkboxXJ)

#eXclude Junction points for Directories
$checkboxXJD = New-Object System.Windows.Forms.checkbox
$checkboxXJD.Location = New-Object System.Drawing.Size(130,60)
$checkboxXJD.Size = New-Object System.Drawing.Size(50,20)
$checkboxXJD.Checked=$False
$checkboxXJD.Text = "/XJD"
$SpreadesheetGroupBox.Controls.Add($checkboxXJD)

#eXclude Junction points for Files
$checkboxXJF = New-Object System.Windows.Forms.checkbox
$checkboxXJF.Location = New-Object System.Drawing.Size(130,80)
$checkboxXJF.Size = New-Object System.Drawing.Size(50,20)
$checkboxXJF.Checked=$False
$checkboxXJF.Text = "/XJF"
$SpreadesheetGroupBox.Controls.Add($checkboxXJF)

#end Robocopy file selection options
#Robocopy Help function
function testhelp {
$help = get-help add-type -full
$outputBox.text = $help |Out-String
}
#Test additional Help functions for readout
#Test Cyber-Help
function testhelp2 {
$help2 = get-help Cyber-Help -full
$outputBox.Text = $help2 | Out-String
}

#Output box
$outputBox = New-Object System.Windows.Forms.RichTextBox 
$outputBox.Location = New-Object System.Drawing.Size(250,325) 
$outputBox.Size = New-Object System.Drawing.Size(610,330)
$outputBox.MultiLine = $True
#$outputBox.WordWrap = $False
$outputBox.ScrollBars = "Both"
$outputBox.Font = "Courier New"
$Form1.Controls.Add($outputBox)

#Button Show Robocopy Help
$ButtonHelp = New-Object System.Windows.Forms.Button 
$ButtonHelp.Location = New-Object System.Drawing.Size(15,15) 
$ButtonHelp.Size = New-Object System.Drawing.Size(180,25) 
$ButtonHelp.Text = "Show Robocopy Help" 
$ButtonHelp.Add_Click({testhelp})
$HelpSection.Controls.Add($ButtonHelp)

$TestHelp = New-Object System.Windows.Forms.Button 
$TestHelp.Location = New-Object System.Drawing.Size(15,45) 
$TestHelp.Size = New-Object System.Drawing.Size(180,25) 
$TestHelp.Text = "Cyber Help" 
$TestHelp.Add_Click({testhelp2})
$HelpSection.Controls.Add($TestHelp)

#start progres bar
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Name = 'ProgressBar'
$progressBar.Value = 0
$progressBar.Style="Continuous"
$progressBar.Location = New-Object System.Drawing.Size(250,670) 
$progressBar.Size = New-Object System.Drawing.Size(610,25)
#initialize a counter
$i=0
$Form1.Controls.Add($progressBar)

#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null
#End function CreateForm
}

　
 
#Call the Function
CyberForm

 

 
