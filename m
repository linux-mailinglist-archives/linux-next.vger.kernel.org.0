Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D50E95C3
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 05:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbfJ3EbZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 00:31:25 -0400
Received: from ozlabs.org ([203.11.71.1]:32807 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbfJ3EbY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Oct 2019 00:31:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 472wWT3qj8z9sPK;
        Wed, 30 Oct 2019 15:31:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572409881;
        bh=RJyD0Tjcr5oKzdh/d42tx+96CzKMvhsQ/4NUPLwRs7s=;
        h=Date:From:To:Cc:Subject:From;
        b=U7WU9wdM0ucxrXsPFhL0m0mE6H2eitlAz8LyzD19RPmKtqzYJDmM/8dMPo0mzU82o
         jbt5Hu3z8Lq9UqAjMiQpCHS50sk1Rho8P0iJ4u56ztReohhwRNpfR7Fx1QXa5j9J5N
         wquA5wrp1OjDty3x72nNO4bUXlrBqoxlpPok6OPWvvbe+n4nF4xbEwcZo+9i7AebgC
         Ombk2PvcKQ2U10dQBbWfkQnWEH+UKOCXYf0IroyUa1uYr4ju5+xwRjOuN2EHPECJGz
         8+Hc/u8EXp/1qmgdqyuxHzyRqtTkUBZC8GiLQu3g1l3ZDyoUsooCAlSyEfiWbF0zuE
         Fgq53XT+4SaAA==
Date:   Wed, 30 Oct 2019 15:31:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: linux-next: manual merge of the y2038 tree with the xfs tree
Message-ID: <20191030153046.01efae4a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qpNmKIRF5YMVei_XnY+.A6k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qpNmKIRF5YMVei_XnY+.A6k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the y2038 tree got a conflict in:

  fs/compat_ioctl.c

between commit:

  837a6e7f5cdb ("fs: add generic UNRESVSP and ZERO_RANGE ioctl handlers")

from the xfs tree and commits:
  011da44bc5b6 ("compat: move FS_IOC_RESVSP_32 handling to fs/ioctl.c")
  37ecf8b20abd ("compat_sys_ioctl(): make parallel to do_vfs_ioctl()")

from the y2038 tree.

I fixed it up (see below and the added patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

=46rom af387ea192196ffd141234e7e45bcfbc2be1a4fc Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 30 Oct 2019 15:05:29 +1100
Subject: [PATCH] fix up for "compat: move FS_IOC_RESVSP_32 handling to
 fs/ioctl.c"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ioctl.c             | 4 ++--
 include/linux/falloc.h | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 455ad38c8610..2f5e4e5b97e1 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -495,7 +495,7 @@ int ioctl_preallocate(struct file *filp, int mode, void=
 __user *argp)
 /* on ia32 l_start is on a 32-bit boundary */
 #if defined CONFIG_COMPAT && defined(CONFIG_X86_64)
 /* just account for different alignment */
-int compat_ioctl_preallocate(struct file *file,
+int compat_ioctl_preallocate(struct file *file, int mode,
 				struct space_resv_32 __user *argp)
 {
 	struct inode *inode =3D file_inode(file);
@@ -517,7 +517,7 @@ int compat_ioctl_preallocate(struct file *file,
 		return -EINVAL;
 	}
=20
-	return vfs_fallocate(file, FALLOC_FL_KEEP_SIZE, sr.l_start, sr.l_len);
+	return vfs_fallocate(file, mode | FALLOC_FL_KEEP_SIZE, sr.l_start, sr.l_l=
en);
 }
 #endif
=20
diff --git a/include/linux/falloc.h b/include/linux/falloc.h
index 63c4f0d615bc..ab42b72424f0 100644
--- a/include/linux/falloc.h
+++ b/include/linux/falloc.h
@@ -45,10 +45,13 @@ struct space_resv_32 {
 	__s32		l_pad[4];	/* reserve area */
 };
=20
-#define FS_IOC_RESVSP_32		_IOW ('X', 40, struct space_resv_32)
+#define FS_IOC_RESVSP_32	_IOW ('X', 40, struct space_resv_32)
+#define FS_IOC_UNRESVSP_32	_IOW ('X', 41, struct space_resv_32)
 #define FS_IOC_RESVSP64_32	_IOW ('X', 42, struct space_resv_32)
+#define FS_IOC_UNRESVSP64_32	_IOW ('X', 43, struct space_resv_32)
+#define FS_IOC_ZERO_RANGE_32	_IOW ('X', 57, struct space_resv_32)
=20
-int compat_ioctl_preallocate(struct file *, struct space_resv_32 __user *);
+int compat_ioctl_preallocate(struct file *, int mode, struct space_resv_32=
 __user *);
=20
 #endif
=20
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

diff --cc fs/compat_ioctl.c
index 62e530814cef,9ae90d728c0f..000000000000
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@@ -1020,51 -165,38 +165,57 @@@ COMPAT_SYSCALL_DEFINE3(ioctl, unsigned=20
  	case FIONBIO:
  	case FIOASYNC:
  	case FIOQSIZE:
- 		break;
-=20
- #if defined(CONFIG_IA64) || defined(CONFIG_X86_64)
+ 	case FS_IOC_FIEMAP:
+ 	case FIGETBSZ:
+ 	case FICLONERANGE:
+ 	case FIDEDUPERANGE:
+ 		goto found_handler;
+ 	/*
+ 	 * The next group is the stuff handled inside file_ioctl().
+ 	 * For regular files these never reach ->ioctl(); for
+ 	 * devices, sockets, etc. they do and one (FIONREAD) is
+ 	 * even accepted in some cases.  In all those cases
+ 	 * argument has the same type, so we can handle these
+ 	 * here, shunting them towards do_vfs_ioctl().
+ 	 * ->compat_ioctl() will never see any of those.
+ 	 */
+ 	/* pointer argument, never actually handled by ->ioctl() */
+ 	case FIBMAP:
+ 		goto found_handler;
+ 	/* handled by some ->ioctl(); always a pointer to int */
+ 	case FIONREAD:
+ 		goto found_handler;
+ 	/* these two get messy on amd64 due to alignment differences */
+ #if defined(CONFIG_X86_64)
  	case FS_IOC_RESVSP_32:
  	case FS_IOC_RESVSP64_32:
 -		error =3D compat_ioctl_preallocate(f.file, compat_ptr(arg));
 +		error =3D compat_ioctl_preallocate(f.file, 0, compat_ptr(arg));
 +		goto out_fput;
 +	case FS_IOC_UNRESVSP_32:
 +	case FS_IOC_UNRESVSP64_32:
 +		error =3D compat_ioctl_preallocate(f.file, FALLOC_FL_PUNCH_HOLE,
 +				compat_ptr(arg));
 +		goto out_fput;
 +	case FS_IOC_ZERO_RANGE_32:
 +		error =3D compat_ioctl_preallocate(f.file, FALLOC_FL_ZERO_RANGE,
 +				compat_ptr(arg));
  		goto out_fput;
  #else
  	case FS_IOC_RESVSP:
  	case FS_IOC_RESVSP64:
 -		goto found_handler;
 +		error =3D ioctl_preallocate(f.file, 0, compat_ptr(arg));
 +		goto out_fput;
 +	case FS_IOC_UNRESVSP:
 +	case FS_IOC_UNRESVSP64:
 +		error =3D ioctl_preallocate(f.file, FALLOC_FL_PUNCH_HOLE,
 +				compat_ptr(arg));
 +		goto out_fput;
 +	case FS_IOC_ZERO_RANGE:
 +		error =3D ioctl_preallocate(f.file, FALLOC_FL_ZERO_RANGE,
 +				compat_ptr(arg));
 +		goto out_fput;
  #endif
 =20
- 	case FICLONE:
- 	case FICLONERANGE:
- 	case FIDEDUPERANGE:
- 	case FS_IOC_FIEMAP:
- 		goto do_ioctl;
-=20
- 	case FIBMAP:
- 	case FIGETBSZ:
- 	case FIONREAD:
- 		if (S_ISREG(file_inode(f.file)->i_mode))
- 			break;
- 		/*FALL THROUGH*/
-=20
  	default:
  		if (f.file->f_op->compat_ioctl) {
  			error =3D f.file->f_op->compat_ioctl(f.file, cmd, arg);

--Sig_/qpNmKIRF5YMVei_XnY+.A6k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl25Eg4ACgkQAVBC80lX
0GyZewf/YR8Lp8H7pzS1iv53Wt2ri2Rc3UAT9FEb+w6jiR2Gg5Rq4VEQmiwzdV0j
smdGdVoCVx5hjfEz6vwYTJI53ASzQcXxInPTg2OnJHpWTun/wUBZ3rgYEAWY5a0B
Yf36rPrtLyR1+nrqE0lWy/zM+fumMtAyeTY9Box+K/zsfvkYPZVeZhX0VvHmtTcG
TINTD5Y49BWrO+WnzQA7UongQJORVCdV9YVyVeW0tMStBtKzjveP6SEkqcbaYMif
QLJowlH7DEfK/m/dUFd/JYxd8+U/n9QQlyZ2xAWYYgAPhCl3QfBfSQuhBJnavcJt
6ucZ9+wyfKA6u9DlHjxiljopgGNv4g==
=YVBN
-----END PGP SIGNATURE-----

--Sig_/qpNmKIRF5YMVei_XnY+.A6k--
