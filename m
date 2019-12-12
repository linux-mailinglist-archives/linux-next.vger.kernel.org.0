Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 740A011D925
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 23:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbfLLWOj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 17:14:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730811AbfLLWOj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Dec 2019 17:14:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Yp4X28w5z9sPK;
        Fri, 13 Dec 2019 09:14:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576188876;
        bh=oJQ08U/7bYVXNdhkHOx85ql8cWPI1wmoBe8IwzyQ8h0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f1vPw1vD3KWa5m9JwCRamDU+mfX4LqVxU4bh0JNEPpXgLo9fkcUaNCi3EEX0egniy
         +bb7DXotw2dei+C05UemoBLF9KSCWZjtr6VHPuCkH0VWgNU1FRgltEBSE7JE3n089r
         dr5F1gWviFcqtOumGdJvcKlUPY81sHo5FpaTwVRcDP2lGeg3U1mGWBP3p+0OSSJY1j
         pUuX8TIUAu+DH9uR1I9sTxlid24fBh0jCimMuiSBVhhbpDyRfhVXo61EAPNgzd1t4/
         DM04dt+jBTQ/QzwCDGVZFiCXB4X7XSZPCa904xNOeAt4SyvHKxQ89jcnDaQlU5RZqJ
         Na6XbPwoTl2hA==
Date:   Fri, 13 Dec 2019 09:14:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: linux-next: build failure after merge of the thermal tree
Message-ID: <20191213091430.383a5f3b@canb.auug.org.au>
In-Reply-To: <20191212095020.523c1fbd@canb.auug.org.au>
References: <20191212095020.523c1fbd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L.T6HuqrbOX.PmleIKwVIb0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L.T6HuqrbOX.PmleIKwVIb0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 12 Dec 2019 09:50:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the thermal tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/thermal/qoriq_thermal.c: In function 'qoriq_tmu_probe':
> drivers/thermal/qoriq_thermal.c:247:20: error: 'SZ_4K' undeclared (first =
use in this function)
>   247 |   .max_register  =3D SZ_4K,
>       |                    ^~~~~
>=20
> Caused by commit
>=20
>   c98030e5440d ("thermal: qoriq: Convert driver to use regmap API")
>=20
> I have used the thermal tree from next-20191211 for today.

Today, I applied the following patch instead:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Dec 2019 09:08:24 +1100
Subject: [PATCH] thermal: qoriq: using SZ_4K requires linux/sizes.h

Fixes: c98030e5440d ("thermal: qoriq: Convert driver to use regmap API")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thermal/qoriq_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_therma=
l.c
index b75d34e07da5..874bc46e6c73 100644
--- a/drivers/thermal/qoriq_thermal.c
+++ b/drivers/thermal/qoriq_thermal.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/regmap.h>
+#include <linux/sizes.h>
 #include <linux/thermal.h>
=20
 #include "thermal_core.h"
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/L.T6HuqrbOX.PmleIKwVIb0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3yu8YACgkQAVBC80lX
0Gye6wf8CukYWNyzKJUoeCHAMaIeP7aguSenU/SnB1HFYGMiYUa9HsQQEAPj74KL
0kaRQI2IWXn1TqvmTFJ5qSyPM2p7VUZV6z7XxAM83UaQEneqjOxoQYW2C+/oAMq5
fDaw2LG0YeaAsjU3G6nsrfhFzmTYgcnFZyu0EdUwaLza5dy68ZtWpvs5vvwC41RJ
czwunCSZu5rXGAL4Yf4MzV/yY0DmAS15UFGVKgGStfet/nC5R6DsUD6RITv38zkE
RXgJhiZGMsZw430iQj2f8qJkrUIriaEYigtZgksy0XmoLyxBoJ8UX3CqSZu4aQrI
gR57gBZ9FNd3zQlm+DDs4RZGEXXMkw==
=qV7X
-----END PGP SIGNATURE-----

--Sig_/L.T6HuqrbOX.PmleIKwVIb0--
