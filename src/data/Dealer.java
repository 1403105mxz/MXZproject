package data;

/**
 * Created by meng on 2016/11/15.
 */
public class Dealer {
    private String name;
    private String id;
    private String address;
    private String phoneNumber;
    private String bank;
    private String bankId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId;
    }

    public static Dealer makeDealer(String name, String id,
                                    String address, String phoneNumber,
                                    String bank, String bankId) {
        Dealer dealer = new Dealer();
        dealer.setName(name);
        dealer.setId(id);
        dealer.setAddress(address);
        dealer.setPhoneNumber(phoneNumber);
        dealer.setBank(bank);
        dealer.setBankId(bankId);
        return dealer;
    }
}
