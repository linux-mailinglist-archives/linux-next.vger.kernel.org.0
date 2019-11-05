Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83CA4F0833
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 22:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730066AbfKEVWw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 16:22:52 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48023 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729952AbfKEVWv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 16:22:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4772gq4VYgz9sP7;
        Wed,  6 Nov 2019 08:22:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572988968;
        bh=zywVva0ZBOfdybEjdBINGJ/0N97yn4UwL3DesnQS+OY=;
        h=Date:From:To:Cc:Subject:From;
        b=RXJ/YZeqpLk8GNUqVRmlhjXLAOydGLQEmhlPe8BFvD2WjTtuMI+pryDHdOmrTTAdC
         iNXbDLpJWY5KhDKyI2qPRAxRV0MPLiaBkCT9ebsbZ26TuTyCK5SbQzAcSZdhrb8sjp
         40FBMEUyPipu3c6F1s3HyKPBIMnLrzf5rB2rlcDHWtyvtYlbNPK1rGSlUW+if1W8RT
         isB/AFJW/XiyxBApvaqFUhNqjohAKmueKIOYy7cvAXju/djecKXM2rG25VahEdAn2y
         0kzMUtI8LkCeRrr4ndwym1NyZDQ6Oc6NMmYhYLz5Q36PwzXF4aeWhtDkKxdqfVWPHp
         dzr3URZ+mmydg==
Date:   Wed, 6 Nov 2019 08:22:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: linux-next: manual merge of the scsi-fixes tree with Linus' tree
Message-ID: <20191106082239.5c4d139c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZysMXdOiGlPzDvQVS6aO3JG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZysMXdOiGlPzDvQVS6aO3JG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-fixes tree got a conflict in:

  drivers/scsi/sd_zbc.c

between commit:

  d81e9d494354 ("scsi: implement REQ_OP_ZONE_RESET_ALL")

from Linus' tree and commit:

  8437bb81853e ("scsi: sd_zbc: Fix sd_zbc_complete()")

from the scsi-fixes tree.

8437bb81853e claims to fix d81e9d494354, however the latter is not an
ancestor of the former ...

I fixed it up (I just used the scsi-fixes tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZysMXdOiGlPzDvQVS6aO3JG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3B6B8ACgkQAVBC80lX
0Gzpbgf9GVHw5M+cfIDkdJVYs3yYVK3B8iX+7v60l7XTqMgppEqopuyJKLqyRpOs
QvfhtK8ZO5e+H9XwfpAxOT4Y1UI7LrnmzmKc9gk2eTPT3YgiVbtL3eGnKjbnzgF3
TN4RNaKPUQ7ujVl2MCfhB9mnkigUqID/YRHu11qCumtEX5pPrZtploykgjTv86No
EzjdCQ2U6Wauq83FfvrIra6BFOzucj4a0Qx0Ik8lNIJK+/uCGjrhHgZWuBVf168d
YVFhA9iZGHv6SDbx6d0i9nqlvwdhiO6psSRHT/iMztJ9UJbqiotZXD1BcX6qADIb
ZI04ePW4zCGYhg7QgtxkU7LKFg73Lw==
=/OVe
-----END PGP SIGNATURE-----

--Sig_/ZysMXdOiGlPzDvQVS6aO3JG--
