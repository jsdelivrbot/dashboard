package dashboard.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import common.service.CommonService;
import dashboard.batch.service.BatchCommonService;
import dashboard.batch.service.BatchFileFvtService;
import dashboard.batch.service.ScheduleUpdateService;
import dashboard.bean.SearchVO;
import dashboard.regression.service.RegressionTestService;
import dashboard.service.ComplexService;

/**
 * 
 * @author grechan
 *
 */
@Controller
public class TestController {

    private static final Logger logger = LoggerFactory.getLogger(TestController.class);
    
    @Autowired
    private ScheduleUpdateService schedulService;
    
    @Autowired
    private BatchFileFvtService fvtService;
    
    @Autowired
    private BatchCommonService batchCommonService;
    
    @RequestMapping(value = "/testOutJsLoad",method = { RequestMethod.GET, RequestMethod.POST })
    public String testOutJsLoad(@SuppressWarnings("rawtypes") Map parameter,Locale locale, Model model) {

        return "testOutJsLoad";
    }

    
    
}