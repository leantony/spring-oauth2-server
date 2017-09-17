package com.authentication.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class JdbcUserDetailsService implements UserDetailsService {

    private final UsersRepository usersRepository;

    @Autowired
    public JdbcUserDetailsService(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users user = usersRepository.findByName(username);
        if(user == null) {
            throw new UsernameNotFoundException("User " + username + " not found in database.");
        }
        return new User(user.getName(), user.getPassword(), user.isEnabled(), true, true, true, user.getAuthorities());
    }
}
