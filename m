Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8A610F3B7
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 01:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfLCAAp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 19:00:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51065 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfLCAAp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Dec 2019 19:00:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47RhvX1h2lz9sP3;
        Tue,  3 Dec 2019 11:00:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575331241;
        bh=ehUuKtq21c7JP3KxhQWOn6j7URCI+Jki4iw3Ti1zz6c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a+4vUUM7/0EjzX+2stCMoiovqMuVaN0/Pjbl7HBD8Rl+Lsw4Jz5qrj8/fuGSmzVuw
         51i5Iv1y81jAXig8h+Ii7mZBFzmFijQmO+jdyHW6Tjf7h/QJjoU1+kzsHY1DgoSJk2
         sCxwgIwxRHAXYhrg2twqVMIWvA7mDK/mzE5C24JnUp6l5bFhJBNHw8YE7Kexz/ZTC8
         7drAN0FequacPH8xhiNfPWZgQY0gfQG43aOtpea1WrUhr498grCDTLVgjeoFVpEKNL
         xi18fUs5qv1Vm2aNe5++GEp9XV13UjyBupKfjQgBT4n2PA7QZUUt9/AEpMKv5DofbZ
         wK2PtkRyU7EgQ==
Date:   Tue, 3 Dec 2019 11:00:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the y2038 tree with the xfs tree
Message-ID: <20191203110039.2ec22a17@canb.auug.org.au>
In-Reply-To: <20191030153046.01efae4a@canb.auug.org.au>
References: <20191030153046.01efae4a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5_edYof0YP+3JTXH5TkWab8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5_edYof0YP+3JTXH5TkWab8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This conflict is now between the xfs tree and Linus' tree (and the
merge fix up patch below needs applying to that merge.

