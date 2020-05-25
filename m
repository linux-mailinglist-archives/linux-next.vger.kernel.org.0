Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A6E1E0B25
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 11:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389425AbgEYJ6T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 05:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389407AbgEYJ6T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 05:58:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A88C061A0E;
        Mon, 25 May 2020 02:58:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Vswm5fnrz9sRK;
        Mon, 25 May 2020 19:58:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590400697;
        bh=C5bGOXdSwpoXj/ZvUi/2ELa8jGqYdbWahmElM6nSh5A=;
        h=Date:From:To:Cc:Subject:From;
        b=djMQu8Ht/SaWlEGZDqarXlwGVKijTdoIi9u1SogHphHBVshrLdg3KQDPDmtI18m6b
         q4sjobZ1I06pSB7tNChmLck12mIucN1gMVX9oXMxkkBjZn/yvAy/hlGml6L5P45wMC
         +FcBa/z/q+eoWuqGYLqRhmaTQZsGd0KZWLJ6yyMuIz6+kWx7ZjCZU/yWiQlFeyQl0L
         sQPkIgqRIa2IQZ1rog//40UEBNMG+fEBp7keMwMG6Ci74BVPtnNaTV8GcFbcNPzxht
         IuP6QNpcvXwmT4Wrn4SYU8aS9UcQKm5XAeNhgju5D7SqQP5VNegwJRlq0XzltPNVLw
         8rVTQ7GZzrD8w==
Date:   Mon, 25 May 2020 19:58:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the notifications tree
Message-ID: <20200525195813.0e76ac56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZC=WHHLA_w6i+JSvgWkA_Gd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZC=WHHLA_w6i+JSvgWkA_Gd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the notifications tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/watch_queue.c:67:13: error: 'generic_pipe_buf_confirm' undeclared he=
re (not in a function); did you mean 'generic_pipe_buf_release'?
   67 |  .confirm =3D generic_pipe_buf_confirm,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
      |             generic_pipe_buf_release
kernel/watch_queue.c:69:3: error: 'const struct pipe_buf_operations' has no=
 member named 'steal'
   69 |  .steal  =3D watch_queue_pipe_buf_steal,
      |   ^~~~~
kernel/watch_queue.c:69:12: error: initialization of 'bool (*)(struct pipe_=
inode_info *, struct pipe_buffer *)' {aka '_Bool (*)(struct pipe_inode_info=
 *, struct pipe_buffer *)'} from incompatible pointer type 'int (*)(struct =
pipe_inode_info *, struct pipe_buffer *)' [-Werror=3Dincompatible-pointer-t=
ypes]
   69 |  .steal  =3D watch_queue_pipe_buf_steal,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/watch_queue.c:69:12: note: (near initialization for 'watch_queue_pip=
e_buf_ops.try_steal')

Caused by commit

  c73be61cede5 ("pipe: Add general notification queue support")

from the notifications tree interacting with commits

  76887c256744 ("fs: make the pipe_buf_operations ->steal operation optiona=
l")
  b8d9e7f2411b ("fs: make the pipe_buf_operations ->confirm operation optio=
nal")

from the vfs tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2020 19:53:40 +1000
Subject: [PATCH] pipe: update for pipe_buf_operations changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/watch_queue.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 9a9699c06709..d7a369eab613 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -56,17 +56,9 @@ static void watch_queue_pipe_buf_release(struct pipe_ino=
de_info *pipe,
 	set_bit(bit, wqueue->notes_bitmap);
 }
=20
-static int watch_queue_pipe_buf_steal(struct pipe_inode_info *pipe,
-				      struct pipe_buffer *buf)
-{
-	return -1; /* No. */
-}
-
 /* New data written to a pipe may be appended to a buffer with this type. =
*/
 static const struct pipe_buf_operations watch_queue_pipe_buf_ops =3D {
-	.confirm	=3D generic_pipe_buf_confirm,
 	.release	=3D watch_queue_pipe_buf_release,
-	.steal		=3D watch_queue_pipe_buf_steal,
 	.get		=3D generic_pipe_buf_get,
 };
=20
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/ZC=WHHLA_w6i+JSvgWkA_Gd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7LlrUACgkQAVBC80lX
0GzuDAf+LZceR3VHP4/7LUemV6cqzQTSlUzb+50eSRfyI/Kv7XfEq/ZQNaTKYYS5
ONh+C1OID0KqRuXrJGpMpScwl4ZM21ys8nPGi3fmwPWhGq1pPSikWdU3KAxZPawH
uFVaEQtRCwaE8bqiieN6elL4mTM1wi8zGfKgiakvrpmah77pCHGrfojXqKnwQDur
1KVpJLVMT0cLPoXGWVN572VGEMrQ29HZqi3YOH5p/ZFa63Z0dCC8j1zrPIGzcPgi
H6t2jbv1Hdjo9XXNqJruL9nBE2kKt8XeGZwssXf6ZYENm9QlmvRHynnsOl2efrEQ
w7CxYO9F3fHZdIyOkejNHcDQ7Ybsrg==
=+kXf
-----END PGP SIGNATURE-----

--Sig_/ZC=WHHLA_w6i+JSvgWkA_Gd--
