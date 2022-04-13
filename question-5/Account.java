public class Account
{
   private AccountHolder holder;
   private double balance = 0.0;

   public Account(double amt, AccountHolder holder)
   {
      this.holder = holder;
      balance = amt;
   }

   public double deposit(double amt)
   {
      balance += amt;
      return balance;
   }

   public double withdraw(double amt)
   {
      balance -= amt;
      return balance;
   }

   public double getBalance()
   {
      return balance;
   }

   public AccountHolder getHolder()
   {
      return holder;
   }

   public void setBalance(double amt)
   {
      balance = amt;
   }

   public void setHolder(AccountHolder holder)
   {
      this.holder = holder;
   }
}
