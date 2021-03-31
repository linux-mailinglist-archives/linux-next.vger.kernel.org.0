Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA4C34F940
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 08:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbhCaGwK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 02:52:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39067 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233833AbhCaGv5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 31 Mar 2021 02:51:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9H6g1brSz9sW4;
        Wed, 31 Mar 2021 17:51:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617173515;
        bh=AFkKVjfftEpgY6NKnLbBw7v4gESuwtowd7l+3shPkmc=;
        h=Date:From:To:Cc:Subject:From;
        b=A53DouJ98es2Rfv1xO3u6SN8c8PTquZp0GAAOSZ103HiZb7E4uyWp32BFnTGh4IA+
         7+fkz18oIqupcQLESVC3TBpCbth/OgoUBzhL52r9+vwDMsg3aA9KmdVnHjLJjekAF9
         QOG19QIfoJbMUQ8YHx9eZW4p+oEjLuZuw85L4OJSV7MY7wNn/9hgTOFrsbF7mrI9Gj
         gOrhbpfnX8w/qIyvgWDw/IHrMK/dEsO/rkfb/xb5j8XNR/R4yKqHY5RQlG3F+T5auR
         7d0tQAWiD8MiuCbXEHDHJ6BJ9lLY0JI6F/O//pbiyC1zHal02gRnZiGy+8qAIVhELH
         F09R+qpyNDrMw==
Date:   Wed, 31 Mar 2021 17:51:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc:     Cristian Marussi <cristian.marussi@arm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the staging tree with the scmi tree
Message-ID: <20210331175151.67fcfe4d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t_YDmqPOl1wSFzdtEpn/d_z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t_YDmqPOl1wSFzdtEpn/d_z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/common/scmi_sensors/scmi_iio.c

between commit:

  25cbdd4609c0 ("iio/scmi: Port driver to the new scmi_sensor_proto_ops int=
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
index 8f4154d92c68,63e4cec9de5e..000000000000
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@@ -505,25 -528,9 +505,11 @@@ static int scmi_iio_set_sampling_freq_a
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
 +scmi_alloc_iiodev(struct scmi_device *sdev,
 +		  const struct scmi_sensor_proto_ops *ops,
 +		  struct scmi_protocol_handle *ph,
 +		  const struct scmi_sensor_info *sensor_info)
  {
  	struct iio_chan_spec *iio_channels;
  	struct scmi_iio_priv *sensor;

--Sig_/t_YDmqPOl1wSFzdtEpn/d_z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBkHAcACgkQAVBC80lX
0GzRawf/foe/OFODjb9SqfahME5uln/jRruFmZ521n21M6RB/tvOZIGu3pPDomhe
ZEMW4kXZjJ3na6sIhtn5BuwN4vDjJLrZW+oRl4I4PpkMvJN3SPl+V8JpSRERO3Oy
mVoIurryfZONZUaf/gl+Ka4nCs6fuhTGKzyhpWMzsh/yaofUhm+sZdHZ/4kGBW5s
628MgIYB9735qm0V2Wy3Mmken+3aANhvU6B9cAO84kOENYdJhCgAANq+CBmI/gDZ
agqDmeAPOgH2dCzI9ecMWVfZzc167ut3RWQh9ry4nBcMrCTlU5DgegSZJbfYwWMK
sKgh7wmcGrZjP/ky3EXF9k9D42fxPQ==
=e9uJ
-----END PGP SIGNATURE-----

--Sig_/t_YDmqPOl1wSFzdtEpn/d_z--
