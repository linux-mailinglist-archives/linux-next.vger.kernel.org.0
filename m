Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1276144BCF
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2020 07:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgAVGhe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jan 2020 01:37:34 -0500
Received: from ozlabs.org ([203.11.71.1]:51439 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgAVGhd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Jan 2020 01:37:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 482bLK6kSpz9sRG;
        Wed, 22 Jan 2020 17:37:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579675051;
        bh=ETg15+iGHEsGo+l6iowSowBndnR1UCVpO6tb+L7AJVk=;
        h=Date:From:To:Cc:Subject:From;
        b=GaDZf7co1bwcH2u2Su8dgDynRu8sib78OYljKmxetGA9TApSdiEiOtWxNkYFe+R+Y
         BMovZpsLcXX74hQVfb3Bj+xpJeYA+2u+Vlg39Xb+falIv7fjjIOUny9oH2FscHXkR8
         bvbyNf0X9o8hBmdg37iAZJomMRiYALpEkBaf9gOt8B0Ijo4DZr4F6Rk8YpQqRHMHly
         AuJ6KmvPiEeQhd22WSddh0aE3oPd255M2Gc3eCe/alsMNuS6lIbQmcvr0vOne+qptf
         fZe4h05XJ1s9suFVdqVQla6EacWCj/PmrdgGvDth/a7i7nZ2wiLPBl0sYpDMT3UzcO
         jWu2rgmTooIEA==
Date:   Wed, 22 Jan 2020 17:37:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Message-ID: <20200122173726.3d57753b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//hEE_DZ5W0rtXA/9gic9+Yb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//hEE_DZ5W0rtXA/9gic9+Yb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/x86/platform/efi/efi_64.c

between commit:

  1f299fad1e31 ("efi/x86: Limit EFI old memory map to SGI UV machines")

from the tip tree and patch:

  "x86: mm+efi: convert ptdump_walk_pgd_level() to take a mm_struct"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/platform/efi/efi_64.c
index e2accfe636bd,515eab388b56..000000000000
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@@ -470,10 -606,10 +470,10 @@@ void __init efi_runtime_update_mappings
  void __init efi_dump_pagetable(void)
  {
  #ifdef CONFIG_EFI_PGT_DUMP
 -	if (efi_enabled(EFI_OLD_MEMMAP))
 +	if (efi_have_uv1_memmap())
- 		ptdump_walk_pgd_level(NULL, swapper_pg_dir);
+ 		ptdump_walk_pgd_level(NULL, &init_mm);
  	else
- 		ptdump_walk_pgd_level(NULL, efi_mm.pgd);
+ 		ptdump_walk_pgd_level(NULL, &efi_mm);
  #endif
  }
 =20

--Sig_//hEE_DZ5W0rtXA/9gic9+Yb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4n7aYACgkQAVBC80lX
0GzZ5Af6Ajw8JwhTrqCuBO//bZrwnAOiy4N+T2myaGW0SKWZ2GMCJfKgF7P/75Ko
NJ2WRu5UyNyPVRESDzXNWeEwXaXutCMUamU2i8PDk8DR9VSJFTJXYtQ4Q9W+YeeJ
UagYV6E29Wgz8WkhOGlpO1yyOKrr8txMV1/qrTWGuEsRCih4uRLwTUS04wmOBIzP
Vr1VqI+16KxEhaPnJgxZVNTS1N467ACh6fDai/IOGf15A5qaGjpzjMNieUYHOiD+
Vu8QC201KYoed6xKbA+UM13WwZWg8s4MxMUAx9GUCRA+jKgf78jHn2xlCm42xz+X
OpVKpJpspXa+tZMYZRZoBqUK6DX2vA==
=Dp2j
-----END PGP SIGNATURE-----

--Sig_//hEE_DZ5W0rtXA/9gic9+Yb--
