package imageboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import imageboard.bean.ImageboardDTO;
import imageboard.service.ImageboardService;

@Controller
@RequestMapping(value="imageboard")
public class ImageboardController {
	
	@Autowired
	private ImageboardService imageboardService;
	
	@GetMapping(value="/imageboardWriteForm")
	public ModelAndView imageboard() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/imageboard/imageboardWriteForm.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value="imageboardWrite")
	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO
								,@RequestParam MultipartFile img,
								HttpSession session) {
		//실제폴더
		String filePath = session.getServletContext().getRealPath("/WEB-INF/storage");
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath,fileName);
		
		try {
			img.transferTo(file);
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		imageboardDTO.setImage1(fileName);
		
		imageboardService.imageboardWrite(imageboardDTO);
	}
	
	@GetMapping(value="imageboardList")
	public ModelAndView imageboardList(@RequestParam(required = false,defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/imageboard/imageboardList.jsp");
		mav.setViewName("/index");
		
		return mav; 
	}
	
	@ResponseBody
	@PostMapping(value="getImageboardList")
	public Map<String,Object> getImageboardList(@RequestParam(required = false,defaultValue="1" ) String pg){
		return imageboardService.getImageBoardList(pg);
		
	}
	
	@GetMapping(value="imageboardDelete")
	public ModelAndView imageboardDelete(@RequestParam String[] check) {
		imageboardService.imageboardDelete(check);
		
		return new ModelAndView("redirect:/imageboard/imageboardList");
	}
}
