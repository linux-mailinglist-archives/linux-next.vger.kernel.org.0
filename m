Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E3D3F4265
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 01:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhHVXjy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Aug 2021 19:39:54 -0400
Received: from ozlabs.org ([203.11.71.1]:58503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229969AbhHVXjw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Aug 2021 19:39:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtBfG3xvBz9sW8;
        Mon, 23 Aug 2021 09:39:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629675544;
        bh=1sz5u3AauCDCg/fz1WO6AJrZt+kY3RAZZ5f0McBDyp4=;
        h=Date:From:To:Cc:Subject:From;
        b=YlvoTscNGCEoZsJwZiiaJCpubkIg3a6pDuDHVtGP3ORayZBsL4tfHTObl6EGxdhlv
         g6AfBKGMnVMYoztDR9XbqIyMXwh2YIlvXaXLqQ1TMEx6RFjixL1tKiEU0j7+YR1Lnm
         DZsSlYO6Pk/X9+FS8AEksyfxchZqOT4LdIwN7deWANHytbn/hQdA2uYfNP4sEY+Pnz
         t3/yU8169X4ca5f4fxVqItdSExI0CIDMNRr2/rnVur2r6BvOp404VFYeRc87fQjOCw
         i6QADWoY1j2KyIco326qZLkQM1t+jDBetaWITYuAkQC9cU/v/1YBX+8SNvahCcTuBs
         0DW+qiWwIZyxQ==
Date:   Mon, 23 Aug 2021 09:39:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Hyunchul Lee <hyc.lee@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steve French <stfrench@microsoft.com>
Subject: linux-next: manual merge of the cifsd tree with the cifs tree
Message-ID: <20210823093901.4b24a10d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cHrfN6G=BHIzbeUpFo=_KYd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cHrfN6G=BHIzbeUpFo=_KYd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cifsd tree got a conflict in:

  fs/Kconfig

between commit:

  ac3e4db1b38c ("cifs: fork arc4 and create a separate module for it for ci=
fs and other users")

from the cifs tree and commits:

  a848c4f15ab6 ("cifsd: add Kconfig and Makefile")
  1a93084b9a89 ("ksmbd: move fs/cifsd to fs/ksmbd")

from the cifsd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/Kconfig
index 6d719f2c5828,720c38f484c6..000000000000
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@@ -358,14 -343,8 +358,15 @@@ config NFS_V4_2_SSC_HELPE
 =20
  source "net/sunrpc/Kconfig"
  source "fs/ceph/Kconfig"
 +
  source "fs/cifs/Kconfig"
 +
 +config CIFS_COMMON
 +	tristate
 +	default y if CIFS=3Dy
 +	default m if CIFS=3Dm
 +
+ source "fs/ksmbd/Kconfig"
  source "fs/coda/Kconfig"
  source "fs/afs/Kconfig"
  source "fs/9p/Kconfig"

--Sig_/cHrfN6G=BHIzbeUpFo=_KYd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEi4BUACgkQAVBC80lX
0Gzy5Af/Xs6eRqwfcahQXxbOjoAxM2X1r/BkeAuV923OybxPv4QCNMdrSy8CfATF
WncJAfvf/lIONOdJLkMYg89Ynvg4oPT6FsVqki0UKimQOeE8ZUmWkn15l13+zITA
OCJsR8i7TUATUmn8TKlMrrLQCy7ZeRhEjdDgjwNdbK+hIGMrjbs4YC3X0aZKMAmb
by4DGyQ3PYkaD7Q1QcG1+K4hpnAWOoHrTlIz1C8M3uLyIaa4mHUImWNFaAGfXMH5
WLqY31RjQE35mfa+Vzh3ohI2MFgzmqlThY223dRqUzECscXx7sNwNscf456B+u+z
w9goGX85Ja3Ra8XwClw5/XYXKuBjSQ==
=GveZ
-----END PGP SIGNATURE-----

--Sig_/cHrfN6G=BHIzbeUpFo=_KYd--
