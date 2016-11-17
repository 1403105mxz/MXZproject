package action;

import com.opensymphony.xwork2.ActionSupport;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by 54333 on 2016/11/14.
 */
public class Go{
    private String changep;

    public String getChangep() {
        return changep;
    }

    public void setChangep(String changep) {
        this.changep = changep;
    }

    public String goOperationIndex() {
        return SUCCESS;
    }

    public String goEditInvoice() {
        return SUCCESS;
    }

    public String goAddInvoice()  {
        return SUCCESS;
    }

    public String goChangeid() {
        return SUCCESS;
    }
}


