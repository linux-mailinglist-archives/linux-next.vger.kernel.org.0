Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0CF19373D
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 05:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgCZEF3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 00:05:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57163 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgCZEF3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 00:05:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nrxK27Brz9sRf;
        Thu, 26 Mar 2020 15:05:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585195526;
        bh=y6wc+bAg2cv8RRvpmTntAaNF+jfJE2C9OgwhDstWIzM=;
        h=Date:From:To:Cc:Subject:From;
        b=U2j9vCU/dqjvazpizlGlL3cNB/2fpPWqjxWhg+ocMefazmHXVT2TJCU3EyfreJJ7X
         +/p32uP1yzStkOOxx3LFYE6BBOYc6vvpI8iOgUw5uiLGWsK4Pv7cpU0Hjm2BJYwM56
         PRG6hYPzICS6b5L/tsy++FJiOma3c75MT8qZCyPHCANe4uKM5vVh+bDATaDcAOx00m
         bM2eU0ATdfQ5iceLd/8dcIXALovR/gYNmF9smGzR4SksN9U+y0wh2BFs+4lO9bInoY
         aJT3ISN8813x3Dp8LbtSOWEVBgARuZkUu7VOF9ZWeHTZYJHwWEm3AHLw2Np6OX6qpr
         Eyn9m9arNxrqQ==
Date:   Thu, 26 Mar 2020 15:05:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Gayatri Kammela <gayatri.kammela@intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>
Subject: linux-next: manual merge of the drivers-x86 tree with the tip tree
Message-ID: <20200326150523.02c4ec48@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/siu_20fGEtIi5bWhFcgiQ/a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/siu_20fGEtIi5bWhFcgiQ/a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/intel_pmc_core.c

between commit:

  a69b3b1d4cf0 ("platform/x86: Convert to new CPU match macros")

from the tip tree and commit:

  16292bed9c56 ("platform/x86: intel_pmc_core: Add Atom based Jasper Lake (=
JSL) platform support")

from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/x86/intel_pmc_core.c
index 3df33ff50faa,d265cd5b1f45..000000000000
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@@ -871,18 -1144,19 +1144,19 @@@ static inline void pmc_core_dbgfs_unreg
  #endif /* CONFIG_DEBUG_FS */
 =20
  static const struct x86_cpu_id intel_pmc_core_ids[] =3D {
 -	INTEL_CPU_FAM6(SKYLAKE_L, spt_reg_map),
 -	INTEL_CPU_FAM6(SKYLAKE, spt_reg_map),
 -	INTEL_CPU_FAM6(KABYLAKE_L, spt_reg_map),
 -	INTEL_CPU_FAM6(KABYLAKE, spt_reg_map),
 -	INTEL_CPU_FAM6(CANNONLAKE_L, cnp_reg_map),
 -	INTEL_CPU_FAM6(ICELAKE_L, icl_reg_map),
 -	INTEL_CPU_FAM6(ICELAKE_NNPI, icl_reg_map),
 -	INTEL_CPU_FAM6(COMETLAKE, cnp_reg_map),
 -	INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
 -	INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
 -	INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
 -	INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
 -	INTEL_CPU_FAM6(ATOM_TREMONT_L, tgl_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,		&spt_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,		&spt_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,		&spt_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,		&spt_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L,	&cnp_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L,		&icl_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_NNPI,	&icl_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE,		&cnp_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L,		&cnp_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L,		&tgl_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE,		&tgl_reg_map),
 +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT,	&tgl_reg_map),
++	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&tgl_reg_map),
  	{}
  };
 =20

--Sig_/siu_20fGEtIi5bWhFcgiQ/a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl58KgMACgkQAVBC80lX
0Gw1TAgAmQ9ahkh4EuK3YQBH9Rtz/xdNsXRZ0OO7DtrjYtr1xxTeBuJu5y52y0KR
mw3WKu1hCmD0bVmhqBZyib0HRxaFtPlHj9sTnJ/XGG/JufVIRPxolJY8bGlnamdP
Yc0aA1x454YUmJ6GrC5kc1rqQDbAgxiES+eTbTF/dJrM6dVgmLR7v3GkGTL9uWmA
vP6niD0BWAAHtXJZ9aQDOuirf9zxG8LZB/9/qU8Fk5gF1eFdXvYJu+FvqH3MOJSi
9jC/uw4LrIx6MRTo88bFwSmkt8vwz+b9DBxLsyVfCKung5ouCquzym82Mo8d1DBU
qOderz/La/5aJ6yv74cZIXfQ89nozw==
=4db6
-----END PGP SIGNATURE-----

--Sig_/siu_20fGEtIi5bWhFcgiQ/a--
