Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF1F2DA5E4
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 03:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgLOB7X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 20:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgLOB6z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 20:58:55 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198A2C06179C;
        Mon, 14 Dec 2020 17:58:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cw1cf3nxlz9sRR;
        Tue, 15 Dec 2020 12:58:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607997491;
        bh=WTFqMmXXO/0Vfo/XBPOXoPt6icOOhuG/JmtxAhijXAo=;
        h=Date:From:To:Cc:Subject:From;
        b=cy/3OlAxSAWvIwd3QvFGtwM+qDiPKzJTxrGsIBWiMfA9ep7ClFdV23H9odWTkjwtb
         TQt0gzmZOpE9I8vLB72ipCO30Q01nfdgZydeH+rBc2A7tLyAEWvCRsMYz+/17e52nF
         fCWg5XmZSjdh+fcHtMfyAN51NX6P7Rt9164x+dsJH39DDNx4YNGirTfUjtJnmhOBHH
         cuhVQBfa7tME3OealJSOXJJmm7B0gxLDL5xuy38y/j9qwt1w6iQM/vfmpWXcB1fdta
         fE4KohV4wLf40/p8134wtAp2ba4Jshpz9fV/h7EW01TTR1izNUwGllFYV87SHdkZ+f
         879z4kBnK4QCg==
Date:   Tue, 15 Dec 2020 12:58:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Lukasz Luba <lukasz.luba@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the thermal tree
Message-ID: <20201215125806.31495950@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WrgKM2096NiRV.VN3owNqVg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WrgKM2096NiRV.VN3owNqVg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thermal tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/thermal/devfreq_cooling.c: In function 'devfreq_cooling_set_cur_sta=
te':
drivers/thermal/devfreq_cooling.c:102:9: error: 'struct device' has no memb=
er named 'em_pd'
  102 |  if (dev->em_pd) {
      |         ^~
drivers/thermal/devfreq_cooling.c:104:13: error: 'struct device' has no mem=
ber named 'em_pd'
  104 |   freq =3D dev->em_pd->table[perf_idx].frequency * 1000;
      |             ^~
drivers/thermal/devfreq_cooling.c: In function 'devfreq_cooling_get_request=
ed_power':
drivers/thermal/devfreq_cooling.c:207:23: error: 'struct device' has no mem=
ber named 'em_pd'
  207 |    dfc->res_util =3D dev->em_pd->table[state].power;
      |                       ^~
drivers/thermal/devfreq_cooling.c:217:30: error: 'struct device' has no mem=
ber named 'em_pd'
  217 |   perf_idx =3D get_perf_idx(dev->em_pd, freq / 1000);
      |                              ^~
drivers/thermal/devfreq_cooling.c:226:15: error: 'struct device' has no mem=
ber named 'em_pd'
  226 |   *power =3D dev->em_pd->table[perf_idx].power;
      |               ^~
drivers/thermal/devfreq_cooling.c: In function 'devfreq_cooling_state2power=
':
drivers/thermal/devfreq_cooling.c:252:14: error: 'struct device' has no mem=
ber named 'em_pd'
  252 |  *power =3D dev->em_pd->table[perf_idx].power;
      |              ^~
drivers/thermal/devfreq_cooling.c: In function 'devfreq_cooling_power2state=
':
drivers/thermal/devfreq_cooling.c:290:23: error: 'struct device' has no mem=
ber named 'em_pd'
  290 |   if (est_power >=3D dev->em_pd->table[i].power)
      |                       ^~
drivers/thermal/devfreq_cooling.c: In function 'of_devfreq_cooling_register=
_power':
drivers/thermal/devfreq_cooling.c:377:9: error: 'struct device' has no memb=
er named 'em_pd'
  377 |  if (dev->em_pd) {
      |         ^~
drivers/thermal/devfreq_cooling.c:385:38: error: 'struct device' has no mem=
ber named 'em_pd'
  385 |   num_opps =3D em_pd_nr_perf_states(dev->em_pd);
      |                                      ^~

Caused by commit

  615510fe13bd ("thermal: devfreq_cooling: remove old power model and use E=
M")

em_pd is only available when CONFIG_ENERGY_MODEL is set.

I have used the thermal tree from next-20201214 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/WrgKM2096NiRV.VN3owNqVg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/YGC4ACgkQAVBC80lX
0Gyvhwf/VAdWGJyY6NwcE7/kVhqfefBKnjGHoP1h+Vj1/mn+Bsj1WQTq7o5ucpd6
/5/guAZWhNuC+EeoZDHwGBeqYRtz+rvoDlClX1YUv9R8LCY9o6egqTt/G/1RpMR7
Xl7VWtuCBwbZ8D2veOYCZtGQ4Z913yqiv/o8sOLQ8/1J/OhFCziIVs8844yKaVBJ
B7nBXXek0ZTy+MBrcYj8Rf+UqWomU6KLG+wcjTcqzdMq85u6272PQfQpntR7OP0U
XIS9oPfKdc96M7i4b3PdAE31BF7pqqkt+x8HPJSy+kI6jPxc7g3OCXsomlDVvrPK
iWKS4VgLmlGOED5PqvhbJpt9jXbfGA==
=6aop
-----END PGP SIGNATURE-----

--Sig_/WrgKM2096NiRV.VN3owNqVg--
