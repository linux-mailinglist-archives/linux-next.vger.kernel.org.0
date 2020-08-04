Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA223B454
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 07:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgHDFLW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 01:11:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50289 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbgHDFLV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 01:11:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLNBt0zDRz9sSt;
        Tue,  4 Aug 2020 15:11:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596517879;
        bh=h/uuom2Oyk1hCVfSGLv/GSqI8b2sa7tipFZELOZiKd4=;
        h=Date:From:To:Cc:Subject:From;
        b=HpWCJ03q8QRjMxFJMoSlhMmBQFZfd6ME4NM8QMrd0M9p51A2Q8o4WazxBNBuKzqXK
         7qYG+I2uajIUZKR3kSvmVWrwHhIex1tU99f2zsc9OrKyqj/IYCr6yhr6kemh/Eyb4U
         RgnxmqO6TA04Dy6hR2tfeqvxo8Pt2El7c9g/zf9Tjr9K3EXcXwcbILXwttoD6z6osh
         Cnypbi/4cw3f/FsxbfsRdfjzjcyALenM/wNEmbzJxb2SmPyjoTeav2vwOcb+Atzb2B
         NJUCqxObs7dDDn5citWJU7zGt1ztmg3/T+Qfve8pu6Elr9RBI/0XGDzG3mCFZJ+E7e
         xz8eji0O+SxOQ==
Date:   Tue, 4 Aug 2020 15:11:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20200804151117.232dfef4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j1GTDJzT4/6ee=s5zw975+M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j1GTDJzT4/6ee=s5zw975+M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/rpmsg/virtio_rpmsg_bus.c:28:10: fatal error: linux/virtio_rpmsg.h: =
No such file or directory
   28 | #include <linux/virtio_rpmsg.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  bba6f4f52c31 ("rpmsg: move common structures and defines to headers")

I have used the vhost tree from next-20200803 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/j1GTDJzT4/6ee=s5zw975+M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8o7fUACgkQAVBC80lX
0GzDSAf+ITf6o2wbYvsklrJdBFXUiYqYZYAxSmxK18TePgWWwMXyvmsZppKxi/NW
UKvYjx7DspoT2BUUrjPlDdSMf+njwgAIs/OUDM3P1H4jPAYky6iDOy4MQXhOfGiT
/RzTbtXmThHJnudLj+PyyNUxtqJLlHDQI7PHSJhzsI9E2MblAf05UVPa/Ih8X44g
x8YFmeiTkWQtViym3/3SHxRuWEH3HLQWw/IxOcFPbTcFqx7FF5KQn7xO+c3y2Y3u
ywIpREsLu1K7vISLLMZE3D7JjtSvoBf59t4Mng6f09/F5lOxq0VayYgWFIwEVAfa
jwHfQ1jjVtK0kn9e5bXvGnJ82Muomw==
=NLw3
-----END PGP SIGNATURE-----

--Sig_/j1GTDJzT4/6ee=s5zw975+M--
