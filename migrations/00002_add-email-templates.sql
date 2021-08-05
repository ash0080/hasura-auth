CREATE TABLE auth.email_templates (
  id text NOT NULL,
  title text NOT NULL,
  html text NOT NULL,
  no_html text NOT NULL,
  locale varchar(2) NOT NULL,
  PRIMARY KEY (id, locale)
);

INSERT INTO auth.email_templates (locale, id, title, html, no_html)
  VALUES ('en', 'verify-email', 'Verify your email address', E'<!DOCTYPE html>\n<html>\n  <head>\n    <meta charset="utf-8" />\n    <style>\n      body {\n        margin: 0;\n        font-family: sans-serif;\n      }\n\n      button {\n        color: white;\n        margin: 0.5em 1em;\n        border-radius: 3px;\n        padding: 0.25em 1em;\n        background: palevioletred;\n        border: 2px solid palevioletred;\n      }\n    </style>\n  </head>\n\n  <body>\n    <h2>Hello <%= displayName %></h2>\n    <p>Please confirm your email address by clicking the button below:</p>\n    <a href="<%= url %>/auth/verify?ticket=<%= ticket %>">\n      <button>Verify email address</button></a\n    >\n    <p>Thanks,<br />The Team</p>\n  </body>\n</html>\n', ''), ('en', 'email-reset', 'Change your email address', E'<!DOCTYPE html>\n<html>\n  <head>\n    <meta charset="utf-8" />\n    <style>\n      body {\n        margin: 0;\n        font-family: sans-serif;\n      }\n    </style>\n  </head>\n\n  <body>\n    <h2>Hello.</h2>\n    <p>Someone requested to change the email for your account.</p>\n    <p>If this was not you, please disregard this message.</p>\n    <hr />\n    <p>Proceed the email change by using the following code:</p>\n    <p><%= ticket %></p>\n    <p>Thanks,<br />The Team</p>\n  </body>\n</html>\n', ''), ('en', 'password-reset', 'Reset your password', E'<!DOCTYPE html>\n<html>\n  <head>\n    <meta charset="utf-8" />\n    <style>\n      body {\n        margin: 0;\n        font-family: sans-serif;\n      }\n    </style>\n  </head>\n\n  <body>\n    <h2>Hello.</h2>\n    <p>Someone requested to reset the password for your account.</p>\n    <p>If this was not you, please disregard this message.</p>\n    <hr />\n    <p>Proceed the password reset by using the following code:</p>\n    <p><%= ticket %></p>\n    <p>Thanks,<br />The Team</p>\n  </body>\n</html>\n', ''), ('en', 'magic-link', 'Secure Sign In link', E'<!DOCTYPE html><html><head>  <meta charset="utf-8" />  <style>    body {      margin: 0;      font-family: sans-serif;    }    button {      color: white;      margin: 0.5em 1em;      border-radius: 3px;      padding: 0.25em 1em;      background: palevioletred;      border: 2px solid palevioletred;    }  </style></head><body>  <h2>Hello <%= email %>  </h2>  <p>Use this link to securely sign in:</p>  <a href="<%= url %>/action/magic-link?otp=<%= otp %>&otpMethod=magic-link">    <button>      Sign In    </button>  </a>  <p>    You can also copy & paste this URL into your browser:    <%= url %>/action/magic-link?otp=<%= otp %>&otpMethod=magic-link>  </p>  <p>Thanks,<br />The Team</p></body></html>', ''), ('en', 'notify-email-change', 'The email attached to your account has been changed', E'<!DOCTYPE html>\n<html>\n  <head>\n    <meta charset="utf-8" />\n    <style>\n      body {\n        margin: 0;\n        font-family: sans-serif;\n      }\n    </style>\n  </head>\n\n  <body>\n    <h2>Hello.</h2>\n    <p>The email attached to your account has been changed.</p>\n    <p>If you did not ask for this, please contact our services.</p>\n    <hr />\n    <p>Thanks,<br />The Team</p>\n  </body>\n</html>\n', '')
ON CONFLICT
  DO NOTHING;
