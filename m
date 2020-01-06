Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9F130CC0
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 05:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgAFEYo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 23:24:44 -0500
Received: from ozlabs.org ([203.11.71.1]:36417 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727432AbgAFEYn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 23:24:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rj8T1pVwz9sP6;
        Mon,  6 Jan 2020 15:24:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578284681;
        bh=K4jQauS/nFr+wfixoE3+3PWR3/OkWL0lmMEDdgDwrIA=;
        h=Date:From:To:Cc:Subject:From;
        b=DYHTxQMU9ONbilqUPTnhP7iyKBJ8KTlref6Hfl9Y/fu4O5WeBSeQgxkjF3gxLSkeW
         no5jutpkNMqJaDYZndniaFFMtPJdofl8S0PL7C8MuMp4fPtNdCdg1KCuN9i3ChzRwr
         Sx7dQxcAscmXQDigoSoMHm/FAWdu1gRNQQHPSRuATe3Fji25KbKXVkkaZCW7GtBkqT
         KnpDWRvRXMvgi4gV2q59ocPi6RUQcxZdTKazoZBbdrFBXpjcbr/K4BGblVnXe2gAZb
         8dHPfKr/AroSwTAf4rBk7ih+aRjnyXdPWVoAayNlj5RGcVPOTdjtLywP5UevXKg2j0
         k6sHp/NUHWMOA==
Date:   Mon, 6 Jan 2020 15:24:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the y2038 tree with the vhost tree
Message-ID: <20200106152440.05a36767@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NFejsT2gXU7ePzLuj3yCe2+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NFejsT2gXU7ePzLuj3yCe2+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the y2038 tree got a conflict in:

  drivers/block/virtio_blk.c

between commit:

  d1281e3a562e ("virtio-blk: remove VIRTIO_BLK_F_SCSI support")

from the vhost tree and commit:

  d320a9551e39 ("compat_ioctl: scsi: move ioctl handling into drivers")

from the y2038 tree.

I wonder if this driver needs a compat_ioctl entry at all any more?

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/block/virtio_blk.c
index 54158766334b,fbbf18ac1d5d..000000000000
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@@ -310,6 -404,10 +310,9 @@@ static int virtblk_getgeo(struct block_
  }
 =20
  static const struct block_device_operations virtblk_fops =3D {
 -	.ioctl  =3D virtblk_ioctl,
+ #ifdef CONFIG_COMPAT
+ 	.compat_ioctl =3D blkdev_compat_ptr_ioctl,
+ #endif
  	.owner  =3D THIS_MODULE,
  	.getgeo =3D virtblk_getgeo,
  };

--Sig_/NFejsT2gXU7ePzLuj3yCe2+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4StogACgkQAVBC80lX
0GxiWwf6AsyNwXnw8Yhmyr0Or2c6bs167N6Ing5wBTCJUnB45HkQhVziD4dFlhL/
QqcpneoGn9s/7sNWpyTekBGzf4yPFq3QtrSZtKp/CulEJG6bSYw0iosNdWDySAu0
vNh54P4Kgrh6mPUaKIhv5i8ys/t6zMAO+NCk7wRMxDsedEQ+hCRvGMrdWu6moX36
SvDFeED7f9/+jv5vX1FMjW63FOVsQjIGm+jjGn25EoLYC3s8w7N/iLCU1Rjz1oLG
5ZiTv/25j68tXGLUWjV4Ko7Y2gJ7qyzkRuwuOBkTG9UjGFJ9F5vMMRF4ikQzWJ0e
E8XUVQsyjbYrEgyPM4a0UBF9T4LB3w==
=Ix2d
-----END PGP SIGNATURE-----

--Sig_/NFejsT2gXU7ePzLuj3yCe2+--
