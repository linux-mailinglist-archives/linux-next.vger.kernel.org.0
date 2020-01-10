Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204521367B9
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 07:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgAJG5i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 01:57:38 -0500
Received: from ozlabs.org ([203.11.71.1]:34193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgAJG5i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 01:57:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47vDM26v2Qz9s1x;
        Fri, 10 Jan 2020 17:57:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578639455;
        bh=Wr0+zDCRj35o/nYnhos8p4/tl7SsKzDapyyPzq0fia4=;
        h=Date:From:To:Cc:Subject:From;
        b=i0ehVsrZcowWtGp1Gb+H2VdU982xs4xruWZH6HzGOTvien/M22vGPUWQm2rWuglj7
         3MeykpMRaqhGXLHQo7nUa5bxflnHKKjLyGHmDhFSUlH8rXUEzlAYJYI3KmO3cO7LQU
         6pRc3bm4/XHX5YA/AJr+hnTxj5cxAFaLpcu02ZCkqT8qwGDXsaIJ8gWDamPrQeB/kz
         sKFRVOytmCloZJuD4NMadpUVTEl4uFXBBqkqMgQrzRemK+aoLg5eAyIDvyWE0Mh4+W
         5gVceOd+MPsSB6tQN7h16B3rjw2TJk1bjbFVXUYB3W7K/Xf5PKSKYDoOJYe7HS0+Eo
         O/7MJVx/ZbbPQ==
Date:   Fri, 10 Jan 2020 17:57:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Carlos Maiolino <cmaiolino@redhat.com>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20200110175729.3b5d2338@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vv5f=h6dcSYkxoC+bwd_hB2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vv5f=h6dcSYkxoC+bwd_hB2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

fs/inode.c:1615:5: error: redefinition of 'bmap'
 1615 | int bmap(struct inode *inode, sector_t *block)
      |     ^~~~
In file included from fs/inode.c:7:
include/linux/fs.h:2867:19: note: previous definition of 'bmap' was here
 2867 | static inline int bmap(struct inode *inode,  sector_t *block)
      |                   ^~~~

Caused by commit

  65a805fdd75f ("fibmap: Use bmap instead of ->bmap method in ioctl_fibmap")

I have added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 10 Jan 2020 17:53:19 +1100
Subject: [PATCH] fs: fix up for !CONFIG_BLOCK and bmap

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/inode.c b/fs/inode.c
index 9f894b25af2b..590f36daa006 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1598,6 +1598,7 @@ void iput(struct inode *inode)
 }
 EXPORT_SYMBOL(iput);
=20
+#ifdef CONFIG_BLOCK
 /**
  *	bmap	- find a block number in a file
  *	@inode:  inode owning the block number being requested
@@ -1621,6 +1622,7 @@ int bmap(struct inode *inode, sector_t *block)
 	return 0;
 }
 EXPORT_SYMBOL(bmap);
+#endif
=20
 /*
  * With relative atime, only update atime if the previous atime is
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/vv5f=h6dcSYkxoC+bwd_hB2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4YIFkACgkQAVBC80lX
0GyxBQf/RzArvoj4CM7CXQ574qEmieNaTjvoXQpRPglLfjg93NCT0QUsdup0mYtU
eQwptOAxum2K5EkGGdCqD2+yMxKzETG7Jh++Wlf0aa+G0wYpAYIY67r96QXnwCwy
uxd99r4yxWFlPUQIXmrGsAZE/73K2DjJFngEjHfBwyQaodH8LRRszyCNMxLfXkwW
iOAi0iApveyemMGGo7t+DCeASNbjWCE/L1qvDLMV4AHXwq/on2dzv5GQF9TPegl2
+xU/3B8YZsT9ZiOaqOiOdZsVd96vNrEmhM2HJYSPnukytVbwdfUQmj6WS0u5suxD
8fC5xCLZc8gJcyhjwHGXdCjRI+safg==
=Ph5h
-----END PGP SIGNATURE-----

--Sig_/vv5f=h6dcSYkxoC+bwd_hB2--
