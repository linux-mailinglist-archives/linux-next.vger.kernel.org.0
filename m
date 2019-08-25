Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722C09C680
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 01:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfHYXSV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Aug 2019 19:18:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfHYXSV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Aug 2019 19:18:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46GrfK1R5mz9s7T;
        Mon, 26 Aug 2019 09:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566775098;
        bh=C+NU4v33oaKNdQ6JvZFe5xkem3dalXSQfAfo4VatRIU=;
        h=Date:From:To:Cc:Subject:From;
        b=pJ+xgR4l6hgrKSygPnlbjPoFvmnvO4ubmmNfgUkLC97rNPhtOItL1mnZQbHvdyCZi
         KB+Zy1gjwVvbL0fVJZ0vZMcETvqoDEHr/00SFTDRda26AaGtW1/6GJ945kWz6Ng6+n
         GQVp/1zmDT/Lfmtg6mXte42Jfyhnay/I5DHLJp8SuPKA8mjKxBiIexlqPI38UzGMn8
         0nBN+VcsYNQciDIA/v9T5Z9bUUvqyW1vXNwI8pnlNBOSMMTzFw2WpXEqdGUKm2eImK
         xbS13LEcHvGg1xYYUFe7qHAYdwyZU6vNShHfLuFTpy2l7uycw3zYmnB6UHql+iCza3
         Wnek9YW3p4FoA==
Date:   Mon, 26 Aug 2019 09:17:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Burton <paul.burton@mips.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: linux-next: manual merge of the mips tree with the kbuild tree
Message-ID: <20190826091758.1a40ac66@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.rooHpJkG1UewFaYSTGcuZq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.rooHpJkG1UewFaYSTGcuZq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/Kconfig

between commit:

  2ff2b7ec65dc ("kbuild: add CONFIG_ASM_MODVERSIONS")

from the kbuild tree and commit:

  45e03e62724f ("MIPS: Decouple CPU_SUPPORTS_HUGEPAGES from 64BIT")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/Kconfig
index 3db919b5c93a,31c7044e34e6..000000000000
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -43,8 -44,7 +44,8 @@@ config MIP
  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if MMU && COMPAT
  	select HAVE_ARCH_SECCOMP_FILTER
  	select HAVE_ARCH_TRACEHOOK
- 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES && 64BIT
+ 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES
 +	select HAVE_ASM_MODVERSIONS
  	select HAVE_EBPF_JIT if (!CPU_MICROMIPS)
  	select HAVE_CONTEXT_TRACKING
  	select HAVE_COPY_THREAD_TLS

--Sig_/.rooHpJkG1UewFaYSTGcuZq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jFyYACgkQAVBC80lX
0GwfeQgAhi1DEgFKN1Om5LrPp0+JAMemaEsFlENZ2j5YN+Lw3pV2LGah+d3WjGrD
AALiKQHPE6WbxMR5b6i0GkkTyfu4PdTvnyPjfAjhx+kYIjpGBncEqFg2zfckPawB
Pk+OilCMaWwcfik/cf1Bk/tBOnpgCbHStih/8R3djZjfq7BqDTo6wzx2FUhe1PQe
vqSey1wS44hd3uqE95FEHF6KZzwN2xPzSPfdasdO35sP74eIgDFAcWZ1HkX4gRJs
O+PCV9rO2FaY1myPA9ohq9McjVSff7JRwqfZKFtSlJV/LBTlib1ZGy2sh0ijdUfv
zihQrU2QFWB/M9pXmURU/2A7gFvL/Q==
=F1Qz
-----END PGP SIGNATURE-----

--Sig_/.rooHpJkG1UewFaYSTGcuZq--
