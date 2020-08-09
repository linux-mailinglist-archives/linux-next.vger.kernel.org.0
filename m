Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43791240056
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 00:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgHIWrO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 18:47:14 -0400
Received: from ozlabs.org ([203.11.71.1]:36329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgHIWrM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Aug 2020 18:47:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPvNr2BcHz9sTT;
        Mon, 10 Aug 2020 08:47:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597013229;
        bh=h3ZagsVIucyTEwdsg2dwiVt2ir6VGtqyV8dklVONgso=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J4NGEFo7vtlf2/N+uabDjIbyApEMECqZbtJGHVa2ND4DKdYzwjwQePeSH8/IpA/wO
         l249HfblC536ePWvQRz2FLLAgIG49Op45pcTDzbddFG+aKJeOtsP7BQ62ab6IPauW6
         cxbZyvHRtCOj1ZKkBvKLmRFpqjpPAR4SohCw524x4wy4Fxhry53TzHropuPwXTqJuX
         sb378Rw5OWb1OnLetPT+HToNUyYns24oQCLfTnFwUAhaeUvDAbxG+cYV9ZsoQBSWkI
         462xgfp03ecNWg5mMupNr0BGpO2RuzG8smeFtglbzB46J/lpGPWeNE4r9kHsy/vgMW
         NDfKR/uN3LSzQ==
Date:   Mon, 10 Aug 2020 08:47:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the fsinfo tree with the vfs tree
Message-ID: <20200810084707.0745be30@canb.auug.org.au>
In-Reply-To: <20200803190532.5b69d3f4@canb.auug.org.au>
References: <20200803190532.5b69d3f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Wa9cyAcdtD4B16icUayXhM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Wa9cyAcdtD4B16icUayXhM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Aug 2020 19:05:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the fsinfo tree got a conflict in:
>=20
>   fs/internal.h
>=20
> between commits:
>=20
>   c60166f04283 ("init: add an init_mount helper")
>   09267defa36a ("init: add an init_umount helper")
>=20
> from the vfs tree and commits:
>=20
>   8c62d62ddd1f ("fsinfo: Allow retrieval of superblock devname, options a=
nd stats")
>   df9f487eeb11 ("fsinfo: Allow fsinfo() to look up a mount object by ID")
>   0a83b1d9fdcd ("fsinfo: Allow mount information to be queried")
>   969ba80e4121 ("fsinfo: Allow mount topology and propagation info to be =
retrieved")
>   a177ce034bec ("fsinfo: Add an attribute that lists all the visible moun=
ts in a namespace")
>=20
> from the fsinfo tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/internal.h
> index 10517ece4516,267b4aaf0271..000000000000
> --- a/fs/internal.h
> +++ b/fs/internal.h
> @@@ -96,11 -95,15 +102,20 @@@ extern int __mnt_want_write_file(struc
>   extern void __mnt_drop_write_file(struct file *);
>  =20
>   extern void dissolve_on_fput(struct vfsmount *);
>  +
>  +int path_mount(const char *dev_name, struct path *path,
>  +		const char *type_page, unsigned long flags, void *data_page);
>  +int path_umount(struct path *path, int flags);
>  +
> + extern int lookup_mount_object(struct path *, unsigned int, struct path=
 *);
> + extern int fsinfo_generic_mount_source(struct path *, struct fsinfo_con=
text *);
> + extern int fsinfo_generic_mount_info(struct path *, struct fsinfo_conte=
xt *);
> + extern int fsinfo_generic_mount_topology(struct path *, struct fsinfo_c=
ontext *);
> + extern int fsinfo_generic_mount_point(struct path *, struct fsinfo_cont=
ext *);
> + extern int fsinfo_generic_mount_point_full(struct path *, struct fsinfo=
_context *);
> + extern int fsinfo_generic_mount_children(struct path *, struct fsinfo_c=
ontext *);
> + extern int fsinfo_generic_mount_all(struct path *, struct fsinfo_contex=
t *);
> +=20
>   /*
>    * fs_struct.c
>    */

This is now a conflict between the fsinfo tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Wa9cyAcdtD4B16icUayXhM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8wfOsACgkQAVBC80lX
0GyCZwgAnsLaOvYhWFrARnKSabV2BCotjmm0h/XdAYvP9z74PyQYO7TnhPDCrvC7
5dm9XMGhS/FI6p24vnJkrmb9YQdPTAg2LBynyQ3TGpbduMom9rDK7rbhSQn38mTT
uY4oN8PRJDCzYeJfDaxS8DTYt/+ikDrsPOCQe0UotuEW4aBn8o1n4902hi1Ecfd8
rfgaUS4nYyGbOxZ66j97MGOZfq3SY9RkzGdxxXmObqSaHxj7Hwhk9vCYLVx6zGOJ
J2xjwbTn6tgOQDLHAFf4BNHDutY5KjniH5e0FP30UIc22poBqV3UUpWkWm3wp6MJ
Uq7+bbFp7iYJqZPedezKcTN4KPVGZQ==
=Q9Xw
-----END PGP SIGNATURE-----

--Sig_/1Wa9cyAcdtD4B16icUayXhM--
