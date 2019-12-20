Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F431272D4
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 02:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfLTBgU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 20:36:20 -0500
Received: from ozlabs.org ([203.11.71.1]:41217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727020AbfLTBgU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 20:36:20 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47fBCz3rWGz9sPT;
        Fri, 20 Dec 2019 12:36:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576805776;
        bh=HbJSgAPpeVSdyHoi1ilZt4nel092vLCUO02ZJNeCLTQ=;
        h=Date:From:To:Cc:Subject:From;
        b=WAlArbUZRjFeIDoB5OGkp4Q/pyUREfJKylBegTakkkPaZPoOGQA8x40j0mMMo1RoX
         W3YK1Y665Fs10b2zSV2Ed9j8mS44EWzwUeiMBgzzmakkljDaXopqjKv00AOB2X117c
         EV/UFeXoMO7UrFImIiukp0zg9A3y/sUfAdaTf9E4cpQYfIaHY6Sf/LE/D6jAw0YOc1
         kRvI2Dk9tQ76eQPkOt9hREhM5ImKi2YCRHan4E3icdklyOOaomdzyY7u0L9cTT6CkW
         EJEeN07A9KVDJW0We6S7y7tw4hfLvrQpoRCXc1gh5vjcUVSlRlU4E5d1HROIWuUdCV
         ZhGbVvxC4fmNw==
Date:   Fri, 20 Dec 2019 12:36:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
Subject: linux-next: manual merge of the block tree with the vfs tree
Message-ID: <20191220123614.5f11d2e3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/838RX.1z8k=IWCSx+a4itv.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/838RX.1z8k=IWCSx+a4itv.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/open.c

between commit:

  0a51692d49ec ("open: introduce openat2(2) syscall")

from the vfs tree and commit:

  252270311374 ("fs: make build_open_flags() available internally")

from the block tree.

I fixed it up (see at end, plus the merge fix patch below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

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
index 26edb980df02..c756b8fc44c6 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2337,19 +2337,21 @@ static int io_openat(struct io_kiocb *req, struct i=
o_kiocb **nxt,
 		     bool force_nonblock)
 {
 	struct open_flags op;
+	struct open_how how;
 	struct file *file;
 	int ret;
=20
 	ret =3D io_openat_prep(req);
 	if (ret)
 		goto err;
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

diff --cc fs/open.c
index 50a46501bcc9,24cb5d58bbda..000000000000
--- a/fs/open.c
+++ b/fs/open.c
@@@ -955,29 -955,8 +955,29 @@@ struct file *open_with_fake_path(const=20
  }
  EXPORT_SYMBOL(open_with_fake_path);
 =20
 -inline int build_open_flags(int flags, umode_t mode, struct open_flags *o=
p)
 +#define WILL_CREATE(flags)	(flags & (O_CREAT | __O_TMPFILE))
 +#define O_PATH_FLAGS		(O_DIRECTORY | O_NOFOLLOW | O_PATH | O_CLOEXEC)
 +
- static inline struct open_how build_open_how(int flags, umode_t mode)
++inline struct open_how build_open_how(int flags, umode_t mode)
 +{
 +	struct open_how how =3D {
 +		.flags =3D flags & VALID_OPEN_FLAGS,
 +		.mode =3D mode & S_IALLUGO,
 +	};
 +
 +	/* O_PATH beats everything else. */
 +	if (how.flags & O_PATH)
 +		how.flags &=3D O_PATH_FLAGS;
 +	/* Modes should only be set for create-like flags. */
 +	if (!WILL_CREATE(how.flags))
 +		how.mode =3D 0;
 +	return how;
 +}
 +
- static inline int build_open_flags(const struct open_how *how,
++inline int build_open_flags(const struct open_how *how,
 +				   struct open_flags *op)
  {
 +	int flags =3D how->flags;
  	int lookup_flags =3D 0;
  	int acc_mode =3D ACC_MODE(flags);
 =20

--Sig_/838RX.1z8k=IWCSx+a4itv.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl38JY4ACgkQAVBC80lX
0GxEoQgAorTaH+zAjQtnCGGhhrkRrOLs2vcx2ZQHjVFu3HyN9rwnI2AxFxs89coM
RgBhv7FqJObmGu4S1HYhG1q3V8Lf7HeaxVPyiQ6clq1kSs3dVP1y0au9HRRVtlU1
wEg4Vx8z40V5R9W8kG/zlGBUSBoaO+9XM37ZhlPecaXQaPVUAw+x+4+ODgBxBLfg
XYslhaMkEX5QAO4AtKqhCtDsTf0UuWT+yrvA87MuH+0arFzJnOSooZ6zGZNLRZZz
rQ1Sq+1NT6SbueXWbfSro9TOx15nryz1Ij3KO7iWsIx4zYmhdWNm8BXXOfHErOlz
0bWWVskOqQu+o+4TvyO+y5EwBQaHIQ==
=m5tl
-----END PGP SIGNATURE-----

--Sig_/838RX.1z8k=IWCSx+a4itv.--
