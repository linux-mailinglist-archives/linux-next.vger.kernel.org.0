Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B1934C325
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 07:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhC2Fpv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 01:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbhC2Fpk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 01:45:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386A9C061574;
        Sun, 28 Mar 2021 22:45:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F81YC0YG8z9sRf;
        Mon, 29 Mar 2021 16:37:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616996224;
        bh=qwsrCthDVSbJ/Gv6/5UKZO6OtEvwh0KrkhLvKvq5l0o=;
        h=Date:From:To:Cc:Subject:From;
        b=AjFI6b1sEeL3JbNqYFpybI9tR3UdP3rw0k8go3K7lF5LzoKjsGtu2bZambJOfB0Dv
         /MSQmBQoTgmZalSCMzx/E4p0LeQww6lPqc/SENUjvE58o2v1bQMtbnDY9xfjmuhEKh
         CU54mmQU+BlNoZnwpa4iWsaqRPJb1TcemdEss0CkCtJC0srxQZfJqGdPCvMtfVH/r7
         FGHqSFfpq4E1Gq+G43in9fCxpifYqBqEOkZAIc3AgzxnMHwZO7oOSR1nf4j1t37y9C
         OunVT/KHIshlv0R+RQoXyPF9g3nIkDW3Z/wV3FbHb1uCcXOU7hc0QOPAPupIGiTC13
         5U5kwN3picC2g==
Date:   Mon, 29 Mar 2021 16:37:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc:     Cristian Marussi <cristian.marussi@arm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the staging tree with the scmi tree
Message-ID: <20210329163700.673b51e9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.biKiUG0_tD30u8yzvX01BR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.biKiUG0_tD30u8yzvX01BR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/common/scmi_sensors/scmi_iio.c

between commit:

  fc91d6b6f0ba ("iio/scmi: port driver to the new scmi_sensor_proto_ops int=
erface")

from the scmi tree and commit:

  1b33dfa5d5f1 ("Merge remote-tracking branch 'local/ib-iio-scmi-5.12-rc2-t=
ake3' into togreg")

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

diff --cc drivers/iio/common/scmi_sensors/scmi_iio.c
index b4bdc3f3a946,63e4cec9de5e..000000000000
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@@ -501,23 -528,9 +501,9 @@@ static int scmi_iio_set_sampling_freq_a
  	return 0;
  }
 =20
- static int scmi_iio_buffers_setup(struct iio_dev *scmi_iiodev)
- {
- 	struct iio_buffer *buffer;
-=20
- 	buffer =3D devm_iio_kfifo_allocate(&scmi_iiodev->dev);
- 	if (!buffer)
- 		return -ENOMEM;
-=20
- 	iio_device_attach_buffer(scmi_iiodev, buffer);
- 	scmi_iiodev->modes |=3D INDIO_BUFFER_SOFTWARE;
- 	scmi_iiodev->setup_ops =3D &scmi_iio_buffer_ops;
- 	return 0;
- }
-=20
 -static struct iio_dev *scmi_alloc_iiodev(struct device *dev,
 -					 struct scmi_handle *handle,
 -					 const struct scmi_sensor_info *sensor_info)
 +static struct iio_dev *
 +scmi_alloc_iiodev(struct scmi_device *sdev, struct scmi_protocol_handle *=
ph,
 +		  const struct scmi_sensor_info *sensor_info)
  {
  	struct iio_chan_spec *iio_channels;
  	struct scmi_iio_priv *sensor;

--Sig_/.biKiUG0_tD30u8yzvX01BR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhZ3wACgkQAVBC80lX
0Gx9Owf8DQqZOiMwR4oxq+2MutYO7PrRcUYhvoZ7CapDE8LksClbIQy8twfMD1Ib
9Hr9LE4xAPIk/LaZEz2j8cFea53eZupvwy7bTIYh816xLppH9ZlQMpAbwHznWhsG
TJ8mbgchMx3/D507hjdDj08fGZfotZsia4g4pLceLxAf0unL43HXHt+S4iEVm7et
XYp6sgNKYItXQMddUUSOhN0xYkh9gD15grtzalAhjtB9xwxXZigS1Taw3dHO5BFJ
Vxvtxk6S4ycp+vJ1huuW517/olaOmj04xW5rLW6iB1Ppk7m+6uR6FYuvZY+AoJtG
JMTBRVMhdUpw5Cge5Jbx+34bCsP9uA==
=5SZd
-----END PGP SIGNATURE-----

--Sig_/.biKiUG0_tD30u8yzvX01BR--
