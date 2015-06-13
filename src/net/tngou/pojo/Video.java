package net.tngou.pojo;


/**
 * youku视频链接地址
 *
 * @author kjh
 */
public class Video extends POJO {


    private String name;    //视频的标题
    private String desc;// 视频的描述
    private String url;    //视频的url链接
    private int seq;// 视频的排序

    @Override
    protected boolean isObjectCachedByID() {
        return true;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
