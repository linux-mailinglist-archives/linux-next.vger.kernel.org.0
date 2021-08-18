Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CEA3EFD31
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 08:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238670AbhHRGzR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 02:55:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51941 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238550AbhHRGzR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Aug 2021 02:55:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GqJYD58c5z9sWq;
        Wed, 18 Aug 2021 16:54:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629269681;
        bh=NdpQ1QgcG3XFmHwu+XqGFcezPo+vVaHwzqtc9iFCO9A=;
        h=Date:From:To:Cc:Subject:From;
        b=LKRUOXQEzCOSxzF3CzKBHeIr90kqer3T32OcPcdCQTjtOEFifp/U1sR8aKLRvTDFp
         TBPy5yn0iiSy0yThxXz+OIdXgvpSSurwhP3+NMy3wxk9KvIY/nmTAoCOukMF03NoTQ
         PpCoYp/5k4yNrST86JeO1wFlXUYfzMXaS3WCosTJZisWS9WmYa0G0X+OeK9IzCAkdE
         bUE5I1HdZF9YCoQFNp6XeNgjG25Y64yCefT6ihzTP9Y6BupIvSlma9KY3F4+qq7+G+
         JQ62N1onAgG6UGAl7ahqCsH1yI1h0rAuGjtV1qjnXlVoeoX2ipEBGoWrOxn8pNjtvq
         dZkpCRuONP5Ew==
Date:   Wed, 18 Aug 2021 16:54:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the i2c tree
Message-ID: <20210818165439.1fc613e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PC3AjA2OuTtCAwgdU1VCbcZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PC3AjA2OuTtCAwgdU1VCbcZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/units.h

between commit:

  26471d4a6cf8 ("units: Add SI metric prefix definitions")

from the i2c tree and commits:

  d874da9a830f ("units: change from 'L' to 'UL'")
  390618bdc78a ("units: add the HZ macros")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/units.h
index 4a25e0cc8fb3,8b8dc8a84d93..000000000000
--- a/include/linux/units.h
+++ b/include/linux/units.h
@@@ -4,25 -4,13 +4,29 @@@
 =20
  #include <linux/math.h>
 =20
 +/* Metric prefixes in accordance with Syst=C3=A8me international (d'unit=
=C3=A9s) */
 +#define PETA	1000000000000000ULL
 +#define TERA	1000000000000ULL
 +#define GIGA	1000000000UL
 +#define MEGA	1000000UL
 +#define KILO	1000UL
 +#define HECTO	100UL
 +#define DECA	10UL
 +#define DECI	10UL
 +#define CENTI	100UL
 +#define MILLI	1000UL
 +#define MICRO	1000000UL
 +#define NANO	1000000000UL
 +#define PICO	1000000000000ULL
 +#define FEMTO	1000000000000000ULL
 +
- #define MILLIWATT_PER_WATT	1000L
- #define MICROWATT_PER_MILLIWATT	1000L
- #define MICROWATT_PER_WATT	1000000L
+ #define HZ_PER_KHZ		1000UL
+ #define KHZ_PER_MHZ		1000UL
+ #define HZ_PER_MHZ		1000000UL
+=20
+ #define MILLIWATT_PER_WATT	1000UL
+ #define MICROWATT_PER_MILLIWATT	1000UL
+ #define MICROWATT_PER_WATT	1000000UL
 =20
  #define ABSOLUTE_ZERO_MILLICELSIUS -273150
 =20

--Sig_/PC3AjA2OuTtCAwgdU1VCbcZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEcrq8ACgkQAVBC80lX
0GxSgwf+LSL3s6LX8tUT47WXc7//WZOQRH5UBwvesgG7VGfGiqSlQ55M0rT8T9zK
Y5pGnLgUcKXvKRVkRBXx652yr/igW5FVWIojg++MtcDE6thNkkgo1AZCv4/A7Laa
VnID+EYkxkGnGKZxggSiBJfNFiBlQDX6m2FMhJKHqlxxBISOUUAQlfb4zpi3F358
4mcTvlQryb3TBypytzWuGpVsecaOXFGihdaY7mFLSuOz5rrspuTMwcU9ByQiB5ku
cVfl2URPixlm5Q33623eVPV2/v5AGMN5KQ4JB6NTT2dHZxyKjvx1uZkv4wfv6J2d
RpBgtgQporUUzLTjhp/rbPCrMRu+1A==
=JqZf
-----END PGP SIGNATURE-----

--Sig_/PC3AjA2OuTtCAwgdU1VCbcZ--
