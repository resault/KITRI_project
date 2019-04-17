package project.kitri.food;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import project.kitri.service.FoodService;

public class FoodController implements ActionListener{
	
	public FoodFrame foodFrame;
//	FoodService foodService;
	public FoodService foodService;
	
	public FoodController(FoodFrame foodFrame) {
		this.foodFrame = foodFrame;
		foodService = new FoodService(this);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
	      if(ob == foodFrame.drinkBtn) {
	    	  foodFrame.card.show(foodFrame.menuPanel, "drinkview");
	      } else if(ob == foodFrame.snackBtn) {
	    	  foodFrame.card.show(foodFrame.menuPanel, "snackview");
	      } else if(ob == foodFrame.noodleBtn) {
	    	  foodFrame.card.show(foodFrame.menuPanel, "noodleview");
	      } else if(ob == foodFrame.instfoodBtn) {
	    	  foodFrame.card.show(foodFrame.menuPanel, "instfoodview");
	      } else if(ob == foodFrame.plusBtn) {
	    	  foodService.plus();
	      } else if(ob == foodFrame.minusBtn) {
	    	  foodService.minus();
	      } else if(ob == foodFrame.oneCancel) {
	    	  foodService.oneCancel();
	      } else if(ob == foodFrame.totalCancel) {
	    	  foodService.totalCancel();
	      } else if(ob == foodFrame.cancelBtn) {
	    	  foodService.cancelOrder();
	      } else if(ob == foodFrame.completeBtn) {
//	    	  String memberid ="1"; //ÀÓÀÇ°ª
//	    	  foodService.completeOrder(memberid);
	    	  foodService.completeOrder();
	      } else {
	    	  foodService.foodProccess(e.getActionCommand());
//	    	  System.out.println(e.getActionCommand());
	      }
		
	}

}
