unit formOrderAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, OrderHandler;

type
  TfrmOrderAdd = class(TForm)
    edtDesc: TLabeledEdit;
    edtTotal: TLabeledEdit;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrderAdd: TfrmOrderAdd;

implementation

uses
  formOrderList;

{$R *.dfm}

procedure TfrmOrderAdd.Button1Click(Sender: TObject);
begin
  edtTotal.Text := inttostr(strtoint(edit1.Text) + strtoint(Edit2.Text));
end;

procedure TfrmOrderAdd.Button3Click(Sender: TObject);
begin
  with TOrderHandler.create(frmOrderList.FDConnection1) do
  begin
    AddOrder(edtDesc.Text, strtocurr(edtTotal.Text));
    free();
  end;

  close();
end;

end.
