package cn.ac.bcc.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * OnlySearch注解,用于标注model类在前天的操作,是否只是查询,在BaseController中,根据此属性,来决定是否向前端返回{model}.json
 * Created by bcc on 16/3/17.
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface OnlySearch {
    boolean value() default true;
}
