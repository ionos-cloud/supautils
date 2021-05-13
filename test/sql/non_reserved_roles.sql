-- use a role that has the CREATEROLE privilege
set role rolecreator;
\echo

-- tests to make sure our hooks don't mess regular non-reserved roles functionality
alter role fake rename to new_fake;
alter role new_fake createrole createdb;
drop role new_fake;
create role non_reserved;
\echo

-- ensure we don't call the hook for invalid roles
drop role public;
\echo

-- since anon already exists, bypass the hook and show normal "already exists" error
create role anon;