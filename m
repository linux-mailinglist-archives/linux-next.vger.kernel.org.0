Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0723E50C9
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 03:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236501AbhHJBzd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 21:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236481AbhHJBzd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 21:55:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E055C0613D3;
        Mon,  9 Aug 2021 18:55:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkGHH0CjQz9sX5;
        Tue, 10 Aug 2021 11:55:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628560508;
        bh=aoPKbT5fndLKSdVrshsTacs3H5b9TMoIS4mCUFOcQ3A=;
        h=Date:From:To:Cc:Subject:From;
        b=iFjyoVw6gE+BuvguLNraOfg6VUywGhuBK9ygxMlWq0BFQ/zfC3lnzyDE1a15laBiH
         KAm3PUs4G17MxWvOQsiGzXfSKYNnsojrcthXSPltWSWXF37ZlV+GPKOVkiJNycsSS9
         2FEvNZD0pdNbrFA8wen1HEOJiAt3XUTVGxpD8upsWkGGgtBAEdNJmOnic7rxSsoy1O
         ETD6SK2aJOH+qTyVDDD08mY+hgrbA1x+LtMZQ+eU2/4lvnWrnNs0sf5zT+3RuSY3lT
         lZVQmn8k89cHij9RAzsgcbOSDm2fyLIdtjN7gG3HUpdKbZeae7cUyBl5Dd5v64eWJu
         bIeQ5LnHfLcRA==
Date:   Tue, 10 Aug 2021 11:55:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Message-ID: <20210810115504.79d24799@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ddxFlyEPSImG0iHYTvZd0cD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ddxFlyEPSImG0iHYTvZd0cD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm.c

between commit:

  89f871af1b26 ("dm: delay registering the gendisk")

from the block tree and commit:

  0a3bec81a409 ("dm ima: measure data on table load")

from the device-mapper tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm.c
index 7981b7287628,2e82757b4ab7..000000000000
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@@ -1997,6 -2001,14 +1998,8 @@@ int dm_create(int minor, struct mapped_
  	if (!md)
  		return -ENXIO;
 =20
 -	r =3D dm_sysfs_init(md);
 -	if (r) {
 -		free_dev(md);
 -		return r;
 -	}
 -
+ 	dm_ima_reset_data(md);
+=20
  	*result =3D md;
  	return 0;
  }

--Sig_/ddxFlyEPSImG0iHYTvZd0cD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmER3HgACgkQAVBC80lX
0GwlSgf+PYnOvhyQwXFZ5OKIPIL6KNtwaa2O7RJXaJl07fuHQVe+kWkze/NYIQFw
JXZf/6MYMQfzxkHt2BttmYPuxQcmyn04tBbcx5Uag8JEqnl0Bns3ASv9wVo+0p7w
jKxa3aLMUfNkVKSrtY5gOq4fl5PzbFTHdB6iVHpm6ygZ6UqXc17jioDQ0Pe3cxVm
cj1OgG7IvORAKtXDuJl2llNTLSAaMuor7GzkhvknOllVFiCUcB8zrpDaDyh1TlcI
VjKHl5MCNtohr6wOTYmqLrl2u0lE3edNAkphsFcXdTobwHwepWJvdPAUAvkArdg3
X8q3I5I1lgjhjmnCXmLhof0YWdGWgA==
=jv5F
-----END PGP SIGNATURE-----

--Sig_/ddxFlyEPSImG0iHYTvZd0cD--
