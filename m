Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B29225704
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 07:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgGTFZ2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 01:25:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45383 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbgGTFZ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jul 2020 01:25:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B99D43w2Pz9sR4;
        Mon, 20 Jul 2020 15:25:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595222726;
        bh=+K7VCuGYsRZWKSbD8PshgftKU99x59RdfMOzQ/NIJes=;
        h=Date:From:To:Cc:Subject:From;
        b=ZE2Vn/zhmdI9E/nlZvj9KxSK4Jpm57FfjseaN/gVpR6b3sjtN9wr9wqjoZiiI086a
         Y33192xAMZOYFE2blf1U3xI7nQ30QE3q6RLbgdwNsYh2zTnnyuPIZPCvm0iQaiOvJG
         8xKwzGCNR5jkb6Dd3erS4enOPgMfckKu5MYCestvUTZPGJPgpJfMk4keSviYC8E11n
         K0NiIW09YAnBLt+fJOZjd7rFEJB5MRuDg19GqsP+ExMUT0slLXA28QcCky6Jc+b+qv
         dG7Pe+CQvWUQArZvpw4s+bYFbW/OhEUWKk5NJmkf2PLA2AKppWXkJqpC47zo1IVsrn
         hGYUoZXYaeU2A==
Date:   Mon, 20 Jul 2020 15:25:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: linux-next: manual merge of the staging tree with Linus' tree
Message-ID: <20200720152522.5ccfc3ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6WyNTDJWviTFSsq=09.p2Be";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6WyNTDJWviTFSsq=09.p2Be
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/magnetometer/ak8974.c

between commit:

  0187294d227d ("iio: magnetometer: ak8974: Fix runtime PM imbalance on err=
or")

from Linus' tree and commit:

  d3be83244c7d ("iio: remove explicit IIO device parent assignment")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/iio/magnetometer/ak8974.c
index 91c39352fba2,c2260c84f7f1..000000000000
--- a/drivers/iio/magnetometer/ak8974.c
+++ b/drivers/iio/magnetometer/ak8974.c
@@@ -890,10 -884,14 +890,9 @@@ static int ak8974_probe(struct i2c_clie
  	ret =3D ak8974_reset(ak8974);
  	if (ret) {
  		dev_err(&i2c->dev, "AK8974 reset failed\n");
 -		goto power_off;
 +		goto disable_pm;
  	}
 =20
- 	indio_dev->dev.parent =3D &i2c->dev;
 -	pm_runtime_set_autosuspend_delay(&i2c->dev,
 -					 AK8974_AUTOSUSPEND_DELAY);
 -	pm_runtime_use_autosuspend(&i2c->dev);
 -	pm_runtime_put(&i2c->dev);
 -
  	switch (ak8974->variant) {
  	case AK8974_WHOAMI_VALUE_AMI306:
  	case AK8974_WHOAMI_VALUE_AMI305:

--Sig_/6WyNTDJWviTFSsq=09.p2Be
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8VKsIACgkQAVBC80lX
0Gzn8Af9GyxpXJL/77yy4KsWLOb+eGixmOfiq8cRCmx7oh+aB8+QcXyRE8D4AF1r
mBFE7RM6TOSSA3409k1jheSRkqJOhWuDY8IwD3p4wz+BdRT54GH3vRUCzsRKwrs+
IVDtr3vukxLGnRSF2YPhLoJaUY+MoNl8zX/5lJgXx2et4I8l69AL5AYUJ9tzt05C
Rp9WDfJ8t2/DJAFbxxK0+MD41UIRjseZH0V5CwVF5gTAjPaEWrT55u/QdbFjpJaG
FihhF1oW/wBlgqn070xrCRb72czGsDGmFKLRdLWZd5MiJQg7voP3xBVcbdCmcL2u
VWhW0jXCgdcd8F+GuPDSQJNDUa0zPg==
=oyJI
-----END PGP SIGNATURE-----

--Sig_/6WyNTDJWviTFSsq=09.p2Be--
