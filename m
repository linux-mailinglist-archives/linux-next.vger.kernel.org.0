Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF3D3FF794
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 01:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347887AbhIBXET (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Sep 2021 19:04:19 -0400
Received: from ozlabs.org ([203.11.71.1]:60529 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348033AbhIBXEK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Sep 2021 19:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630623790;
        bh=EQCA+y9FfDgV+4Yb2KesMZHXUnD88mVisnlsn+rCf5M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MxTJ9NBi46fL5TBxnoabxGO7Leo15Dfpg7EbpdRQgjILQKVA6V6AKkJZjcE3KYY9+
         cHsmqxcYDN7B14FJNdU7k2KvKLOlLx0T+WCwJC+/4NdLr7UJjxeRYE8L18r2GTJXyK
         zaTMePvZ5E+j0XwVJOt1Yu/MImUoH3LK42JFvxGCntTweoTujskZE+H2Etz5CCPjZ+
         w1z/ltcHpuez9GnL1c908jQb72dWy+j3FX/QDucIcqkGm1+1FAyCs3qzThE/U0BxjR
         cnrutFrfZN2hRHJp6A60mBYbwqFp3R0UQhi2Kv9z1OnWg8t89B2Pnh//svVoU29tus
         Mlq74SWenf5iA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0xKn4c3pz9sPf;
        Fri,  3 Sep 2021 09:03:08 +1000 (AEST)
Date:   Fri, 3 Sep 2021 09:03:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc:     Miklos Szeredi <miklos@szeredi.hu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the overlayfs tree
Message-ID: <20210903090307.48f05d83@canb.auug.org.au>
In-Reply-To: <20210819093910.55f96720@canb.auug.org.au>
References: <20210819093910.55f96720@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C+FxG_NLnqc5.ViBj5.mkA/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C+FxG_NLnqc5.ViBj5.mkA/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Aug 2021 09:39:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the overlayfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/ntfs3/file.c:1231:13: error: initialization of 'struct posix_acl * (*)=
(struct inode *, int,  bool)' {aka 'struct posix_acl * (*)(struct inode *, =
int,  _Bool)'} from incompatible pointer type 'struct posix_acl * (*)(struc=
t inode *, int)' [-Werror=3Dincompatible-pointer-types]
>  1231 |  .get_acl =3D ntfs_get_acl,
>       |             ^~~~~~~~~~~~
> fs/ntfs3/file.c:1231:13: note: (near initialization for 'ntfs_file_inode_=
operations.get_acl')
>=20
> Caused by commit
>=20
>   0cad6246621b ("vfs: add rcu argument to ->get_acl() callback")
>=20
> interacting with commits
>=20
>   4534a70b7056 ("fs/ntfs3: Add headers and misc files")
>   82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
>   4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
>=20
> from the ntfs3 tree.
>=20
> I have added the following merge resolution patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 19 Aug 2021 09:31:21 +1000
> Subject: [PATCH] ntfs3: fix up for "vfs: add rcu argument to ->get_acl() =
callback"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/ntfs3/ntfs_fs.h | 2 +-
>  fs/ntfs3/xattr.c   | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
> index 0c3ac89c3115..a0655b8b7be1 100644
> --- a/fs/ntfs3/ntfs_fs.h
> +++ b/fs/ntfs3/ntfs_fs.h
> @@ -787,7 +787,7 @@ int ntfs_cmp_names_cpu(const struct cpu_str *uni1, co=
nst struct le_str *uni2,
> =20
>  /* globals from xattr.c */
>  #ifdef CONFIG_NTFS3_FS_POSIX_ACL
> -struct posix_acl *ntfs_get_acl(struct inode *inode, int type);
> +struct posix_acl *ntfs_get_acl(struct inode *inode, int type, bool rcu);
>  int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  		 struct posix_acl *acl, int type);
>  int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 98871c895e77..9239c388050e 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -539,8 +539,11 @@ static struct posix_acl *ntfs_get_acl_ex(struct user=
_namespace *mnt_userns,
>   *
>   * inode_operations::get_acl
>   */
> -struct posix_acl *ntfs_get_acl(struct inode *inode, int type)
> +struct posix_acl *ntfs_get_acl(struct inode *inode, int type, bool rcu)
>  {
> +	if (rcu)
> +		return ERR_PTR(-ECHILD);
> +
>  	/* TODO: init_user_ns? */
>  	return ntfs_get_acl_ex(&init_user_ns, inode, type, 0);
>  }
> @@ -640,7 +643,7 @@ static int ntfs_xattr_get_acl(struct user_namespace *=
mnt_userns,
>  	if (!(inode->i_sb->s_flags & SB_POSIXACL))
>  		return -EOPNOTSUPP;
> =20
> -	acl =3D ntfs_get_acl(inode, type);
> +	acl =3D ntfs_get_acl(inode, type, false);
>  	if (IS_ERR(acl))
>  		return PTR_ERR(acl);
> =20

This merge fix patch is now needed when the ntfs3 tree is merged with
Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/C+FxG_NLnqc5.ViBj5.mkA/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmExWCsACgkQAVBC80lX
0GxJ9Af+KdKVLMGSh7UpcfXo6FqbKkMVoQOWvFaZOUDKP0kDGCcnyyR35JgzqKmM
JWyx/5XBuBdBcku7aDvDG2Sev3yV7J0NF80ctKVAivh7nuL7O/V99Zvfap28ZUsv
gb/IZUDDHdV3TvFbCmwA3ns+RerxQdbvY+iLKQRfokMciy8MpJrCsbl3aF1mI21b
o+3RA+PagOPKwSd8wV0ZB0KUx8a8jRXtJY4ROX95jg8E20BB6mCU/mwn0xrzLExz
prxcEE8cBfYfSYVptgnbTek5EE+h2CxF9Vor1QHL4Ju58CNHAgD0+2EPkUdZC6wA
G/G9Oe3SKTQMzge1cU1jQcAi4vZN4g==
=p5ZK
-----END PGP SIGNATURE-----

--Sig_/C+FxG_NLnqc5.ViBj5.mkA/--
