Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A83197679
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 10:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbgC3Ibn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 04:31:43 -0400
Received: from ozlabs.org ([203.11.71.1]:48929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729626AbgC3Ibn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 04:31:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rQfh3672z9sPk;
        Mon, 30 Mar 2020 19:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585557101;
        bh=fbyUzA6k/iyA8xkI6Q4mzU0pOvTrxH+PkLD3DPXI62w=;
        h=Date:From:To:Cc:Subject:From;
        b=SzSmeEVLSRTxjv0gYODyjywi2vRhHmhyre+YyeaB1LeX9wbWSd7INz9DOiMy/cYbS
         8XD5JGk1Oz4tfmuWxlhRYphWZ5oFajGnUMEGkTocK/ycxavKZrSOtpJZFz7Rw41lRp
         Zfeg/VsG0joPt9qmlCVSl6MpgzX+dE2078LzCUfV8XUrf4HcRi/INC/C8hmTw/XejY
         GSxcyGmUGlQ0uD/DWDL0te3FpVev4YflpeAUFZVjp0Bid/84CC9CjkixA2yo0YoQ+C
         1gcjtxPr0lSp8t7egZgdwLB+wn144jK9XNeDG6G/jw8ztKbH5Ye/zEcAfFfGEpio3H
         XdCDHG0fgG10Q==
Date:   Mon, 30 Mar 2020 19:31:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Subject: linux-next: manual merge of the akpm-current tree with the vhost
 tree
Message-ID: <20200330193137.44fd70c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QNEToN4H55D=v4f2nByCx0m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QNEToN4H55D=v4f2nByCx0m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/virtio/virtio_balloon.c

between commit:

  5a6b4cc5b7a1 ("virtio-balloon: Switch back to OOM handler for VIRTIO_BALL=
OON_F_DEFLATE_ON_OOM")

from the vhost tree and commits:

  5193acb63eef ("virtio-balloon: pull page poisoning config out of free pag=
e hinting")o
  226d0484a676 ("virtio-balloon: add support for providing free page report=
s to host")
  49006aae9e94 ("virtio-balloon: switch back to OOM handler for VIRTIO_BALL=
OON_F_DEFLATE_ON_OOM")

from the akpm-current tree.

OK, this is such a mess that all I could do was to revert commit
5a6b4cc5b7a1 from the vhost tree and keep all the akpm-current tree
patches. Please sort this out before Linus gets to see it.

--=20
Cheers,
Stephen Rothwell

--Sig_/QNEToN4H55D=v4f2nByCx0m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BrmoACgkQAVBC80lX
0GyJdAgAjRKVv196kRPG89HoTU52QU7cAczx5LSTCdlveuCt2yP6VPRySJ3mqDgb
nCj3+Wm5WIIMDuwIJp9z8RHM8bDCv9HN1Cum8JKx5LX8tYpc4wFid86+WFz1ycPM
8ZxFP0ORpRc96ijr1fb1Ohm3Y3CvRLaA/hyWzSspcwV5sQVvvH0pO1royQ3QFBuH
TSNEnVmAqMz90++uJ8iJKOAB6ZA46ekJBA4XZt70j4YVxD6WHS3p3TI0qxs6HmNR
ZPdzmootgpKJj9KIppatq9I9ChX+yYHzXoxnh9peUW9Xi/zJ456zvKaDnhRoigro
CzgB5/KYHu/fdfqUVvr22kCbdW46gg==
=Ormc
-----END PGP SIGNATURE-----

--Sig_/QNEToN4H55D=v4f2nByCx0m--
