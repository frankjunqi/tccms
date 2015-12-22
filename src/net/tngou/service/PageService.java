package net.tngou.service;

import net.tngou.dao.PageDao;
import net.tngou.entity.PageUtil;

import java.io.Serializable;


public class PageService extends BaseService {

    public PageUtil getPage(int page, int size, int type) {
        String fullyQualifiedName = "Page";
        Serializable key = "getPage_p" + page + "_s" + size + "_t" + type;
        PageUtil pageUtil = (PageUtil) cacheEngine.get(fullyQualifiedName, key);
        if (pageUtil == null) {
            PageDao pageDao = new PageDao();
            pageUtil = new PageUtil(pageDao.getPage(type, page, size), page, size, pageDao.getPage(type));
            cacheEngine.add(fullyQualifiedName, key, pageUtil);
        }
        return pageUtil;

    }

    public PageUtil getPageWith(int page, int size, int type, String isshowindex) {
        String fullyQualifiedName = "Page";
        Serializable key = "getPage_p" + page + "_s" + size + "_t" + type + "_s_i" + isshowindex;
        PageUtil pageUtil = (PageUtil) cacheEngine.get(fullyQualifiedName, key);
        if (pageUtil == null) {
            PageDao pageDao = new PageDao();
            pageUtil = new PageUtil(pageDao.getPage(type, page, size, isshowindex), page, size, pageDao.getPage(type));
            cacheEngine.add(fullyQualifiedName, key, pageUtil);
        }
        return pageUtil;

    }


}
