Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7A52639B6
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 04:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730275AbgIJCAw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 22:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgIJBrs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 21:47:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586A5C061346;
        Wed,  9 Sep 2020 17:31:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bn0FF6RSKz9sTX;
        Thu, 10 Sep 2020 10:31:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599697906;
        bh=zM2MvQJLonAoEzgWZpxZMgRmgeYv2DIj99f9b8gCPEM=;
        h=Date:From:To:Cc:Subject:From;
        b=aqS8zy9jbR5h+NhEp/pqxLRQDXartZx10IVyl+n99ZieCHurD8FHJ3YMSrYup7UUv
         BKexs+a2bsBD4SJ36YxT7YGKYxlUGd/s8qZ9B0eTIkpwbVNYWskGK0ulUTYXZi0Y8p
         HQ0Fnx7HU6k4unEA6BJ9shjeNDKIh72WKqdTQJYm3pVHZLpLriczQNaQCL0PjKqPmx
         uOhAQlRcAPvhlt7YQSkWdC1rR2oK8BLo5DjH1zBrgkAsEc45OMjD2nsVHkVwWysYj+
         eTh0FKFab8kylcTAunqXQvFITUXNTlaAOe28rNcmLkjLiLKOpTpbK9Y7UhQieUUs7N
         LqO3p5l6EQ+mA==
Date:   Thu, 10 Sep 2020 10:31:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the m68k tree
Message-ID: <20200910103144.4612ba94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kiu3AQQV6MuEO+Z9N3b4o3=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kiu3AQQV6MuEO+Z9N3b4o3=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/m68k/Kconfig

between commit:

  dc072012bc94 ("m68k: Sort selects in main Kconfig")

from the m68k tree and commit:

  5e6e9852d6f7 ("uaccess: add infrastructure for kernel builds with set_fs(=
)")

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

diff --cc arch/m68k/Kconfig
index c830705bd3ac,dcf4ae8c9b21..000000000000
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@@ -6,33 -6,33 +6,34 @@@ config M68
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
+ 	select SET_FS
 +	select UACCESS_MEMCPY if !MMU
 +	select VIRT_TO_BUS
 =20
  config CPU_BIG_ENDIAN
  	def_bool y

--Sig_/Kiu3AQQV6MuEO+Z9N3b4o3=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9Zc/AACgkQAVBC80lX
0GyV0gf/egqd3Vdhl/l19t9kD0GWq3RCX9QPeOFO/IZv+X6Iw5Um7BSS71FzuAzV
vRyqBTyrqtANzo4TWjfGqkcA7bSRrZqg8S8dpZKLuBy/Hj59ExQzk2jiyvE9bEhm
W6uyjBeBbuj+ZdhHMydXUIFsjfAg2cba8OcYyJ36pjzjHTrsrlI2tmqq7NK9LQ2a
k3M1TY07qUPRUiNh8GajvClWv4NRkMx1z3J3kdHSu39RVvBmxdBKcncIsMc7poK8
k8+a2D+rF3gJPfaIJUE03x12rv14pPcbH2A6G+bmZttj6vJ81ekibApVQI+gOz/j
3y+DcNsTiVU+qvO6tKyG8BEARmeSyQ==
=TN0r
-----END PGP SIGNATURE-----

--Sig_/Kiu3AQQV6MuEO+Z9N3b4o3=--
