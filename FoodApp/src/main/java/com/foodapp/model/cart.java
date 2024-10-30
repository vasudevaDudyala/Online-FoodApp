package com.foodapp.model;

import java.util.HashMap;
import java.util.Map;

public class cart {
	private Map<Integer,cartItem> items;
	public cart() {
		this.items=new HashMap<>();
	}
	public void addItem(cartItem item) {
		int itemId=item.getItemId();
		if(items.containsKey(itemId)) {
			cartItem existingItem=items.get(itemId);
			existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
		}
		else {
			items.put(itemId, item);
		}
	}
	public void updateItem(int itemId,int quantity) {
		if(items.containsKey(itemId)) {
			if(quantity<=0) {
				items.remove(itemId);
			}
			else {
				items.get(itemId).setQuantity(quantity);
			}
		}
	}
	public void removeItem(int itemId) {
		items.remove(itemId);
	}
	public Map<Integer,cartItem> getItems(){
		return items;
	}
	public void clear() {
		items.clear();
	}

}
