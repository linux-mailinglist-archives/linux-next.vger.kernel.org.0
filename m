Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A2B130B7B
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 02:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgAFBae (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 20:30:34 -0500
Received: from ozlabs.org ([203.11.71.1]:50345 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbgAFBae (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 20:30:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rdHS6FrZz9sR1;
        Mon,  6 Jan 2020 12:30:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578274230;
        bh=yMDpAd1QOKFjQar6fmYKLCg+bdrTlcJiiHW/xzSmJDU=;
        h=Date:From:To:Cc:Subject:From;
        b=W1Pg0Ikbf7pht31LX0B7lwOCDSnxE3PdmFg/ffmp/ul7eMnkqHv1QDkvUX0KdYIZ1
         2kffyE0d8my7N2RmaISOtbdIW4CUpaF5ZRLfCtxbm6pbwLfBlOyp6JXKZWH21DTEjo
         S0JM43ksTPIf2hpuVqO6E+GVu55lcdzd6DQTnDzzNf7RGbbfZ3vnoxXalFdSGYpAGl
         HzOROSE+Qc24Gqn6j1ULuBHgSIO4hUSGA7TUFYObz7zysVTND5oPp8O3pWp3kXDIfy
         ZHgD3sB3PrsGM1e6fnh9DUiuiBamRybJan6LrcjuGtLCY2mGAoxKjH7GOXST5dDKx/
         qChEIc/At24Yg==
Date:   Mon, 6 Jan 2020 12:30:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200106123027.1a162197@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pqe+0R3zoI8vqIGsIjsOL5B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pqe+0R3zoI8vqIGsIjsOL5B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/open.c:977:12: error: conflicting types for 'build_open_flags'
  977 | inline int build_open_flags(const struct open_how *how,
      |            ^~~~~~~~~~~~~~~~
In file included from /home/sfr/next/next/fs/open.c:36:
fs/internal.h:127:12: note: previous declaration of 'build_open_flags' was =
here
  127 | extern int build_open_flags(int flags, umode_t mode, struct open_fl=
ags *op);
      |            ^~~~~~~~~~~~~~~~

Caused by commits

  4e9e15c9426e ("fs: make build_open_flags() available internally")
  3bba3e571bc8 ("io_uring: add support for IORING_OP_OPENAT")

interacting with commit

  0a51692d49ec ("open: introduce openat2(2) syscall")

from the vfs tree.

I have applied the following fix up patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Dec 2019 11:50:51 +1100
Subject: [PATCH] io_uring: fix up for "open: introduce openat2(2) syscall"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/internal.h | 3 ++-
 fs/io_uring.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 166134be439f..dabf747c14fd 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -124,7 +124,8 @@ extern struct file *do_filp_open(int dfd, struct filena=
me *pathname,
 		const struct open_flags *op);
 extern struct file *do_file_open_root(struct dentry *, struct vfsmount *,
 		const char *, const struct open_flags *);
-extern int build_open_flags(int flags, umode_t mode, struct open_flags *op=
);
+extern struct open_how build_open_how(int flags, umode_t mode);
+extern int build_open_flags(const struct open_how *how, struct open_flags =
*op);
=20
 long do_sys_ftruncate(unsigned int fd, loff_t length, int small);
 long do_faccessat(int dfd, const char __user *filename, int mode);
diff --git a/fs/io_uring.c b/fs/io_uring.c
index c770c2c0eb52..60ebdea1d8c6 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2476,16 +2476,18 @@ static int io_openat(struct io_kiocb *req, struct i=
o_kiocb **nxt,
 		     bool force_nonblock)
 {
 	struct open_flags op;
+	struct open_how how;
 	struct file *file;
 	int ret;
=20
-	ret =3D build_open_flags(req->open.flags, req->open.mode, &op);
+	how =3D build_open_how(req->open.flags, req->open.mode);
+	ret =3D build_open_flags(&how, &op);
 	if (ret)
 		goto err;
 	if (force_nonblock)
 		op.lookup_flags |=3D LOOKUP_NONBLOCK;
=20
-	ret =3D get_unused_fd_flags(req->open.flags);
+	ret =3D get_unused_fd_flags(how.flags);
 	if (ret < 0)
 		goto err;
=20
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Pqe+0R3zoI8vqIGsIjsOL5B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4SjbMACgkQAVBC80lX
0Gzf4AgAh3FFiUW5b1cLfbDX6dNTw7MYybIsttqrSvB8zf98dtkz9pb4vMYwaGC+
w0RlNABraY/NnNz7QJIjhwx+vbSM0LUwpt1bWidnPSvfdOwduPVonaRrDsACzmTw
ZbfcQTqh/yqJpRuPc6sxCiai6SIT7LB59iVPKwhqim9bunO25qBg68QC4iiHzLGW
Ggc0i3PsuOvdgLIi2PmiEiRxUwuF49OOEMTtNHGgpkoDPz0TQwtN+E1YPCdwe+gv
kUcfyF5Io0Br2WkRw9iAGy4YfTYYeL07PjspfCuv9lC1M6qEHJgsh7shgvYk0mVu
6yVN1dLdqP5karbSWA/GdEQdT5qoLg==
=JwN7
-----END PGP SIGNATURE-----

--Sig_/Pqe+0R3zoI8vqIGsIjsOL5B--
