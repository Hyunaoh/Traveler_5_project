package com.traveler.commons;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

public class Commons_sort implements Comparator<Integer> {

	//List 오름차순 정렬
	@Override
	public int compare(Integer o1, Integer o2) {
		return o1.compareTo(o2);
	}
	
	//Map Value값으로 내림차순 정렬
	public static List sortByValue(final Map map){
	        List<Integer> list = new ArrayList();
	        list.addAll(map.keySet());
	         
	        Collections.sort(list,new Comparator(){
	             
	            public int compare(Object o1,Object o2){
	                Object v1 = map.get(o1);
	                Object v2 = map.get(o2);
	                 
	                return ((Comparable) v1).compareTo(v2);
	            }
	             
	        });
	        Collections.reverse(list); // 주석시 오름차순
	        return list;
	    }

}
