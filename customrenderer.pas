(******************************************************************************)
(*                             TiComponentLibrary                             *)
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

unit CustomRenderer;

{$mode objfpc}{$H+}
{$IFOPT D+}
  {$DEFINE DEBUG}
{$ENDIF}

interface

uses
  SysUtils, Types, Graphics, BGRABitmap, BGRADefaultBitmap, BGRABitmapTypes,
  BGRAGradientScanner;

type
  TLinearGradientType = (
    LINEAR_VERTICAL_TOP_BOTTOM,
    LINEAR_VERTICAL_BOTTOM_TOP,
    LINEAR_HORIZONTAL_LEFT_RIGHT,
    LINEAR_HORIZONTAL_RIGHT_LEFT,
    LINEAR_DIAGONAL_LEFT_BOTTOM_RIGHT_TOP,
    LINEAR_DIAGONAL_RIGHT_TOP_LEFT_BOTTOM,
    LINEAR_DIAGONAL_LEFT_TOP_RIGHT_BOTTOM,
    LINEAR_DIAGONAL_RIGHT_BOTTOM_LEFT_TOP
  );

  TMargin = record
    Top, Right, Bottom, Left : Cardinal;
  end;

  TCustomRenderer = class
  public
    constructor Create (AWidth, AHeight : Cardinal);
    destructor Destroy; override;

    procedure FillSolid (AColor : TBGRAPixel; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillSolid (AMargin : TMargin; AColor : TBGRAPixel; ADrawMode :
      TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillSolid (ARect : TRect; AColor : TBGRAPixel; ADrawMode :
      TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillSolid (AMargin : TMargin; ARect : TRect; AColor : TBGRAPixel;
      ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}

    procedure FillLinearGradient (AStartColor, AEndColor : TBGRAPixel;
      AGradientType : TLinearGradientType; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillLinearGradient (AMargin : TMargin; AStartColor, AEndColor :
      TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode : TDrawMode);
      overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillLinearGradient (ARect : TRect; AStartColor, AEndColor :
      TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode : TDrawMode);
      overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillLinearGradient (AMargin : TMargin; ARect : TRect; AStartColor,
      AEndColor : TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode :
      TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillLinearGradient (AStartPos : TPointF; AStartColor : TBGRAPixel;
      AEndPos : TPointF; AEndColor : TBGRAPixel; ADrawMode : TDrawMode);
      overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillLinearGradient (ARect : TRect; AStartPos : TPointF;
      AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
      ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillLinearGradient (AMargin : TMargin; AStartPos : TPointF;
      AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
      ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillLinearGradient (AMargin : TMargin; ARect : TRect; AStartPos :
      TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor :
      TBGRAPixel; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}

    procedure FillReflectedGradiend (AStartColor, AEndColor : TBGRAPixel;
      AGradientType : TLinearGradientType; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillReflectedGradiend (AMargin : TMargin; AStartColor, AEndColor :
      TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode : TDrawMode);
      overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillReflectedGradiend (ARect : TRect; AStartColor, AEndColor :
      TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode : TDrawMode);
      overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillReflectedGradiend (AMargin : TMargin; ARect : TRect;
      AStartColor, AEndColor : TBGRAPixel; AGradientType : TLinearGradientType;
      ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillReflectedGradiend (AStartPos : TPointF; AStartColor :
      TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel; ADrawMode :
      TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillReflectedGradiend (ARect : TRect; AStartPos : TPointF;
      AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
      ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillReflectedGradiend (AMargin : TMargin; AStartPos : TPointF;
      AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
      ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure FillReflectedGradiend (AMargin : TMargin; ARect : TRect;
      AStartPos : TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF;
      AEndColor : TBGRAPixel; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}

    procedure DrawSolidRectangle (ABorderSize : Cardinal; ABorderColor :
      TBGRAPixel; ABackgroundColor : TBGRAPixel; ADrawMode : TDrawMode);
      overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure DrawSolidRectangle (AMargin : TMargin; ABorderSize : Cardinal; 
      ABorderColor : TBGRAPixel; ABackgroundColor : TBGRAPixel; ADrawMode : 
      TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}  
    procedure DrawSolidRectangle (ARect : TRect; ABorderSize : Cardinal; 
      ABorderColor : TBGRAPixel; ABackgroundColor : TBGRAPixel; ADrawMode : 
      TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure DrawSolidRectangle (AMargin : TMargin; ARect : TRect;
      ABorderSize : Cardinal; ABorderColor : TBGRAPixel; ABackgroundColor : 
      TBGRAPixel; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}

    procedure DrawSolidRectangle (AOuterBorderSize : Cardinal; 
      AOuterBorderColor : TBGRAPixel; ABorderSize : Cardinal;  ABorderColor : 
      TBGRAPixel; AInnerBorderSize : Cardinal; AInnerBorderColor : TBGRAPixel; 
      ABackgroundColor : TBGRAPixel; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    procedure DrawSolidRectangle (ARect : TRect; AOuterBorderSize : Cardinal; 
      AOuterBorderColor : TBGRAPixel; ABorderSize : Cardinal; ABorderColor : 
      TBGRAPixel;  AInnerBorderSize : Cardinal; AInnerBorderColor : TBGRAPixel; 
      ABackgroundColor : TBGRAPixel; ADrawMode : TDrawMode); overload;
      {$IFNDEF DEBUG}inline;{$ENDIF}
    
  private
    FBitmap : TBGRABitmap;
  public
    property Canvas : TBGRABitmap read FBitmap;
  end;

  function Margin (ATop, ARight, ABottom, ALeft : Cardinal) : TMargin;
    overload;
  function Margin (ARect : TRect) : TMargin; overload;

implementation

function Margin (ATop, ARight, ABottom, ALeft : Cardinal) : TMargin;
begin
  Result.Top := ATop;
  Result.Right := ARight;
  Result.Bottom := ABottom;
  Result.Left := ALeft;
end;

function Margin (ARect : TRect) : TMargin;
begin
  Result.Top := ARect.Top;
  Result.Right := ARect.Right;
  Result.Bottom := ARect.Bottom;
  Result.Left := ARect.Left;
end;

{ TCustomRenderer }

constructor TCustomRenderer.Create (AWidth, AHeight : Cardinal);
begin
  FBitmap := TBGRABitmap.Create(AWidth, AHeight, BGRA(0, 0, 0, 0));

end;

destructor TCustomRenderer.Destroy;
begin
  FreeAndNil(FBitmap);
  inherited Destroy;
end;

procedure TCustomRenderer.FillSolid (AColor : TBGRAPixel; ADrawMode :
  TDrawMode);
begin
  FillSolid(Rect(0, 0, FBitmap.Width, FBitmap.Height), AColor, ADrawMode);
end;

procedure TCustomRenderer.FillSolid (AMargin : TMargin; AColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FillSolid(AMargin, Rect(0, 0, FBitmap.Width, FBitmap.Height), AColor,
    ADrawMode);
end;

procedure TCustomRenderer.FillSolid (ARect : TRect; AColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FBitmap.FillRect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom, AColor,
    ADrawMode);
end;

procedure TCustomRenderer.FillSolid (AMargin : TMargin; ARect : TRect; AColor :
  TBGRAPixel; ADrawMode : TDrawMode); overload;
begin
  FillSolid(Rect(ARect.Left + AMargin.Left, ARect.Top + AMargin.Top,
    ARect.Right - AMargin.Right, ARect.Bottom - AMargin.Bottom), AColor,
    ADrawMode);
end;

procedure TCustomRenderer.FillLinearGradient (AStartColor, AEndColor :
  TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode : TDrawMode);
begin
  FillLinearGradient(Rect(0, 0, FBitmap.Width, FBitmap.Height), AStartColor,
    AEndColor, AGradientType, ADrawMode);
end;

procedure TCustomRenderer.FillLinearGradient (AStartPos : TPointF; AStartColor :
  TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel; ADrawMode : TDrawMode);
begin
  FBitmap.GradientFill(0, 0, FBitmap.Width, FBitmap.Height,
    AStartColor, AEndColor, gtLinear, AStartPos, AEndPos, ADrawMode);
end;

procedure TCustomRenderer.FillLinearGradient (AMargin : TMargin; AStartPos :
  TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FillLinearGradient(Rect(AMargin.Left, AMargin.Top, FBitmap.Width -
    AMargin.Right, FBitmap.Height - AMargin.Bottom), AStartPos, AStartColor,
    AEndPos, AEndColor, ADrawMode);
end;

procedure TCustomRenderer.FillLinearGradient (ARect : TRect; AStartPos :
  TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
    AStartColor, AEndColor, gtLinear, AStartPos, AEndPos, ADrawMode);
end;

procedure TCustomRenderer.FillLinearGradient (AMargin : TMargin; ARect : TRect;
  AStartPos : TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor :
  TBGRAPixel; ADrawMode : TDrawMode);
begin
  FillLinearGradient(Rect(ARect.Left + AMargin.Left, ARect.Top + AMargin.Top,
    ARect.Right - AMargin.Right, ARect.Bottom - AMargin.Bottom), AStartPos,
    AStartColor, AEndPos, AEndColor, ADrawMode);
end;

procedure TCustomRenderer.FillLinearGradient (AMargin : TMargin; AStartColor,
  AEndColor : TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode :
  TDrawMode);
begin
  FillLinearGradient(AMargin, Rect(0, 0, FBitmap.Width, FBitmap.Height),
    AStartColor, AEndColor, AGradientType, ADrawMode);
end;

procedure TCustomRenderer.FillLinearGradient (ARect : TRect; AStartColor,
  AEndColor : TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode :
  TDrawMode);
begin
  case AGradientType of
  LINEAR_VERTICAL_TOP_BOTTOM :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtLinear, PointF(ARect.Left, ARect.Top),
      PointF(ARect.Left, ARect.Bottom), ADrawMode);
  LINEAR_VERTICAL_BOTTOM_TOP :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtLinear, PointF(ARect.Left, ARect.Bottom),
      PointF(ARect.Left, ARect.Top), ADrawMode);
  LINEAR_HORIZONTAL_LEFT_RIGHT :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtLinear, PointF(ARect.Left, ARect.Top),
      PointF(ARect.Bottom, ARect.Left), ADrawMode);
  LINEAR_HORIZONTAL_RIGHT_LEFT :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtLinear, PointF(ARect.Bottom, ARect.Left),
      PointF(ARect.Left, ARect.Top), ADrawMode);
  LINEAR_DIAGONAL_LEFT_BOTTOM_RIGHT_TOP :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtLinear, PointF(ARect.Left, ARect.Bottom),
      PointF(ARect.Bottom, ARect.Left),
      ADrawMode);
  LINEAR_DIAGONAL_RIGHT_TOP_LEFT_BOTTOM :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtLinear, PointF(ARect.Bottom, ARect.Left),
      PointF(ARect.Left, ARect.Bottom),
      ADrawMode);
  LINEAR_DIAGONAL_RIGHT_BOTTOM_LEFT_TOP :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtLinear, PointF(AREct.Bottom, ARect.Bottom),
      PointF(ARect.Top, ARect.Top), ADrawMode);
  end;
end;

procedure TCustomRenderer.FillLinearGradient (AMargin : TMargin; ARect : TRect;
  AStartColor, AEndColor : TBGRAPixel; AGradientType : TLinearGradientType;
  ADrawMode : TDrawMode);
begin
  FillLinearGradient(Rect(ARect.Left + AMargin.Left, ARect.Top + AMargin.Top,
    ARect.Right - AMargin.Right, ARect.Bottom - AMargin.Bottom), AStartColor,
    AEndColor, AGradientType, ADrawMode);
end;

procedure TCustomRenderer.FillReflectedGradiend (AStartColor, AEndColor :
  TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode : TDrawMode);
begin
  FillReflectedGradiend(Rect(0, 0, FBitmap.Width, FBitmap.Height), AStartColor,
    AEndColor, AGradientType, ADrawMode);
end;

procedure TCustomRenderer.FillReflectedGradiend (AMargin : TMargin; AStartColor,
  AEndColor : TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode :
  TDrawMode);
begin
  FillReflectedGradiend(AMargin, Rect(0, 0, FBitmap.Width, FBitmap.Height),
    AStartColor, AEndColor, AGradientType, ADrawMode);
end;

procedure TCustomRenderer.FillReflectedGradiend (ARect : TRect; AStartColor,
  AEndColor : TBGRAPixel; AGradientType : TLinearGradientType; ADrawMode :
  TDrawMode);
begin
  case AGradientType of
  LINEAR_VERTICAL_TOP_BOTTOM :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtReflected, PointF(ARect.Left, ARect.Top),
      PointF(ARect.Left, ARect.Bottom), ADrawMode);
  LINEAR_VERTICAL_BOTTOM_TOP :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtReflected, PointF(ARect.Left, ARect.Bottom),
      PointF(ARect.Left, ARect.Top), ADrawMode);
  LINEAR_HORIZONTAL_LEFT_RIGHT :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtReflected, PointF(ARect.Left, ARect.Top),
      PointF(ARect.Bottom, ARect.Left), ADrawMode);
  LINEAR_HORIZONTAL_RIGHT_LEFT :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtReflected, PointF(ARect.Bottom, ARect.Left),
      PointF(ARect.Left, ARect.Top), ADrawMode);
  LINEAR_DIAGONAL_LEFT_BOTTOM_RIGHT_TOP :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtReflected, PointF(ARect.Left, ARect.Bottom),
      PointF(ARect.Bottom, ARect.Left),
      ADrawMode);
  LINEAR_DIAGONAL_RIGHT_TOP_LEFT_BOTTOM :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtReflected, PointF(ARect.Bottom, ARect.Left),
      PointF(ARect.Left, ARect.Bottom),
      ADrawMode);
  LINEAR_DIAGONAL_RIGHT_BOTTOM_LEFT_TOP :
    FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      AStartColor, AEndColor, gtReflected, PointF(AREct.Bottom, ARect.Bottom),
      PointF(ARect.Top, ARect.Top), ADrawMode);
  end;
end;

procedure TCustomRenderer.FillReflectedGradiend (AMargin : TMargin; ARect :
  TRect; AStartColor, AEndColor : TBGRAPixel; AGradientType :
  TLinearGradientType; ADrawMode : TDrawMode);
begin
  FillReflectedGradiend(Rect(ARect.Left + AMargin.Left, ARect.Top + AMargin.Top,
    ARect.Right - AMargin.Right, ARect.Bottom - AMargin.Bottom), AStartColor,
    AEndColor, AGradientType, ADrawMode);
end;

procedure TCustomRenderer.FillReflectedGradiend (AStartPos : TPointF;
  AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FillReflectedGradiend(Rect(0, 0, FBitmap.Width, FBitmap.Height), AStartPos,
    AStartColor, AEndPos, AEndColor, ADrawMode);
end;

procedure TCustomRenderer.FillReflectedGradiend (ARect : TRect; AStartPos :
  TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FBitmap.GradientFill(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
    AStartColor, AEndColor, gtReflected, AStartPos, AEndPos, ADrawMode);
end;

procedure TCustomRenderer.FillReflectedGradiend (AMargin : TMargin; AStartPos :
  TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF; AEndColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FillReflectedGradiend(Rect(AMargin.Left, AMargin.Top, FBitmap.Width -
    AMargin.Right, FBitmap.Height - AMargin.Bottom), AStartPos, AStartColor,
    AEndPos, AEndColor, ADrawMode);
end;

procedure TCustomRenderer.FillReflectedGradiend (AMargin : TMargin; ARect :
  TRect; AStartPos : TPointF; AStartColor : TBGRAPixel; AEndPos : TPointF;
  AEndColor : TBGRAPixel; ADrawMode : TDrawMode);
begin
  FillReflectedGradiend(Rect(ARect.Left + AMargin.Left, ARect.Top +
    AMargin.Top, ARect.Right - AMargin.Right, ARect.Bottom - AMargin.Bottom),
    AStartPos, AStartColor, AEndPos, AEndColor, ADrawMode);
end;

procedure TCustomRenderer.DrawSolidRectangle (ARect : TRect; ABorderSize :
  Cardinal; ABorderColor : TBGRAPixel; ABackgroundColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  FBitmap.RectangleAntialias(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
    ABorderColor, ABorderSize * 2);
  FillSolid(Rect(ARect.Left + ABorderSize, ARect.Top + ABorderSize,
    ARect.Right - ABorderSize, ARect.Bottom - ABorderSize), ABackgroundColor,
    ADrawMode);
end;

procedure TCustomRenderer.DrawSolidRectangle (ABorderSize : Cardinal;
  ABorderColor : TBGRAPixel; ABackgroundColor : TBGRAPixel; ADrawMode :
  TDrawMode);
begin
  DrawSolidRectangle(Rect(0, 0, FBitmap.Width, FBitmap.Height), ABorderSize,
    ABorderColor, ABackgroundColor, ADrawMode);
end;

procedure TCustomRenderer.DrawSolidRectangle (AMargin : TMargin; ABorderSize :
  Cardinal; ABorderColor : TBGRAPixel; ABackgroundColor : TBGRAPixel;
  ADrawMode : TDrawMode);
begin
  DrawSolidRectangle(Rect(AMargin.Left, AMargin.Top, AMargin.Right,
    AMargin.Bottom), ABorderSize, ABorderColor, ABackgroundColor, ADrawMode);
end;

procedure TCustomRenderer.DrawSolidRectangle (AMargin : TMargin; ARect : TRect;
  ABorderSize : Cardinal; ABorderColor : TBGRAPixel; ABackgroundColor :
  TBGRAPixel; ADrawMode : TDrawMode);
begin
  DrawSolidRectangle(Rect(ARect.Left + AMargin.Left, ARect.Top + AMargin.Top,
    ARect.Right - AMargin.Right, ARect.Bottom - AMargin.Bottom), ABorderSize,
    ABorderColor, ABackgroundColor, ADrawMode);
end;

procedure TCustomRenderer.DrawSolidRectangle (AOuterBorderSize : Cardinal;
  AOuterBorderColor : TBGRAPixel; ABorderSize : Cardinal;  ABorderColor :
  TBGRAPixel; AInnerBorderSize : Cardinal; AInnerBorderColor : TBGRAPixel;
  ABackgroundColor : TBGRAPixel; ADrawMode : TDrawMode);
begin
  DrawSolidRectangle(Rect(0, 0, FBitmap.Width, FBitmap.Height),
    AOuterBorderSize, AOuterBorderColor, ABorderSize, ABorderColor,
    AInnerBorderSize, AInnerBorderColor, ABackgroundColor, ADrawMode);
end;

procedure TCustomRenderer.DrawSolidRectangle (ARect : TRect; AOuterBorderSize :
  Cardinal; AOuterBorderColor : TBGRAPixel; ABorderSize : Cardinal;
  ABorderColor : TBGRAPixel;  AInnerBorderSize : Cardinal; AInnerBorderColor :
  TBGRAPixel; ABackgroundColor : TBGRAPixel; ADrawMode : TDrawMode);
begin
  FBitmap.JoinStyle := pjsMiter;
  FBitmap.RectangleAntialias(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
    AOuterBorderColor, AOuterBorderSize * 2);
  FBitmap.RectangleAntialias(ARect.Left + AOuterBorderSize + ABorderSize,
    ARect.Top + AOuterBorderSize + ABorderSize, ARect.Right -
    AOuterBorderSize - ABorderSize, ARect.Bottom - AOuterBorderSize -
    ABorderSize, ABorderColor, ABorderSize * 2);
  FillSolid(Rect(ARect.Left + AOuterBorderSize + ABorderSize, ARect.Top +
    AOuterBorderSize + ABorderSize, ARect.Right - AOuterBorderSize -
    ABorderSize, ARect.Bottom - AOuterBorderSize - ABorderSize),
    ABackgroundColor, ADrawMode);
  {FBitmap.RectangleAntialias(ARect.Left + AOuterBorderSize + ABorderSize,
    ARect.Top + AOuterBorderSize + ABorderSize, ARect.Right - AOuterBorderSize -
    ABorderSize, ARect.Bottom - AOuterBorderSize - ABorderSize,
    AInnerBorderColor, AInnerBorderSize * 2);}
end;

end.
