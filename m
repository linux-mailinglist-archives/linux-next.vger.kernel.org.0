Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8C8263ACE
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 04:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbgIJCAw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 22:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730145AbgIJByT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 21:54:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CE5C0617B9;
        Wed,  9 Sep 2020 16:34:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmyzL0s2vz9sTW;
        Thu, 10 Sep 2020 09:34:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599694478;
        bh=/iimjDFu3pasKYMJQEQ/kTu+FsUVpzwxhLgrWCaorIo=;
        h=Date:From:To:Cc:Subject:From;
        b=lUM96aD3mSfmgJ1r0i3Jb33pimBT2LGB28cKZ+jKojcm66LDK3VwpIBbV5zPDwkeX
         bFEpjJFiQUy44dJC9AGTT7ovCCy9LomHf/hQ+MaJTsOzy79MuMB/h2keGLvFRa34P8
         1eujQ42LCu5aYSEOJul4ylM7Jyz9y1bnfplUAynD2WQSbvmGx2UUM1QTOFMlJhFjgq
         Vs58Zp+HBpIcwpMkIYCXVQvSARBBW62lL+Z2XFxwCFpdu/lMkcsDLvAr4CjIHH/qlP
         cmzrpqjSvdJhgxWYBexRRYtIQDIGekGh5NdvNZ1qzD+b5d6XvmPmauJEgYHau6pc7o
         EzFsO9ls7WREw==
Date:   Thu, 10 Sep 2020 09:34:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg Ungerer <gerg@snapgear.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the m68knommu tree with the m68k tree
Message-ID: <20200910093437.4098988b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5OzjCGux=otNrvMezQoDw/3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5OzjCGux=otNrvMezQoDw/3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the m68knommu tree got a conflict in:

  arch/m68k/Kconfig

between commit:

  dc072012bc94 ("m68k: Sort selects in main Kconfig")

from the m68k tree and commit:

  ef03e4545eac ("m68knommu: switch to using asm-generic/uaccess.h")

from the m68knommu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/m68k/Kconfig
index 93bbb74ea876,aefffebc0afa..000000000000
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@@ -6,32 -6,33 +6,33 @@@ config M68
  	select ARCH_HAS_BINFMT_FLAT
  	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
 +	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
  	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
  	select ARCH_NO_PREEMPT if !COLDFIRE
 +	select ARCH_WANT_IPC_PARSE_VERSION
  	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
  	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
 -	select HAVE_IDE
 -	select HAVE_AOUT if MMU
 -	select HAVE_ASM_MODVERSIONS
 -	select HAVE_DEBUG_BUGVERBOSE
 -	select GENERIC_IRQ_SHOW
  	select GENERIC_ATOMIC64
 -	select NO_DMA if !MMU && !COLDFIRE
 -	select HAVE_UID16
 -	select VIRT_TO_BUS
 -	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
  	select GENERIC_CPU_DEVICES
  	select GENERIC_IOMAP
 +	select GENERIC_IRQ_SHOW
  	select GENERIC_STRNCPY_FROM_USER if MMU
  	select GENERIC_STRNLEN_USER if MMU
 -	select UACCESS_MEMCPY if !MMU
 -	select ARCH_WANT_IPC_PARSE_VERSION
 +	select HAVE_AOUT if MMU
 +	select HAVE_ASM_MODVERSIONS
 +	select HAVE_DEBUG_BUGVERBOSE
  	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
 +	select HAVE_IDE
  	select HAVE_MOD_ARCH_SPECIFIC
 +	select HAVE_UID16
 +	select MMU_GATHER_NO_RANGE if MMU
  	select MODULES_USE_ELF_REL
  	select MODULES_USE_ELF_RELA
 -	select OLD_SIGSUSPEND3
 +	select NO_DMA if !MMU && !COLDFIRE
  	select OLD_SIGACTION
 -	select MMU_GATHER_NO_RANGE if MMU
 +	select OLD_SIGSUSPEND3
++	select UACCESS_MEMCPY if !MMU
 +	select VIRT_TO_BUS
 =20
  config CPU_BIG_ENDIAN
  	def_bool y

--Sig_/5OzjCGux=otNrvMezQoDw/3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ZZo0ACgkQAVBC80lX
0GxVyAgAojk8j6SRwOfQxFRWRIC/Yz6kMt1UMnLqldmKcqs4i/b9bKC7/Zw73Ekw
tMfj4aoZ4UKrij2DZGkD3kwgyT0AI30zCy74D0+TZEdB2tkpG5Gvgf3HHH/Sh/xn
sjZsUa9ivUix6WAgAnduI6iI8hykgZL5ujsrJFzcXGohWS/ZJonBw4RYjA71nJOE
cW73kP4rXEYkeLeglHgooMk0bh8tJL/meoHsZsYD7Q83jC7KdxE8ROsO4cbxbsbw
0v/QzUNEu+nSdqV7LKdButXhw98GphjkcplFoC3HoODTG/uZ9ECpIhoHv/P2sYvV
67GKuIE+T7vhbFq/ozXLckBqYYeRtw==
=bvx9
-----END PGP SIGNATURE-----

--Sig_/5OzjCGux=otNrvMezQoDw/3--
