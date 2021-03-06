package dashboard.common.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.service.CommonService;
import dashboard.service.ComplexService;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

/**
 * 
 * @author grechan
 *
 */
@Controller
public class CommonController {

    private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

    @Autowired
    private CommonService commonService;
    
    @Autowired
    private ComplexService service;

    @RequestMapping(value = "/checkSearchConditionJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView checkSearchConditionJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView(); 
    	
    	Map<?,?> savedSearch = service.getSavedSearchCondiion(searchVO);
    	JSONObject searchCondition = null;
    	if(savedSearch !=null && savedSearch.get("SEARCH") != null)
    		searchCondition = (JSONObject) JSONSerializer.toJSON( savedSearch.get("SEARCH") );
    	
        mav.addObject("searchCondition", searchCondition);        
        mav.setViewName("jsonView");
        

        return mav;
    }
    
    /**
     * pms 공통코드를 가져온다. prameter: codeName
     * @param request
     * @param searchVO
     * @param locale
     * @param model
     * @return
     */
    @RequestMapping(value = "/pmsCodeListJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView pmsCodeListJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView(); 
    	
    	List<?> dataList = commonService.pmsCodeList(searchVO);
        mav.addObject("dataList", dataList);
       
        mav.setViewName("jsonView");        
        

        return mav;
    }
    
    @RequestMapping(value = "/pmsProjectListJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView pmsProjectListJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView(); 
    	
    	List<?> dataList = commonService.pmsProjectList(searchVO);
        mav.addObject("dataList", dataList);       
        mav.setViewName("jsonView");        
        

        return mav;
    }
    
    @RequestMapping(value = "/pmsModelListJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView pmsModelListJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView(); 
    	
    	List<?> dataList = commonService.pmsModelListByPjtId(searchVO);
        mav.addObject("dataList", dataList);       
        mav.setViewName("jsonView");        
        

        return mav;
    }
    
