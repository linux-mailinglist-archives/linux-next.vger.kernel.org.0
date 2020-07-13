Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1C621D021
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 08:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgGMG6x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 02:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgGMG6w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 02:58:52 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6155C061794;
        Sun, 12 Jul 2020 23:58:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B4vd36LH5z9sR4;
        Mon, 13 Jul 2020 16:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594623529;
        bh=luQio5Oo9CYwRultNKJhxs2HHiwp/p2cOZqnLur5m0k=;
        h=Date:From:To:Cc:Subject:From;
        b=iG1eowlp6weSZO4gxHVQs24lWYkN+tnjqQtoIEmWTjIOpM+inp7VoZ0aJgVdv7FVM
         SGMz09lo3EoXiy8qMWkXErIBDwVxziHICpkbpwkxSZMrjUysDotxMTXbsvFq/hBVPu
         KxxMeyszjurFUQGcWUPoRZHSEf+sd7yy1DoDPHNCuqW1DxbWYbEhs3m3AnlXFykUoN
         bogr/FhrqclesA2HOfqr66hIbIKoNSIjArVez0Z+BWV6k2Kok6sHakBdmi/596kr+5
         6ACgkEv7unF4eHCg69v9kJi/dFn1izPZ/o6sf3bNsdqMrUhls5xfYKBIkWvueY070j
         uw95EOrKpGsCg==
Date:   Mon, 13 Jul 2020 16:58:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greentime Hu <greentime.hu@sifive.com>,
        Tobias Klauser <tklauser@distanz.ch>
Subject: linux-next: manual merge of the pidfd tree with the risc-v tree
Message-ID: <20200713165846.5166ff82@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7DTP4JIE5QhI2h_EU1JNPOo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7DTP4JIE5QhI2h_EU1JNPOo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  95ce6c73da3b ("riscv: Enable context tracking")
  929f6a183839 ("riscv: Add kmemleak support")

from the risc-v tree and commit:

  140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")

from the pidfd tree.

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
index 76a0cfad3367,f6a3a2bea3d8..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -57,9 -52,6 +57,8 @@@ config RISC
  	select HAVE_ARCH_SECCOMP_FILTER
  	select HAVE_ARCH_TRACEHOOK
  	select HAVE_ASM_MODVERSIONS
 +	select HAVE_CONTEXT_TRACKING
- 	select HAVE_COPY_THREAD_TLS
 +	select HAVE_DEBUG_KMEMLEAK
  	select HAVE_DMA_CONTIGUOUS if MMU
  	select HAVE_EBPF_JIT if MMU
  	select HAVE_FUTEX_CMPXCHG if FUTEX

--Sig_/7DTP4JIE5QhI2h_EU1JNPOo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8MBiYACgkQAVBC80lX
0GzjyQf/XQpISQlEFenm4EapmmIpxMa5oQF9THQbASEtmpjtjQlP2M/sqw7u4i35
mZ2XKLc/QchK3hCap87RBSriJPSyNFcc2tMJi4U2O8xly4oeVtm9ceFsCyW0e2Eq
o1rmVrdCetbsqiPFMLHzTZj7B5r4iytHXDsLXJ+sp9YoTuI6i8amAJTgV4Gu8azM
pt14tNVD45Z45SzBvnqW+xLMgUkoYvFtsBPJj78fD2WKyQ2nOg4Hqmn+R4Kq1Cu/
Cfgel/vjQ53jOPxtF0AgWv6RGuRCvC2yUU0XCOy9q9UWDd/o6o2pakCcCy5fIddf
kWksBTGsPQDTcTMQfLxSzMIwKgh5Kg==
=zB9c
-----END PGP SIGNATURE-----

--Sig_/7DTP4JIE5QhI2h_EU1JNPOo--
