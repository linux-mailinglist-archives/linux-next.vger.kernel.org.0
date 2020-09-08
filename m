Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37675260804
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 03:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgIHBYg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Sep 2020 21:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728307AbgIHBYf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2020 21:24:35 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2508AC061573;
        Mon,  7 Sep 2020 18:24:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BlnW264WFz9sSP;
        Tue,  8 Sep 2020 11:24:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599528272;
        bh=x7ZEhT+Kb2TkfRxTqRVEA2QUZo6IOx0tY4Wv+geiK3Y=;
        h=Date:From:To:Cc:Subject:From;
        b=AeChHquQ4T2Khbo0Gi9HriUwuH5aOY671Hp4tFt8M0fjZ4+W6AaSZCgeGcrUsalnS
         F77urSwYj/Qhgb/Rb2iL/n/rqkE49Feug/M07afz5slrAz8s41v9K1JnxPFFuqvkrz
         T4JwxBufVlLouXQhssUg/5Ss2bVGEGGmEa7E0JHofSv63wkVGGZ1VWbReQoAVvYm5t
         5YTlcv1xvTiwhIN+uMIDhWpHnyYBMo2kQLdtNzAKu7tBX5OVuZhClGkyC6T4V82w3N
         s6QfI7sfWaQAhIV3IjJcc2sPIq094wIvOO/2cOX3E7c8xBgnHyFu14tHORHYWlieCh
         PI6yG+ITmfTsQ==
Date:   Tue, 8 Sep 2020 11:24:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the m68k tree
Message-ID: <20200908112429.29ca7562@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JvBYjCBbL7R.Ho/4nAc0VGZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JvBYjCBbL7R.Ho/4nAc0VGZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/m68k/Kconfig

between commit:

  dc072012bc94 ("m68k: Sort selects in main Kconfig")
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

from the m68k tree and commit:

  0d4ca5778ffd ("uaccess: add infrastructure for kernel builds with set_fs(=
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
index 93bbb74ea876,dcf4ae8c9b21..000000000000
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
 +	select VIRT_TO_BUS
 =20
  config CPU_BIG_ENDIAN
  	def_bool y

--Sig_/JvBYjCBbL7R.Ho/4nAc0VGZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9W3U0ACgkQAVBC80lX
0GxBLgf/XDqFLJazDfMjBpMz4qK83mJIvp4oBtwWn9W7vxmuYs7uwrl5iXPLw5uh
CXnzoxYCGoAxvlWR02lbu06BeE8TbHYbFVUTMWwJHlwgTrovd/ZA+twmkEzrm6L/
rvwhWynEGShDy3xWDEFlkH7wwrNM2jOkcS9XXIXA9fwHEdrRgGw5fLnaS8AJBDBV
tUi4QnFdFESwpPFHJ0ZPvvnBiiz33r5RuLz7X+/8PBSCooeAvbUdh0oJwS1q4/x6
ufTz9hXbscLwvklhgZJdTx55Rqx+BbQ1OTu+5Odtg0JdXPDF39PjrG+mLhm69HlN
MbWba+lQMJNFxZFYsiRyyaz5VwNRww==
=xtbq
-----END PGP SIGNATURE-----

--Sig_/JvBYjCBbL7R.Ho/4nAc0VGZ--
