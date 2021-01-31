Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1147B309F6C
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 00:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhAaXUZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Jan 2021 18:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhAaXUS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 31 Jan 2021 18:20:18 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF88C061573;
        Sun, 31 Jan 2021 15:19:37 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DTRqR4P3xz9t0l;
        Mon,  1 Feb 2021 10:19:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612135174;
        bh=73uNE7LFH6S0+cjAw3Z4TFxXwm9LHiGGdhDddpFHl4M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FlW4Sw9/mbwfFPCtx4CuxdLqWFCQnryYh4ppxnTubiNW/HKVyDbgjEsWkYPLYmgL/
         mpRzJ0x7sU0TOcTJMDO1sfphqpKT1ZsQS3MwUVg2YfEo1p3Olgpha6dwCnPSn3Ln1k
         qLDrly0aLKwP1j+zPxbVbjCeRrxZRAVUMbV8XzE9H1Tb+q624ua44yMQgGf3lR1/tp
         NJ/npiJTTinuFscv7sjXzJS25KNgaGT80o/BkX6u81Kjp7IQcmk2kOqYbpEpwsu3fF
         BYo7+EPSvqEQRqO7N80PUlbaS2eMwV7BYLMm9fZ2yBU3s6b7go3Sn50RtJ4ia3FMQh
         bsJBU5oNrQTDg==
Date:   Mon, 1 Feb 2021 10:19:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Miklos Szeredi <miklos@szeredi.hu>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Tycho Andersen <tycho@tycho.pizza>,
        Tyler Hicks <code@tyhicks.com>
Subject: Re: linux-next: manual merge of the pidfd tree with the overlayfs
 tree
Message-ID: <20210201101929.618b32e5@canb.auug.org.au>
In-Reply-To: <20210125162336.470e3183@canb.auug.org.au>
References: <20210125162336.470e3183@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2z7DCM4mIfDsXczMCe4tzS8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2z7DCM4mIfDsXczMCe4tzS8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 16:23:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/ecryptfs/inode.c
>=20
> between commit:
>=20
>   176cfe865da6 ("ecryptfs: fix uid translation for setxattr on security.c=
apability")
>=20
> from the overlayfs tree and commit:
>=20
>   c7c7a1a18af4 ("xattr: handle idmapped mounts")
>=20
> from the pidfd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc fs/ecryptfs/inode.c
> index 58d0f7187997,55da9a91f51a..000000000000
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@@ -1024,11 -1043,10 +1045,12 @@@ ecryptfs_setxattr(struct dentry *dentry
>   		rc =3D -EOPNOTSUPP;
>   		goto out;
>   	}
>  -	rc =3D vfs_setxattr(&init_user_ns, lower_dentry, name, value, size,
>  -			  flags);
>  +	inode_lock(lower_inode);
> - 	rc =3D __vfs_setxattr_locked(lower_dentry, name, value, size, flags, N=
ULL);
> ++	rc =3D __vfs_setxattr_locked(&init_user_ns, lower_dentry, name,
> ++				   value, size, flags, NULL);
>  +	inode_unlock(lower_inode);
>   	if (!rc && inode)
>  -		fsstack_copy_attr_all(inode, d_inode(lower_dentry));
>  +		fsstack_copy_attr_all(inode, lower_inode);
>   out:
>   	return rc;
>   }

This is now a conflict between the pidfd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/2z7DCM4mIfDsXczMCe4tzS8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAXOwEACgkQAVBC80lX
0GxydQf8C0/yd2Sf8R/bUl5kk1BwC5eh9CiAYqer0xPMzU7n9KN0I/fEgdB5vRY1
oFHFexfVP4HkXsB86jDMm+/NTXIzQFejnkkM0Sdw6SuMYjO4kcYElBYPqD/2q0LU
69xyko9qLGqPnehRiUzihsCSsj6kjfxaAZyQtUEsGASf0rqDquttXiny0YEJf2yZ
WtSoRNlPBgPRtrncccIY8zzto8ligfYtoPIcFFW7/6pmXsZh/asZZO8/fjFo4yvY
rUgFupeakLyDJNgfCjulIi3qokfpmp6nW5s3n/Svhdhohrm52klYpIBOi3rLrY9S
ZaU5es4wIVY2sHpVxwqh1m0xjPrNDA==
=npri
-----END PGP SIGNATURE-----

--Sig_/2z7DCM4mIfDsXczMCe4tzS8--