    @RequestMapping(value = "/generic",method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView generic(@SuppressWarnings("rawtypes") @RequestParam Map<Object,Object> searchVO,Locale locale, Model model, HttpServletRequest request,ModelAndView mav) {
    	//parameter.put("pjtCodeList",req.getParameterValues("pjtCodeList"));
    	mav.addObject("searchVO",searchVO);
    	commonService.requestToVo(request, searchVO);
    	mav.setViewName(searchVO.get("viewName").toString());
        return mav;
    }
    
    @RequestMapping(value = "/genericlListJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView genericlListJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView(); 
    	commonService.requestToVo(request, searchVO);
    	Object filterStr = searchVO.get("filters");
    	if(filterStr != null){
    		JSONObject filters = JSONObject.fromObject(filterStr.toString());
        	searchVO.put("filtersOrigin", filterStr.toString());
        	searchVO.put("filters", filters);
    	}
    	List<?> dataList = commonService.selectList(searchVO.get("sqlid").toString(),searchVO);
        mav.addObject("dataList", dataList);       
        mav.setViewName("jsonView");      
        

        return mav;
    }
    
    @RequestMapping(value = "/genericlListPageJson",method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView genericlListPageJson(HttpServletRequest request,HttpServletResponse response, @RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView(); 
    	//searchVO.put("pjtCodeList",request.getParameterValues("pjtCodeList"));
    	commonService.requestToVo(request, searchVO);
    	Object filterStr = searchVO.get("filters");
    	if(filterStr != null && !filterStr.equals("")){
    		JSONObject filters = JSONObject.fromObject(filterStr.toString());
        	searchVO.put("filtersOrigin", filterStr.toString());
        	searchVO.put("filters", filters);
    	}
    	List<?> dataList = commonService.selectList(searchVO.get("sqlid").toString(),searchVO);
    	mav.addObject("rows", dataList);
    	
    	Map<String,Object> paging = commonService.selectOne(searchVO.get("paging_sqlid").toString(),searchVO);
    	mav.addObject("total", paging.get("TOTAL"));
    	mav.addObject("page", paging.get("PAGE"));
    	mav.addObject("records", paging.get("RECORDS"));
        
        mav.setViewName("jsonView");        

        return mav;
    }
    
    @RequestMapping(value = "/genericSaveJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView genericlSaveJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	ModelAndView mav = new ModelAndView(); 
    	commonService.requestToVo(request, searchVO);
    	try{
    		commonService.update(searchVO.get("sqlid").toString(), searchVO); 
    		//searchVO.put("result","success");
    		mav.addObject("result", "success");
    	}catch(Exception ex){
    		//searchVO.put("result","fail");
    		//searchVO.put("message",ex.getMessage());
    		mav.addObject("result", "fail");       
    		mav.addObject("message", ex.getMessage());       
    		
    	}
    	
        mav.setViewName("jsonView");        

        return mav;
    }
    
    /**
	 * 201804. kimdoyoun 추가
	 * */
    @RequestMapping(value = "/genericAutoSaveJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView genericAutoSaveJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView();
    	commonService.requestToVo(request, searchVO);
    	
    	try{
    		commonService.updateAutoSave(searchVO.get("sqlid").toString(), searchVO); 
    		//searchVO.put("result","success");
    		mav.addObject("result", "success");       
    	}catch(Exception ex){
    		//searchVO.put("result","fail");
    		//searchVO.put("message",ex.getMessage());
    		mav.addObject("result", "fail");       
    		mav.addObject("message", ex.getMessage()); 
    		
    	}
    	
        mav.setViewName("jsonView");        

        return mav;
    }
    
    /**
	 * 201804. kimdoyoun 추가
	 * */
    @RequestMapping(value = "/genericAllSaveJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView genericAllSaveJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
    	ModelAndView mav = new ModelAndView();
    	commonService.requestToVo(request, searchVO);
    	
    	try{
    		/**
    		 * Test Set mgmt. Popup 입력시 기존 있던 항목을 지우고 새로운 Test Set 을 입력(rev, seq 전부 비교해서 넣으려면 비교 시간이 매우 길어짐.)
    		 * */
    		//System.out.println("searchVO.get(\"allSaveFlag\").toString()) 1111111111111111 : " + searchVO.get("allSaveFlag").toString());
    		if( "dashboard.ssd_sm.testSetDtlGridSave".equals(searchVO.get("sqlid").toString())) {
    			if( "Copy".equals(searchVO.get("allSaveFlag").toString())) {
    				commonService.updateAllSaveBeforeDel(searchVO.get("sqlid").toString(), searchVO);
    			}
    		}
    		/*if( ){
    			
    		}*/
    		int resultCnt = commonService.updateAllSave(searchVO.get("sqlid").toString(), searchVO);
    		//searchVO.put("result","success");
    		mav.addObject("result", "success");
    		mav.addObject("resultCnt", resultCnt);
    	}catch(Exception ex){
    		//searchVO.put("result","fail");
    		//searchVO.put("message",ex.getMessage());
    		mav.addObject("result", "fail");       
    		mav.addObject("message", ex.getMessage());       
    		
    	}
    	
        mav.setViewName("jsonView");        

        return mav;
    }
    
    
    
    @RequestMapping(value = "/urlExistsJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView urlExistsJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	
		ModelAndView mav = new ModelAndView();
		boolean result = false;

		try {
			HttpURLConnection.setFollowRedirects(false);
			// note : you may also need
			// HttpURLConnection.setInstanceFollowRedirects(false)
			HttpURLConnection con = (HttpURLConnection) new URL(searchVO.get("url").toString().replace(" ","%20")).openConnection();
			con.setRequestMethod("HEAD");
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK)
				result = true;
		} catch (Exception e) {
			//e.printStackTrace();
			result = false;
		}
		mav.addObject("result", result);
		mav.setViewName("jsonView");
		return mav;
    }
    
    
    
    @RequestMapping(value = "/fileTest",method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView fileTest(@SuppressWarnings("rawtypes") @RequestParam Map<Object,Object> parameter,Locale locale, Model model, HttpServletRequest req,ModelAndView mav) {
    	//parameter.put("pjtCodeList",req.getParameterValues("pjtCodeList"));
    	mav.addObject("searchVO",parameter);
    	mav.setViewName("fileTest");
        return mav;
    }
    
    @RequestMapping(value = "/filedownloadJson",method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView filedownloadJson(@SuppressWarnings("rawtypes") @RequestParam Map<Object,Object> parameter,Locale locale, Model model, HttpServletRequest req,ModelAndView mav) {
    	//parameter.put("pjtCodeList",req.getParameterValues("pjtCodeList"));
    	mav.addObject("searchVO",parameter);
    	mav.setViewName("filedownload");
        return mav;
    }
    
    @RequestMapping(value = "/fileTestJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView fileTestJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) throws Exception {
    	
    	final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
    	ModelAndView mav = new ModelAndView(); 
    	commonService.multipartProcess(searchVO, multiRequest);
//    	List<?> dataList = commonService.pmsProjectList(searchVO);
//        mav.addObject("dataList", dataList);       
    	mav.addObject("searchVO",searchVO);
        mav.setViewName("jsonView");        
        

        return mav;
    }
    
    @RequestMapping(value = "/transactionTestJson" ,method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView transactionTestJson(HttpServletRequest request,@RequestParam Map<Object,Object> searchVO ,Locale locale, Model model) {
    	ModelAndView mav = new ModelAndView(); 
    	commonService.requestToVo(request, searchVO);
    	mav.addObject("vo", searchVO); 
    	try{
    		commonService.transactionTest(searchVO); 
    		//searchVO.put("result","success");
    		mav.addObject("result", "success");
    	}catch(Exception ex){
    		//searchVO.put("result","fail");
    		//searchVO.put("message",ex.getMessage());
    		mav.addObject("result", "fail");       
    		mav.addObject("message", ex.getMessage());       
    		
    	}
    	
        mav.setViewName("jsonView");        

        return mav;
    }
    
}
