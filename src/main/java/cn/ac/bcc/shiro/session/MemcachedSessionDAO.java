package cn.ac.bcc.shiro.session;

/**
 * Created by Lisy on 2016-07-31.
 */
import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;

import cn.ac.bcc.shiro.cache.ShiroMemcache;
import net.spy.memcached.MemcachedClient;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MemcachedSessionDAO extends AbstractSessionDAO {
    private final static Logger log = LoggerFactory.getLogger(MemcachedSessionDAO.class);

    private MemcachedClient client;

    public MemcachedSessionDAO(ShiroMemcache shiroMemcache) {
        this.client = shiroMemcache.getMemcachedClient();
    }

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = generateSessionId(session);
        assignSessionId(session, sessionId);
        try {
            client.set(sessionId.toString(), (int) session.getTimeout() / 1000, session);
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        Session session = null;
        try {
            session = (Session)client.get(sessionId.toString());
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        return session;
    }


    public void delete(Session session) {
        try {
            client.delete(session.getId().toString());
        } catch (Exception e) {
            log.error(e.getMessage());
        }
    }


    public Collection<Session> getActiveSessions() {
        return Collections.emptySet();
    }

    public void update(Session session) throws UnknownSessionException {
        try {
            client.replace(session.getId().toString(), (int) session.getTimeout() / 1000, session);
        } catch (Exception e) {
            log.error(e.getMessage());
        }
    }
}