On Wed, 30 Oct 2019 15:31:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the y2038 tree got a conflict in:
>=20
>   fs/compat_ioctl.c
>=20
> between commit:
>=20
>   837a6e7f5cdb ("fs: add generic UNRESVSP and ZERO_RANGE ioctl handlers")
>=20
> from the xfs tree and commits:
>   011da44bc5b6 ("compat: move FS_IOC_RESVSP_32 handling to fs/ioctl.c")
>   37ecf8b20abd ("compat_sys_ioctl(): make parallel to do_vfs_ioctl()")
>=20
> from the y2038 tree.
>=20
> I fixed it up (see below and the added patch) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> From af387ea192196ffd141234e7e45bcfbc2be1a4fc Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 30 Oct 2019 15:05:29 +1100
> Subject: [PATCH] fix up for "compat: move FS_IOC_RESVSP_32 handling to
>  fs/ioctl.c"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/ioctl.c             | 4 ++--
>  include/linux/falloc.h | 7 +++++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 455ad38c8610..2f5e4e5b97e1 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -495,7 +495,7 @@ int ioctl_preallocate(struct file *filp, int mode, vo=
id __user *argp)
>  /* on ia32 l_start is on a 32-bit boundary */
>  #if defined CONFIG_COMPAT && defined(CONFIG_X86_64)
>  /* just account for different alignment */
> -int compat_ioctl_preallocate(struct file *file,
> +int compat_ioctl_preallocate(struct file *file, int mode,
>  				struct space_resv_32 __user *argp)
>  {
>  	struct inode *inode =3D file_inode(file);
> @@ -517,7 +517,7 @@ int compat_ioctl_preallocate(struct file *file,
>  		return -EINVAL;
>  	}
> =20
> -	return vfs_fallocate(file, FALLOC_FL_KEEP_SIZE, sr.l_start, sr.l_len);
> +	return vfs_fallocate(file, mode | FALLOC_FL_KEEP_SIZE, sr.l_start, sr.l=
_len);
>  }
>  #endif
> =20
> diff --git a/include/linux/falloc.h b/include/linux/falloc.h
> index 63c4f0d615bc..ab42b72424f0 100644
> --- a/include/linux/falloc.h
> +++ b/include/linux/falloc.h
> @@ -45,10 +45,13 @@ struct space_resv_32 {
>  	__s32		l_pad[4];	/* reserve area */
>  };
> =20
> -#define FS_IOC_RESVSP_32		_IOW ('X', 40, struct space_resv_32)
> +#define FS_IOC_RESVSP_32	_IOW ('X', 40, struct space_resv_32)
> +#define FS_IOC_UNRESVSP_32	_IOW ('X', 41, struct space_resv_32)
>  #define FS_IOC_RESVSP64_32	_IOW ('X', 42, struct space_resv_32)
> +#define FS_IOC_UNRESVSP64_32	_IOW ('X', 43, struct space_resv_32)
> +#define FS_IOC_ZERO_RANGE_32	_IOW ('X', 57, struct space_resv_32)
> =20
> -int compat_ioctl_preallocate(struct file *, struct space_resv_32 __user =
*);
> +int compat_ioctl_preallocate(struct file *, int mode, struct space_resv_=
32 __user *);
> =20
>  #endif
> =20
> --=20
> 2.23.0
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/compat_ioctl.c
> index 62e530814cef,9ae90d728c0f..000000000000
> --- a/fs/compat_ioctl.c
> +++ b/fs/compat_ioctl.c
> @@@ -1020,51 -165,38 +165,57 @@@ COMPAT_SYSCALL_DEFINE3(ioctl, unsigned=20
>   	case FIONBIO:
>   	case FIOASYNC:
>   	case FIOQSIZE:
> - 		break;
> -=20
> - #if defined(CONFIG_IA64) || defined(CONFIG_X86_64)
> + 	case FS_IOC_FIEMAP:
> + 	case FIGETBSZ:
> + 	case FICLONERANGE:
> + 	case FIDEDUPERANGE:
> + 		goto found_handler;
> + 	/*
> + 	 * The next group is the stuff handled inside file_ioctl().
> + 	 * For regular files these never reach ->ioctl(); for
> + 	 * devices, sockets, etc. they do and one (FIONREAD) is
> + 	 * even accepted in some cases.  In all those cases
> + 	 * argument has the same type, so we can handle these
> + 	 * here, shunting them towards do_vfs_ioctl().
> + 	 * ->compat_ioctl() will never see any of those.
> + 	 */
> + 	/* pointer argument, never actually handled by ->ioctl() */
> + 	case FIBMAP:
> + 		goto found_handler;
> + 	/* handled by some ->ioctl(); always a pointer to int */
> + 	case FIONREAD:
> + 		goto found_handler;
> + 	/* these two get messy on amd64 due to alignment differences */
> + #if defined(CONFIG_X86_64)
>   	case FS_IOC_RESVSP_32:
>   	case FS_IOC_RESVSP64_32:
>  -		error =3D compat_ioctl_preallocate(f.file, compat_ptr(arg));
>  +		error =3D compat_ioctl_preallocate(f.file, 0, compat_ptr(arg));
>  +		goto out_fput;
>  +	case FS_IOC_UNRESVSP_32:
>  +	case FS_IOC_UNRESVSP64_32:
>  +		error =3D compat_ioctl_preallocate(f.file, FALLOC_FL_PUNCH_HOLE,
>  +				compat_ptr(arg));
>  +		goto out_fput;
>  +	case FS_IOC_ZERO_RANGE_32:
>  +		error =3D compat_ioctl_preallocate(f.file, FALLOC_FL_ZERO_RANGE,
>  +				compat_ptr(arg));
>   		goto out_fput;
>   #else
>   	case FS_IOC_RESVSP:
>   	case FS_IOC_RESVSP64:
>  -		goto found_handler;
>  +		error =3D ioctl_preallocate(f.file, 0, compat_ptr(arg));
>  +		goto out_fput;
>  +	case FS_IOC_UNRESVSP:
>  +	case FS_IOC_UNRESVSP64:
>  +		error =3D ioctl_preallocate(f.file, FALLOC_FL_PUNCH_HOLE,
>  +				compat_ptr(arg));
>  +		goto out_fput;
>  +	case FS_IOC_ZERO_RANGE:
>  +		error =3D ioctl_preallocate(f.file, FALLOC_FL_ZERO_RANGE,
>  +				compat_ptr(arg));
>  +		goto out_fput;
>   #endif
>  =20
> - 	case FICLONE:
> - 	case FICLONERANGE:
> - 	case FIDEDUPERANGE:
> - 	case FS_IOC_FIEMAP:
> - 		goto do_ioctl;
> -=20
> - 	case FIBMAP:
> - 	case FIGETBSZ:
> - 	case FIONREAD:
> - 		if (S_ISREG(file_inode(f.file)->i_mode))
> - 			break;
> - 		/*FALL THROUGH*/
> -=20
>   	default:
>   		if (f.file->f_op->compat_ioctl) {
>   			error =3D f.file->f_op->compat_ioctl(f.file, cmd, arg);

--=20
Cheers,
Stephen Rothwell

--Sig_/5_edYof0YP+3JTXH5TkWab8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3lpacACgkQAVBC80lX
0Gxefgf/eFC5Ja1WCb8ObxkHw12SrZfMlHLZ3b/7qM0WvkkgUXa4VD6Dxyg5bbzY
/h2Qpm7WT2lcmEoKn3zujfXc4DHEJlkewLk2MZA4PS522C0mHaTG7joC5OUnNocr
luluGD/DHU4H96lkrMg5r+q5JYbs6upiuVcFP+1sOA9xgeuqmcx7/IytlDTuBRCK
dJZj1sm2BnBjZbml/9kdnCXxoD/ZAnX4+rFK4L9rMDPlkXOee+jn+o6xPuz5sl5/
hY2t/oZ08f8bKnguN471ChdE8YwAiWHN/6oDUBO/6qusdFwZreJfId0H3dhZ8CUG
Omg3ObpWTZXRZuz0eWieTWN+VA3M6w==
=bZuD
-----END PGP SIGNATURE-----

--Sig_/5_edYof0YP+3JTXH5TkWab8--
