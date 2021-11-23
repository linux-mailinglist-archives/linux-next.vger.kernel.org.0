Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB9745A059
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 11:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbhKWKkI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 05:40:08 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:35560 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbhKWKkE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 05:40:04 -0500
Received: by mail-lf1-f48.google.com with SMTP id u3so89789087lfl.2;
        Tue, 23 Nov 2021 02:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=PtV7woM/3PlgR3MAPg22PBAiKUG+MlxdtiGdeKZpdNU=;
        b=KouZOs3PFkRpfnGs5RYANnbiTDsBdNUFOz19WGuHRCY6jA/aYwN6TkgMbDdKfddHg6
         c1i56smzv8/qk4AG8EhICgbQdvAx6lRgGRQ5Zn+a/p0TI3fYXgO++RLQ/j5SHwBP7tPm
         xE4glRFqPwqWVWwBlbLZGL8GXS5gAyA0GWF37cYZaSnrhmES5rAp8Z8CROv3s2R5BmFj
         yDqfnJMw47N8h78ucWVU5UkPEyC9QoLkTxg+NEAurE8+6XvCxtqQQvR/8eH9LWwPAA7R
         GtsqX2OCTgfbefAhE/KwrU3S+4h40dOXtjtyfm5v3Ay1oVLXvbMLTk7NLm9JQy5p5eyX
         FGZA==
X-Gm-Message-State: AOAM531oJ/Nn5259w2yRQmqKTk3+4WpeVv5BWDrW+f5KwQ3hfWeQnLOi
        pz2gn8Ln+rXCJwkkGe9tUpmdYA1/KvI=
X-Google-Smtp-Source: ABdhPJwtvsA3hJoIzbF+mzVvaqrjR+ZDbvMgq1gQxzvnUeU+sWH+rm4ZNrw9pCxzPVIyUkrGFmI0xQ==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr3820955lfh.382.1637663815461;
        Tue, 23 Nov 2021 02:36:55 -0800 (PST)
Received: from fedora (dc73szyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16ee:fa00::4])
        by smtp.gmail.com with ESMTPSA id w14sm1232474ljj.7.2021.11.23.02.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 02:36:54 -0800 (PST)
Date:   Tue, 23 Nov 2021 12:36:47 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        heiko.carstens@de.ibm.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] regulator: rohm-generic: iniline stub function
Message-ID: <YZzEP3S7U15bTDAI@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RsmKJOU+Xd1An4KD"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--RsmKJOU+Xd1An4KD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The function rohm_regulator_set_voltage_sel_restricted() has a stub
implementation. Linux-next testing spot following:

include/linux/mfd/rohm-generic.h:93:12: error:
'rohm_regulator_set_voltage_sel_restricted' defined but not used

Fix this by inlining the stub.

Fixes: 8b6e88555971 ("regulator: rohm-regulator: add helper for restricted =
voltage setting")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---
I broke the build - sorry for that. This should probably go to Mark's
tree even if it actually changes the headers under MFD :( Sorry for the
trouble!

I think it might be even better to remove whole dummy fuction - but at
this point when the build is already broken - it's safer to just inline
and consider removing when there's the luxury of having the time to test
it.

 include/linux/mfd/rohm-generic.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-gene=
ric.h
index 35c5866f48b7..080d60adcd5f 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -90,7 +90,8 @@ static inline int rohm_regulator_set_dvs_levels(const str=
uct rohm_dvs_config *dv
 {
 	return 0;
 }
-static int rohm_regulator_set_voltage_sel_restricted(struct regulator_dev =
*rdev,
+
+static inline int rohm_regulator_set_voltage_sel_restricted(struct regulat=
or_dev *rdev,
 						     unsigned int sel)
 {
 	return 0;
--=20
2.31.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--RsmKJOU+Xd1An4KD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmGcxDIACgkQeFA3/03a
ocXmLAf9Fhyz4medXAS9DKUlPWOBh52/vRAEYGyETudn5XUN2NS2r53Ko77PXPjC
uARLDxXUECv+opXXKBOeMTEw5VXBu6a9lqsCE2U43+aLQbcY4cX96AWeFjXjS3mE
IdngtRB+Hbz7IFs0vKISrqcKpwvMShCjnrB0qYecWV/zX13x3uqqMen7wc14AZ8c
nZybLL9Ob1+AVP9aDoPLP1VU8rjTW/yWWG5P5ZyD7QQFxAxh/f5eNdpzUaO3wA79
VtAMveFFCmnRGTQgIXi2X9yUX0zFcMJKzxaUybDVLf365hCkAqn4wzUt8/iV3zWs
I7vf3tR4GyEeYc5Q/xpYgOP0uy6NBQ==
=73Vh
-----END PGP SIGNATURE-----

--RsmKJOU+Xd1An4KD--
