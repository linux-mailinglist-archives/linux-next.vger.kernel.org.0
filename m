Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFD0618282B
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 06:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387739AbgCLFRI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 01:17:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387677AbgCLFRH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 01:17:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dHBR5sPSz9sNg;
        Thu, 12 Mar 2020 16:17:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583990225;
        bh=+3AwsPpHCeb/RyP/Narc475nvziZ1cURXT4Ze8f/8fE=;
        h=Date:From:To:Cc:Subject:From;
        b=KNtjflFEUYka1UZeUDFT/X0Dx/Vi+e/DnMbgl3m/yAS365gllMrqm+w3xM6G7vDk6
         q1+1TAKVo7Mt0uCZUkV6oJ0Jl6QBRU6gYeJmdloDJiXZ/wpz74jvkMgo+YG196FBkK
         DaT4QNj2oC8lsKF0JskpDWhymH0pItl9NFgZ5BgCvVv5eCyILxtVmMWQb/Dl05orve
         zeNeCxt2+a6jarLRi8gPF5bIS4NZNvdqcP9hda7Sy/JO/H6UmzwZmxeMAYlDRCCTXE
         ytKD0JpnEYa1eTIojB2C4rXM1g7PK3nTJszLy9gq+/vUYEJgZrgoOn2j7FfZLQfXLC
         f3HNMHa8VayRA==
Date:   Thu, 12 Mar 2020 16:16:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Namjae Jeon <namjae.jeon@samsung.com>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Message-ID: <20200312161657.57abd6c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hhH77Ac4SP7uwLa4OQbKUn/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hhH77Ac4SP7uwLa4OQbKUn/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/exfat/Kconfig
  MAINTAINERS

between commits:

  88ab55f16aae ("MAINTAINERS: add exfat filesystem")
  1a3c0509ce83 ("staging: exfat: make staging/exfat and fs/exfat mutually e=
xclusive")

from the vfs tree and commit:

  590a95e418d1 ("staging: exfat: remove staging version of exfat filesystem=
")

from the staging tree.

I fixed it up (I removed the first file and see below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

diff --cc MAINTAINERS
index 4698de48c727,836f1e262b4e..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -6361,19 -6301,6 +6356,13 @@@ F:	include/trace/events/mdio.
  F:	include/uapi/linux/mdio.h
  F:	include/uapi/linux/mii.h
 =20
 +EXFAT FILE SYSTEM
 +M:	Namjae Jeon <namjae.jeon@samsung.com>
 +M:	Sungjong Seo <sj1557.seo@samsung.com>
 +L:	linux-fsdevel@vger.kernel.org
 +S:	Maintained
 +F:	fs/exfat/
 +
- EXFAT FILE SYSTEM
- M:	Valdis Kletnieks <valdis.kletnieks@vt.edu>
- L:	linux-fsdevel@vger.kernel.org
- S:	Maintained
- F:	drivers/staging/exfat/
-=20
  EXT2 FILE SYSTEM
  M:	Jan Kara <jack@suse.com>
  L:	linux-ext4@vger.kernel.org

--=20
Cheers,
Stephen Rothwell

--Sig_/hhH77Ac4SP7uwLa4OQbKUn/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5pxckACgkQAVBC80lX
0Gzl9Qf+OAHFNrC5XHHetF4YEvpkn8866fB0Sc+r9911RrglcPoYYCNi74ekZ1Ud
5dAPJGURf0vJzF+kjSmU9qt9gu8SLzYzrU3uaXuDNAUXywwreLkgSVxDgdhvcNBx
SuFdO5rU5g7lm3/ZCM8aIYUrlVSlm2E++ZcMTHEEmw2fDroouVahhEVqgS1dLo2I
QeZA0FvGiXUFYNIR+cCVcf2BW5Nedrvs7LT8VJNmLCYX8YlnCgpLOKqQBpuGyXP/
jifp3G0YuHzqqvxWN7Plym2Wyba+3pVXUWHHP4/bNEO+vV28kOTrz/auOlbMJscD
uSlnT/UB61FzGoEcM8bhClhwN3KZDw==
=CB5t
-----END PGP SIGNATURE-----

--Sig_/hhH77Ac4SP7uwLa4OQbKUn/--
