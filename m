Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3F1139C27
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 23:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgAMWFg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 17:05:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34297 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727382AbgAMWFg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 17:05:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47xSMG3qTvz9sR8;
        Tue, 14 Jan 2020 09:05:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578953134;
        bh=Ubnaq+eXxIkAc2/WViiMSUBC4GtBy+uXBWKBWOL/o+k=;
        h=Date:From:To:Cc:Subject:From;
        b=tQrC0TYPuG2o73xvQ+LK5d7EY2QetXagACuuU8Xz3UKUtxuLhfaOtHVMYmm4t4enq
         QuLiOAYt/7zBdaDMpQSJ+Yt4drcFBkYC93QvkSx4aMRL78eu1UC8XeAJ3j+3EReoHY
         +KaWQzycFimjylGn0EHy/aQwIpR3TiUPDCmYk35WjXw5dDTl0AoCDwMaobux6dCILn
         HsFDyQ0y6c0tasxk6D3UYvGzJbYZXC8Gkm0AhSgydh+VKAJaq19BvILgdXbfDGtDkp
         9zZs4S0He61Xnpkf44ycSlNCEcCsIctDLc9jrbwgPwnf0meE4PaExT+Er8wR9o7qQo
         dDNakvjevfBqQ==
Date:   Tue, 14 Jan 2020 09:05:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amanieu d'Antras <amanieu@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Nick Hu <nickhu@andestech.com>,
        Vincent Chen <vincent.chen@sifive.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20200114090520.1be304e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ckIt/TcarnvxtW3kvLhHrC/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ckIt/TcarnvxtW3kvLhHrC/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  20bda4ed62f5 ("riscv: Implement copy_thread_tls")

from Linus' tree and commit:

  d0f057940663 ("riscv: Add KASAN support")
  5b800fd350d6 ("riscv: add required functions to enable HAVE_REGS_AND_STAC=
K_ACCESS_API")
  a630fb824cf5 ("riscv: Add support for restartable sequence")

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

diff --cc arch/riscv/Kconfig
index fa7dc03459e7,9220071bb7da..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -65,7 -63,9 +63,10 @@@ config RISC
  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
  	select HAVE_ARCH_MMAP_RND_BITS if MMU
  	select ARCH_HAS_GCOV_PROFILE_ALL
 +	select HAVE_COPY_THREAD_TLS
+ 	select HAVE_ARCH_KASAN if MMU && 64BIT
+ 	select HAVE_REGS_AND_STACK_ACCESS_API
+ 	select HAVE_RSEQ
 =20
  config ARCH_MMAP_RND_BITS_MIN
  	default 18 if 64BIT

--Sig_/ckIt/TcarnvxtW3kvLhHrC/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4c6aEACgkQAVBC80lX
0Gy3ZQgApGyUKGLLwj49nw84bQXiz8GpoPL+a2TM6sA26JhwOlXGLKqjuM8fNinS
kRsgVwOwAVnYFCjc+7SDJVk8oTJY/9pxV+3u0J3FHaLHIRhvYOEoFBN71liHjgiP
Mc01ytK1jX3BMuQHjn4r6NRYkcT1L1vXSXXbaE1rnzHmYEvm3YOR19YxZpmS9rsP
OCRhO8yyZGgXh+vgf26PkPoaLSYRapwedBvjvhNZj2UjrWSDWSDijiTrWfRabedA
eRwQmqyYm49dHgKeWNA4T2fCpAe1Y7RihoE9BIsafuVsHoVbRecSqOcrbNmogwAV
IR3ZiJrIUfqmJYFPFF7J2oNiVxD8QA==
=TDED
-----END PGP SIGNATURE-----

--Sig_/ckIt/TcarnvxtW3kvLhHrC/--
