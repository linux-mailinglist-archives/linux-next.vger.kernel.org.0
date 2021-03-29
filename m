Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1FB34C35E
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 07:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhC2Fzd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 01:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhC2Fzb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 01:55:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78252C061574;
        Sun, 28 Mar 2021 22:55:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F81yQ5GS5z9sRf;
        Mon, 29 Mar 2021 16:55:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616997328;
        bh=ssHqwp0jYzHAWbJb8XxvEzWUtgIJXXwjvOfaG7LTtOw=;
        h=Date:From:To:Cc:Subject:From;
        b=n53CIR8rKEvMDuYW+6+OQ0sAenTmu7jf+hyeZ2Hn4BK1ALcbwRtcrZP/2iyrxFj+0
         wfBuMYuDSCfrXbNWkjwX8D6ukBouf77EhPDuoGeBuUgmfaqiNVvbqgxH1k/Tm4PvnL
         JotjtNGsLcdExBzA2Yr04/+FaIcZ8alR/t2JGieT192HrdiOF4qPnTMjO9kyEYtYW6
         L2fAn54RdCCsD/xPIlN9UQ7Ctwm4bvGSuiP0x4Vk5FrLYbIdZ0D+CMS71sip3IsxV+
         upNrSwjDjhxzqi+HLQkgyXUxABOIp6nYiIzCN0fYKS/xckQGFngDo5w8olxEAexk3V
         s7kKYXsdZzlQQ==
Date:   Mon, 29 Mar 2021 16:55:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>
Cc:     Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the staging tree
Message-ID: <20210329165525.32d51a3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gfXdZzMKzQTdW83QzkqYuyL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gfXdZzMKzQTdW83QzkqYuyL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_read_reg':
drivers/iio/adc/ti-ads131e08.c:180:5: error: 'struct spi_transfer' has no m=
ember named 'delay_usecs'
  180 |    .delay_usecs =3D st->sdecode_delay_us,
      |     ^~~~~~~~~~~
drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_write_reg':
drivers/iio/adc/ti-ads131e08.c:206:5: error: 'struct spi_transfer' has no m=
ember named 'delay_usecs'
  206 |    .delay_usecs =3D st->sdecode_delay_us,
      |     ^~~~~~~~~~~

Caused by commit

  d935eddd2799 ("iio: adc: Add driver for Texas Instruments ADS131E0x ADC f=
amily")

interacting with commit

  3ab1cce55337 ("spi: core: remove 'delay_usecs' field from spi_transfer")

from the spi tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Mar 2021 16:51:22 +1100
Subject: [PATCH] iio: adc: merge fix for "spi: core: remove 'delay_usecs'
 field from spi_transfer"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iio/adc/ti-ads131e08.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-ads131e08.c b/drivers/iio/adc/ti-ads131e08.c
index 0060d5f0abb0..764dab087b41 100644
--- a/drivers/iio/adc/ti-ads131e08.c
+++ b/drivers/iio/adc/ti-ads131e08.c
@@ -177,7 +177,10 @@ static int ads131e08_read_reg(struct ads131e08_state *=
st, u8 reg)
 		{
 			.tx_buf =3D &st->tx_buf,
 			.len =3D 2,
-			.delay_usecs =3D st->sdecode_delay_us,
+			.delay =3D {
+				.value =3D st->sdecode_delay_us,
+				.unit =3D SPI_DELAY_UNIT_USECS,
+			},
 		}, {
 			.rx_buf =3D &st->rx_buf,
 			.len =3D 1,
@@ -203,7 +206,10 @@ static int ads131e08_write_reg(struct ads131e08_state =
*st, u8 reg, u8 value)
 		{
 			.tx_buf =3D &st->tx_buf,
 			.len =3D 3,
-			.delay_usecs =3D st->sdecode_delay_us,
+			.delay =3D {
+				.value =3D st->sdecode_delay_us,
+				.unit =3D SPI_DELAY_UNIT_USECS,
+			},
 		}
 	};
=20
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/gfXdZzMKzQTdW83QzkqYuyL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBha80ACgkQAVBC80lX
0GwDzAf5AXnUHssuIz730WHkg4wjQLKpbGeUxZfnnUk56mLnFSNN5XUb7/Y7f3Qo
h0Un8B55Dn67yPbE1g0b6iHSNZMpwY4CGI2tykI2xoJTMJwK1xlJznCtKp5/BJBH
TlOVFxX0XORRIqA1WFBsqxbx7aK6EaPjEP0WEIFWu4dtWLjBe8IU92V1C22aKqug
KuOeKNNKXtrTYLxGlHJv2U8RVGfHX5MDDdCnaW+GPYi4vWBE3NfNd5X10iDC4PQH
gHXapHdGmfn9d8bvQUs/bfiPcLYMEH1mqlpfzqK24QFJIM5KJW2CNQJU15d7j5W2
79JlfovnEgi+qpQNc9kl/5X1ZkXSng==
=vbrZ
-----END PGP SIGNATURE-----

--Sig_/gfXdZzMKzQTdW83QzkqYuyL--
