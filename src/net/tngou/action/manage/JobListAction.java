package net.tngou.action.manage;

import com.alibaba.fastjson.JSON;
import net.tngou.action.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Job;
import net.tngou.pojo.POJO;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * 招聘list
 * Created by kjh08490 on 2015/5/18.
 */
public class JobListAction extends BaseAction {


    @Override
    public void execute() throws ServletException, IOException {


        printFreemarker("manage/jobslist.ftl", root);
    }

    public void json() {
        Ask ask = (Ask) getAsk(new Ask());
        Job bean = new Job();
        int total = bean.totalCount();
        System.out.print("total = "+total);
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows());
        String json = JSON.toJSONString(list);
        printJson(toJsonP(json, total));
    }

    /**
     * 新增一项
     */
    public void add() {

        Job job = (Job) getAsk(new Job());
        job.save();
    }

    /**
     * 删除一项
     */
    public void delete() {

        String[] ids = request.getParameterValues("id[]");
        String sql = "DELETE FROM `" + Prefix + "job`  WHERE id=?";
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

    /**
     * 编辑
     */
    public void edit() {

        Job bean = (Job) getAsk(new Job());
        long id = bean.update();
        printJson("修改成功！");
    }
}
