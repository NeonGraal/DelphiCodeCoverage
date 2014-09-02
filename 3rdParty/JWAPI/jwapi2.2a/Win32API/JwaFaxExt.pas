{******************************************************************************}
{                                                                              }
{ Fax Config and Notififcation Extensions API interface unit for Object Pascal }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: faxext.h, released November 2001. The original Pascal  }
{ code is: FaxExt.pas, released April 2002. The initial developer of the       }
{ Pascal code is Marcel van Brakel (brakelm att chello dott nl).               }
{                                                                              }
{ Portions created by Marcel van Brakel are Copyright (C) 1999-2001            }
{ Marcel van Brakel. All Rights Reserved.                                      }
{                                                                              }
{ Obtained through: Joint Endeavour of Delphi Innovators (Project JEDI)        }
{                                                                              }
{ You may retrieve the latest version of this file at the Project JEDI         }
{ APILIB home page, located at http://jedi-apilib.sourceforge.net              }
{                                                                              }
{ The contents of this file are used with permission, subject to the Mozilla   }
{ Public License Version 1.1 (the "License"); you may not use this file except }
{ in compliance with the License. You may obtain a copy of the License at      }
{ http://www.mozilla.org/MPL/MPL-1.1.html                                      }
{                                                                              }
{ Software distributed under the License is distributed on an "AS IS" basis,   }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for }
{ the specific language governing rights and limitations under the License.    }
{                                                                              }
{ Alternatively, the contents of this file may be used under the terms of the  }
{ GNU Lesser General Public License (the  "LGPL License"), in which case the   }
{ provisions of the LGPL License are applicable instead of those above.        }
{ If you wish to allow use of your version of this file only under the terms   }
{ of the LGPL License and not to allow others to use your version of this file }
{ under the MPL, indicate your decision by deleting  the provisions above and  }
{ replace  them with the notice and other provisions required by the LGPL      }
{ License.  If you do not delete the provisions above, a recipient may use     }
{ your version of this file under either the MPL or the LGPL License.          }
{                                                                              }
{ For more information about the LGPL: http://www.gnu.org/copyleft/lesser.html }
{                                                                              }
{******************************************************************************}

// $Id: JwaFaxExt.pas,v 1.9 2007/09/05 11:58:49 dezipaitor Exp $

{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaFaxExt;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "faxext.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinType;
{$ENDIF JWA_OMIT_SECTIONS}



{$IFNDEF JWA_IMPLEMENTATIONSECTION}

{************************************
*                                   *
*   Extension configuration data    *
*                                   *
************************************}

type
  FAX_ENUM_DEVICE_ID_SOURCE = (
    DEV_ID_SRC_FAX,         // Device id is generated by the fax server
    DEV_ID_SRC_TAPI);       // Device id is generated by a TAPI TSP (of FSP).
  {$EXTERNALSYM FAX_ENUM_DEVICE_ID_SOURCE}
  TFaxEnumDeviceIdSource = FAX_ENUM_DEVICE_ID_SOURCE;

//
// Prototype of FaxExtGetData
//

type
  PFAX_EXT_GET_DATA = function(dwDeviceId: DWORD; DevIdSrc: FAX_ENUM_DEVICE_ID_SOURCE; lpcwstrDataGUID: LPCWSTR; out ppData: LPBYTE; lpdwDataSize: LPDWORD): DWORD; stdcall;
  {$EXTERNALSYM PFAX_EXT_GET_DATA}

//
// Prototype of FaxExtSetData
//

  PFAX_EXT_SET_DATA = function(hInst: HINST; dwDeviceId: DWORD; DevIdSrc: FAX_ENUM_DEVICE_ID_SOURCE; lpcwstrDataGUID: LPCWSTR; pData: LPBYTE; dwDataSize: DWORD): DWORD; stdcall;
  {$EXTERNALSYM PFAX_EXT_SET_DATA}

  PFAX_EXT_CONFIG_CHANGE = function(dwDeviceId: DWORD; lpcwstrDataGUID: LPCWSTR; lpData: LPBYTE; dwDataSize: DWORD): HRESULT; stdcall;
  {$EXTERNALSYM PFAX_EXT_CONFIG_CHANGE}

//
// Prototype of FaxExtRegisterForEvents
//

  PFAX_EXT_REGISTER_FOR_EVENTS = function(hInst: HINST; dwDeviceId: DWORD; DevIdSrc: FAX_ENUM_DEVICE_ID_SOURCE; lpcwstrDataGUID: LPCWSTR; lpConfigChangeCallback: PFAX_EXT_CONFIG_CHANGE): HANDLE; stdcall;
  {$EXTERNALSYM PFAX_EXT_REGISTER_FOR_EVENTS}

//
// Prototype of FaxExtUnregisterForEvents
//

  PFAX_EXT_UNREGISTER_FOR_EVENTS = function(hNotification: HANDLE): DWORD; stdcall;
  {$EXTERNALSYM PFAX_EXT_UNREGISTER_FOR_EVENTS}

//
// Prototype of FaxExtFreeBuffer
//

  PFAX_EXT_FREE_BUFFER = procedure(lpvBuffer: LPVOID); stdcall;
  {$EXTERNALSYM PFAX_EXT_FREE_BUFFER}

//
// The extension should implement and export the following function:
//

  PFAX_EXT_INITIALIZE_CONFIG = function(
    pFaxExtGetData: PFAX_EXT_GET_DATA;
    pFaxExtSetData: PFAX_EXT_SET_DATA;
    pFaxExtRegisterForEvents: PFAX_EXT_REGISTER_FOR_EVENTS;
    pFaxExtUnregisterForEvents: PFAX_EXT_UNREGISTER_FOR_EVENTS;
    pFaxExtFreeBuffer: PFAX_EXT_FREE_BUFFER): HRESULT; stdcall;
  {$EXTERNALSYM PFAX_EXT_INITIALIZE_CONFIG}

{$ENDIF JWA_IMPLEMENTATIONSECTION}



{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}



{$IFNDEF JWA_INTERFACESECTION}
//your implementation here
{$ENDIF JWA_INTERFACESECTION}



{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
