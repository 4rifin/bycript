package com.login.bycript;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebMvcConfig extends WebSecurityConfigurerAdapter{
	 @Bean
	    public BCryptPasswordEncoder passwordEncoder() {
	        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	        return bCryptPasswordEncoder;
	    }
	 
	 @Override
		public void configure(WebSecurity web) throws Exception {
			web.ignoring().antMatchers("/resources/**");
		}

		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.authorizeRequests()
							.antMatchers("/").permitAll()
							.antMatchers("/register").permitAll()
							.antMatchers("/login/signin").permitAll()
							.antMatchers("/listUserRegister").permitAll()
							.antMatchers("/login/submit").permitAll()
							.antMatchers("/successLogin").permitAll()
							.antMatchers("/welcome").hasAnyRole("USER", "ADMIN")
							.antMatchers("/getEmployees").hasAnyRole("USER", "ADMIN")
							.antMatchers("/addNewEmployee").hasAnyRole("ADMIN").anyRequest().authenticated()
								.and().formLogin().loginPage("/login").permitAll()
							.and().logout().permitAll();

			http.csrf().disable();
		}

		@Autowired
		public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {
			authenticationMgr.inMemoryAuthentication().withUser("admin").password("admin").authorities("ROLE_USER").and()
					.withUser("javainuse").password("javainuse").authorities("ROLE_USER", "ROLE_ADMIN");
		}
}
