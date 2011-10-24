#tag Window
Begin Window SystemImages
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "System Images"
   Visible         =   True
   Width           =   600
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   165
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Underline       =   ""
      Visible         =   True
      Width           =   270
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics)
		  System.DebugLog CurrentMethodName
		  if PopupMenu1.ListIndex = -1 then
		    return
		  end if
		  
		  
		  dim f as NSImageSystemMethod = PopupMenu1.RowTag(PopupMenu1.ListIndex)
		  dim image as NSImage = f.Invoke
		  
		  
		  declare sub drawInRect lib CocoaLib selector "drawInRect:fromRect:operation:fraction:" (obj_id as Ptr, dstRect as Cocoa.NSRect, srcRect as Cocoa.NSRect, op as Integer, delta as Single)
		  
		  
		  dim dstRect as Cocoa.NSRect
		  dstRect.x = (g.Width - image.Size.width)/2
		  dstRect.y = self.Height - 64.0 - image.Size.height
		  dstRect.w = image.Size.width
		  dstRect.h = image.Size.height
		  
		  dim zeroRect as Cocoa.NSRect
		  
		  const NSCompositeSourceOver = 2
		  drawInRect(image, dstRect, zeroRect, NSCompositeSourceOver , 1.0)
		  
		End Sub
	#tag EndEvent


	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function NSImageSystemMethod() As NSImage
	#tag EndDelegateDeclaration


#tag EndWindowCode

#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  dim images() as Pair = Array(_
		  "NSImageNameAdvanced" : AddressOf NSImage.Advanced, _
		  "NSImageNameApplicationIcon" : AddressOf NSImage.ApplicationIcon, _
		  "NSImageNameBonjour" : AddressOf NSImage.Bonjour, _
		  "NSImageNameComputer" : AddressOf NSImage.Computer, _
		  "NSImageNameCaution" : AddressOf NSImage.Caution, _
		  "NSImageNameColorPanel" : AddressOf NSImage.ColorPanel, _
		  "NSImageNameDotMac" : AddressOf NSImage.DotMac, _
		  "NSImageNameEveryone" : AddressOf NSImage.Everyone, _
		  "NSImageNameFolder" : AddressOf NSImage.Folder, _
		  "NSImageNameFolderBurnable" : AddressOf NSImage.FolderBurnable, _
		  "NSImageNameFolderSmart" : AddressOf NSImage.FolderSmart, _
		  "NSImageNameFontPanel" : AddressOf NSImage.FontPanel, _
		  "NSImageNameInfo" : AddressOf NSImage.Info, _
		  "NSImageNameMobileMe" : AddressOf NSimage.MobileMe, _
		  "NSImageNameMultipleDocuments" : AddressOf NSImage.MultipleDocuments, _
		  "NSImageNameNetwork" : AddressOf NSImage.Network, _
		  "NSImageNamePreferencesGeneral" : AddressOf NSImage.PreferencesGeneral, _
		  "NSImageNameStatusAvailable" : AddressOf NSImage.StatusAvailable, _
		  "NSImageNameStatusNone" : AddressOf NSImage.StatusNone, _
		  "NSImageNameStatusPartiallyAvailable" : AddressOf NSImage.StatusPartiallyAvailable, _
		  "NSImageNameStatusUnavailable" : AddressOf NSImage.StatusUnavailable, _
		  "NSImageNameTrashEmpty" : AddressOf NSImage.TrashEmpty, _
		  "NSImageNameTrashFull" : AddressOf NSImage.TrashFull, _
		  "NSImageNameUser" : AddressOf NSImage.User, _
		  "NSImageNameUserAccounts" : AddressOf NSImage.UserAccounts, _
		  "NSImageNameUserGroup" : AddressOf NSImage.UserGroup, _
		  "NSImageNameUserGuest" : AddressOf NSImage.UserGuest)
		  
		  for each item as Pair in images
		    me.AddRow item.Left.StringValue
		    me.RowTag(me.ListCount - 1) = item.Right
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  self.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents