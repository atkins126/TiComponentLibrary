unit DemoForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, CustomRenderer,
  BGRABitmap, BGRABitmapTypes, CairoGraphics;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    renderer : TCustomRenderer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  renderer := TCustomRenderer.Create(400, 200);
  {
  renderer.FillSolid(BGRA(255, 255, 255, 255), dmDrawWithTransparency);
  renderer.FillReflectedGradiend(Margin(5, 5, 5, 5), Rect(5, 5, 395, 195),
    PointF(0, 50), BGRA(255, 255, 0, 255), PointF(280, 140),
    BGRA(0, 0, 255, 255), dmDrawWithTransparency);
  }
  {
  renderer.DrawSolidRectangle(10, BGRA(255, 255, 255, 255),
    BGRA(255, 255, 0, 255), dmDrawWithTransparency);
  }

  renderer.DrawSolidRectangle(1, BGRA(0, 0, 0, 255), 10,
    BGRA(255, 255, 255, 255), 2, BGRA(80, 80, 80, 128), BGRA(255, 255, 0, 255),
    dmDrawWithTransparency);

  renderer.Canvas.Draw(Form1.Canvas, 50, 50, False);

end;

end.

