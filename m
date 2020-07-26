Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E6222E33C
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 01:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgGZXS6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Jul 2020 19:18:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40079 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbgGZXS6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Jul 2020 19:18:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFJlx34dJz9sPf;
        Mon, 27 Jul 2020 09:18:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595805533;
        bh=/X/ChJaJP4iEeTziTLKzpmu8jebl/w6GWG/nzK9ujck=;
        h=Date:From:To:Cc:Subject:From;
        b=MzZlWyH8gw+4kWBC8YOvC8glT0aLJImk0DQqFuqq+8KBQhHsZSCwNeoZmMiCczKMH
         CCwNBR5/jemaMfKDb4tv7OLOqNiIFwVi3hX+JQU/9fN+Om5Z5f0n2+et2DRgnvpkev
         MLxgs+84sLV1VfkNezLRzMQvlpddcVcXrfBdkPvpNX7Fgc75fumb6vBZ3XwlmvetXD
         8MySFN+M8jQ6wDOh9YenE3tVXENr1sN5EXYKUQr0lDj2rTbjvaUgMqYw40IfU5wNX0
         BKJEZ2WVU9NBdavIWfI9PANwkPCCV36MKaW/BrpAC90/Crb4pq+HINbKQlBc2P0+eG
         anRYtP7dfGjoA==
Date:   Mon, 27 Jul 2020 09:18:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>, Andrei Vagin <avagin@gmail.com>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20200727091851.64a0d61b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rMN2ke2O3/fZB.ielbidoKm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rMN2ke2O3/fZB.ielbidoKm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/vdso/compat_gettimeofday.h

between commit:

  97884ca8c292 ("arm64: Introduce a way to disable the 32bit vdso")

from Linus' tree and commit:

  3503d56cc723 ("arm64/vdso: Add time namespace page")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 9a625e8947ff,d0cbb04bfc10..000000000000
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@@ -152,12 -153,18 +153,24 @@@ static __always_inline const struct vds
  	return ret;
  }
 =20
 +static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
 +{
 +	return vd->clock_mode =3D=3D VDSO_CLOCKMODE_ARCHTIMER;
 +}
 +#define vdso_clocksource_ok	vdso_clocksource_ok
 +
+ #ifdef CONFIG_TIME_NS
+ static __always_inline const struct vdso_data *__arch_get_timens_vdso_dat=
a(void)
+ {
+ 	const struct vdso_data *ret;
+=20
+ 	/* See __arch_get_vdso_data(). */
+ 	asm volatile("mov %0, %1" : "=3Dr"(ret) : "r"(_timens_data));
+=20
+ 	return ret;
+ }
+ #endif
+=20
  #endif /* !__ASSEMBLY__ */
 =20
  #endif /* __ASM_VDSO_GETTIMEOFDAY_H */

--Sig_/rMN2ke2O3/fZB.ielbidoKm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eD1sACgkQAVBC80lX
0GzHlQf3Tbsm62ClaMkKAgTIeF2BaVSAhBIllgW4rqoq9HRmpUjQP29wOo6e/Tfh
TCrJE/7poF9l27CqJebjIeiSJ9Eu+5gSQpQVf/59U0+OXVJQXdaieMm7tuHVWiHu
40efLVsEMQBA1UA10W3R+jNJiZxJkwNHbimK+ULjw0AKe8Yr3l6GnB/OnZ74cNnJ
ii2HZyaXOF8zkPNB3Yc43Z26IuA0MwGD2q59W/PYV+4E6Ue2s/2wPXlfMYSmDF9c
Wf66DKWAeWKvFvlot8Q1+waAE77oWfjkdfBDR2fogb17f0agUHW5N2SAnAEBf8KF
itgy3fQ0wetRCs8cSOcAOUswg27/
=A4HT
-----END PGP SIGNATURE-----

--Sig_/rMN2ke2O3/fZB.ielbidoKm--
