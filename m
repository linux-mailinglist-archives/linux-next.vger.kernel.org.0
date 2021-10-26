Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B91143AC3E
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 08:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbhJZGZW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 02:25:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60963 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhJZGZV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 02:25:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdhZh5mJDz4xbM;
        Tue, 26 Oct 2021 17:22:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635229374;
        bh=SvmuLrAtdjTncLWxPr0oWfdBGe3se7oBVEf8ePvbZjY=;
        h=Date:From:To:Cc:Subject:From;
        b=pXRekACUwp3RkBGaBMj4PrAPMiX4FzdOJDjdGhRko5l0UDaK1j3JAwLIK/AhreDJo
         Wikd4Tdr+GatmldPtqIv01cgI9l0+dN/OPPeK/165nv8GtdryPslLpqxntaGRHTpnR
         4lCwI9pfLSr6d9kzcgc6pLiZuNQa0xr0aLL3AemrRI56UdWMUhEfSqER4gOiWEVG3Q
         5pTG3I+vuZIa9dEzFJO6DsDHMT6bPT+HyYKMEhHpfcpaDthZfAifSt2ZKDFr+BDS2T
         toNX0Z6kcmI74vc9geAhACQLX7z9HLkm8UAGvhu5MGknSNZW8Mf5UgF/x8+GW2Fz93
         4/RsxAYsEwbRA==
Date:   Tue, 26 Oct 2021 17:22:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tianyu Lan <Tianyu.Lan@microsoft.com>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20211026172251.0f655709@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l7P5XwJqpsfbtmFPXdxUtNv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l7P5XwJqpsfbtmFPXdxUtNv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  arch/x86/mm/pat/set_memory.c

between commit:

  e9d1d2bb75b2 ("treewide: Replace the use of mem_encrypt_active() with cc_=
platform_has()")

from the tip tree and commit:

  cf90c4532b92 ("x86/hyperv: Add new hvcall guest address host visibility s=
upport")

from the hyperv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/mm/pat/set_memory.c
index 527957586f3c,525f682ab150..000000000000
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@@ -2024,6 -2025,17 +2026,17 @@@ static int __set_memory_enc_pgtable(uns
  	return ret;
  }
 =20
+ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool en=
c)
+ {
+ 	if (hv_is_isolation_supported())
+ 		return hv_set_mem_host_visibility(addr, numpages, !enc);
+=20
 -	if (mem_encrypt_active())
++	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+ 		return __set_memory_enc_pgtable(addr, numpages, enc);
+=20
+ 	return 0;
+ }
+=20
  int set_memory_encrypted(unsigned long addr, int numpages)
  {
  	return __set_memory_enc_dec(addr, numpages, true);

--Sig_/l7P5XwJqpsfbtmFPXdxUtNv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3nrsACgkQAVBC80lX
0GwHuAf+P9tcZbWKVWXq2vmdhRFyI+E9a5LrbnP7qTWpCZkcxV2lBDf5qTk9LyYZ
/Qzo1AxOcMHelB+eZByBaCz1FAgZO3AIaLRomKtuciAcA4v9HRTCCjzguVnEwIDz
f8D0fULGaDWIRpCCpmoXrAFffC+xYZB0UK15Mopi9vBQuDi7ULJRXq6ZnE0rvXYU
2oyl+v6VXD49PeEgPIX0S/ihqSeIcyWAgJmwzU3j1oyElLW9zfIwBf8h3TpZq2xy
XufPfRszQbqgfbquBKxV3mZ+aTTE9QvDukWtuKO5IiqJ/jhib3+c6HYgaSTLLreF
VIzs4pNT73icEaX/rNE7s0vlNU28Rg==
=0Pb2
-----END PGP SIGNATURE-----

--Sig_/l7P5XwJqpsfbtmFPXdxUtNv--
