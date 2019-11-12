Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 920B5F8608
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfKLB0L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:26:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58487 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726924AbfKLB0K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Nov 2019 20:26:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Bqnp5hdDz9sP4;
        Tue, 12 Nov 2019 12:26:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573521967;
        bh=W3s43Z88oXu9pIzwh9tpxWxTIX0x+AKU7y4WkOJAJLU=;
        h=Date:From:To:Cc:Subject:From;
        b=PMNCkg1dPaIOFB2udaVC1OEaTsXRpJArXHX0cZ06bnoX1VtGSzJQOkByoFk/hqlOg
         +7/S9uONnUGWp4ik3Nq+YVXwSO7zymBCMUXSS+YPOa1QJdYIcIPZM+/q2+OXgKBRwc
         ft+9v923TbQYHD448mj7X/Ok378ffQbeVMbLj670hMXCgNme6hRRgj1cf7NXm/mlqj
         kcC52k1KnPONY7qQ+S/HasGmXeSoiFbOz7P9c4lUGmKCw0Ky2V35QYsck9zie9KfQS
         YwkiupwJYQtTuaK32mZ5JM3mCrMZ/vOSbhjnG5kvNM8fffcn7CWydAUR69VtYTMppt
         ztByroEfEWBOQ==
Date:   Tue, 12 Nov 2019 12:26:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Message-ID: <20191112122600.44c88517@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tbsT14jj.cYO1DXCXtXJWY+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tbsT14jj.cYO1DXCXtXJWY+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/codecs/Kconfig

between commit:

  82e8d723e9e6 ("sound: Fix Kconfig indentation")

from the sound tree and commit:

  36da67630d31 ("ASoC: Add DA7213 audio codec as selectable option")

from the sound-asoc tree.

I fixed it up (I just used the latter version which also fixed the
indentation) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tbsT14jj.cYO1DXCXtXJWY+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3KCigACgkQAVBC80lX
0GygNggAnqffmZmmQ79iQHL1v2XBl3A1VHEMikEKrQ/QDzTms1cGmqYjVaqj7RO8
y+s1SYf5MOCDbIGJF2bp3TgA+RbWal6I/LpfNyXFPazCsNkOhwakwh9T/b+DNGZo
vtBvZ/rit/iCqhXfVNceDk131FCbEPRsJc+rLfx2iB3R7JaLKM5dAfmxmUG6/djz
PM9eFVd6fPmgQ2lDBciN6I8E+7ZkWFfLzhZt2Fhxwgaha24wyBoJqL9d58nE6r1A
daMse50qNfLccFCl4n+hHqy9NrTs3Dvk5b4Jjue/mpQzSv4CHJAyRAxOkGsMHfp+
hHqj0/YV6kAoReE3sanOdRTu2hhPJw==
=r86P
-----END PGP SIGNATURE-----

--Sig_/tbsT14jj.cYO1DXCXtXJWY+--
