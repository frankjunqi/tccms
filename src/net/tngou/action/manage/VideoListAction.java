package net.tngou.action.manage;

import com.alibaba.fastjson.JSON;
import net.tngou.action.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Link;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Video;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * 视频管理页面
 */
public class VideoListAction extends BaseAction {


    @Override
    public void execute() throws ServletException, IOException {
        printFreemarker("manage/videolist.ftl", root);
    }

    public void json() {
        Ask ask = (Ask) getAsk(new Ask());
        Video bean = new Video();
        int total = bean.totalCount();
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows());
        String json = JSON.toJSONString(list);
        printJson(toJsonP(json, total));
    }

    public void add() {
        Video video = (Video) getAsk(new Video());
        video.save();
    }

    public void delete() {
        String[] ids = request.getParameterValues("id[]");
        String sql = "DELETE FROM `" + Prefix + "video`  WHERE id=?";
        Object[][] params = new Object[ids.length][1];
        String id = "";
        for (int i = 0; i < params.length; i++) {
            if (i != 0) id += ",";
            id += i;
            params[i][0] = ids[i];
        }
        QueryHelper.batch(sql, params);
        printJson("{\"msg\":\"" + id + "\"}");
    }

    public void edit() {
        Video bean = (Video) getAsk(new Video());
        long id = bean.update();
        printJson("修改成功！");
    }
}
