program CMDContact;

Uses
 crt, sysutils;

Type
 cpack = Record
     Name : String;
     Phone: String;
 end;

 Contacts = array [1..25] of cpack;

Const
  Ver = '0.61';

Var
  Data : Contacts;
  Input: string='';
  RecC : Integer=1;

Procedure PrintContacts;
 var counter:integer=1;
begin;
 Repeat
   if Data[1].Name='' then writeln('No Contacts Added. Type "new" to add one.')
   else
     writeln(IntToStr(counter)+'  '+Data[counter].Name+' '+Data[counter].Phone);
   writeln('-');
   counter:=counter+1;
 Until Data[counter].Name='';
end;

Procedure PrintHelp;
begin
 writeln('"NEW" - Create new contact');
 writeln('"VIEW" - view existing contacts in memory');
end;

Procedure CreateNewContact;
begin;
 writeln('Please input your contact name');
 Readln(Data[RecC].Name);
 writeln('Contact Phone Number');
 Readln(Data[RecC].Phone);
 writeln('Contact '+Data[RecC].name+' saved to memory');
 RecC := RecC+1;
end;

Procedure RunCommand(Command:String);
begin;
 If Command = 'new' then CreateNewContact;
 if Command = 'view' then PrintContacts;
 if command = 'help' then Printhelp;
end;

Procedure StartProg;
begin
 writeln('CMDContact Pascal Program Test Ver.'+Ver);
 writeln('Input Command');
   Repeat
     Readln(Input);
     Input := LowerCase(Input);
     RunCommand(Input);
   Until Input='end';
end;

begin
  Repeat
  StartProg;
  Until Input = 'end';
end.

