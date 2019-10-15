public class Par {
    public String name;
    public String type;
    public int nivel;

    public Par() {
        this.name = "";
        this.type = "";
        this.nivel = 0;
    }

    public Par(Par a) {
        this.setName(a.getName());
        this.setType(a.getType());
        this.setNivel(a.getNivel());
    }

    public Par(String name, String type, int nivel) {
        this.name = name;
        this.type = type;
        this.nivel = nivel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    @Override
    public String toString() {
        return "Par{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", nivel=" + nivel +
                '}';
    }

}
