Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E1B3BF34D
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 03:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhGHBLl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 21:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhGHBLk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Jul 2021 21:11:40 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D803C061574;
        Wed,  7 Jul 2021 18:08:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GKyqD1dNdz9sXV;
        Thu,  8 Jul 2021 11:08:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625706536;
        bh=CwzLaLJFQta8XP/3MzpUVxU8qh6XLSGsGRQ8AbnxOJ4=;
        h=Date:From:To:Cc:Subject:From;
        b=eAZR58XkE/254gZi5CHOMW51msvS5ePHuqiADs4Un8U2vvYpUqRi/FK1bi1GnPIzs
         LgEzeJZUAdxkD+hYRLgCG/YUDJowUidTtWoUYEnd1BEIEbZC3B9MfVZ4S3/EOEiLzR
         lwJFO09f4rPE2XR6+W3mV62f0QJMFo01ceYGW3NDTrJq4fLKbXoOyDrUUvvbSs6fpT
         ZoTWX2V2Cr5fUT0srrceOFBuPsqmCkq+3aagkgpvhdhuQ62WW5RrIQWUCzCwf0/eqz
         knkugdc68wTZRvncwgTosbohVXT2m0hoIWLZoITslbIzsyZ6v2gyqWaSRNjBbFSdif
         Kc8DPGdVhgTug==
Date:   Thu, 8 Jul 2021 11:08:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20210708110854.1a1ab200@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3lBgu5OH9pGs.64MVF7/kQN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3lBgu5OH9pGs.64MVF7/kQN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/block/virtio_blk.c:986:14: error: initialization of 'int (*)(struct=
 virtio_device *, void *)' from incompatible pointer type 'int (*)(struct v=
irtio_device *)' [-Werror=3Dincompatible-pointer-types]
  986 |  .probe    =3D virtblk_probe,
      |              ^~~~~~~~~~~~~
drivers/block/virtio_blk.c:986:14: note: (near initialization for 'virtio_b=
lk.probe')
drivers/char/virtio_console.c:2213:11: error: initialization of 'int (*)(st=
ruct virtio_device *, void *)' from incompatible pointer type 'int (*)(stru=
ct virtio_device *)' [-Werror=3Dincompatible-pointer-types]
 2213 |  .probe =3D virtcons_probe,
      |           ^~~~~~~~~~~~~~
drivers/char/virtio_console.c:2213:11: note: (near initialization for 'virt=
io_console.probe')
drivers/char/virtio_console.c:2228:11: error: initialization of 'int (*)(st=
ruct virtio_device *, void *)' from incompatible pointer type 'int (*)(stru=
ct virtio_device *)' [-Werror=3Dincompatible-pointer-types]
 2228 |  .probe =3D virtcons_probe,
      |           ^~~~~~~~~~~~~~
drivers/char/virtio_console.c:2228:11: note: (near initialization for 'virt=
io_rproc_serial.probe')
drivers/scsi/virtio_scsi.c:983:11: error: initialization of 'int (*)(struct=
 virtio_device *, void *)' from incompatible pointer type 'int (*)(struct v=
irtio_device *)' [-Werror=3Dincompatible-pointer-types]
  983 |  .probe =3D virtscsi_probe,
      |           ^~~~~~~~~~~~~~
drivers/scsi/virtio_scsi.c:983:11: note: (near initialization for 'virtio_s=
csi_driver.probe')
drivers/net/virtio_net.c: At top level:
drivers/net/virtio_net.c:3387:14: error: initialization of 'void * (*)(stru=
ct virtio_device *)' from incompatible pointer type 'int (*)(struct virtio_=
device *)' [-Werror=3Dincompatible-pointer-types]
 3387 |  .validate =3D virtnet_validate,
      |              ^~~~~~~~~~~~~~~~
drivers/net/virtio_net.c:3387:14: note: (near initialization for 'virtio_ne=
t_driver.validate')
drivers/net/virtio_net.c:3388:11: error: initialization of 'int (*)(struct =
virtio_device *, void *)' from incompatible pointer type 'int (*)(struct vi=
rtio_device *)' [-Werror=3Dincompatible-pointer-types]
 3388 |  .probe =3D virtnet_probe,
      |           ^~~~~~~~~~~~~
drivers/net/virtio_net.c:3388:11: note: (near initialization for 'virtio_ne=
t_driver.probe')

Caused by commit

  e397242b72e2 ("virtio: allow passing config data from validate callback")

I have used the vhost tree from next-20210707 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3lBgu5OH9pGs.64MVF7/kQN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDmUCYACgkQAVBC80lX
0GwEoggAj1uyG0upb7RIhZWYeg0FyaTOP05DhjfCXE2TzelDHig+R8kY0cBtQuAv
CpBfHqnpNiX3BHflgsIiF9X5PTnBqY7ZqO6Zr9Hz7iZl6nxok256r5YWphiepT27
oFMcF0TE4z19BhQN8i5UMk/omiCYh7Np0IT89dhCYzdVpN0I/8Yga4DyYzXwBrmp
JLqt3dzIv8aLn0+tpkjAPNiOaGbLNHsf+LwPAjiySgcVLqkr290OxGadXAsa6Cr9
SllzN71cRPL1O1LZ05emtUL5h8HkfYuoeUJ+FqA9gWA1Axb1mI+/8jjXK6ymNCD9
nyzTCNYqZXBDkL8gmgCXVXzy/jU1WA==
=J6h9
-----END PGP SIGNATURE-----

--Sig_/3lBgu5OH9pGs.64MVF7/kQN--
