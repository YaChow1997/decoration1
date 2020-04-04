package cn.jit.po;

public class Process {
    private Integer id;
    private Integer decoratorId;
    private Integer clientId;
    private String pic;
    private String isAccept;
    private String isDelete;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDecoratorId() {
        return decoratorId;
    }

    public void setDecoratorId(Integer decoratorId) {
        this.decoratorId = decoratorId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getIsAccept() {
        return isAccept;
    }

    public void setIsAccept(String isAccept) {
        this.isAccept = isAccept;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}
