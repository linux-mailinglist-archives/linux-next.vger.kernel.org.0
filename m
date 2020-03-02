Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80207176815
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 00:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgCBXZg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 18:25:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58635 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbgCBXZg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Mar 2020 18:25:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Wbq12bG1z9sSN;
        Tue,  3 Mar 2020 10:25:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583191533;
        bh=y2qlCjjTFOCCt5mgeBh0PcMBGGz27m+6/Ieaf0dvbCM=;
        h=Date:From:To:Cc:Subject:From;
        b=XbsezIDMZSPyNhHGAtO/4cUhjJ2wlTdbMgb0FOM9aD+HCJir8pZo+r+wECIDhIGYN
         LVYkq8/nmTGToZAh2A8B6Bd3b2S3daJM4xcDE0LmoDRFYbKt/9nAfPir75Xw9v3Wts
         3A7EM8LlbG0TABFfXSN6FbTqM27Rl+IriFMLbNQJsZ3+WEYZBAgOVNAdnPgDBM7QOl
         F7mHdxJ5tjSALnJ55RNqvnJZuQ6rAp0P+AE0KBQAxGP9aUaMa3BGxjtVJ7DK5K+qez
         UR9ulfxasPX3nsxfsvmFXcsCC+bb35E2tq1TXUxTArjXMWdNHPVwl7T+61qBEYM48I
         1vZpEOh/OFvPg==
Date:   Tue, 3 Mar 2020 10:25:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with Linus' tree
Message-ID: <20200303102523.0b3b4e52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ua05MdXoOqRfMvbYTbMkgEv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ua05MdXoOqRfMvbYTbMkgEv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/filesystems/zonefs.rst

between commit:

  4c5fd3b791a0 ("zonefs: fix documentation typos etc.")

from Linus' tree and commit:

  9a6108124c1d ("docs: filesystems: convert zonefs.txt to ReST")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/zonefs.rst
index d54fa98ac158,7e733e751e98..000000000000
--- a/Documentation/filesystems/zonefs.rst
+++ b/Documentation/filesystems/zonefs.rst
@@@ -301,7 -308,8 +308,8 @@@ Mount option
 =20
  zonefs define the "errors=3D<behavior>" mount option to allow the user to=
 specify
  zonefs behavior in response to I/O errors, inode size inconsistencies or =
zone
 -condition chages. The defined behaviors are as follow:
 +condition changes. The defined behaviors are as follow:
+=20
  * remount-ro (default)
  * zone-ro
  * zone-offline

--Sig_/ua05MdXoOqRfMvbYTbMkgEv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5dleMACgkQAVBC80lX
0GxTygf9GQA6rR4DPbEoVrs2TwZKZXskfqiyMRQXc/T5RlG70D6to4IUFVHOuYAv
bubD8mJjPkoAfkXSVX2WrGqgMWlemTcG7fuE3y2CMP60JpTs9/zvJCGkoclmMjhG
L4THZfK3LWHDQQTDkFxw05svfw5LVkX5v3iD/LlrZHyLXzdr7xLkAfGCwPIl8LzU
3spp/P10mF7Fbhxx/FJGvv3HJfK0dirxlBO+jvMJ8l3Atwamtw4Alw5S5Kdhkgfv
gA8O704xX7EwHYn3VGeHRhAo9aG8C83sBRvg/UHiIdcAMza4MINVnnd4o6x9+dUf
2prvZHjJppnkFzP4uwbj5FfEcFPP4g==
=bhy6
-----END PGP SIGNATURE-----

--Sig_/ua05MdXoOqRfMvbYTbMkgEv--
