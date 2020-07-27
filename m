Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152F422E3AB
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 03:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgG0BhR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Jul 2020 21:37:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34143 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbgG0BhQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Jul 2020 21:37:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFMqY3Rj5z9sR4;
        Mon, 27 Jul 2020 11:37:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595813834;
        bh=2HGtDVl81XeUzs5FBuvoiwwRr5u4U87gWF3ezxpGHTg=;
        h=Date:From:To:Cc:Subject:From;
        b=sAmQ1iGjsn+xToQh6JKce7ccgrevN7ChSvO9aqDe9KBwwKD7Qn8udQRK6p958n7GT
         bPrvIdkzgByweTkOHeSgHp50mrep7OupqWH1qCZYyY+1WyvJZQKojRlmQ6yoXkV0r4
         m2DrS68gBwkhMeqi/dFIJPlYU5lWkyPKwse74gve5rkBVIwD/R6rdLSo1q1B3D4+54
         Cib6zyofZ3yyzIGws+WYmTfHCwGr9ORgbKNrTnXdtmpt5H7PFriGfU2m7BMNrpZMU6
         HTosB/EhUN2+AhaVzOFRUYrsBquqyhgKRXhiJKCDSZ6FSamMBoQUdHE8L7b3LCSZX+
         pDOgElx1lVDCg==
Date:   Mon, 27 Jul 2020 11:37:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kevin Buettner <kevinb@redhat.com>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Message-ID: <20200727113712.55fdf621@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IJ9_NogjI858KS7k_Kv5q/2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IJ9_NogjI858KS7k_Kv5q/2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/x86/kernel/fpu/xstate.c

between commit:

  5714ee50bb43 ("copy_xstate_to_kernel: Fix typo which caused GDB regressio=
n")

from Linus' tree and commit:

  c196049cc732 ("x86: switch to ->regset_get()")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/fpu/xstate.c
index ad3a2b37927d,c80d4734c1f6..000000000000
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@@ -1065,17 -1048,16 +1048,16 @@@ void copy_xstate_to_kernel(struct membu
  	header.xfeatures &=3D xfeatures_mask_user();
 =20
  	if (header.xfeatures & XFEATURE_MASK_FP)
- 		copy_part(0, off_mxcsr,
- 			  &xsave->i387, &kbuf, &offset_start, &count);
+ 		copy_part(&to, &last, 0, off_mxcsr, &xsave->i387);
  	if (header.xfeatures & (XFEATURE_MASK_SSE | XFEATURE_MASK_YMM))
- 		copy_part(off_mxcsr, MXCSR_AND_FLAGS_SIZE,
- 			  &xsave->i387.mxcsr, &kbuf, &offset_start, &count);
+ 		copy_part(&to, &last, off_mxcsr,
+ 			  MXCSR_AND_FLAGS_SIZE, &xsave->i387.mxcsr);
  	if (header.xfeatures & XFEATURE_MASK_FP)
- 		copy_part(offsetof(struct fxregs_state, st_space), 128,
- 			  &xsave->i387.st_space, &kbuf, &offset_start, &count);
+ 		copy_part(&to, &last, offsetof(struct fxregs_state, st_space),
+ 			  128, &xsave->i387.st_space);
  	if (header.xfeatures & XFEATURE_MASK_SSE)
- 		copy_part(xstate_offsets[XFEATURE_SSE], 256,
- 			  &xsave->i387.xmm_space, &kbuf, &offset_start, &count);
 -		copy_part(&to, &last, xstate_offsets[XFEATURE_MASK_SSE],
++		copy_part(&to, &last, xstate_offsets[XFEATURE_SSE],
+ 			  256, &xsave->i387.xmm_space);
  	/*
  	 * Fill xsave->i387.sw_reserved value for ptrace frame:
  	 */

--Sig_/IJ9_NogjI858KS7k_Kv5q/2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eL8gACgkQAVBC80lX
0GwBEAf+JffQp4JD4YPsjr46UoC0cqDlEn5dR6QETMapiZXmbSXYSsAbi09kJh50
YWsZyLUmVQMBmW9fnyiBevmzqSrEI9tjbHEuQS/UlMnR7u5e91EqsIQ+xjWwsxep
K3//JSZM1AbtpXMjsKcv/EKUaumBZoRY9UQ6C29z4R9eGPes5vcIyDJ1inAWpV7k
4MRKafCHMeMDyYTcbrsx/Mf5VyR8wMeR3tlNVApUu905oPb7lEA+Y0+VjUPiu2Id
T2/HfPRVLQj/BYqy5WDT3qDmW5+VOD+S94MSuwFbRACxxLC7lbC1bnWQ6sbkIJ+r
8Vl0tfweBj/R14srJ6K9E0fnxlOJbg==
=XxDx
-----END PGP SIGNATURE-----

--Sig_/IJ9_NogjI858KS7k_Kv5q/2--
