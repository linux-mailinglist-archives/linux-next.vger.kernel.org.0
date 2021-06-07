Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F2C39D260
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 02:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhFGA3f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Jun 2021 20:29:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55093 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229772AbhFGA3f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Jun 2021 20:29:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FyvMy6Mbdz9sPf;
        Mon,  7 Jun 2021 10:27:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623025663;
        bh=r4rdCsZV0alb4f5aKhXBr6OwsAvgLial/NJLF5WlbWI=;
        h=Date:From:To:Cc:Subject:From;
        b=dPFANbnkt5l21z2Lt7y1d6I+fXuoeIX6osLfpVMccVrxDVsLRiElA580mLswth19H
         assp6LQ8zzmjRnUkq6xw5bf+tFh8PchBij+9Pih5fKk0g6A4pw9A4kG2uqmr5KKEJy
         RKoYCaBcZ4d5FgRkDU59K77q8KS6sz5QDJnHxxCFU6TpqE09LMArqApA1qgGOaOK+Y
         q7jWdkje93lwmgnF+bzWzq9R+Cg8pg6nZIPw2VjL7eCHpVWVg5JTKiZh7xvZg65AHw
         ry0m2Gwiin3P9SWfUCIQPpcDGR+Ojr/ZcyjXrvKm8sldMlcvW+FSdMJZ2jisZhnSC+
         IOyH1sNUzrPWw==
Date:   Mon, 7 Jun 2021 10:27:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Leah Rumancik <leah.rumancik@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the ext4 tree with Linus' tree
Message-ID: <20210607102740.55c10d82@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3m38Qe1iGhm5mDXY0p0Umom";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3m38Qe1iGhm5mDXY0p0Umom
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/ioctl.c

between commit:

  4db5c2e6236f ("ext4: convert to fileattr")

from Linus' tree and commit:

  339183dfb87c ("ext4: add ioctl EXT4_IOC_CHECKPOINT")

from the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/ioctl.c
index 31627f7dc5cd,d25eaec1afdc..000000000000
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@@ -1291,6 -1455,9 +1335,7 @@@ long ext4_compat_ioctl(struct file *fil
  	case EXT4_IOC_CLEAR_ES_CACHE:
  	case EXT4_IOC_GETSTATE:
  	case EXT4_IOC_GET_ES_CACHE:
 -	case FS_IOC_FSGETXATTR:
 -	case FS_IOC_FSSETXATTR:
+ 	case EXT4_IOC_CHECKPOINT:
  		break;
  	default:
  		return -ENOIOCTLCMD;

--Sig_/3m38Qe1iGhm5mDXY0p0Umom
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC9Z/wACgkQAVBC80lX
0GxF/Qf+Kn1wOxf9+Ef/wuLz1RRE/9YWxQp7zOAdCRUAnj6qzKQpxc2tp1CAJ3BG
Rn+W/ZXpFfQahj3QwL8TTdvlybAE54mMtRxKQRbDLNPMewYW1+bW2KhU0EV3bHJF
60roHWV/0Sg472VQgOZR2YXgRvySJx3o1sb5tbGtDWnDWa7sPyPgUlKUZquK7X/L
5CSSLzaYz8doszfgriyhNYqgJ34wLgvsw+nYv0PuBgT20DWbGgeDfRI0x8WFlK+0
ovAcpi0HvDhSbpfWlywlJw8Mt2xyi72uA5wTvuIRze9Em++otlH9MEKxEDcRABjo
hog/royNk5RH79vaLE7BN6qyYgJlDQ==
=ezeJ
-----END PGP SIGNATURE-----

--Sig_/3m38Qe1iGhm5mDXY0p0Umom--
