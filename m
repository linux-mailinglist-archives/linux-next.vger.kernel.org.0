Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113C311C375
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 03:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfLLCpU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 21:45:20 -0500
Received: from ozlabs.org ([203.11.71.1]:45305 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727756AbfLLCpU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 21:45:20 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YJ7K2HDXz9sPL;
        Thu, 12 Dec 2019 13:45:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576118717;
        bh=k5K3z4pR/6kRfzSrFFFQbpNvkWUM7O/Rpu0gsbd+/sU=;
        h=Date:From:To:Cc:Subject:From;
        b=mVksRyZyLywzo/o5OV4zsssqsJpLPX3l0SQeiV9xcURBWWYk+gn1mE+RDSEmpU5Yj
         JL0xe/s4NZM574NKhyR7WcCZd/VOllpj1vsuZnjzQkAMbDi7GFJOmkbiJd5e9GHCfF
         Aqlx3D4MJ/XegZD7FZN6QxG/3ReB8OeM3RyoUPoctXpDLdiBFHy64ig6AZsNSnTp0Y
         KkdexpMkZ+Th5Hc6XEQJen+GKwL4no9sBZyKFhddV186ytJHvCWeIYNFCFUJlQgMr9
         4E9LUcje4CXQQHGQvDAn+50uOEkSOehySnNPvoMPxxMmFVeb6JwFqaEz4tykXAvRpl
         bswtvl92eLypg==
Date:   Thu, 12 Dec 2019 13:45:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20191212134516.3b5f4a4e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0UV9VL474PMc.NDmqJoHEA8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0UV9VL474PMc.NDmqJoHEA8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/misc/watch_queue.c: In function 'watch_queue_set_filter':
drivers/misc/watch_queue.c:526:2: error: implicit declaration of function '=
rcu_swap_protected' [-Werror=3Dimplicit-function-declaration]
  526 |  rcu_swap_protected(wqueue->filter, wfilter,
      |  ^~~~~~~~~~~~~~~~~~

Caused by commit

  af8c9224182e ("rcu: Remove rcu_swap_protected()")

interacting with commit

  fe78d401ca6b ("General notification queue with user mmap()'able ring buff=
er")

from the keys tree.

I have added the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Dec 2019 13:37:52 +1100
Subject: [PATCH] rcu: fix up for "Remove rcu_swap_protected()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/misc/watch_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/watch_queue.c b/drivers/misc/watch_queue.c
index b3fc59b4ef6c..a4a77ec977ac 100644
--- a/drivers/misc/watch_queue.c
+++ b/drivers/misc/watch_queue.c
@@ -523,8 +523,8 @@ static long watch_queue_set_filter(struct inode *inode,
 	kfree(tf);
 set:
 	inode_lock(inode);
-	rcu_swap_protected(wqueue->filter, wfilter,
-			   lockdep_is_held(&inode->i_rwsem));
+	wfilter =3D rcu_replace_pointer(wqueue->filter, wfilter,
+				      lockdep_is_held(&inode->i_rwsem));
 	inode_unlock(inode);
 	if (wfilter)
 		kfree_rcu(wfilter, rcu);
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/0UV9VL474PMc.NDmqJoHEA8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xqbwACgkQAVBC80lX
0Gzfxgf/UmzYVrv9LVLeuFtFsbDUbp9ZL3sn+amw2q8iPpFqw08HCSeS4cjDYMd5
0t05wMDIj6mKqlzJtricpN5Gxzdx25MJgpqcQsDdktF9N1uErK6ZVXQ43bihTH6e
6BrfPj2/X8sN2dU5NFervkLN+BWo6S6s1C8VkhRncEPHFfu2ymePZw42Ii2v9DCg
5gn1uhatUR3NwyEJXuD/6bFFxOO4FO3bReZzsRlFzcyhNx87OTX56D8pUPOAkT1o
y+PW6ZqWIPi5E2tb2CaBjKy9B4IFSs5C5l6krs779uRVx6vcigC2Ik/bc+G8l8E8
1oiuXSJbjGZ+G2fn4ht6od8WXDc3jw==
=FoR4
-----END PGP SIGNATURE-----

--Sig_/0UV9VL474PMc.NDmqJoHEA8--
