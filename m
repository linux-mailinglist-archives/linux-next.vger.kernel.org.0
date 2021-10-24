Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0835438C9F
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 01:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhJXXxZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 19:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhJXXxX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 19:53:23 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6ABC061745;
        Sun, 24 Oct 2021 16:51:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hcvwz3ZNjz4xYy;
        Mon, 25 Oct 2021 10:50:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635119461;
        bh=OI6VXw3aoUavo32ZrQyC5k0fHdF3zA4FxukTuzDgdrg=;
        h=Date:From:To:Cc:Subject:From;
        b=NuLdQH3fEkF37hhNpWhspRdW55w7Mu7+4RwIXwrpDSFdHx2tNLzZMdqy+Z+lw/zBG
         LCPt+K8io8mPMf63h06DErib04bm1ud4XUR2eepHF6PlAuKm+K9ShjaPfODre1fynC
         FaOb39IVDAziKIPqBkjfHPqk8UguP40VwrqjeK9GA49oHexyHrTzpLizBfAsMeIlbm
         pgDHchHMjGMyp7jfQm2qsk0cW68SEYRUNjRrT/gZpXipb2fCQvoCuJEo1bLTc3aVDB
         bmGTzuXtbGNNndmXR8n5s7E8NYM7i6MAy7CPeZY6rQd/ltGarn8s3WuLWEwBeOHeUX
         lynG6/zMh5fIQ==
Date:   Mon, 25 Oct 2021 10:50:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the risc-v tree with the kbuild tree
Message-ID: <20211025105058.11bd58fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/drnyTCkpvs2_5TD=f7Jga4G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/drnyTCkpvs2_5TD=f7Jga4G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Makefile

between commit:

  8212f8986d31 ("kbuild: use more subdir- for visiting subdirectories while=
 cleaning")

from the kbuild tree and commit:

  5d4595db0e1c ("riscv: add rv32 and rv64 randconfig build targets")

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

diff --cc arch/riscv/Makefile
index 753e13f3a9d2,9247407b95d6..000000000000
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@@ -135,3 -137,16 +135,13 @@@ zinstall: install-image =3D Image.g
  install zinstall:
  	$(CONFIG_SHELL) $(srctree)/$(boot)/install.sh $(KERNELRELEASE) \
  	$(boot)/$(install-image) System.map "$(INSTALL_PATH)"
+=20
 -archclean:
 -	$(Q)$(MAKE) $(clean)=3D$(boot)
 -
+ PHONY +=3D rv32_randconfig
+ rv32_randconfig:
+ 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=3D$(srctree)/arch/riscv/configs/32-bit.con=
fig \
+ 		-f $(srctree)/Makefile randconfig
+=20
+ PHONY +=3D rv64_randconfig
+ rv64_randconfig:
+ 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=3D$(srctree)/arch/riscv/configs/64-bit.con=
fig \
+ 		-f $(srctree)/Makefile randconfig

--Sig_/drnyTCkpvs2_5TD=f7Jga4G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF18WIACgkQAVBC80lX
0GwdMwf+NPJN8AkP1xk1RHIg2z0mO7Rmgfg7P2ZIFi94J50bIT6nf/lEaxgWuVvx
L7UekjkY83vXVLPXW6EORQjfEkse94de5shCv9lXgtaFQb/rWzMNdY1GOFEKH3mG
4KDvLzAOaTgWk/jDkgruNRO9zGd1rkZpmAKYFff3BeSe70M7jk/FS87lowRYXZSf
a5QJ03SqUIytLyV5JRfGJJOZYTfzdjd8NHpwYC70iQLilnm1rr1wxvl3byXeWov/
5xCGjz4cXONubQ+ydN/QL4o81S81qLUTaS3vi38KVOQiwYJ/Ii3LeTypuVpeIGKo
sZ88BxMh8R3QTe+gUwGLZX26n359tA==
=dUmp
-----END PGP SIGNATURE-----

--Sig_/drnyTCkpvs2_5TD=f7Jga4G--
