Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D0C41E643
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 05:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhJADk3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 23:40:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51669 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhJADk2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 23:40:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HLG6q1v7Tz4xb9;
        Fri,  1 Oct 2021 13:38:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633059524;
        bh=zER17jwT/nPYJQiW2vUTIMlPaO2AajjFVc6PJANpva8=;
        h=Date:From:To:Cc:Subject:From;
        b=MV5cxLsr1jXRSjU4CqozDwyFk3vUCg8HM2UmkDoPZCNYEqfhCgQGTq03Yt+PH8OPA
         1wAVU/heHMYWwjgKMGGZnkyNBXHWjAFucJhXoF+K2SLLc7zGgKGu/uhNHI5wvgG+U9
         g3jeuetnnQhRP5MHbEO2ilY2GyDM6S6KLy4BWDLioaPIoaCunwp3qc0F5RBGz0T+A/
         +70G7D/iXvinglFKQgbX6cXPniejl8b+8ub2FKSHlTsnFcQETsomhiL+muRicI2//d
         uksyaef3a4jqDM8sbeAHu5whzj3gYvOiN5X5AIbv40LlVIxaLVnbDLCIK3brzWa8mk
         nUcky099ct4Wg==
Date:   Fri, 1 Oct 2021 13:38:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Billy Tsai <billy_tsai@aspeedtech.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <20211001133841.2b46b779@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZXIusq7ayoW1+cgDXZq=td=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZXIusq7ayoW1+cgDXZq=td=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/adc/aspeed_adc.c

between commit:

  eb795cd97365 ("iio: adc: aspeed: set driver data when adc probe.")

from the iio-fixes tree and commit:

  e96b152c6cc2 ("iio: adc: aspeed: Keep model data to driver data.")

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

diff --cc drivers/iio/adc/aspeed_adc.c
index 34ec0c28b2df,9e2c85c3cbe9..000000000000
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@@ -183,7 -492,7 +492,8 @@@ static int aspeed_adc_probe(struct plat
 =20
  	data =3D iio_priv(indio_dev);
  	data->dev =3D &pdev->dev;
 +	platform_set_drvdata(pdev, indio_dev);
+ 	data->model_data =3D of_device_get_match_data(&pdev->dev);
 =20
  	data->base =3D devm_platform_ioremap_resource(pdev, 0);
  	if (IS_ERR(data->base))

--Sig_/ZXIusq7ayoW1+cgDXZq=td=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFWgsEACgkQAVBC80lX
0GybWwgAh6uDE34bntpaHsM2F/5qkThMNIOYRXRqFPgBXAJfO8sdMpggY0Dc8eQs
Ou/8wF+qI5wtOEcGK8ssy7Sq+PbSiMvOvzS3DB3w9P2xj+OqBJJbqTS9YggRp1EQ
kxAZmQtW9y2dG8t1yIhJyJhfyskQYwOzKxzZAAT102kdsYHsUuezOZkaVXBmBi6w
p7FfxGH43sHKs+jz1vdRUCSAL7AOE5dEQMn4GVi0viWKKPFo0pVgSnujeB8KDCUJ
QhwCqhRMebwg2YVv/wYqFYZdH0Ix+4GhUZsJzuIGqpDV3C7YZSiY0eJd1o8TtfYB
iIo1rJKXD2gxyF1OIe4qrL4cnJUwbQ==
=3lUu
-----END PGP SIGNATURE-----

--Sig_/ZXIusq7ayoW1+cgDXZq=td=--
