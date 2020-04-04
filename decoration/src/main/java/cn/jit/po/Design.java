package cn.jit.po;

public class Design {
    private Integer id;
    private Integer decoratorId;
    private Integer clientId;
    private String style;
    private String house;
    private Double square;
    private String drawing;
    private Double constructionCost;
    private Double mainMaterial;
    private Double furniture;
    private Double softOutfit;

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

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public Double getSquare() {
        return square;
    }

    public void setSquare(Double square) {
        this.square = square;
    }

    public String getDrawing() {
        return drawing;
    }

    public void setDrawing(String drawing) {
        this.drawing = drawing;
    }

    public Double getConstructionCost() {
        return constructionCost;
    }

    public void setConstructionCost(Double constructionCost) {
        this.constructionCost = constructionCost;
    }

    public Double getMainMaterial() {
        return mainMaterial;
    }

    public void setMainMaterial(Double mainMaterial) {
        this.mainMaterial = mainMaterial;
    }

    public Double getFurniture() {
        return furniture;
    }

    public void setFurniture(Double furniture) {
        this.furniture = furniture;
    }

    public Double getSoftOutfit() {
        return softOutfit;
    }

    public void setSoftOutfit(Double softOutfit) {
        this.softOutfit = softOutfit;
    }
}
