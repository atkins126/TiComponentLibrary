(******************************************************************************)
(*                        TiCustomScrollingListControl                        *)
(*                  Base class for scrolling list components                  *)
(*                                                                            *)
(*                                                                            *)
(* Copyright (c) 2020                                       Ivan Semenkov     *)
(* https://github.com/isemenkov/ticomponentlibrary          ivan@semenkov.pro *)
(*                                                          Ukraine           *)
(******************************************************************************)
(*                                                                            *)
(* This source  is free software;  you can redistribute  it and/or modify  it *)
(* under the terms of the GNU General Public License as published by the Free *)
(* Software Foundation; either version 3 of the License.                      *)
(*                                                                            *)
(* This code is distributed in the  hope that it will  be useful, but WITHOUT *)
(* ANY  WARRANTY;  without even  the implied  warranty of MERCHANTABILITY  or *)
(* FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License for *)
(* more details.                                                              *)
(*                                                                            *)
(* A copy  of the  GNU General Public License is available  on the World Wide *)
(* Web at <http://www.gnu.org/copyleft/gpl.html>. You  can also obtain  it by *)
(* writing to the Free Software Foundation, Inc., 51  Franklin Street - Fifth *)
(* Floor, Boston, MA 02110-1335, USA.                                         *)
(*                                                                            *)
(******************************************************************************)

unit CustomScrollingListControl;

{$mode objfpc}{$H+}
{$IFOPT D+}
  {$DEFINE DEBUG}
{$ENDIF}

interface

uses
  Classes, SysUtils, container.list;

type
  
  generic TCommonScrollingListModel<T, BinaryCompareFunctor> = class
    (specialize TList<T, BinaryCompareFunctor>);

  generic TCommonScrollingListRenderer<T> = class
  public
    procedure Draw (AItemIndex : Integer); virtual; abstract;
  end;

  { Base class for scrolling list controls components }
  generic TiCustomScrollingListControl<CustomListModel, CustomListRenderer> =
    class(TScrollingWinControl)
  protected
    FModel : IListModel;
    FRenderer : IListRenderer;
  public

  published

  end;

implementation

end.
