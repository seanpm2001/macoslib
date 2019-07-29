#tag Window
Begin Window NSColorWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   DefaultLocation =   "0"
   Frame           =   "0"
   FullScreen      =   False
   HasBackColor    =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   MinWidth        =   64
   Placement       =   "0"
   Resizable       =   True
   Resizeable      =   "True"
   SystemUIVisible =   True
   Title           =   "NSColors"
   Type            =   "0"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   "*, 120"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontal=   "0"
      GridLinesHorizontalStyle=   "0"
      GridLinesVertical=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   True
      HasHeader       =   True
      HasHeading      =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   400
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Color Name	Color"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   False
      SelectionType   =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			return true
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row < me.ListCount then
		    if column = 1 then
		      dim c as NSColor = me.CellTag(row, 1)
		      if c <> nil then
		        g.ForeColor = c.ColorValue
		        g.FillRect 0, 0, g.Width, g.Height
		        return true
		      end if
		    end if
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim colors() as Pair = Array("AlternateSelectedControlColor" : NSColor.AlternateSelectedControlColor, _
		  "AlternateSelectedControlTextColor" : NSColor.AlternateSelectedControlTextColor, _
		  "Black" : NSColor.Black, _
		  "Blue" : NSColor.Blue, _
		  "Brown" : NSColor.Brown, _
		  "Clear" : NSColor.Clear, _
		  "Cyan" : NSColor.Cyan, _
		  "DarkGray" : NSColor.DarkGray, _
		  "Gray" : NSColor.Gray, _
		  "Green" : NSColor.Green, _
		  "LightGray" : NSColor.LightGray, _
		  "Magenta" : NSColor.Magenta, _
		  "Orange" : NSColor.Orange, _
		  "Purple" : NSColor.Purple, _
		  "Red" : NSColor.Red, _
		  "White" : NSColor.White, _
		  "Yellow" : NSColor.Yellow, _
		  "ControlTintBlue" : NSColor.ControlTintBlue, _
		  "ControlTintClear" : NSColor.ControlTintClear, _
		  "ControlTintDefault" : NSColor.ControlTintDefault, _
		  "ControlTintGraphite" : NSColor.ControlTintGraphite, _
		  "ControlTextColor" : NSColor.ControlTextColor, _
		  "ControlTextColorDisabled" : NSColor.ControlTextColorDisabled, _
		  "ControlHighlightColor" : NSColor.ControlHighlightColor, _
		  "ControlLightHighlightColor" : NSColor.ControlLightHighlightColor, _
		  "ControlShadowColor" : NSColor.ControlShadowColor, _
		  "ControlBackgroundColor" : NSColor.ControlBackgroundColor, _
		  "GridColor" : NSColor.GridColor, _
		  "HeaderColor" : NSColor.HeaderColor, _
		  "HeaderTextColor" : NSColor.HeaderTextColor, _
		  "HighlightColor" : NSColor.HighlightColor, _
		  "KeyboardFocusIndicatorColor" : NSColor.KeyboardFocusIndicatorColor, _
		  "KnobColor" : NSColor.KnobColor, _
		  "ScrollBarColor" : NSColor.ScrollBarColor, _
		  "SecondarySelectedControlColor" : NSColor.SecondarySelectedControlColor, _
		  "SelectedControlColor" : NSColor.SelectedControlColor, _
		  "SelectedControlTextColor" : NSColor.SelectedControlTextColor, _
		  "SelectedKnobColor" : NSColor.SelectedKnobColor, _
		  "SelectedMenuItemColor" : NSColor.SelectedMenuItemColor, _
		  "SelectedMenuItemTextColor" : NSColor.SelectedMenuItemTextColor, _
		  "SelectedTextBackgroundColor" : NSColor.SelectedTextBackgroundColor, _
		  "SelectedTextColor" : NSColor.SelectedTextColor, _
		  "ShadowColor" : NSColor.ShadowColor, _
		  "TextBackgroundColor" : NSColor.TextBackgroundColor, _
		  "TextColor" : NSColor.TextColor, _
		  "WindowFrameColor" : NSColor.WindowFrameColor, _
		  "WindowFrameTextColor" : NSColor.WindowFrameTextColor)
		  
		  if IsYosemite then
		    colors.Append  "LabelColor" : NSColor.LabelColor
		    colors.Append  "SecondaryLabelColor" : NSColor.SecondaryLabelColor
		  end if
		  
		  
		  dim t() as NSColor = NSColor.ControlAlternatingRowBackgroundColors
		  For i as Integer = 0 to t.Ubound
		    colors.Append "ControlAlternatingRowBackgroundColors(" + str(i) + ")" : t(i)
		  Next
		  
		  
		  for each item as Pair in colors
		    me.AddRow item.Left.StringValue
		    me.CellTag(me.LastIndex, 1) = item.Right
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
