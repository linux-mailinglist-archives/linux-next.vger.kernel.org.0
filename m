Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2C29A5E7
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 05:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389683AbfHWDIr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 23:08:47 -0400
Received: from ozlabs.org ([203.11.71.1]:56123 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389290AbfHWDIr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Aug 2019 23:08:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46F5vb6dQrz9s7T;
        Fri, 23 Aug 2019 13:08:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566529724;
        bh=Y4rV12y4MwnYpN7mGIgEqqv5HK0SPrggGd2iqOCrVoA=;
        h=Date:From:To:Cc:Subject:From;
        b=qnJ03ZvU26qzYJkcJYFaoXYxEA8vxKAutntLOldqizpk6kpdN9h1RakdMaX9olX7z
         MXTf4lwr73ks4UFzERbTlHig3W8kblik2MzzVakT78Niy/eIVme+3LKtvyv5DcDuAP
         xQ9dQ+nS35o3FSOlC2NNsMYGxvlXgwoAngFlReXuxcl9+etK/blKasLZLGO471n05J
         yL3Iv6um507c51kBF9ikkZkaTmxp6E4FdzhicFsaCSJAiMn3QA6Ws3ZHcXV+Bluy1F
         1PwvLAm8hdnCc7GF+4GddCw3ceYgX6SFBvc18ljYnkIjEe9/0FpoMu/Bk2WJ+o8No7
         o8csPDam9RBPA==
Date:   Fri, 23 Aug 2019 13:08:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans de Goede <hdegoede@redhat.com>
Subject: linux-next: manual merge of the crypto tree with Linus' tree
Message-ID: <20190823130841.4fdbda61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=xcZ.RUWj2DDJGdJ2qm19.r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=xcZ.RUWj2DDJGdJ2qm19.r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/x86/purgatory/Makefile

between commit:

  4ce97317f41d ("x86/purgatory: Do not use __builtin_memcpy and __builtin_m=
emset")

from Linus' tree and commit:

  ad767ee858b3 ("crypto: sha256 - Move lib/sha256.c to lib/crypto")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/purgatory/Makefile
index 8901a1f89cf5,ea86982aba27..000000000000
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@@ -6,12 -6,11 +6,14 @@@ purgatory-y :=3D purgatory.o stack.o setu
  targets +=3D $(purgatory-y)
  PURGATORY_OBJS =3D $(addprefix $(obj)/,$(purgatory-y))
 =20
 +$(obj)/string.o: $(srctree)/arch/x86/boot/compressed/string.c FORCE
 +	$(call if_changed_rule,cc_o_c)
 +
- $(obj)/sha256.o: $(srctree)/lib/sha256.c FORCE
+ $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
  	$(call if_changed_rule,cc_o_c)
 =20
+ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
+=20
  LDFLAGS_purgatory.ro :=3D -e purgatory_start -r --no-undefined -nostdlib =
-z nodefaultlib
  targets +=3D purgatory.ro
 =20

--Sig_/=xcZ.RUWj2DDJGdJ2qm19.r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1fWLkACgkQAVBC80lX
0GzRMgf/X7CRbOkevCxmPAir1DvqbNEOGARqOtal9Ky+ADu1LxKZbnCkUO9fqKWP
lGGt84IxUT6Xd1alfY34+0p+EVw0eQI4DecRDFgyd00tK5Z2lYrKhcmSHoxVbKUG
wOPEwuxOnC0bw0nIsb+pNmzJt+ts8C9pYDlOkWMwW4ok0HKvpAXJB9lYn/Xn16hK
xtLA+AAtYOR6VOV8nrMNsW+1RCw22mZVAdajrIqV0MOyJCfrnc8BC+ZCPg0DXvri
xUk4sGXIxr3iIPkK/HRwC1cpv+8c8alATo56xWlBwo3CzCIviO94OCVoKlxYi4+j
I3mqvUxw6qlffEIbjbZdQX4GaIaaGg==
=kX1i
-----END PGP SIGNATURE-----

--Sig_/=xcZ.RUWj2DDJGdJ2qm19.r--
