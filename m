Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 941D2127200
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 01:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfLTAEZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 19:04:25 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfLTAEZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 19:04:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47f89y26csz9sRD;
        Fri, 20 Dec 2019 11:04:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576800262;
        bh=takvx2pkdv2X2YMc6lDzRwLeDoZ5lLrcA66pNFNMat0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MtYPDg1Z5sa9MSw4ciMURVAMM3IxFd55715Aa+tcVq/5+lRQIkM6WVyQeP6IQRjPL
         6JJ9Xq8E+oB/R9zGKQsQDKHeD7MDoU5+M6zOkrEoXXnRENDP5i6p2wFhJfrGjrtWnH
         +lYKye4ZwkXlq29izx3yG82tcnShSX02goXgnLonG0eOgeg4tYwhk9ny4notH53SoM
         +/qT3Rfk2HCgmaEyNKdo26LNgWrHtAX0b/io6I4V00Ivs1Zq0bW1iAGbLLtOXCvM1t
         7X+CkfgR0ltpiOtQhXNqEKjpVolM3dpnzEWxSoSGyZ2LcVAcpRDyOQdKeu4rFyxv0s
         aiXH0e5sRreqw==
Date:   Fri, 20 Dec 2019 11:04:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: linux-next: build failure after merge of the thermal tree
Message-ID: <20191220110421.2c155cbf@canb.auug.org.au>
In-Reply-To: <e792e206-6ed8-733c-bbba-55f5a0b52407@linaro.org>
References: <20191212095020.523c1fbd@canb.auug.org.au>
        <20191213091430.383a5f3b@canb.auug.org.au>
        <e792e206-6ed8-733c-bbba-55f5a0b52407@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0z+cx..yAbAPU7qtaaW/vUo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0z+cx..yAbAPU7qtaaW/vUo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 13 Dec 2019 02:03:05 +0100 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> On 12/12/2019 23:14, Stephen Rothwell wrote:
> >=20
> > On Thu, 12 Dec 2019 09:50:20 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> After merging the thermal tree, today's linux-next build (x86_64
> >> allmodconfig) failed like this:
> >>
> >> drivers/thermal/qoriq_thermal.c: In function 'qoriq_tmu_probe':
> >> drivers/thermal/qoriq_thermal.c:247:20: error: 'SZ_4K' undeclared (fir=
st use in this function)
> >>   247 |   .max_register  =3D SZ_4K,
> >>       |                    ^~~~~
> >>
> >> Caused by commit
> >>
> >>   c98030e5440d ("thermal: qoriq: Convert driver to use regmap API")
> >>
> >> I have used the thermal tree from next-20191211 for today. =20
> >=20
> > Today, I applied the following patch instead: =20
>=20
> Thanks for the fix, I'll fold it with the commit c98030e5440d in order
> to recover the bisectability.
>=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 13 Dec 2019 09:08:24 +1100
> > Subject: [PATCH] thermal: qoriq: using SZ_4K requires linux/sizes.h
> >=20
> > Fixes: c98030e5440d ("thermal: qoriq: Convert driver to use regmap API")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/thermal/qoriq_thermal.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_th=
ermal.c
> > index b75d34e07da5..874bc46e6c73 100644
> > --- a/drivers/thermal/qoriq_thermal.c
> > +++ b/drivers/thermal/qoriq_thermal.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/regmap.h>
> > +#include <linux/sizes.h>
> >  #include <linux/thermal.h>
> > =20
> >  #include "thermal_core.h"

I am still applying this patch ...
--=20
Cheers,
Stephen Rothwell

--Sig_/0z+cx..yAbAPU7qtaaW/vUo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl38EAUACgkQAVBC80lX
0GwYXgf5AckAVZs318/xnkkzefekekoTzk78w4cQRIVXRnXzSuA/VRyVVb+qT+uD
uM+JoN5VivWzJe6RslL0Y7WmgDVYUd+GE3/jhDAGwBNjWNal6RQ6YkTnguJkoNVE
ZtMNDLlgeSCGLKoTkELzw3aCDf7w/yoEJLGgGHmkrh4gbjL2xm9GffDfu0kJTN8C
xndErFBRk+ESN5gP5tp5IwU9Iv71l0xZ9bQCDW7tO1p0GDk8WqEHvGJUFqevtU0Z
zfCr5im/8mZCEvepR/0K0atinteiI+LQ4QNRoWEL//ZjV8f2QsMALiiHGf9g7NBk
8DuS7L0b0SwX3kdPN8lhBbWJa6GJAQ==
=UPAi
-----END PGP SIGNATURE-----

--Sig_/0z+cx..yAbAPU7qtaaW/vUo--
