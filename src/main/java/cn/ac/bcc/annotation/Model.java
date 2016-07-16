package cn.ac.bcc.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface Model {
	/**
	 */
	String name() default "";
	boolean readable() default true;/*用于标记字段是否能够被前端读写*/
	boolean isChinese() default false;
}