type MoneyUnit = "PENNY" | "NICKEL" | "DIME" | "QUARTER" | "ONE" | "FIVE" | "TEN" | "TWENTY" | "ONE HUNDRED";  
type Money = [MoneyUnit, number];

type StatusType = "OPEN" | "INSUFFICIENT_FUNDS" | "CLOSED";
type CashRegister = {status: StatusType, change: Money[]};

function toCents(dollars: number): number{
  return Math.round(100*dollars);
}

function toDollars(cents: number): number{
  return cents/100;
}

export default function checkCashRegister(price: number, cash: number, cid: Money[]): CashRegister{
    let cashRegister: CashRegister = {status: "OPEN", change: []};
    const totalCash = toCents( cid.reduce((sum,cUnit)=>sum + cUnit[1],0) );
    const changeDue = toCents( cash - price );
    const cidInCents: Money[] = cid.map( item => ([item[0], toCents(item[1])]) );
  
    
    if (totalCash == changeDue)
    {
      cashRegister.status = "CLOSED";
      cashRegister.change = cid;
      return cashRegister;
    } 
    else if (totalCash < changeDue)
    {
      cashRegister.status = "INSUFFICIENT_FUNDS";
      return cashRegister;
    }
    
    let units = [1, 5, 10, 25, 100, 500, 1000, 2000, 10000];
  
    cashRegister.change = cid.map(item => [item[0], 0]);
    let change = 0;
  
    for (let i=cidInCents.length-1; i>=0; i--) 
    {  
      let needMoreCash = change + units[i] <= changeDue;
      let haveMoreCash = cidInCents[i][1] > 0;
      while (needMoreCash && haveMoreCash){
        change                    += units[i];
        cashRegister.change[i][1] += units[i];
        cidInCents[i][1]          -= units[i];
        needMoreCash = change + units[i] <= changeDue;
        haveMoreCash = cidInCents[i][1] > 0;
      }
    }
  
    if (change < changeDue)
    {
      console.log(change, changeDue)
      cashRegister.status = "INSUFFICIENT_FUNDS";
      cashRegister.change = [];
      return cashRegister;
    } 
    else 
    {
      cashRegister.change = cashRegister.change.reverse()
                            .filter(item => item[1] != 0)
                            .map(item => [item[0], toDollars(item[1])]);
      return cashRegister;
    }
  }