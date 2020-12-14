Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E1B2D9228
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 05:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438522AbgLNECP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 23:02:15 -0500
Received: from ozlabs.org ([203.11.71.1]:60113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438520AbgLNECJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Dec 2020 23:02:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvSPJ1TXMz9sT6;
        Mon, 14 Dec 2020 15:01:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607918484;
        bh=9+A86C863K9HTY0WI73evwhzCirA3ZE+1KNjjB9VcwQ=;
        h=Date:From:To:Cc:Subject:From;
        b=H+2KUG9DYJ7Xc02HSu6IVaMLUcqa6kryhYbJI7XiTM4WuhuJAX8b4ZVO9Dk8o/UtB
         wq/x+ErMByBmlp2MtKohaRbMs+adzIeONPALh9kGb6cUTvnD+D9u1C4mJNZyPIj/CQ
         3RtxbEvzxeDW5P23QDofmkto4PQ439Qn40FkMwzDWJAv0dbnVJCkMmZges4yKHs3hV
         HvcrJaeSP+eJhCFEHAz8+oWe3fAJ/rJLTuO03lZbPrJ9KZxptprHYgFcZB5Z57MZfm
         /cyNOmsg+FAg/vxjBtk9/pRYdNGPYTrMIB+NtrPvIxiUowN3T5+nkLv2AutBLJzLYJ
         A6FZu8bnBESPw==
Date:   Mon, 14 Dec 2020 15:01:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Kevin Vigor <kvigor@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Song Liu <songliubraving@fb.com>
Subject: linux-next: manual merge of the block tree with the origin tree
Message-ID: <20201214150123.10807d20@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v9=/9zeQcvM64Vq6ZeVFSEl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v9=/9zeQcvM64Vq6ZeVFSEl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/md/raid10.c

between commit:

  17c28c2a0687 ("Revert "md/raid10: extend r10bio devs to raid disks"")

from the origin tree and commit:

  93decc563637 ("md/raid10: initialize r10_bio->read_slot before use.")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/raid10.c
index 3b598a3cb462,a84fa7526a53..000000000000
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@@ -1493,7 -1506,8 +1491,8 @@@ static void __make_request(struct mdde
  	r10_bio->mddev =3D mddev;
  	r10_bio->sector =3D bio->bi_iter.bi_sector;
  	r10_bio->state =3D 0;
+ 	r10_bio->read_slot =3D -1;
 -	memset(r10_bio->devs, 0, sizeof(r10_bio->devs[0]) * conf->geo.raid_disks=
);
 +	memset(r10_bio->devs, 0, sizeof(r10_bio->devs[0]) * conf->copies);
 =20
  	if (bio_data_dir(bio) =3D=3D READ)
  		raid10_read_request(mddev, bio, r10_bio);

--Sig_/v9=/9zeQcvM64Vq6ZeVFSEl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/W45MACgkQAVBC80lX
0GydcQf/T3SQQDSUqx+joYQLWnadGw8EZWesHxJ8v29HYiyMsLGAkenE17xl2/zl
qkIwtkLWKFVbrDu8mvJzr2tf65joRWpLGaceRrfSOsuCoI4xXItl2V62BGB9B/Ib
mSdXF/Th5WSaaDAGcWU2x+FbrjrMo6raR090c99wgDwt/3Yd2T/RVyQCiGXFTtMU
YZTjdjQ1xt4LwrygIN1XsiqQQBjUmeZvLLRErNaDmFibLxUfn0UNIc3lp0hwPz6H
W02KthY2WMNUucq8lBegYZS6WbIzpEfVN7gHLoWzs2h25e3mB4qB1zzUedp9d2tA
wXb0+1+dZBRV+v/pOEZsUI37QM07tg==
=zjAq
-----END PGP SIGNATURE-----

--Sig_/v9=/9zeQcvM64Vq6ZeVFSEl--
