Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C9431D386
	for <lists+linux-next@lfdr.de>; Wed, 17 Feb 2021 02:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhBQBHF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Feb 2021 20:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbhBQBHE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2021 20:07:04 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3BCC061574;
        Tue, 16 Feb 2021 17:06:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DgKRH1v58z9rx8;
        Wed, 17 Feb 2021 12:06:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613523982;
        bh=RRzkqdL37ji72TSNLKK1EnP8N9KbpqruLJNYdU6zsVg=;
        h=Date:From:To:Cc:Subject:From;
        b=jJ2tZ7L+0hj83UJ59qTAzTSEtxI6Bwx9eKnAmVeRGL/AtjjOefF0LZfcSqhb4EKX7
         Fd9scFKDXRSMIkDgCdqSJ/02o/GvskpmW9cqIuoyWs7OUENBI7SyBAOsAkvtckBkOa
         Nk5SGw8OIZMuZqUwI9xJymARrYOMr1y9bTX/pZi8Fa7DX3LSDZ0aK1Yh4K5o5+Cclc
         QvdN2l0T8GYrTQUYlhH8FM7SQ0ka7s8AcHY2/Mf0qAs9y2zHRthyMf3o83DAlW7jVT
         Wz8imQe82CYZHms9L64+UdQL+U3aHZxOo1xljnItheNx+tUehBaUlFd3nlwC+iCE96
         A2nwAkq7IkyzA==
Date:   Wed, 17 Feb 2021 12:06:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the pm tree with the i3c tree
Message-ID: <20210217120617.61b22e5e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oi1JKT2qPaLEnZh0.EjaeV4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oi1JKT2qPaLEnZh0.EjaeV4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  MAINTAINERS

between commit:

  f06a1af8e739 ("MAINTAINERS: Add Silvaco I3C master")

from the i3c tree and commit:

  4590d98f5a4f ("sfi: Remove framework for deprecated firmware")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index fdb32f96ede9,f7ec274a3e5a..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -16221,21 -16235,6 +16218,14 @@@ S:	Maintaine
  F:	Documentation/fb/sm712fb.rst
  F:	drivers/video/fbdev/sm712*
 =20
 +SILVACO I3C DUAL-ROLE MASTER
 +M:	Miquel Raynal <miquel.raynal@bootlin.com>
 +M:	Conor Culhane <conor.culhane@silvaco.com>
 +L:	linux-i3c@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
 +F:	drivers/i3c/master/svc-i3c-master.c
 +
- SIMPLE FIRMWARE INTERFACE (SFI)
- S:	Obsolete
- W:	http://simplefirmware.org/
- F:	arch/x86/platform/sfi/
- F:	drivers/sfi/
- F:	include/linux/sfi*.h
-=20
  SIMPLEFB FB DRIVER
  M:	Hans de Goede <hdegoede@redhat.com>
  L:	linux-fbdev@vger.kernel.org

--Sig_/oi1JKT2qPaLEnZh0.EjaeV4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAsbAkACgkQAVBC80lX
0GykCgf9Ej3Of3aQhseiJHFRupOw8mZOvylyWsOqtrFy46hP2HFo13MDLvgZoWts
5RBA2+MFyMw2aZ8YQz4GEKeARtYvp6WkzSk80F0DUp5ZlkKlEEX8efTEA0AQBflF
eucD3toocScKuGMkRJIs5NXsszqWx/LLhz63uq2uJi9ZG76cqdPF/e16zAFKumMk
JyCc0c1rBX91F1Au8//H/XZod4unctfdbXoYETnRNQbIEUmFW7Iq0WdbcMMiOu8l
XTX0WXeXqh6sT0z+7AwVwTmZirLSuIj2RMTjt0Fxi2uUZqq/yXhjJ1lKNA8RaU4Z
tDTHCdm6koMo0i85j0PNo0PMScquzA==
=dMwo
-----END PGP SIGNATURE-----

--Sig_/oi1JKT2qPaLEnZh0.EjaeV4--
