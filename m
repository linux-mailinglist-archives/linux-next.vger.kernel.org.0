Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314971BB712
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 08:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgD1Gzd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 02:55:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgD1Gzd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 02:55:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BC8H6DNXz9sSG;
        Tue, 28 Apr 2020 16:55:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588056931;
        bh=6eiIFrHk1wWxVd8A8Z8Z5Fdd6GKLAXFKycz/ivOwzDA=;
        h=Date:From:To:Cc:Subject:From;
        b=UgNAI6Adsh7CNRp6fa+3asPpwdKRSaxfoYa8DiaxQkbrk9TTfi2mDihi5QdUmYmND
         A6BdRzNSMOKbP2UZknoJz/nhHfRZuYvPP3zuFqzLteNkEGXAq6tB7O5g8Ms28wmXk4
         /JZA3TKTh1DOThDeZ9slqiolhDG3UnsvaQxHc4a3HfsVrb2QvdZPTRUTZf+6yI60Wc
         ITt8w6ERAWnkmhpxF1JI0I3MWUeWtcjrwV/aiGdITTbAUVumy/JK3acouIXwwAcQSj
         RSCT8PUE2Cday5SMW5okhE1vcEiaya1ABxB2I36VTLqAfDIK4CNfrbGN+opVcDDRvy
         FQ/foocSRQRcw==
Date:   Tue, 28 Apr 2020 16:55:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zong Li <zong.li@sifive.com>,
        Vincent Chen <vincent.chen@sifive.com>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20200428165525.6e7c2f7a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oOtCp/bk25KN/dVmacqCv7d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oOtCp/bk25KN/dVmacqCv7d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/riscv/Kconfig

between commits:

  d3c263cda1a5 ("riscv: Add KGDB support")
  ce66581cb6e9 ("riscv: Use the XML target descriptions to report 3 system =
registers")

from the risc-v tree and commit:

  bbb6dc9ac443 ("riscv: support DEBUG_WX")

from the akpm-current tree.

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
index 39f7a70cbd72,8576cc027b76..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -68,8 -67,7 +67,9 @@@ config RISC
  	select ARCH_HAS_GCOV_PROFILE_ALL
  	select HAVE_COPY_THREAD_TLS
  	select HAVE_ARCH_KASAN if MMU && 64BIT
 +	select HAVE_ARCH_KGDB
 +	select HAVE_ARCH_KGDB_QXFER_PKT
+ 	select ARCH_HAS_DEBUG_WX
 =20
  config ARCH_MMAP_RND_BITS_MIN
  	default 18 if 64BIT

--Sig_/oOtCp/bk25KN/dVmacqCv7d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6n014ACgkQAVBC80lX
0Gy9pgf+K+gRGhUD1wMp4hRaanXCmlHA1aqKXkXW4HcnEOzG9swpSdvl7uMN+Alc
/5bPmmwrtkyKp/2dQjeT/tu9TSQOnvaNe4uwpgP2zUksx+r0v6kgW4kUQb0OniKu
jTPhwKKY4jkuUDaL6UzsjoPJ/txI8myBIAYe7gVzXHW1yCkvmdqBnqosaabbTPyw
tF4h3WBZhWTFLXobNJ9Ja9WHLaESgaqG6Npo/+W5YruOB3wZ9w714mGNP2jtHgfl
YcjTgax4l0v0m9IQ09HMcGAsNuVp2J7q376/9GRr0Se5yQXGa91h0yM+B7ZP5+g0
OqWdMZIrSjdGEVFO2gqg36ySv5XUFw==
=0gmd
-----END PGP SIGNATURE-----

--Sig_/oOtCp/bk25KN/dVmacqCv7d--
