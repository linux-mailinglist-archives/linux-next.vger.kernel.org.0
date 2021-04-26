Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4638036AA0A
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 02:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhDZAfR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Apr 2021 20:35:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231247AbhDZAfQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Apr 2021 20:35:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FT5WG3SM5z9sV5;
        Mon, 26 Apr 2021 10:34:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619397275;
        bh=VMtyYy8y9C5htLTvGyVRFdpRmhiRJjEZhns2kdthpwo=;
        h=Date:From:To:Cc:Subject:From;
        b=WjwPpyll3stnbTMeszNYHg/b4roCYp9Vv3rFznTFG2Li6H32IFULeKqrsEf6np3rB
         uZ3jfpI/lXFKk6JYBSe2KdJIRmJ4bdrz4ALgrqp/1ltOHDOs4daBTV09bS0XhSPwKp
         xXJh/uS+8pryoAKe65sa6TtLHKAj/E60AgxcHK2/Vbpr68+RR4B7+4abMChJO7Mxlb
         ksJPnTvDGjhZkr8SyYVTMl5A5d6nUdp1VHRSJaZwwm8Zak7+N/3OdENCD9/YcdIfW+
         bEBU3PpiznXGlO4h9z6P36t3OV59n9yWqGykQ2R47QPAp5QfFyAWWPthOousSH5CxZ
         OcaoNDX23VVbg==
Date:   Mon, 26 Apr 2021 10:34:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: manual merge of the kspp tree with the arm64 tree
Message-ID: <20210426103433.01f527e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//s/=FBPKlZugET_SU2UtHe5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//s/=FBPKlZugET_SU2UtHe5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/arm64/kernel/alternative.c

between commit:

  8d144746ecc5 ("arm64: alternative: simplify passing alt_region")

from the arm64 tree and commit:

  9562f3dc6f50 ("arm64: add __nocfi to __apply_alternatives")

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

diff --cc arch/arm64/kernel/alternative.c
index f6fd16185040,abc84636af07..000000000000
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@@ -133,10 -133,11 +133,10 @@@ static void clean_dcache_range_nopatch(
  	} while (cur +=3D d_size, cur < end);
  }
 =20
- static void __apply_alternatives(struct alt_region *region, bool is_modul=
e,
- 				 unsigned long *feature_mask)
 -static void __nocfi __apply_alternatives(void *alt_region,  bool is_modul=
e,
++static void __nocfi __apply_alternatives(struct alt_region *region, bool =
is_module,
+ 					 unsigned long *feature_mask)
  {
  	struct alt_instr *alt;
 -	struct alt_region *region =3D alt_region;
  	__le32 *origptr, *updptr;
  	alternative_cb_t alt_cb;
 =20

--Sig_//s/=FBPKlZugET_SU2UtHe5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGCpkACgkQAVBC80lX
0GxTVAgAniX8/a+CJm22JkE0cMhYYwrNuihYitHexabUQ1qbHZIgSERUZ9JckzW5
p58c8aT+blBiJ3vuBl0tTbktATQ3Ohm2gSS2XBM0CTtBvkd5XvgfOS5CHiMTN0pD
dpeOfkV2XLyna75SrO87SNj2AX1l4f4BT5DKbIf5zz7d2c/jy97UdneJc7sjpj8J
4ONDs5M+gFfJqVxgl9HfGMrIlcse7L8RhSVOOavvwoYAkN/R2ns5pG9QIz6Ria/w
uR53w2LUntyVqWpo0QC916qTwF+XntOMx3efXREq2Cl3qwSODO/KgqNAN7Rnf1cQ
gEpU2I3YtSX8kKHE3PzGhI/WW11j5w==
=DsJ8
-----END PGP SIGNATURE-----

--Sig_//s/=FBPKlZugET_SU2UtHe5--
