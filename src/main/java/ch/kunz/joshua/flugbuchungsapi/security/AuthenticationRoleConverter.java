package ch.kunz.joshua.flugbuchungsapi.security;

import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class AuthenticationRoleConverter implements Converter<Jwt, AbstractAuthenticationToken> {
    private final JwtGrantedAuthoritiesConverter defaultGrantedAuthoritiesConverter = new JwtGrantedAuthoritiesConverter();

    public AuthenticationRoleConverter() {
        defaultGrantedAuthoritiesConverter.setAuthoritiesClaimName("roles");
        defaultGrantedAuthoritiesConverter.setAuthorityPrefix("ROLE_");
    }

    @SuppressWarnings("unchecked")
    private static Collection<? extends GrantedAuthority> extractResourceRoles(final Jwt jwt) {
        Map<String, Object> resourceAccess = jwt.getClaim("resource_access");
        Collection<String> resourceRoles;
        if (resourceAccess != null) {
            Map<String, Collection<String>> flugbuchungsapi = (Map<String, Collection<String>>) resourceAccess.get("ch.kunz.joshua.flugbuchungsapi");
            if ((resourceRoles = flugbuchungsapi.get("roles")) != null) {
                return resourceRoles.stream()
                        .map(SimpleGrantedAuthority::new)
                        .collect(Collectors.toSet());
            }
        }
        return Collections.emptySet();
    }

    @SuppressWarnings("null")
    @Override
    public AbstractAuthenticationToken convert(final Jwt source) {
        Collection<GrantedAuthority> authorities = Stream.concat(defaultGrantedAuthoritiesConverter.convert(source)
                                .stream(),
                        extractResourceRoles(source).stream())
                .collect(Collectors.toSet());
        return new JwtAuthenticationToken(source, authorities);
    }
}