Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4C045B0CC
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 01:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhKXAli (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 19:41:38 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:38841 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhKXAli (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 19:41:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzMYt5SLJz4xcK;
        Wed, 24 Nov 2021 11:38:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637714308;
        bh=B7rrDtDcspEyxt8KXHSEFf7i51lb5phCWSVYpKaBdFU=;
        h=Date:From:To:Cc:Subject:From;
        b=cPioaWmnno9XmzbohZNvr/ecyfNgyqahn4J9zZ2qsV3KySwI6E7Dh8qaZhghoVcgg
         AU1S6kYjCK+FwZbRf0kJWWqvqQS1UDjEATM6T1oQfw689u7wAnvvNHeLy2V47UW2mL
         WDa9cpHWXspEmr/ExFJ/aAKqF0fGU78/Ye7PTrEP2D8dTSZsKdbc0L79VEvGPfjVxf
         KQaC+h3dhjlA+WwqsIEHAPlVL+FVVUXoyO8qbNLbiLmEDTP3j6EYO6WUfcJw1DlIba
         +VCw9saIYRvzrD5+cd/JjOBYmvKLNpaLAzf1lwWVDW4J0E5ldFcUJKTh5m1SP+hY7K
         PB6pnNgVHtmkQ==
Date:   Wed, 24 Nov 2021 11:38:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tomoyo tree with the block tree
Message-ID: <20211124113825.2d9de813@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eDryevQj.qE_nL1MPiCA+YR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eDryevQj.qE_nL1MPiCA+YR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tomoyo tree got a conflict in:

  drivers/block/loop.c

between commit:

  3793b8e18186 ("block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL_NO_PART")

from the block tree and commits:

  dfb2cc3b7f7e ("loop: don't hold lo_mutex during __loop_clr_fd()")
  51d5ae114da8 ("loop: replace loop_validate_mutex with loop_validate_spinl=
ock")

from the tomoyo tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/block/loop.c
index 0954ea8cf9e3,6ebfa156fd9b..000000000000
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@@ -1061,9 -1041,9 +1041,9 @@@ static int loop_configure(struct loop_d
  		lo->lo_flags |=3D LO_FLAGS_PARTSCAN;
  	partscan =3D lo->lo_flags & LO_FLAGS_PARTSCAN;
  	if (partscan)
 -		lo->lo_disk->flags &=3D ~GENHD_FL_NO_PART_SCAN;
 +		lo->lo_disk->flags &=3D ~GENHD_FL_NO_PART;
 =20
- 	loop_global_unlock(lo, is_loop);
+ 	loop_update_state(lo, Lo_bound);
  	if (partscan)
  		loop_reread_partitions(lo);
  	if (!(mode & FMODE_EXCL))
@@@ -1181,19 -1142,14 +1142,14 @@@ static void __loop_clr_fd(struct loop_d
 =20
  	/*
  	 * lo->lo_state is set to Lo_unbound here after above partscan has
- 	 * finished.
- 	 *
- 	 * There cannot be anybody else entering __loop_clr_fd() as
- 	 * lo->lo_backing_file is already cleared and Lo_rundown state
- 	 * protects us from all the other places trying to change the 'lo'
- 	 * device.
+ 	 * finished. There cannot be anybody else entering __loop_clr_fd() as
+ 	 * Lo_rundown state protects us from all the other places trying to
+ 	 * change the 'lo' device.
  	 */
- 	mutex_lock(&lo->lo_mutex);
  	lo->lo_flags =3D 0;
  	if (!part_shift)
 -		lo->lo_disk->flags |=3D GENHD_FL_NO_PART_SCAN;
 +		lo->lo_disk->flags |=3D GENHD_FL_NO_PART;
- 	lo->lo_state =3D Lo_unbound;
- 	mutex_unlock(&lo->lo_mutex);
+ 	loop_update_state(lo, Lo_unbound);
 =20
  	/*
  	 * Need not hold lo_mutex to fput backing file. Calling fput holding
@@@ -2032,9 -1985,11 +1985,10 @@@ static int loop_add(int i
  	 * userspace tools. Parameters like this in general should be avoided.
  	 */
  	if (!part_shift)
 -		disk->flags |=3D GENHD_FL_NO_PART_SCAN;
 -	disk->flags |=3D GENHD_FL_EXT_DEVT;
 +		disk->flags |=3D GENHD_FL_NO_PART;
  	atomic_set(&lo->lo_refcnt, 0);
  	mutex_init(&lo->lo_mutex);
+ 	loop_update_state(lo, Lo_unbound);
  	lo->lo_number		=3D i;
  	spin_lock_init(&lo->lo_lock);
  	spin_lock_init(&lo->lo_work_lock);

--Sig_/eDryevQj.qE_nL1MPiCA+YR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGdiYEACgkQAVBC80lX
0GyUgwgAkDLtikz3JVTUbIhxs65Meb0DeToQZhvUpikLogi9uYZj17Eq75lhOxId
8bFqWrVAlOX/R0VBa5/jGcI2es7Kr410nRG4WdeB2iDDhO+0FrxnGF9I/9QqIKiu
itB0zBy/VdXaQTPDXe5mHHJPlGxlI4rhb6KlTIeCCA/4agFS7K/ILw/l1nXJXnJ7
Awh4XdyMLvik7Lf6xW9dNa0sYCRg2waWrQ9TqaXZ8QUvK/xUN1sPcoe7ySeGJANd
S8namb2cJu8fhm25Q+8QYbAU6TbpBXw81MJGVc12Db5re8/ETtyUhRCS+qADyize
Eob9VYm2eApOFhk8uBSEDzoDSNVI4w==
=PvwN
-----END PGP SIGNATURE-----

--Sig_/eDryevQj.qE_nL1MPiCA+YR--
