Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE846277FE6
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 07:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgIYFZs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 01:25:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58313 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbgIYFZs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Sep 2020 01:25:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByL3Y71Qhz9sSn;
        Fri, 25 Sep 2020 15:25:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601011546;
        bh=2gx4dW3Za2qhUic+/NJoGelBionjh8kGB6m105OPlfI=;
        h=Date:From:To:Cc:Subject:From;
        b=Lv+oos/2NpHE1cUbMH6CcaSvNnF/xmNONLtQR5KuMhCIqhYWdW3L8O9auhKXgTgpL
         ijV3kSfTEck4N9iYtAbWGTjuDqW9RujACTMFTGAo+qUhkphGjRiiO73oTKx5lg838Q
         Xg6zXS/m8VwFnOUKzab+AfWIH0lMryH5hqWflYOoUhx0Fe5LXJfZe+77mVx6XwTgjT
         L6UbOZDX0nB3TiIpZkI2giO5GdqWIo9mH3Hi/J4Do/UdvHriSiQ0AgQ7LXAQaDwefk
         J6eR5oYjWvrnHzKMXV2EuFS+7mB6rLxBFkqCcvgERjrqlaetqwcMWBSd7FIMB/LDv9
         LgQSQkp0Axh3w==
Date:   Fri, 25 Sep 2020 15:25:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Message-ID: <20200925152545.60cccb7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1L_4i_TQkRuXrSoDSXYhZnS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1L_4i_TQkRuXrSoDSXYhZnS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm/Makefile

between commit:

  596b0474d3d9 ("kbuild: preprocess module linker script")

from the kbuild tree and commit:

  5a17850e251a ("arm/build: Warn on orphan section placement")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/Makefile
index e15f76ca2887,e589da3c8949..000000000000
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@@ -16,6 -16,14 +16,10 @@@ LDFLAGS_vmlinux	+=3D --be
  KBUILD_LDFLAGS_MODULE	+=3D --be8
  endif
 =20
+ # We never want expected sections to be placed heuristically by the
+ # linker. All sections should be explicitly named in the linker script.
+ LDFLAGS_vmlinux +=3D $(call ld-option, --orphan-handling=3Dwarn)
+=20
 -ifeq ($(CONFIG_ARM_MODULE_PLTS),y)
 -KBUILD_LDS_MODULE	+=3D $(srctree)/arch/arm/kernel/module.lds
 -endif
 -
  GZFLAGS		:=3D-9
  #KBUILD_CFLAGS	+=3D-pipe
 =20

--Sig_/1L_4i_TQkRuXrSoDSXYhZnS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tf1kACgkQAVBC80lX
0GxtIQf/bB83Up1yh+U7tvU/W2qepHb7I0UpA6ap2dJJ/gVm1T/GJx+wdLkhtMEV
bWtirx2ei+8J+Da7hYzAUKyVDHMx9FegmsdbScjCvlVSE0uiemvV7l/O/1f17k3V
ioDeZYgxso0/s2tj/Q297Mv0c5B22wSXCeY8zrPdPXsVtTCRafOE0XiZU3g18dUF
oE/LR0sXhEdRGYvEhwbIp/5BCvqmnDeXAckbYKiUbnwhJ0mOG/jaaZO1Mx8T/jMa
9SCyQ4SBmKLSJOZqcGF8zFe3N7/6hOt/TdjEIx7O45W3UGzb06rQUcczRGJnMh+O
4duL9fh/L1Ds4qKG5JJhZglCfTOAbA==
=v4a4
-----END PGP SIGNATURE-----

--Sig_/1L_4i_TQkRuXrSoDSXYhZnS--
