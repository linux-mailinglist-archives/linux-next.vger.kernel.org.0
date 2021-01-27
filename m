Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C7D30511C
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239339AbhA0ElO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:41:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbhA0D3R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 22:29:17 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D90C0613D6;
        Tue, 26 Jan 2021 19:28:31 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQTZy73hLz9sWH;
        Wed, 27 Jan 2021 14:28:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611718107;
        bh=JbVRN4XtgmApcPwHmmXTSEhO8JsUiQGRisESwApMoxI=;
        h=Date:From:To:Cc:Subject:From;
        b=YGp26eAP1J96nplaP0feRoO1vIiX3s3lBrPj9XgSlygh9gQwhrwYOSJL6DL2vNJQq
         j7UbDMfuw3XpmxYvCu09avwhK1zAzLUtbHH66f2tPBo8y+DmaT/NJ2qJYm9llZd8Z2
         d/NVqv56AUBPx0I3mTAGuFPjxxsPgKesB/zhIDZRXkQKt8ns9Dm40x8y8Q33iyPMU3
         GmR7xaXik/fQGhv3yz6YTbR0Ox4ATkhw6JiALxiyepd5Ap/G0xxHw60tmb2SQJbSHm
         kX6+z4T8B4epY0cYOzduTE4FxmCvZa+4LrgdRjDNyQW9/1KIN6N2yrTSDRElSlBgDk
         /1Ub5RtW78Dsw==
Date:   Wed, 27 Jan 2021 14:28:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with the fscache tree
Message-ID: <20210127142825.625c45bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZpWqrVT1DuQ7yX/Jk=L3U7Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZpWqrVT1DuQ7yX/Jk=L3U7Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  lib/iov_iter.c

between commit:

  11432a3cc061 ("iov_iter: Add ITER_XARRAY")

from the fscache tree and commit:

  54c8195b4ebe ("iov_iter: optimise bvec iov_iter_advance()")

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

diff --cc lib/iov_iter.c
index f53a57588489,e55357f09f71..000000000000
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@@ -1145,12 -1090,11 +1158,16 @@@ void iov_iter_advance(struct iov_iter *
  		i->count -=3D size;
  		return;
  	}
+ 	if (iov_iter_is_bvec(i)) {
+ 		iov_iter_bvec_advance(i, size);
+ 		return;
+ 	}
 -	iterate_and_advance(i, size, v, 0, 0, 0)
 +	if (unlikely(iov_iter_is_xarray(i))) {
 +		i->iov_offset +=3D size;
 +		i->count -=3D size;
 +		return;
 +	}
 +	iterate_and_advance(i, size, v, 0, 0, 0, 0)
  }
  EXPORT_SYMBOL(iov_iter_advance);
 =20

--Sig_/ZpWqrVT1DuQ7yX/Jk=L3U7Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQ3dkACgkQAVBC80lX
0GzhXAgAjcBxg1f6r2G8oZOuZG4XM/IDmFPAnyprOjtmIma0IER6cpar2wE2uatl
ROw9M0RXnfTiwmReiBdHYJwQ8v6ajv5nWtibr81GO443FO7nFBbqbhe1+Jd1o4Vm
FNa3LORottAu3+atWz7AnmO4ZuLNjpRKl+/4nP/xZxVXTZmmsewwFGHrqfO2WQj0
TXguxFZNvb7mkvt6F5Wr9jmYPaEN6Zt9PMCaOUTkvk1l8JdeGsUa9peovxx/dQgX
xRd6HqYRSX0l6prvYl8XOcI4YLAPRRKnwTt9xUG7RjW9RFOpm/KheexyOn4/M6EW
T6Buq2lgFx8OlOyySsp54RvX2nQgvQ==
=XrSz
-----END PGP SIGNATURE-----

--Sig_/ZpWqrVT1DuQ7yX/Jk=L3U7Y--
