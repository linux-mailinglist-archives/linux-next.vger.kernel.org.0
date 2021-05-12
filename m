Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29E537B3A4
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 03:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhELBpK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 21:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhELBpK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 21:45:10 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC212C061574;
        Tue, 11 May 2021 18:44:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfyHz31T2z9sWC;
        Wed, 12 May 2021 11:43:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620783839;
        bh=RLSKmGAgISlJ3ax9BT6xGD2ShyO5KQi6GMpWTcOc+/s=;
        h=Date:From:To:Cc:Subject:From;
        b=a1Gklo5t1zIVA0Dg27uYXvsHltLGfTLnFLJ7LiGfZX4vv6fSxQgvvcxFbUCuWbi6V
         773suUFa5l522njiejMKByhZVw9oSv6AH6O4rpd0MQ0oYWF+rdcPcxbRo0EcmU086q
         5KK0ERp86QGs+k0t+09OnM7i78NOQvZNX4cKKqkHAM9OUe+JA5vtXRfCUL8xPZc/oN
         5JTC92qJls/SFkXjw3nSNWPu1vsvkKwrGU6B+46eD/6Dsej0ksBNk2eJtqzCGEX6S5
         zmyQGxYD8IRpIvketXFeARfsYhjZREOD9TONEYGTWVGzA8iom/sGA0D+FH0Ko5Tj0X
         4nPWAU/d2463A==
Date:   Wed, 12 May 2021 11:43:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Greg KH <greg@kroah.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tomasz Duszynski <tomasz.duszynski@octakon.com>
Subject: linux-next: manual merge of the iio tree with the staging.current
 tree
Message-ID: <20210512114342.286dd7d6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vnJ1n8rbJzkObHz80pD_Lql";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vnJ1n8rbJzkObHz80pD_Lql
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/industrialio-core.c

between commit:

  901f84de0e16 ("iio: core: fix ioctl handlers removal")

from the staging.current tree and commit:

  919a6adf8107 ("iio: core: move @chrdev from struct iio_dev to struct iio_=
dev_opaque")

from the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/iio/industrialio-core.c
index 59efb36db2c7,efb4cf91c9e4..000000000000
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@@ -1785,10 -1811,10 +1810,10 @@@ static long iio_ioctl(struct file *filp
  	}
 =20
  	if (ret =3D=3D IIO_IOCTL_UNHANDLED)
 -		ret =3D -EINVAL;
 +		ret =3D -ENODEV;
 =20
  out_unlock:
- 	mutex_unlock(&indio_dev->info_exist_lock);
+ 	mutex_unlock(&iio_dev_opaque->info_exist_lock);
 =20
  	return ret;
  }
@@@ -1925,9 -1951,12 +1950,9 @@@ EXPORT_SYMBOL(__iio_device_register)
   **/
  void iio_device_unregister(struct iio_dev *indio_dev)
  {
- 	cdev_device_del(&indio_dev->chrdev, &indio_dev->dev);
 -	struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(indio_dev);
 -	struct iio_ioctl_handler *h, *t;
 -
+ 	cdev_device_del(&iio_dev_opaque->chrdev, &indio_dev->dev);
 =20
- 	mutex_lock(&indio_dev->info_exist_lock);
+ 	mutex_lock(&iio_dev_opaque->info_exist_lock);
 =20
  	iio_device_unregister_debugfs(indio_dev);
 =20

--Sig_/vnJ1n8rbJzkObHz80pD_Lql
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbMs4ACgkQAVBC80lX
0Gy1HggAmJLdqJ2JBFJdR1Ilmv7DYdz8tZbBJgvc9BMtsdCDqd1XrRWTRkbxKsUt
K4DRbVpVZFxCyXJUdv01JYW0YxMG+QAAEYrXI1fkmhLTnrhR+bw/i5OIaROiUIfb
sG+MSI3fe66XV98ukTO233W1VBS4uipMbDwZUVPBP6qMhJz1N+ORFle5UKUuGU2C
xf49B4N+jS92LxNGyxEn4dqsQ+mWqslaeO35QSO0zlimSjn7QRGZcyzxtLrxyo/M
ZV57ztIyZ+QGI/6Nuu+peucfHPZyRMCdBiImvA9iPtVhGuFeCtInP2oDgqHy2DGn
i/IxxH/JekhxCwBWCO1Oc2zLD1V26A==
=6YUd
-----END PGP SIGNATURE-----

--Sig_/vnJ1n8rbJzkObHz80pD_Lql--
