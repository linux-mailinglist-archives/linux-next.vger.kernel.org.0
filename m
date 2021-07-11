Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C5D3C3FDB
	for <lists+linux-next@lfdr.de>; Mon, 12 Jul 2021 01:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhGKXFD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Jul 2021 19:05:03 -0400
Received: from ozlabs.org ([203.11.71.1]:36483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhGKXFD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Jul 2021 19:05:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GNMq91zyRz9sWX;
        Mon, 12 Jul 2021 09:02:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626044534;
        bh=QN9uBgrdKseADDrmaMxDt0Q67fmkBOSEFJeJV4SZ4W0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Y8CwsgYFVMF/s3N/4v7i0ngPJUdI9Xz/MVlKEXvcxcep3EDLysISXXjrLgBSH8TCm
         Rsfh+kOQuXoKJqAAXKt6l4LC+wUPnHG//SoODZFMqg0CiziffTo9J6tRWFuXFBhP8b
         /xt+oGzL1w+L4b/KmJeE+qhEV7ACKuULUVewLesXaz1UTjBnw3H2wat4cNGZDLGmnj
         VDcFD8j02QrBVljuXxtlznVy3WSPJ+XU0XwZv3p6KFdS1dLkNi4wa1WZvIH0t5eT9n
         18qhaRotG7TeDLpTQ8YMxxaB6HezXmaLpfp+Z4ArfhiHPoXn639rqrzeig3ejbxSUu
         aRY+MMqDgmecg==
Date:   Mon, 12 Jul 2021 09:02:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: linux-next: manual merge of the block tree with the mmc-fixes
 tree
Message-ID: <20210712090212.79b40e20@canb.auug.org.au>
In-Reply-To: <20210709103244.64b2f1de@canb.auug.org.au>
References: <20210709103244.64b2f1de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YGDPu_VDs0wa2cS810Owr9Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YGDPu_VDs0wa2cS810Owr9Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 9 Jul 2021 10:32:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   drivers/mmc/core/block.c
>=20
> between commit:
>=20
>   5c0777665b3e ("mmc: core: Use kref in place of struct mmc_blk_data::usa=
ge")
>=20
> from the mmc-fixes tree and commits:
>=20
>   249cda3325e0 ("mmc: remove an extra blk_{get,put}_queue pair")
>   607d968a5769 ("mmc: switch to blk_mq_alloc_disk")
>=20
> from the block tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/mmc/core/block.c
> index d7b5c5ab75fa,9890a1532cb0..000000000000
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@@ -195,26 -196,18 +195,25 @@@ static inline int mmc_get_devidx(struc
>   	return devidx;
>   }
>  =20
>  -static void mmc_blk_put(struct mmc_blk_data *md)
>  +static void mmc_blk_kref_release(struct kref *ref)
>   {
>  -	mutex_lock(&open_lock);
>  -	md->usage--;
>  -	if (md->usage =3D=3D 0) {
>  -		int devidx =3D mmc_get_devidx(md->disk);
>  +	struct mmc_blk_data *md =3D container_of(ref, struct mmc_blk_data, kre=
f);
>  +	int devidx;
>  =20
>  -		ida_simple_remove(&mmc_blk_ida, devidx);
>  -		put_disk(md->disk);
>  -		kfree(md);
>  -	}
>  +	devidx =3D mmc_get_devidx(md->disk);
> - 	blk_put_queue(md->queue.queue);
>  +	ida_simple_remove(&mmc_blk_ida, devidx);
>  +
>  +	mutex_lock(&open_lock);
>  +	md->disk->private_data =3D NULL;
>   	mutex_unlock(&open_lock);
>  +
>  +	put_disk(md->disk);
>  +	kfree(md);
>  +}
>  +
>  +static void mmc_blk_put(struct mmc_blk_data *md)
>  +{
>  +	kref_put(&md->kref, mmc_blk_kref_release);
>   }
>  =20
>   static ssize_t power_ro_lock_show(struct device *dev,
> @@@ -2334,27 -2327,11 +2333,11 @@@ static struct mmc_blk_data *mmc_blk_all
>  =20
>   	INIT_LIST_HEAD(&md->part);
>   	INIT_LIST_HEAD(&md->rpmbs);
>  -	md->usage =3D 1;
>  +	kref_init(&md->kref);
> -=20
> - 	ret =3D mmc_init_queue(&md->queue, card);
> - 	if (ret)
> - 		goto err_putdisk;
> -=20
>   	md->queue.blkdata =3D md;
>  =20
> - 	/*
> - 	 * Keep an extra reference to the queue so that we can shutdown the
> - 	 * queue (i.e. call blk_cleanup_queue()) while there are still
> - 	 * references to the 'md'. The corresponding blk_put_queue() is in
> - 	 * mmc_blk_put().
> - 	 */
> - 	if (!blk_get_queue(md->queue.queue)) {
> - 		mmc_cleanup_queue(&md->queue);
> - 		ret =3D -ENODEV;
> - 		goto err_putdisk;
> - 	}
> -=20
>   	md->disk->major	=3D MMC_BLOCK_MAJOR;
> + 	md->disk->minors =3D perdev_minors;
>   	md->disk->first_minor =3D devidx * perdev_minors;
>   	md->disk->fops =3D &mmc_bdops;
>   	md->disk->private_data =3D md;

This is now a conflict between the mmc-fixes tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YGDPu_VDs0wa2cS810Owr9Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDreHQACgkQAVBC80lX
0GwSjQf+PZPzITEqXzgq3VCzd/nB6Bn4E+TpKfmM334f+TS3t/pJsQhIrFzbQKhy
dGf11ESdzgmS90q3XyGIC5v/30zM/mxvyHFAG2xI34Fl7tC2GJBmagMaCFeltA/1
HWL5xBkh5m8L73VS5S6ThQAxYjIPSun0FwBn1VnK9O9t43a1CXZKrmFwYwia6SmW
tipY9tZCAjPyJ8xmxajoXV4nZN/GiERgJYQcHazIZMFdNNrrx2tBiyiPssTij4MH
boWvWkVsGLnWsO8HCpzrhWe5NNzHsmb9v8Oc8qcZ6vy3twc0bvSdXQ9Czcz0Trg8
8YmhfraVzy3BHUdff2d81Vi7yYbfkg==
=7X9Q
-----END PGP SIGNATURE-----

--Sig_/YGDPu_VDs0wa2cS810Owr9Z--
