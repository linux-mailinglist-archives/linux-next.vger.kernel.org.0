Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7E4175164
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 01:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgCBAhl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 19:37:41 -0500
Received: from ozlabs.org ([203.11.71.1]:37479 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726592AbgCBAhl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 19:37:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48W1Sf0twSz9sSV;
        Mon,  2 Mar 2020 11:37:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583109458;
        bh=jvcFUHM117CyrBq3WcbbM9BOYsmO5EEKz50Jjm+Zmyc=;
        h=Date:From:To:Cc:Subject:From;
        b=OWl34R2/McLkAOjUevN9acm7ZVlvSftz6DcTRl940Ou2BX4qiDFr+uIknAcVxbCRM
         pu8maZX+UHGTHSGIFjD+OSFwruHd7dZgavFSQhWn5SOy3N/Eth9lVPSg0wURbZHOX4
         sMLzuJMHJZJkPfGvzecoNHxvdu6UtIjKzd6pAbYtG+dkzOjl8me/uCv7msoFy6tTNZ
         Cgo3YnSqIBlXMgqGdbMxJWQCDnl/ihm0/6mZMeuQIPUSqrujG+s/us+j5TqULL/RAo
         tcklbqOnhMmS13xEgjcAhsGYcieBi1YkFHG03FUI/iR6FldXrqEukKwP1zgwXg+2dJ
         Ag/jZHKNhpVow==
Date:   Mon, 2 Mar 2020 11:37:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: build failure after merge of the keys tree
Message-ID: <20200302113737.7c3fdee0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HA33pD_FuR9008Kr8+hkX0h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HA33pD_FuR9008Kr8+hkX0h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/io_uring.c: In function 'io_splice_punt':
fs/io_uring.c:2473:6: error: too few arguments to function 'get_pipe_info'
 2473 |  if (get_pipe_info(file))
      |      ^~~~~~~~~~~~~
In file included from include/linux/splice.h:12,
                 from include/linux/skbuff.h:36,
                 from include/linux/if_ether.h:19,
                 from include/uapi/linux/ethtool.h:19,
                 from include/linux/ethtool.h:18,
                 from include/linux/netdevice.h:37,
                 from include/net/sock.h:46,
                 from fs/io_uring.c:64:
include/linux/pipe_fs_i.h:267:25: note: declared here
  267 | struct pipe_inode_info *get_pipe_info(struct file *file, bool for_s=
plice);
      |                         ^~~~~~~~~~~~~

Caused by commit

  549d46d3827d ("pipe: Add general notification queue support")

interacting with commit

  52b31bc9aabc ("io_uring: add splice(2) support")

from the block tree.

I have added the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Mar 2020 11:27:27 +1100
Subject: [PATCH] io_uring: fix up for get_pipe_info() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index fb8fe0bd5e18..8cdd3870cd4e 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2470,7 +2470,7 @@ static int io_splice_prep(struct io_kiocb *req, const=
 struct io_uring_sqe *sqe)
=20
 static bool io_splice_punt(struct file *file)
 {
-	if (get_pipe_info(file))
+	if (get_pipe_info(file, true))
 		return false;
 	if (!io_file_supports_async(file))
 		return true;
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/HA33pD_FuR9008Kr8+hkX0h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5cVVEACgkQAVBC80lX
0GwfLwf/cot/JmEiiZU7+2qsvBtR14DOu7e/gM2Ew6NfefRoNC7a2/NPVlRvCz8A
8omh0PvgzWjK4XaxGPm0XTte0ZwF+BDRTgh/zY4nTzlpPJQEqxF+Ggw1UyVqNjZg
RCVH05IGikTEwUTJ3FLik6Zm89I4NCtBACllQp/o+EAbyOcOXlgm9MzB/RTXrIDc
2OMx0mzutudj+2zkozRdDguGWJIK97nw3mkOYbh4WAaXhpxyETE73B3l+5B0wV6m
s7+2cUrdW6S2bi+EpaG+sTviyNKrIzmQNItB+oF3J2FFHDyK84FuWcPMLGJN+8lR
JmCgdX9jhxxlyHRPibPwhoQ7hOfsTw==
=8Nn9
-----END PGP SIGNATURE-----

--Sig_/HA33pD_FuR9008Kr8+hkX0h--
