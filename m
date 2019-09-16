Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E82DB3871
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 12:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730204AbfIPKmj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 06:42:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33738 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfIPKmj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 06:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=JZBjiu6mXEF4xljF1dJvnzItrxLJQ/ptLLfiyKsUZDM=; b=mcTQ3/PmWWPgIhdxeGMFgAW+F
        1fLJopUTSjAisftrUQn8kbLQVK2OpQSbkj3b1Vl0Xi1aQeTUQ5YogfHaYMV7gY19ZeLXOWCTL2fav
        4q8glNwUzm/puuhRvzWb4RtjCxXnv6Tet9/LAt/vUoJzQHqeHTcUyJDrILuyyw0AEqYMo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9oSn-0003vN-9s; Mon, 16 Sep 2019 10:42:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2E02B2741A23; Mon, 16 Sep 2019 11:42:32 +0100 (BST)
Date:   Mon, 16 Sep 2019 11:42:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the arm64 tree with the
 compiler-attributes tree
Message-ID: <20190916104231.GX4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y48FV0AvvvAm5Iyr"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Y48FV0AvvvAm5Iyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  init/Kconfig

between commit:

  eb111869301e15b7373 ("compiler-types.h: add asm_inline definition")

=66rom the compiler-attributes tree and commit:

  2d122942484c20b ("Revert "init/Kconfig: Fix infinite Kconfig recursion on=
 PPC"")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc init/Kconfig
index 257e428c90472,d96127ebc44e0..cebadd0cfa50e
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -30,9 -30,9 +30,12 @@@ config CC_CAN_LIN
  config CC_HAS_ASM_GOTO
        def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
 =20
 +config CC_HAS_ASM_INLINE
 +      def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(C=
C) -x c - -c -o /dev/null)
 +
+ config TOOLS_SUPPORT_RELR
+       def_bool $(success,env "CC=3D$(CC)" "LD=3D$(LD)" "NM=3D$(NM)" "OBJC=
OPY=3D$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
+=20
  config CC_HAS_WARN_MAYBE_UNINITIALIZED
        def_bool $(cc-option,-Wmaybe-uninitialized)
        help

--Y48FV0AvvvAm5Iyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/ZxcACgkQJNaLcl1U
h9BiNgf7BUPhO+mDw5BCZm9EeRGqX2N+OfJwDTJ1+fa6mVSR7olKtg1n4raFn7Ex
hbwCpqh0IL7tS9mvQOqo64zCUmhXDrMsiGe8Zk9iODnAETVdhGYM7vMC1YMLi5et
KeNG/by+pMv56RXllDX/kXNvVAJptCUCWZAclLeHLWyb7bG2xpZfZy+3PIJlsWxU
SvwNMegCobH50m5MSrDiYsoWq80mC8pKBOEqTuP1utmKDhLJR+aFu3P3BnnAu5wE
EJieQaQ4C0TuNTcTSHVDicFQxYcTbmt8CDZcetNz27Get/pO13RYVYpnsGAKJJ60
PBvRcHuMpwZChVP7TwRpgBfDBnECTA==
=sijn
-----END PGP SIGNATURE-----

--Y48FV0AvvvAm5Iyr--
