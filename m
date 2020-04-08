Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48F5B1A19C4
	for <lists+linux-next@lfdr.de>; Wed,  8 Apr 2020 04:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgDHCAb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 22:00:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49851 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgDHCAb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Apr 2020 22:00:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48xnY73rRRz9sSj;
        Wed,  8 Apr 2020 12:00:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586311227;
        bh=xvqCi+cIJ3wlVON3+hV0bMtvtjfy8ATYcnMOBtdsJQI=;
        h=Date:From:To:Cc:Subject:From;
        b=Sp8McM5WmxQEtZ0ffSXobTcnrIhy/tovsmPsr5Dw/YIAvHmhw69XjtFZQprIGH0rW
         UYphmqTmjVEBEzyK3iWalJrkUNgChRHK3eSN7ht3QZs/i2zSyxte2RP0ywvslWJGnw
         z6E8sJVPNn+795s6d7mEVMQAsjUA6gZP/Srkd1BEqOGkoD8sHnisvOiw3vvVtRFS+/
         TdmhpgB+w9C52Yz/r0pmoVAQDjGKnewBbaL5DXDndx5nRtm3ICPAW9KDv/iH+XTmnD
         UfGkUhszI6cExaDNEuxA2fHrP4OnOSc9REWGS4Xf9FupK4SCLMQvY7ERlpy+TFFwhY
         2AQBEDTWEpzaA==
Date:   Wed, 8 Apr 2020 12:00:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "=?UTF-8?B?RnLDqWTDqXJpYw==?= Pierret (fepitre)" 
        <frederic.pierret@qubes-os.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Message-ID: <20200408120025.71355911@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2R1KTHrTBVXl_qm2lu5Ut2y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2R1KTHrTBVXl_qm2lu5Ut2y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  scripts/gcc-plugins/Makefile

between commits:

  735aab1e008b ("kbuild: add -Wall to KBUILD_HOSTCXXFLAGS")

from Linus' tree and commit:

  dda632f1bc6d ("gcc-common.h: Update for GCC 10")
  8d1951750084 ("gcc-plugins: drop support for GCC <=3D 4.7")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/gcc-plugins/Makefile
index f22858b2c3d6,1d0b9382e759..000000000000
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@@ -1,9 -1,19 +1,10 @@@
  # SPDX-License-Identifier: GPL-2.0
 -PLUGINCC :=3D $(CONFIG_PLUGIN_HOSTCC:"%"=3D%)
  GCC_PLUGINS_DIR :=3D $(shell $(CC) -print-file-name=3Dplugin)
 =20
 -ifeq ($(PLUGINCC),$(HOSTCC))
 -  HOSTLIBS :=3D hostlibs
 -  HOST_EXTRACFLAGS +=3D -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=3Dgnu9=
9 -ggdb
 -  export HOST_EXTRACFLAGS
 -else
 -  HOSTLIBS :=3D hostcxxlibs
 -  HOST_EXTRACXXFLAGS +=3D -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=3Dgn=
u++98 -fno-rtti
 -  HOST_EXTRACXXFLAGS +=3D -fno-exceptions -fasynchronous-unwind-tables -g=
gdb
 -  HOST_EXTRACXXFLAGS +=3D -Wno-narrowing -Wno-unused-variable
 -  HOST_EXTRACXXFLAGS +=3D -Wno-format-diag
 -  export HOST_EXTRACXXFLAGS
 -endif
 +HOST_EXTRACXXFLAGS +=3D -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=3Dgnu+=
+98 -fno-rtti
 +HOST_EXTRACXXFLAGS +=3D -fno-exceptions -fasynchronous-unwind-tables -ggdb
 +HOST_EXTRACXXFLAGS +=3D -Wno-narrowing -Wno-unused-variable -Wno-c++11-co=
mpat
++HOST_EXTRACXXFLAGS +=3D -Wno-format-diag
 =20
  $(obj)/randomize_layout_plugin.o: $(objtree)/$(obj)/randomize_layout_seed=
.h
  quiet_cmd_create_randomize_layout_seed =3D GENSEED $@

--Sig_/2R1KTHrTBVXl_qm2lu5Ut2y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6NMDkACgkQAVBC80lX
0Gz9bgf+I02E38X9bu15NZyxK/Bta9eYafJ/6yzKyqlZlrqu8W0DP7MNqS4kyxWN
eawVwxHfZEp6FmI7bcFZS1sxRnye9EtKAEzsPHAxx8LEttZQ9zau4eS+ZpPFqeyc
j4yAPKdx7l7VJWchyZjXj9BKYgerASwYA2EuXylZPu7009fOeMGFm4e4jY6ZXBKT
7qKrFjDcscn7AnLNr2HYh+VPVsiTcdsZOBUJcCxrat5k+14UVWeDIC7riuYUFqvt
rQU4bpeE4TX9xwNedfKoTNwZUVcGfkHuzM3loDOSX6lXolOQvvTnqhqT6I09+Q/I
HVViqU7dQwi3XEqiH2w6vAlied+zTA==
=+K/0
-----END PGP SIGNATURE-----

--Sig_/2R1KTHrTBVXl_qm2lu5Ut2y--
