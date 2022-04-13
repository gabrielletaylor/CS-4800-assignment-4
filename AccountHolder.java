import java.util.Random;

abstract class AccountHolder
{
   protected int ID;
   protected String address;

   public AccountHolder(int ID, String address)
   {
      this.ID = ID;
      this.address = address;
   }

   public static int getNextID()
   {
      int nextID = new Random().nextInt(1000000 - 1) + 1;
      return nextID;
   }
}