package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.Version;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface VersionMapper extends Mapper<Version> {
    List<Version> searchVersionList();
}