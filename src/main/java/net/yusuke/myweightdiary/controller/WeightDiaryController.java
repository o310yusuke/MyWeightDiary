package net.yusuke.myweightdiary.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

public class WeightDiaryController extends Controller {

    @Override
    public Navigation run() throws Exception {
        return forward("weightDiary.jsp");
    }
}
