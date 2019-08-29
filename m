Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0BDA11A3
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 08:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfH2GUS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 02:20:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfH2GUS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 02:20:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Jssm4XpSz9s5b;
        Thu, 29 Aug 2019 16:20:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567059614;
        bh=/BfztD6d6XnpxU0f5gBZ/LrGiHY0Ca3O089JzxLB024=;
        h=Date:From:To:Cc:Subject:From;
        b=Tz08iF6Viha8JCPQNOS9k3qMfB0s7pUqNu/Gz24lfg209Oe4jTt/Ssh6tidaDsGMo
         QfEA+NAeUTz68tYp0D56z1NYgljl+m/euYPyBXlfe1upQKDfNnGS0pYK+KLYiJXsvQ
         l08kM/yrBR6Ee0JceHaUUBhH2bJZYbJzb4Wv5jfMawPb83lA9ziLQxEIZ7MZuewPuj
         Tz3Z//o7H5sZllGPJWS9yTnaPfXtobXY7KEpEu/7xBRWL/743XBjz/Qf2IAuKR+d3S
         9g2VIUxDaGPqNqMSXVNkOhl/os8cz+ijC89YyZX7WvA7lZETTa9STJSImAMfTP3xIf
         nzWVNzD0yyzxw==
Date:   Thu, 29 Aug 2019 16:20:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mac Chiang <mac.chiang@intel.com>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20190829162012.36ac9d7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gwp1ztGUMDUg9e9J7d3bXy0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Gwp1ztGUMDUg9e9J7d3bXy0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from sound/soc/intel/boards/sof_rt5682.c:23:
sound/soc/intel/boards/../common/soc-intel-quirks.h: In function 'soc_intel=
_is_cml':
sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: error: 'INTEL_FA=
M6_KABYLAKE_MOBILE' undeclared (first use in this function); did you mean '=
INTEL_FAM6_KABYLAKE_L'?
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/intel/boards/../common/soc-intel-quirks.h:18:44: note: in definit=
ion of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
sound/soc/intel/boards/../common/soc-intel-quirks.h:39:1: note: in expansio=
n of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: note: each undec=
lared identifier is reported only once for each function it appears in
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/intel/boards/../common/soc-intel-quirks.h:18:44: note: in definit=
ion of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
sound/soc/intel/boards/../common/soc-intel-quirks.h:39:1: note: in expansio=
n of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
In file included from sound/soc/intel/atom/sst/sst_acpi.c:35:
sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h: In function 'soc_=
intel_is_cml':
sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:23: error: 'INT=
EL_FAM6_KABYLAKE_MOBILE' undeclared (first use in this function); did you m=
ean 'INTEL_FAM6_KABYLAKE_L'?
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:18:44: note: in de=
finition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:1: note: in exp=
ansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:23: note: each =
undeclared identifier is reported only once for each function it appears in
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:18:44: note: in de=
finition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:1: note: in exp=
ansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~

Caused by commit

  af239c44e3f9 ("x86/intel: Aggregate big core mobile naming")

interacting with commit

  c643c189f0fe ("ASoC: Intel: boards: Add Cometlake machine driver support")

from the sound-asoc tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Aug 2019 16:08:49 +1000
Subject: [PATCH] ASoC: Intel: boards: merge fix for INTEL_FAM6_KABYLAKE_MOB=
ILE -> INTEL_FAM6_KABYLAKE_L change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/intel/common/soc-intel-quirks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/co=
mmon/soc-intel-quirks.h
index e6357d306cb8..863a477d3405 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -36,7 +36,7 @@ SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
 SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
 SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
 SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
-SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
+SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_L);
=20
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/Gwp1ztGUMDUg9e9J7d3bXy0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1nbpwACgkQAVBC80lX
0GzMYAf/QgHi6pm8ExP1P5GPMv7MjzSYdHpEODamNTp7HKxl2Z/S4SQLoMAlCPZ7
B1Y1hN8sR/MTYZSj9eytp2BaVHLKOso494np38aGwyHBPQT9CiYip6BnmJAwOnpn
BasMv0rThVszseRJwhRv0jl5pnnOu6BB7rJjxDoOmwXdtm4QndhjHOhhBSNs/Iv9
LUa3582cjMIB+wAc+snwU/0qyQ397EnhCk771bdT5KyN0vp+zHB0XLsx74NiGM1s
l5dk6YbyCZUiD5ow8vyPSnsbR1p9XH3rMnnNz9rd5Z/D4SLDXN6YG0TME2NUg7RU
xcNP4Po0UR1RMfkof4Rs+ZHafsSEKA==
=rGyW
-----END PGP SIGNATURE-----

--Sig_/Gwp1ztGUMDUg9e9J7d3bXy0--
