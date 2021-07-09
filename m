Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C236E3C1CBE
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 02:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhGIAfd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jul 2021 20:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhGIAfd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jul 2021 20:35:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C304EC061574;
        Thu,  8 Jul 2021 17:32:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GLYz22zrRz9sWd;
        Fri,  9 Jul 2021 10:32:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625790767;
        bh=+WN6vickkkMlDTyJCZqZwVOeIpzHZ/inZVOsfbJRzz8=;
        h=Date:From:To:Cc:Subject:From;
        b=CUpfBaH2wcyTM+9arf0YKFUPUXSP4LWKeHygArB7q5aol3yrwlJpnn13JaW6/STiW
         RK1QgKBdBtn/ewWKiOXbkYQQiBP9UdACPwuDxAct2vlV/OV+oyGfQGFdmxZcAcZgwh
         h4nkFO1CeAsFSGOZArC5epPZ/kdyPMXLvT1r6HXkNMpJCHA/pWzxfouypcM5dNFDCH
         2bAJ33IRWw6VkT7uQcWKSYOrKt7mSoMpOrLnenGb3m6843mMLpEDl7dzxpj0xO4lGb
         Jmpx4VlBztWOplwqD/cOFxpWF+EllucfAEUWUwSOQCRN7dqjiXhdmT6s19/bREHHE6
         1RP+ylNo1aNoA==
Date:   Fri, 9 Jul 2021 10:32:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: linux-next: manual merge of the block tree with the mmc-fixes tree
Message-ID: <20210709103244.64b2f1de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8JDPbODuzXKJlel5Nywvt_/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8JDPbODuzXKJlel5Nywvt_/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/mmc/core/block.c

between commit:

  5c0777665b3e ("mmc: core: Use kref in place of struct mmc_blk_data::usage=
")

from the mmc-fixes tree and commits:

  249cda3325e0 ("mmc: remove an extra blk_{get,put}_queue pair")
  607d968a5769 ("mmc: switch to blk_mq_alloc_disk")

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

diff --cc drivers/mmc/core/block.c
index d7b5c5ab75fa,9890a1532cb0..000000000000
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@@ -195,26 -196,18 +195,25 @@@ static inline int mmc_get_devidx(struc
  	return devidx;
  }
 =20
 -static void mmc_blk_put(struct mmc_blk_data *md)
 +static void mmc_blk_kref_release(struct kref *ref)
  {
 -	mutex_lock(&open_lock);
 -	md->usage--;
 -	if (md->usage =3D=3D 0) {
 -		int devidx =3D mmc_get_devidx(md->disk);
 +	struct mmc_blk_data *md =3D container_of(ref, struct mmc_blk_data, kref);
 +	int devidx;
 =20
 -		ida_simple_remove(&mmc_blk_ida, devidx);
 -		put_disk(md->disk);
 -		kfree(md);
 -	}
 +	devidx =3D mmc_get_devidx(md->disk);
- 	blk_put_queue(md->queue.queue);
 +	ida_simple_remove(&mmc_blk_ida, devidx);
 +
 +	mutex_lock(&open_lock);
 +	md->disk->private_data =3D NULL;
  	mutex_unlock(&open_lock);
 +
 +	put_disk(md->disk);
 +	kfree(md);
 +}
 +
 +static void mmc_blk_put(struct mmc_blk_data *md)
 +{
 +	kref_put(&md->kref, mmc_blk_kref_release);
  }
 =20
  static ssize_t power_ro_lock_show(struct device *dev,
@@@ -2334,27 -2327,11 +2333,11 @@@ static struct mmc_blk_data *mmc_blk_all
 =20
  	INIT_LIST_HEAD(&md->part);
  	INIT_LIST_HEAD(&md->rpmbs);
 -	md->usage =3D 1;
 +	kref_init(&md->kref);
-=20
- 	ret =3D mmc_init_queue(&md->queue, card);
- 	if (ret)
- 		goto err_putdisk;
-=20
  	md->queue.blkdata =3D md;
 =20
- 	/*
- 	 * Keep an extra reference to the queue so that we can shutdown the
- 	 * queue (i.e. call blk_cleanup_queue()) while there are still
- 	 * references to the 'md'. The corresponding blk_put_queue() is in
- 	 * mmc_blk_put().
- 	 */
- 	if (!blk_get_queue(md->queue.queue)) {
- 		mmc_cleanup_queue(&md->queue);
- 		ret =3D -ENODEV;
- 		goto err_putdisk;
- 	}
-=20
  	md->disk->major	=3D MMC_BLOCK_MAJOR;
+ 	md->disk->minors =3D perdev_minors;
  	md->disk->first_minor =3D devidx * perdev_minors;
  	md->disk->fops =3D &mmc_bdops;
  	md->disk->private_data =3D md;

--Sig_/8JDPbODuzXKJlel5Nywvt_/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDnmSwACgkQAVBC80lX
0GxpEAf/TTd1pOJ2c3TF+OFt1CnJY43J47OxQh9rRSb7DEhZLTRuLrOSu6EWPRwV
OMtFNkCLPFiPRcbGwm0WfFgrqnyoHY+bHf0lmLzLquU/goUjmn7pb8PXK8I04Oc8
BEFv9s2deScbYWxXcPxL38sPLI9nFCBu3/sxj8zxYekZ8i4w4vT+4VRhlk5pKN27
nUWK+TlF8KWOu/siqx+bY0527WhzqJF1ZFHeo6qQyN98SRIGeX6tOODGRxTxvj4v
8k8SFjYHDpg1yW5T69vrhfxXAD0B53p+uUtRo9NvxYVAJtrvQoVkylMxZMKFUazP
Odru69agAYnSL1mw9v1Nzec0cXHhfQ==
=/4k3
-----END PGP SIGNATURE-----

--Sig_/8JDPbODuzXKJlel5Nywvt_/--
