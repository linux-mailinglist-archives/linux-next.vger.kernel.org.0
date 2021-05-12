Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829BC37B3A9
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 03:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhELBtP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 21:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhELBtP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 21:49:15 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA7EC061574;
        Tue, 11 May 2021 18:48:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfyNk0Wdqz9sWQ;
        Wed, 12 May 2021 11:48:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620784086;
        bh=uFP33cSySi6o++DyDrkKhuRrS7ovojVuv6UUwS7BzcQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mQGsNNaUAyks+25PAvvMkSw0SaDRl0PtoBXPIbUF7iuq37tuv2APAWOvexMbnfk6w
         iNYMQJ6yCAlykKV3uvv+wRieFyTBIMopXB8uo/AMFLRizu384NnoIjRfiT5JjyCUC6
         lYdQjcs6GMbSwBKPRRj5+DKlvU8qttxP9o1zzMcdNC1z/foLdAUf/oZviSn6a+sDbC
         y14cfL0dC/3AvYQzCLnZ0P0OapIelvynxvIUupukLqjTKl9OinMOZhkkHrjoM7ubx+
         HUUIksDImokMrB0xxi1MaTGFZ7fK1h3aEYzVflCSXcO/quCbM1AZ/bsZrgjAuyfssb
         foTjceTYp7qRg==
Date:   Wed, 12 May 2021 11:48:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Greg KH <greg@kroah.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tomasz Duszynski <tomasz.duszynski@octakon.com>
Subject: Re: linux-next: manual merge of the iio tree with the
 staging.current tree
Message-ID: <20210512114805.5bcef396@canb.auug.org.au>
In-Reply-To: <20210512114342.286dd7d6@canb.auug.org.au>
References: <20210512114342.286dd7d6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1u=bMDm1hG4ltcBLVYmfXyp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1u=bMDm1hG4ltcBLVYmfXyp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 May 2021 11:43:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the iio tree got a conflict in:
>=20
>   drivers/iio/industrialio-core.c
>=20
> between commit:
>=20
>   901f84de0e16 ("iio: core: fix ioctl handlers removal")
>=20
> from the staging.current tree and commit:
>=20
>   919a6adf8107 ("iio: core: move @chrdev from struct iio_dev to struct ii=
o_dev_opaque")
>=20
> from the iio tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/iio/industrialio-core.c
> index 59efb36db2c7,efb4cf91c9e4..000000000000
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@@ -1785,10 -1811,10 +1810,10 @@@ static long iio_ioctl(struct file *filp
>   	}
>  =20
>   	if (ret =3D=3D IIO_IOCTL_UNHANDLED)
>  -		ret =3D -EINVAL;
>  +		ret =3D -ENODEV;
>  =20
>   out_unlock:
> - 	mutex_unlock(&indio_dev->info_exist_lock);
> + 	mutex_unlock(&iio_dev_opaque->info_exist_lock);
>  =20
>   	return ret;
>   }
> @@@ -1925,9 -1951,12 +1950,9 @@@ EXPORT_SYMBOL(__iio_device_register)
>    **/
>   void iio_device_unregister(struct iio_dev *indio_dev)
>   {
> - 	cdev_device_del(&indio_dev->chrdev, &indio_dev->dev);
>  -	struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(indio_dev);
>  -	struct iio_ioctl_handler *h, *t;
>  -
> + 	cdev_device_del(&iio_dev_opaque->chrdev, &indio_dev->dev);
>  =20
> - 	mutex_lock(&indio_dev->info_exist_lock);
> + 	mutex_lock(&iio_dev_opaque->info_exist_lock);
>  =20
>   	iio_device_unregister_debugfs(indio_dev);
>  =20

Actually, I had to add back the iio_dev_opaque declaration line.

--=20
Cheers,
Stephen Rothwell

--Sig_/1u=bMDm1hG4ltcBLVYmfXyp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbM9UACgkQAVBC80lX
0GwcqQf/a1AFY9pnYyezBEXbqwKTPPgTM6gkUoHA0UFqNGD8xgnbP9fwzEZmkP2K
QA8A5isAcqqFgPEeX4punpDSelc4bDdGI/uLUeT2ZywS96Th70PdQ8pxcNdCVSAi
TbeRO+PYqfRqz6C/Nqwk+3QTSRnf2GJtvwiGXoVbWIGrxK63ZEh1IgyDQ1D7FYyv
oWsWZp92LfXKtuxn+RVcSOwUJ79oCHcpBwfKtMAJqCNNKNNYXm6y1z1MO8AqC90U
rhLu6nnD4/rI3c5f6Y3o+/0dQlZaQ50Jnkle6z6vtzu3/kGz1kCSKctFcNq4NIpe
mmwiYkRyrxpTZQxrUEXA4L2CvMbwfw==
=3E/B
-----END PGP SIGNATURE-----

--Sig_/1u=bMDm1hG4ltcBLVYmfXyp--
