Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD21223898
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 11:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQJmY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 05:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgGQJmY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 05:42:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B9EC061755;
        Fri, 17 Jul 2020 02:42:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7R3x5gyrz9sRR;
        Fri, 17 Jul 2020 19:42:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594978942;
        bh=8l+VVRwt/1/X+Sp2SWJCe4e3X9Pf36Mkns2s5phL8CQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ZQ/I44b3r/HnlGiaZWF85Zk+6pLHoQ6XZXW1mX1xlqh/a7gxAlPX1L5PAOlsZOycY
         xTaA2NlqZA8QyUtYGFLm2txataRLxIhAitMu+CsrQBc1QCd2TiT6InEsuCNN/wH8MX
         fVFBCLhFEUINQMfoj6aAtpaqN5RwJsx9Rcu04e41cQYJWvBO9zSd5wcDe8wekGo8gC
         x/hkqDFHpavRR7fWTHvDrzOIqDD/aiTi8F5/RMC/Vp3Uv2maRrbRqcbcm0FW0yJ+Lw
         ILY6UzUg7n1FLK2QwEaDuPE6ac/Y+9YicUKld1y9BFTyNDVJjKi6z9hakIwHsz1W7P
         qnMqkK33NydLw==
Date:   Fri, 17 Jul 2020 19:42:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the init tree with the block tree
Message-ID: <20200717194221.146ab662@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DoOX.LRKhMCrGAH/jmM=5xQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DoOX.LRKhMCrGAH/jmM=5xQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the init tree got a conflict in:

  drivers/md/md.c

between commit:

  a564e23f0f99 ("md: switch to ->check_events for media change notification=
s")

from the block tree and commit:

  7e0adbfc20c5 ("md: rewrite md_setup_drive to avoid ioctls")

from the init tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/md.c
index 5b6d46741baa,ee622b67424e..000000000000
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@@ -7836,21 -7790,23 +7820,21 @@@ static void md_release(struct gendisk *
  	mddev_put(mddev);
  }
 =20
 -static int md_media_changed(struct gendisk *disk)
 -{
 -	struct mddev *mddev =3D disk->private_data;
 -
 -	return mddev->changed;
 -}
 -
 -static int md_revalidate(struct gendisk *disk)
 +static unsigned int md_check_events(struct gendisk *disk, unsigned int cl=
earing)
  {
  	struct mddev *mddev =3D disk->private_data;
 +	unsigned int ret =3D 0;
 =20
 +	if (mddev->changed)
 +		ret =3D DISK_EVENT_MEDIA_CHANGE;
  	mddev->changed =3D 0;
 -	return 0;
 +	return ret;
  }
 +
- static const struct block_device_operations md_fops =3D
+ const struct block_device_operations md_fops =3D
  {
  	.owner		=3D THIS_MODULE,
 +	.submit_bio	=3D md_submit_bio,
  	.open		=3D md_open,
  	.release	=3D md_release,
  	.ioctl		=3D md_ioctl,

--Sig_/DoOX.LRKhMCrGAH/jmM=5xQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Rcn0ACgkQAVBC80lX
0GyTzQf+KOSMeJ4CQ+rp9jlSXmeP4oevbpb2rfGovdW6FF+KRhzgBTJC7Usjfz8S
Lb3F/8gZ0sif2XQeWBu5SmhWbP9uXm7ZI5EtxjiOdVrKWhtgUUR+W49yIUUgJmXE
wx6WGmE9/rWBNmTcrwIpwxJ9cN3qhmUd6aQFXWBPkPh6tO0hMXvpHHWDjCXBkIQV
8kmRxet7gV5ElhNq3EZR0yiAiInWX9dBTAJSzRKgOo2Nuv88AfkomrlNCJq6e/pP
wnmxu+iFRROl6IhqtHv3esKR+3a+QyDQv55kbbUtHF0hP0BCm8xzNn++12WIHfKq
skyYmEUl5809e7D4sVkDKukBl+/YSQ==
=qjJR
-----END PGP SIGNATURE-----

--Sig_/DoOX.LRKhMCrGAH/jmM=5xQ--
