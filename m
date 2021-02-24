Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD30324703
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 23:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbhBXWmV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 17:42:21 -0500
Received: from ozlabs.org ([203.11.71.1]:46751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233034AbhBXWmU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Feb 2021 17:42:20 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dm9rd25GXz9sRN;
        Thu, 25 Feb 2021 09:41:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614206498;
        bh=ZORBWEEtjZgsTkrdMG0CZU74ty/pLXBNh3gD6wpO0M4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VrVppo6CuXnDL5cHLCdOrX1hmJBLruUPpHYcssPCX/fAJRUUWaXl37IPMnojUBZ+T
         4ThN9iJcMytHXRnzKzzJ5EsInG+OTBPtfgLd/QhjaCDBo6o5HLdUkKgJKYX/MFJFkH
         9aMGxwUC5BReZtkgbNculjOUJ8Jv6aE7npttqkFN5RW3jT2Msso85sC2a6eHMN7lfJ
         Qh4/QSW/7K4q8jBSU6vTvTAF/LsrkxND7lbC+I4TG4nUuOFWoDMISs4vuu+OwaT1yS
         JLqAvVOUiguRZAetKu3tdkohwmzO3fJ7AblmVL1If6FH9gRKsXJNkGqmK+z//QIA6r
         HY8E57hylBOUQ==
Date:   Thu, 25 Feb 2021 09:41:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 pidfd tree
Message-ID: <20210225094136.05a1aabe@canb.auug.org.au>
In-Reply-To: <20210215085441.48edb08f@canb.auug.org.au>
References: <20210127224351.486fd977@canb.auug.org.au>
        <20210215085441.48edb08f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EcadYf3QhxJO2krOZ.7qV+n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EcadYf3QhxJO2krOZ.7qV+n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 08:54:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Wed, 27 Jan 2021 22:43:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> >=20
> >   fs/hugetlbfs/inode.c
> >=20
> > between commit:
> >=20
> >   2f221d6f7b88 ("attr: handle idmapped mounts")
> >=20
> > from the pidfd tree and commit:
> >=20
> >   57d3629b7a9a ("hugetlbfs: remove useless BUG_ON(!inode) in hugetlbfs_=
setattr()")
> >=20
> > from the akpm-current tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc fs/hugetlbfs/inode.c
> > index c5c32eb59498,ca9e25427f2d..000000000000
> > --- a/fs/hugetlbfs/inode.c
> > +++ b/fs/hugetlbfs/inode.c
> > @@@ -760,9 -766,7 +767,7 @@@ static int hugetlbfs_setattr(struct use
> >   	unsigned int ia_valid =3D attr->ia_valid;
> >   	struct hugetlbfs_inode_info *info =3D HUGETLBFS_I(inode);
> >  =20
> > - 	BUG_ON(!inode);
> > -=20
> >  -	error =3D setattr_prepare(dentry, attr);
> >  +	error =3D setattr_prepare(&init_user_ns, dentry, attr);
> >   	if (error)
> >   		return error;
> >    =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.
>=20
> The akpm-current commit is now
>=20
>   b557c21f61f8 ("hugetlbfs: remove useless BUG_ON(!inode) in hugetlbfs_se=
tattr()")

This is now a conflict between the akpm-current tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EcadYf3QhxJO2krOZ.7qV+n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA21iAACgkQAVBC80lX
0GxL7wgAlWm0Pey0FWWy1+erLO7y2mZ1LTfCDkuuZLyY3CTIjffMXqBZIwi2quFq
u2WQarIA+eGVR4c8picKSNPAQUvlq1wCJa3s0Gzt/D61tBsrMS0/3KRnkKDJTcMO
2zLvGWVCZ1LBPHsAtmcYu506SisxCiyJRP+T50ZUP/XHKnvPbi/oDrMoD965M9ya
T1r40lGJdR+RfHe43uMDbPAe5ml0GzkqePLHdkQFViuhFfTV9u6e5DGFWAh4YOiT
E8IsDcLO8OzpTfSEB3AnFqt+Ga51vJk2/YthdO0Bxd5RDQRdXJtbMYsek7shporF
Y80k5lVPcb4OpNbt8c1x2k+gak4cmA==
=1JyT
-----END PGP SIGNATURE-----

--Sig_/EcadYf3QhxJO2krOZ.7qV+n--
