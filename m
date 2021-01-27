Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13273067E7
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 00:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbhA0XaE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 18:30:04 -0500
Received: from ozlabs.org ([203.11.71.1]:58261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234800AbhA0X2s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 18:28:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DR0Bs1sQnz9sSs;
        Thu, 28 Jan 2021 10:27:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611790074;
        bh=OTWDb98vidPLgsGQvW27UC+yhbiHyf44Fpn+cy08QhA=;
        h=Date:From:To:Cc:Subject:From;
        b=Pw+4WD4UxG24bbzVbz1f4WRkIdB+if+EP4iZqupZuPcx7HGyF3oQeRpznndITtAOw
         t0Fr+pXpr9uuuiVtlwJe5NgMafOKSoHQrIyLSMwYXOSVSClAFiJ3wllDjgzaTMZNUw
         5m/9f9Q0PWei53t+pSIXkxysipeIyU07HICOdqDAyPlx6nXRVrVfwRIuTF6N6VBWgC
         eQL6DM5Mtdz69VtiCJfWnHoCAUlbqDrOQbL1iw7E5GKP5nlzx5y2+ifX2yQDGf2iXt
         stjbuicUGQyvKtiKcorprX9YxeTU+pgqqsYPKlIu+q2PaQ5Hn6ON9zJnUrIKdIqmHo
         4BoHsJivLg5fw==
Date:   Thu, 28 Jan 2021 10:27:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Atish Patra <atish.patra@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: linux-next: manual merge of the risc-v tree with the arm64 tree
Message-ID: <20210128102747.3ae8e5eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uzHRzYvuqbXg=DLHTAYsZJF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uzHRzYvuqbXg=DLHTAYsZJF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/arm64/mm/Makefile

between commit:

  072e3d96a79a ("arm64: hibernate: move page handling function to new trans=
_pgd.c")

from the arm64 tree and commit:

  ae3c107cd8be ("numa: Move numa implementation to common code")

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

diff --cc arch/arm64/mm/Makefile
index 77222d92667a,cd60e4fed78f..000000000000
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@@ -6,8 -6,6 +6,7 @@@ obj-y				:=3D dma-mapping.o extable.o fau
  obj-$(CONFIG_HUGETLB_PAGE)	+=3D hugetlbpage.o
  obj-$(CONFIG_PTDUMP_CORE)	+=3D ptdump.o
  obj-$(CONFIG_PTDUMP_DEBUGFS)	+=3D ptdump_debugfs.o
 +obj-$(CONFIG_TRANS_TABLE)	+=3D trans_pgd.o
- obj-$(CONFIG_NUMA)		+=3D numa.o
  obj-$(CONFIG_DEBUG_VIRTUAL)	+=3D physaddr.o
  obj-$(CONFIG_ARM64_MTE)		+=3D mteswap.o
  KASAN_SANITIZE_physaddr.o	+=3D n

--Sig_/uzHRzYvuqbXg=DLHTAYsZJF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAR9vQACgkQAVBC80lX
0GxjQwf8DZsExCauOxTwgqd/ymd2lFTpvFbn7ZytOTmZ1gGK/xPv9Tdcxj+bjYKD
3JSN4cHC5wHV6VU+TTBZqgxmPamY++pI4IQ6rykaxjYARQo5xjs+Td0mwOSj13/H
Vub/f8XVcuQb2B7OAuCNF0L0P1ij9lfSW8r6MbRxmVo2OaEFaVZIQrUi0+dkyX73
6Bosb0kz1OAwp/c3XGI+twD6vqJD/WruhcvzJOt4qlcZ6Ctcoipz5uHKXi1QBga+
NXEiAjZucngOvC5bwF6xfIrhNNN4C7uNlTrzKPx7qcHHBRm1dfvTwqrvosDHAyTh
9KyLKr27GAZreOoYi+p+UTTqanU2ZA==
=PVHd
-----END PGP SIGNATURE-----

--Sig_/uzHRzYvuqbXg=DLHTAYsZJF--
