package net.tngou.dao;

import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Page;

import java.util.List;

public class PageDao extends BaseDao {

    public List<Page> getPage(int type, int page, int count) {
        String sql = "SELECT * FROM `" + Prefix + "page` where menu in ( SELECT id FROM `" + Prefix + "menu` where type=?) ORDER BY id DESC";

        return QueryHelper.query_slice(Page.class, sql, page, count, type);

    }

    public int getPage(int type) {
        String sql = "SELECT count(*) FROM `" + Prefix + "page` where menu in ( SELECT id FROM `" + Prefix + "menu` where type=?)";
        return (int) QueryHelper.stat(sql, type);

    }

    public List<Page> getPage(int type, int page, int count, String isshowindex) {
        String sql = "SELECT * FROM `" + Prefix + "page` where menu in ( SELECT id FROM `" + Prefix + "menu` where type=?) and isshowindex=? ORDER BY id DESC";

        return QueryHelper.query_slice(Page.class, sql, page, count, type, isshowindex);

    }
}
