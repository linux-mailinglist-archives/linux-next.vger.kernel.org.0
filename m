Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527C41F328C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jun 2020 05:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgFIDZ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Jun 2020 23:25:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42471 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbgFIDZ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Jun 2020 23:25:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49gwW702qGz9sRW;
        Tue,  9 Jun 2020 13:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591673155;
        bh=gIjjcr8M6LDnbpaVF4ausq8d8vi/Lg+MJ3EBipQKmE8=;
        h=Date:From:To:Cc:Subject:From;
        b=ENABCNmr1rsAT1+ISb3A4lYHuVo2mBXp/KsNP3xAaxUAAPPUQqohyDxgNmthlqFk2
         s6oV1TJBv3Nc11uDnJcZKu8AH1tmaOGXMgUsqxlDeX7QE8YLAPkSv6g+jyfPPtO/Wf
         jn5+ocrn3j+srQOe/Icui+wzgCbZKZxRmtCzYQDkFyfsKZEymqEGTWIrEItyXoh/r0
         Mj1Cnzi5s98Vh/E71aWf7htFFDs0EDPAQb5RZZltQuNq/RwTfizZWvi/v95392k/FK
         5WxfhAyxLPtM5flr9yuX/Z8SYt74ajrfc/l3YpztP4DJ322HX//tXpdjLg1p6g8IxY
         nkHY/+f/I1xSA==
Date:   Tue, 9 Jun 2020 13:25:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the vhost tree
Message-ID: <20200609132553.272b1b62@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2CxN6NvNPw+_rUVLv4MDAQN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2CxN6NvNPw+_rUVLv4MDAQN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/device.h:15,
                 from include/linux/virtio.h:9,
                 from drivers/virtio/virtio_mem.c:10:
drivers/virtio/virtio_mem.c: In function 'virtio_mem_init':
drivers/virtio/virtio_mem.c:1720:27: warning: format '%x' expects argument =
of type 'unsigned int', but argument 3 has type 'uint64_t' {aka 'long long =
unsigned int'} [-Wformat=3D]
 1720 |  dev_info(&vm->vdev->dev, "subblock size: 0x%x",
      |                           ^~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/virtio/virtio_mem.c:1720:2: note: in expansion of macro 'dev_info'
 1720 |  dev_info(&vm->vdev->dev, "subblock size: 0x%x",
      |  ^~~~~~~~
drivers/virtio/virtio_mem.c:1720:46: note: format string is defined here
 1720 |  dev_info(&vm->vdev->dev, "subblock size: 0x%x",
      |                                             ~^
      |                                              |
      |                                              unsigned int
      |                                             %llx

Introduced by commit

  676fa9ba893e ("virtio_mem: convert device block size into 64bit")

--=20
Cheers,
Stephen Rothwell

--Sig_/2CxN6NvNPw+_rUVLv4MDAQN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7fAUEACgkQAVBC80lX
0Gwt+gf+LlyB5eHQuD79aJvT9qnRssfaW/l+dZ7xDFORJ8v7JnWPh2OW62CoGHGJ
vBKHxC1NcJ7BPO/9Gv1UDW4ueigfd9sNuUjmSIfRp1YLsOOVV7BMaZj4UH/Q0eWc
yaaZgRj/eH7b6cOgnIcq/8XtcJXFGd6gaZWrImIBHgap/wNBFwxV2bZj0ozxF3jx
4gXk2Qeomp6nC/TEJv9uLG2j8yT86qswTHz7VInOmBG0Jw65zCl8qPUGOPI4ufMz
CMh3QccFako5w5U5Qd9MsyXcVwoCT97gkzlwPJlauh8nHxbbOVD0iqlv01Z9x8kJ
lK/8mO/JovRJTeq/LmEW4C8CEG+aKg==
=zkAZ
-----END PGP SIGNATURE-----

--Sig_/2CxN6NvNPw+_rUVLv4MDAQN--
