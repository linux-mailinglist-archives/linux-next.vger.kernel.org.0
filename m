Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCEC1CF234
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 12:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELKSS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 06:18:18 -0400
Received: from ozlabs.org ([203.11.71.1]:59819 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbgELKSS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 06:18:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Ltzr0hsNz9sSg;
        Tue, 12 May 2020 20:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589278696;
        bh=ix19I6h1qe83/nMpXpSgQ/SwrlaGpJzfs1+vdoDLdDY=;
        h=Date:From:To:Cc:Subject:From;
        b=Fqvh8jYPQbGgMrW1fDt6cXrgNNpFN6fXg6tJXJlsuAfK7J+f2mUTVQGqMwTrtxJ7v
         SYaa42I6K7jtxVytEqJI2pJj+XLAYg0y0OcYJO68jPafBnSUV2QLl9ZEE0EYqJC7CR
         N1ITMrY1MkzONEjcOxI5uJ49pAA6p7KpXDFTVvN2D0doD9JXBIZtPw4N3YWm7aZIzL
         TQmXCkmnsUPGKz4B54UVnCAUQFREz7f+ruMTMydlLqmYX2PtPgt3tgzHzQJ6U+041F
         aUO25BkpzkR6w/ulkIHm350hi0H6W8j+LiQJsJZ3mW7sQmjLQG715qipUW9jBNlibN
         moSsmck+qEUbQ==
Date:   Tue, 12 May 2020 20:18:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the pidfd tree
Message-ID: <20200512201811.12480da0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kvU3d8jCt7mdCfQJ7mgN.rv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kvU3d8jCt7mdCfQJ7mgN.rv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pidfd tree, today's linux-next build (x86_64
allnoconfig) failed like this:

fs/nsfs.c:232:6: error: redefinition of 'proc_ns_file'
  232 | bool proc_ns_file(const struct file *file)
      |      ^~~~~~~~~~~~
In file included from fs/nsfs.c:6:
include/linux/proc_fs.h:194:20: note: previous definition of 'proc_ns_file'=
 was here
  194 | static inline bool proc_ns_file(const struct file *file)
      |                    ^~~~~~~~~~~~

Caused by commit

  1e76b8ad203a ("nsproxy: attach to namespaces via pidfds")

I have applied the following hack for today:

=46rom 07065344c6fb39c440b0de5f75842066bc97a675 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 May 2020 20:08:51 +1000
Subject: [PATCH] nsproxy: protect proc_ns_file() when CONFIG_PROC_FS is not=
 set

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/nsfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index 800c1d0eb0d0..9215ad7597d6 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -229,10 +229,12 @@ int ns_get_name(char *buf, size_t size, struct task_s=
truct *task,
 	return res;
 }
=20
+#ifdef CONFIG_PROC_FS
 bool proc_ns_file(const struct file *file)
 {
 	return file->f_op =3D=3D &ns_file_operations;
 }
+#endif
=20
 struct file *proc_ns_fget(int fd)
 {
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/kvU3d8jCt7mdCfQJ7mgN.rv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66d+MACgkQAVBC80lX
0Gzp1wf/R0aGCQvo2aR4sWsYOu0Iy3zpldtgYIIOi1PiB9UHF01Z+h28BFZw9/yh
Kd0UIDKglqPQYMi/JALwPr5RbixCe8kai6vL5dRcvxKOaFLAE+r/hLvOixNkvlFf
jn/Q1ww1BATg5io7I9iTpICLJI/X8pFkB/QnB0cC9tqi/dKGwPGwxwNPCiDW4el5
VRXKI8YToha16G/3Q6bOKy5gdPFdtGLZtYPj/BJ4zmcCA0rvZYCX2/6CJkyMZhqt
38rPjA6ixjOCsRbwgqwNjLY9OpmMLtgnzN20hz+vcKhgO3e9uxcJjImz9q9/nQov
bD6WtZzszUjGJTCXtNEzVBmjH61k6g==
=cu3k
-----END PGP SIGNATURE-----

--Sig_/kvU3d8jCt7mdCfQJ7mgN.rv--
