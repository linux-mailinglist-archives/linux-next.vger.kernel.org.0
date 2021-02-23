Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43CC32338A
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 23:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhBWWBg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 17:01:36 -0500
Received: from ozlabs.org ([203.11.71.1]:56651 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230128AbhBWWBf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 17:01:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlY006vnHz9sSC;
        Wed, 24 Feb 2021 09:00:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614117653;
        bh=sIkHQwImve+nGJQYowwJ79SQgaunCqfQ+ORaEsdpAmQ=;
        h=Date:From:To:Cc:Subject:From;
        b=XaUqj9bplb13RZo5lapDAY5Nk5dKqj1EeDntj2sPnaZKB7tbaUAKVWGKqXK11VJqZ
         42+6X2znojYb6PgEJojF1yYKnlz1yv44P263COqhBRb+yQGFZifBE9RU/R+6+snP24
         Kb4ptaVtUPaD5WtvcnakCJ1XU4Q4XRSqATWJ34VjjQawqUJiDVIDGWEBD0MK60Ta83
         TKS8tkMnY7sViQWEHBP0dBAflIjMYuALNSo0Leu/3ZyVRWiCx2D1DqquflzVhO0DFM
         TxWmyLyMpWjLqOPWKAYQMhTjj/SP1D0cggoaeEjIT3CyV2b6+IjeT9rD10utV7oFly
         IGd1oVOe8Sy3A==
Date:   Wed, 24 Feb 2021 09:00:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20210224090048.5855942c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3.RuaWCgJzkDrD44FM2WFkb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3.RuaWCgJzkDrD44FM2WFkb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  drivers/soc/Makefile

between commit:

  89d4f98ae90d ("ARM: remove zte zx platform")

from Linus' tree and commits:

  08734e0581a5 ("riscv: Use vendor name for K210 SoC support")
  e134d426e1a3 ("soc: canaan: Sort the Makefile alphabetically")

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

diff --cc drivers/soc/Makefile
index 9bceb12b291d,34b23645be14..000000000000
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@@ -28,4 -29,4 +29,3 @@@ obj-y				+=3D ti
  obj-$(CONFIG_ARCH_U8500)	+=3D ux500/
  obj-$(CONFIG_PLAT_VERSATILE)	+=3D versatile/
  obj-y				+=3D xilinx/
- obj-$(CONFIG_SOC_KENDRYTE)	+=3D kendryte/
 -obj-$(CONFIG_ARCH_ZX)		+=3D zte/

--Sig_/3.RuaWCgJzkDrD44FM2WFkb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1exAACgkQAVBC80lX
0Gy/Xwf/dnbQZdSruEEhnRA6zjb8HnixjZoBW8TFjci+Rf7lr6QforZiEdsHj2Yc
xoGx8ulUQYm4A4g9P1ioojH/eWRftM8Uzv7XfoRq/XOAaNhmYAv4e0P5f4eEcODo
DNGvF+lsWpDbZd2K8AgWSOZrijtzw/I+WhnmMXFurVLDSqVQHw0T0a1mJEAR26fb
RMDUBukLVxMjDptSHyqB0Lq6XjZ68Gxy0a6GGe31hHk+5KKWgGK3NZYDURzn/sRg
ka0Vz2yBvCY55Ez3W5YCJB6slyZVXTwwd7eBWgGli2InFkP5n0Jf3wz9ENRtxmz8
w8IZDnEQJj/Y3jrRp6Zj5ST6mChNvg==
=wLol
-----END PGP SIGNATURE-----

--Sig_/3.RuaWCgJzkDrD44FM2WFkb--
