package ua.controller.admin;

import static ua.util.ParamBuilder.getParams;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ua.dto.filter.SimpleFilter;

import ua.entity.MeasuringSystem;
import ua.service.MeasuringSystemService;
import ua.validator.MeasuringsystemsValidator;



@Controller
@RequestMapping("/admin/mssystems")
@SessionAttributes("mssystems")
public class MSSystemsController {

	
	@Autowired
	private MeasuringSystemService mssystemsService;
	
	
	
	@InitBinder("mssystems")
	protected void bind(WebDataBinder binder){
		binder.setValidator(new MeasuringsystemsValidator(mssystemsService));
	}
	
	@ModelAttribute("filter")
	public SimpleFilter getFilter(){
		return new SimpleFilter();
	}
	
	@ModelAttribute("mssystems")
	public MeasuringSystem getForm(){
		return new MeasuringSystem();
	}
	
	@GetMapping
	public String show(Model model, @PageableDefault Pageable pageable, 
			@ModelAttribute("filter") SimpleFilter filter){
		model.addAttribute("page", mssystemsService.findAll(pageable, filter));
		return "admin-mssystems";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable Long id, Model model
			, @PageableDefault Pageable pageable,
			@ModelAttribute("filter") SimpleFilter filter){
		model.addAttribute("mssystems", mssystemsService.findOne(id));
		show(model, pageable, filter);
		return "admin-mssystems";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Long id, @PageableDefault Pageable pageable,
			@ModelAttribute("filter") SimpleFilter filter){
		mssystemsService.delete(id);
		return "redirect:/admin/mssystems"+getParams(pageable, filter);
	}
	
	@PostMapping
	public String save(@ModelAttribute("mssystems") @Valid MeasuringSystem mssystems, 
			BindingResult br, Model model, SessionStatus status, 
			@PageableDefault Pageable pageable,
			@ModelAttribute("filter") SimpleFilter filter){
		if(br.hasErrors()){
			return show(model, pageable, filter);
		}
		mssystemsService.save(mssystems);
		status.setComplete();
		return "redirect:/admin/mssystems"+getParams(pageable, filter);
	}
	
	
}
