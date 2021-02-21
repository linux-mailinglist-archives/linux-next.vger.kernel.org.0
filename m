Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29649320E5A
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 23:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbhBUWto (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 17:49:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34203 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbhBUWtn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 17:49:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkL8V0t8Cz9sRN;
        Mon, 22 Feb 2021 09:48:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613947739;
        bh=G35ZPwIMt0VA+ZZfL9BRx2EJnxXsLHEKc/YH+RAg7Oo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vIi0xCBdxx/FMNHyOaTa0UKxI42QqRPi3STSB6iYwiIt2oYrbEHiaqXMgZpctNP8h
         vLTGPm3TFx6J9lQYXaawvKQCEszet7gRJkXbAblaNMP6kOcnN2ydBr7TOoKr7L7MLf
         bTBuyORs6oeP4PCuO3CzOzKi0D/K6U3ZoMsq9hWU7i6st//Bs2dizCgk9Rp765t9iO
         kCj208ACEwvm2qFI7Of0yNzAkdVIElhdbidDfMeG4FN4xsR1qXD427TZTWx+/Bqzfe
         5zf46O8PJsoWQY+RsPHtEAgdr4bf9iL3LIabreNfvhuZLSqd11CF8UAiYZWOPGwyth
         y0a4jxszwu/FA==
Date:   Mon, 22 Feb 2021 09:48:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Chao Yu <yuchao0@huawei.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the f2fs tree
Message-ID: <20210222094857.129c8818@canb.auug.org.au>
In-Reply-To: <20210215075806.6bdb990c@canb.auug.org.au>
References: <20210125163255.1a87bba4@canb.auug.org.au>
        <20210215075806.6bdb990c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AQd1C5pxWiusBHTA/hApDP6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AQd1C5pxWiusBHTA/hApDP6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 07:58:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> On Mon, 25 Jan 2021 16:32:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Today's linux-next merge of the pidfd tree got a conflict in:
> >=20
> >   fs/f2fs/acl.c
> >=20
> > between commit:
> >=20
> >   7cf2e6173b2d ("f2fs: enhance to update i_mode and acl atomically in f=
2fs_setattr()")
> >=20
> > from the f2fs tree and commit:
> >=20
> >   e65ce2a50cf6 ("acl: handle idmapped mounts")
> >=20
> > from the pidfd tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc fs/f2fs/acl.c
> > index 732ec10e7890,a19e86c9adac..000000000000
> > --- a/fs/f2fs/acl.c
> > +++ b/fs/f2fs/acl.c
> > @@@ -200,27 -200,6 +200,27 @@@ struct posix_acl *f2fs_get_acl(struct i
> >   	return __f2fs_get_acl(inode, type, NULL);
> >   }
> >  =20
> >  +static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
> >  +			  struct posix_acl **acl)
> >  +{
> >  +	umode_t mode =3D inode->i_mode;
> >  +	int error;
> >  +
> >  +	if (is_inode_flag_set(inode, FI_ACL_MODE))
> >  +		mode =3D F2FS_I(inode)->i_acl_mode;
> >  +
> >  +	error =3D posix_acl_equiv_mode(*acl, &mode);
> >  +	if (error < 0)
> >  +		return error;
> >  +	if (error =3D=3D 0)
> >  +		*acl =3D NULL;
> > - 	if (!in_group_p(inode->i_gid) &&
> > - 	    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
> > ++	if (!in_group_p(i_gid_into_mnt(&init_user_ns, inode)) &&
> > ++	    !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FSETID))
> >  +		mode &=3D ~S_ISGID;
> >  +	*mode_p =3D mode;
> >  +	return 0;
> >  +}
> >  +
> >   static int __f2fs_set_acl(struct inode *inode, int type,
> >   			struct posix_acl *acl, struct page *ipage)
> >   { =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.
>=20
> The f2fs tree commit is now
>=20
>   17232e830afb ("f2fs: enhance to update i_mode and acl atomically in f2f=
s_setattr()")

This is now a conflict between the pidfd tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/AQd1C5pxWiusBHTA/hApDP6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAy41kACgkQAVBC80lX
0GzqNQf+P8df7gds32gB3B3HjASb7Oi6fNpVHyvllAQeqMMpJ10ctjOBaED6qcRI
AKC+mG63D6Dzv19eJ7ChnLZuOFFTw8acw/g4+YRjv4p0MswkzVWWUX3veHupBPAA
igWAT2vizY+1AFDcg9vBh23nDmrRxez9Uec3433OOZ+8b7jbJp4SWTr/+oFjwUDe
6uHpn+XM3U8fYMiZG3rh6gmQL5Zis5KbmEmwdK8nFGgK+xF/P99P+y4jd9Mv7vtm
Zzn/Ma5tD9zdT4msZ6mbSQqAMome7KDSAMvnXp805lA5iVmJBjaPB7LpHzhiP/Sr
lQ0C0CWeDi4hLt+Sq0lYwtu+OeQ9UA==
=bsyX
-----END PGP SIGNATURE-----

--Sig_/AQd1C5pxWiusBHTA/hApDP6--
