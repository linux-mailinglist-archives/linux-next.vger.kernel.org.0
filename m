Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41970286B65
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 01:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgJGXNy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Oct 2020 19:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbgJGXNy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2020 19:13:54 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9498C061755;
        Wed,  7 Oct 2020 16:13:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C69BK1MKFz9sPB;
        Thu,  8 Oct 2020 10:13:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602112430;
        bh=0OI28V4KZp/CukgLxY2AM4+3y1zdBrEAWDeh7lQGtKY=;
        h=Date:From:To:Cc:Subject:From;
        b=HrjSN2r2BRCCajCfR1xFtwDpFTrDuafK4YXOBkMM3x1t4/jvNxvxjZvkhLKb7N934
         fBksPpnjwI2UOhAt2894qsB6IPa1QmeQLuisQou0BIex/GQs6LLX3TqgQU5p8wxhQq
         OIDb0M7Q/TV3rdo60p3aGC8/Mp0KVHSZ0OD/NkpN4Myh2/JmAxaoiQOBpr+eQMwSnn
         N3yfSw365XBFVqOVa+t64ZhRYoR2uGWFZ/KgXbRbW4FlA4xbtfFH8FJEV8meeKRYFj
         Ig5PwCk8D9dgGKRZQpjFuKU6SNURh3YUiba1F4l1CIKkJSZY58lWzLqx1iSNAiQFz7
         ASNMKIcq6wo7g==
Date:   Thu, 8 Oct 2020 10:13:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        Guo Ren <guoren@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the risc-v tree with the risc-v-fixes
 tree
Message-ID: <20201008101341.12ce7ab7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nBidG_b=.T0gle+JS2TAJDM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nBidG_b=.T0gle+JS2TAJDM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/kernel/vmlinux.lds.S

between commit:

  84814460eef9 ("riscv: Fixup bootup failure with HARDENED_USERCOPY")

from the risc-v-fixes tree and commit:

  cb7d2dd5612a ("RISC-V: Add PE/COFF header for EFI stub")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/kernel/vmlinux.lds.S
index 34d00d9e6eac,9795359cb9da..000000000000
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@@ -66,8 -71,11 +70,13 @@@ SECTION
  		_etext =3D .;
  	}
 =20
+ #ifdef CONFIG_EFI
+ 	. =3D ALIGN(PECOFF_SECTION_ALIGNMENT);
+ 	__pecoff_text_end =3D .;
+ #endif
+=20
 +	INIT_DATA_SECTION(16)
 +
  	/* Start of data section */
  	_sdata =3D .;
  	RO_DATA(SECTION_ALIGN)

--Sig_/nBidG_b=.T0gle+JS2TAJDM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+S6UACgkQAVBC80lX
0GxMtgf/Uq1PGeDqzPSObxD/jeJw88vtjYFL+I/Rkvu/O3Ui5cPfKutgTzo4m+si
+QTioSBmvrsCZC9LNS1ZSzqRME70zpEX1QI9mPNGSmOe3OXkK/wUbdME0VaFhVEX
breuJivi9l6k7wvMBCOeILdXu5eyBuUrKrGNzfQvT2oYtHIzlylaVQgzyXO70CSf
nUHwpow+GpDwi39xf9FNwsNpTVb2mQsqyu0M7MxHooAfkRoN2W+B7l/gcqzF9hYP
yZuU/eLZNt66wy+hMjfX1Q7d1s1xBGk+tFEC6EGHKuYb3QhUN8+UseWuiiOMLNX7
zebSatfOnvRDUvEu0mOGnTMC/gq62A==
=oOMM
-----END PGP SIGNATURE-----

--Sig_/nBidG_b=.T0gle+JS2TAJDM--
