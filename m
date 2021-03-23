Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8903A3453D5
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 01:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhCWA11 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 20:27:27 -0400
Received: from ozlabs.org ([203.11.71.1]:41225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhCWA1K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Mar 2021 20:27:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4ByL3Mvlz9sSC;
        Tue, 23 Mar 2021 11:27:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616459226;
        bh=eFN2ccEoIxgAK/hFX9cj0zHHYca0TUOx9QjALavqtyk=;
        h=Date:From:To:Cc:Subject:From;
        b=LAvMixINFOXO4Mh5o2MJG6ftHadiKc7CDXrf8Wzv7/P7okl+ds/TFG8/Cf20HO4vZ
         ROsUx7qotLucVkXNULfKcqWGMmwWiDk4XuSqpKxFdxC14ynZgTQEcCFXFPzPd2FeyZ
         k/L3cySycllPxIEhJvfKde+j+xgDUJKDdmYJ0VT9GzUE9jVk5Qsa+e0P45LyIkYGqH
         1aMlAninRo2C2XbMk6K07FQ/eXe5Co2QJlRGKNeeqiJ9unW8YrdGx5UFEqtgxVZn+R
         hTcfmop6oKbOXyYZJ/uEWxBQwavtKnj4hI093dJ6jOJjSJi75vMmiy7UKRxUO3NR/6
         VVfjx47l1Hziw==
Date:   Tue, 23 Mar 2021 11:27:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: linux-next: manual merge of the opp tree with the v4l-dvb tree
Message-ID: <20210323112705.3094525d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I1qCCZIArNB4+41BasbJ/YD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I1qCCZIArNB4+41BasbJ/YD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the opp tree got a conflict in:

  drivers/media/platform/qcom/venus/pm_helpers.c

between commit:

  08b1cf474b7f ("media: venus: core, venc, vdec: Fix probe dependency error=
")

from the v4l-dvb tree and commit:

  857219ae4043 ("media: venus: Convert to use resource-managed OPP API")

from the opp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/media/platform/qcom/venus/pm_helpers.c
index e349d01422c5,e61317220b9a..000000000000
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@@ -750,12 -753,11 +750,11 @@@ static int venc_power_v4(struct device=20
  	return ret;
  }
 =20
 -static int vcodec_domains_get(struct device *dev)
 +static int vcodec_domains_get(struct venus_core *core)
  {
  	int ret;
- 	struct opp_table *opp_table;
  	struct device **opp_virt_dev;
 -	struct venus_core *core =3D dev_get_drvdata(dev);
 +	struct device *dev =3D core->dev;
  	const struct venus_resources *res =3D core->res;
  	struct device *pd;
  	unsigned int i;
@@@ -826,13 -825,11 +821,11 @@@ skip_pmdomains
 =20
  	if (core->opp_dl_venus)
  		device_link_del(core->opp_dl_venus);
-=20
- 	dev_pm_opp_detach_genpd(core->opp_table);
  }
 =20
 -static int core_get_v4(struct device *dev)
 +static int core_get_v4(struct venus_core *core)
  {
 -	struct venus_core *core =3D dev_get_drvdata(dev);
 +	struct device *dev =3D core->dev;
  	const struct venus_resources *res =3D core->res;
  	int ret;
 =20
@@@ -871,35 -867,24 +863,24 @@@
  		}
  	}
 =20
 -	ret =3D vcodec_domains_get(dev);
 +	ret =3D vcodec_domains_get(core);
- 	if (ret) {
- 		if (core->has_opp_table)
- 			dev_pm_opp_of_remove_table(dev);
- 		dev_pm_opp_put_clkname(core->opp_table);
+ 	if (ret)
  		return ret;
- 	}
 =20
  	return 0;
  }
 =20
 -static void core_put_v4(struct device *dev)
 +static void core_put_v4(struct venus_core *core)
  {
- 	struct device *dev =3D core->dev;
-=20
  	if (legacy_binding)
  		return;
 =20
 -	vcodec_domains_put(dev);
 +	vcodec_domains_put(core);
-=20
- 	if (core->has_opp_table)
- 		dev_pm_opp_of_remove_table(dev);
- 	dev_pm_opp_put_clkname(core->opp_table);
-=20
  }
 =20
 -static int core_power_v4(struct device *dev, int on)
 +static int core_power_v4(struct venus_core *core, int on)
  {
 -	struct venus_core *core =3D dev_get_drvdata(dev);
 +	struct device *dev =3D core->dev;
  	struct device *pmctrl =3D core->pmdomains[0];
  	int ret =3D 0;
 =20

--Sig_/I1qCCZIArNB4+41BasbJ/YD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBZNdkACgkQAVBC80lX
0GyHHQf/YHTo3fHYKpoXF+D6dkaYMBAJfV/uiOmsewn7fDOz38nw0vbxrCo+yT4I
MWpR1MmBMdUNa+cMAh26LJ8y95smgyH7LJb85ejkM4LuTW7JMtYeCrrCcvJpgiHp
R8neocYehQFH49qoNzWVTKcN4OJouMMXNQqlsuFzfOwKdN4bCY1kXiKSbFJRu4oj
uC/1bbgmoox6hvP7DP2ENpwSRKcd0qBi2C2Jz9WXGRGA3pj1Dsj5O8toIiwpw0Z+
sA3oQ/fw7UVoo7Rh8wU7NtxAy0HHHDknvZJbmvcpxXTdKzsE+OCvZxOK3s/QFXZg
cJL2LaXYhaWXda/YFnjIiqEl1Evf1w==
=oY2V
-----END PGP SIGNATURE-----

--Sig_/I1qCCZIArNB4+41BasbJ/YD--
