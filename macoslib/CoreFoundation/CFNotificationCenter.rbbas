#tag ClassClass CFNotificationCenterInherits CFType	#tag Event		Function ClassID() As UInt32		  return me.ClassID		End Function	#tag EndEvent	#tag Method, Flags = &h0		 Shared Function LocalCenter() As CFNotificationCenter		  #if targetMacOS		    if IsTiger then		      soft declare function CFNotificationCenterGetLocalCenter lib CarbonFramework () as Ptr		      		      dim theCenter as new CFNotificationCenter(CFNotificationCenterGetLocalCenter, false)		      return theCenter		      		    else		      return nil		    end if		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function ClassID() As UInt32		  #if targetMacOS		    		    soft declare function CFNotificationCenterGetTypeID lib CarbonFramework () as UInt32		    		    static id as Uint32 = CFNotificationCenterGetTypeID		    return id		  #else		    return 0		  #endif		  		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub AddObserver()		  'void CFNotificationCenterAddObserver (		  'CFNotificationCenterRef center,		  'const void *observer,		  'CFNotificationCallback callBack,		  'CFStringRef name,		  'const void *object,		  'CFNotificationSuspensionBehavior suspensionBehavior		  ');		  		  		  'enum CFNotificationSuspensionBehavior {		  'CFNotificationSuspensionBehaviorDrop = 1,		  'CFNotificationSuspensionBehaviorCoalesce = 2,		  'CFNotificationSuspensionBehaviorHold = 3,		  'CFNotificationSuspensionBehaviorDeliverImmediately = 4		  '};		  'typedef enum CFNotificationSuspensionBehavior CFNotificationSuspensionBehavior;		End Sub	#tag EndMethodEnd Class#tag EndClass