Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2017343C75B
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 12:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbhJ0KLx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 06:11:53 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56693 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbhJ0KLw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 06:11:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfPYd6s4Mz4xbC;
        Wed, 27 Oct 2021 21:09:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635329366;
        bh=Nt0ovT/aF/pfHbmyRO6qwxpTGq2nM0FPv6PVv43Na6A=;
        h=Date:From:To:Cc:Subject:From;
        b=Ef+UEmCzssS4E8D10fuHGyps8ZaxO7zK0uKLBmVvwcQ+HGtAV2AgsmdqCYO7hyUUF
         SYtg4H684QgJH5nQK7bOQeQrPtJnpzcCDBBAzUZzJkeHpqLnJTKq9DPPw4iBrNoIJu
         t/8Gy+M95olZmeQhpqzx10Z/YmVgTcmShV3EpD0hd8rkm1pkMO4BKDrcjAFgxyfZ7X
         pbIEczXyJYHMW1AdByf+LlvKGJ7PQm425molWNCaj8zC6weha2rM5/7dMHx7HBQH5s
         7a71UdN5jn6FD45eOWDlVlY6kW8Q49SBGdAVY6qjkvfn4lkGLaJOgGnT78MmH+TTjO
         E1k1Ni+ZpZ7dA==
Date:   Wed, 27 Oct 2021 21:09:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: build failure after merge of the btrfs tree
Message-ID: <20211027210924.22ef5881@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WBXj/Gqj3ng9sdQkmCFxe+v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WBXj/Gqj3ng9sdQkmCFxe+v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[I am not sure why this error only popped up after I merged Andrew's
patch set ...]

After merging the btrfs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/string.h:253,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/cpumask.h:5,
                 from arch/x86/include/asm/msr.h:11,
                 from arch/x86/include/asm/processor.h:22,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:7,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:55,
                 from include/linux/wait.h:9,
                 from include/linux/mempool.h:8,
                 from include/linux/bio.h:8,
                 from fs/btrfs/ioctl.c:7:
In function 'memcpy',
    inlined from '_btrfs_ioctl_send' at fs/btrfs/ioctl.c:4846:3:
include/linux/fortify-string.h:219:4: error: call to '__write_overflow' dec=
lared with attribute error: detected write beyond size of object (1st param=
eter)
  219 |    __write_overflow();
      |    ^~~~~~~~~~~~~~~~~~

Caused by commit

  c8d9cdfc766d ("btrfs: send: prepare for v2 protocol")

This changes the "reserved" field of struct btrfs_ioctl_send_args from 4 u6=
4's to 3, but the above memcpy is copying the "reserved" filed from a struc=
t btrfs_ioctl_send_args_32 (4 u64s) into it.

All I could really do at this point was mark BTRFS_FS as BROKEN
(TEST_KMOD selects BTRFS_FS):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 27 Oct 2021 20:53:24 +1100
Subject: [PATCH] make btrfs as BROKEN due to an inconsistent API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/Kconfig  | 1 +
 lib/Kconfig.debug | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/btrfs/Kconfig b/fs/btrfs/Kconfig
index 520a0f6a7d9e..f7dd994a88af 100644
--- a/fs/btrfs/Kconfig
+++ b/fs/btrfs/Kconfig
@@ -20,6 +20,7 @@ config BTRFS_FS
 	select SRCU
 	depends on !PPC_256K_PAGES	# powerpc
 	depends on !PAGE_SIZE_256KB	# hexagon
+	depends on BROKEN
=20
 	help
 	  Btrfs is a general purpose copy-on-write filesystem with extents,
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0104cafd403f..44a6df361016 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2491,6 +2491,7 @@ config TEST_KMOD
 	depends on m
 	depends on NETDEVICES && NET_CORE && INET # for TUN
 	depends on BLOCK
+	depends on BROKEN
 	select TEST_LKM
 	select XFS_FS
 	select TUN
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/WBXj/Gqj3ng9sdQkmCFxe+v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF5JVQACgkQAVBC80lX
0GwtCAf+KbDue8qiMCaDQMC87Jw+o9kewaR/gAkB2q0OGXE7xlecog2r/97vfCt+
GJ4W8R+HmtYgCdR9Kz0uRTFVQyw9jMEZYyqy+XrL5jHYRLM8kRJ6VX/XNblgA+Xb
EHG6oeqW7cUejrqM2aJzmRgpKbBMutvIzljQyamQpup8drSxMVdMl0YQ50Y3dDkk
IPsRSNFQlLOk3eVKYuKzfQWi62pYFwcBkA3My3MZC35KQ4xHHbQ6bDJPm+uSNG/6
g/EV8EGYVS3H5++iCSiVEYQdtyDkCKdhqYwD6BdLndniop/DIBRlRWhgmJ4a31dP
990O0RgzEPp/sYh4T1fOpXmhE3Getg==
=VzlW
-----END PGP SIGNATURE-----

--Sig_/WBXj/Gqj3ng9sdQkmCFxe+v--
