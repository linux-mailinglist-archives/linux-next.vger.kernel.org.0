Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046383FC060
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 03:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239228AbhHaBOh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 21:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhHaBOg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 21:14:36 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80548C061575;
        Mon, 30 Aug 2021 18:13:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gz8Ml2KBfz9sT6;
        Tue, 31 Aug 2021 11:13:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630372419;
        bh=NvKX1qVZAnfCPVE4H3/0yh3zCLm3YMLzx80u8/vDjd8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ngpikwQNP+Ujfbvz/K4R3SDsmmH6vHqaFziMptEViZpRsYMcbumQhhIjkQSQ4Ca/I
         umaCohBpOwd+Q1dwbo8Pk3oc0Pxq/4xdqJGdSVs8CxBuG66UIJbJoxIouyEpAbt7lx
         DxMsWD7DrmhwkJNTYOSRQt3P4pLwHcG7pCqC7WrDpHUAWryl8VN1+UC3ZuxwokRsrO
         am7vltjPSi9QKg7FE49+yF6X+790/Rhax4vfCOhSUcKb69VRg5nb2RYCbv83mtjv6W
         teRq7wGolHvoTj+5jkQ5+98IoCnpEnYL54r/JWbFfI1Vwnt4KvGOX23/DJ7UN0jrDn
         t8r5bFJ0n27sQ==
Date:   Tue, 31 Aug 2021 11:13:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chuck Lever <chuck.lever@oracle.com>
Cc:     Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the file-locks tree with the cel
 tree
Message-ID: <20210831111338.2e3a222c@canb.auug.org.au>
In-Reply-To: <20210824100737.4bd6d815@canb.auug.org.au>
References: <20210824100737.4bd6d815@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dX5Z+..yBvC/XOO+yqG3Ki0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dX5Z+..yBvC/XOO+yqG3Ki0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 24 Aug 2021 10:07:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the file-locks tree got a conflict in:
>=20
>   fs/nfs/file.c
>=20
> between commit:
>=20
>   c045f1c40a48 ("nfs: don't allow reexport reclaims")
>=20
> from the cel tree and commit:
>=20
>   f7e33bdbd6d1 ("fs: remove mandatory file locking support")
>=20
> from the file-locks tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/nfs/file.c
> index 7411658f8b05,514be5d28d70..000000000000
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@@ -806,13 -806,6 +806,9 @@@ int nfs_lock(struct file *filp, int cmd
>  =20
>   	nfs_inc_stats(inode, NFSIOS_VFSLOCK);
>  =20
>  +	if (fl->fl_flags & FL_RECLAIM)
>  +		return -ENOGRACE;
>  +
> - 	/* No mandatory locks over NFS */
> - 	if (__mandatory_lock(inode) && fl->fl_type !=3D F_UNLCK)
> - 		goto out_err;
> -=20
>   	if (NFS_SERVER(inode)->flags & NFS_MOUNT_LOCAL_FCNTL)
>   		is_local =3D 1;
>  =20

This is now a conflict between the cel tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dX5Z+..yBvC/XOO+yqG3Ki0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEtgkIACgkQAVBC80lX
0GzWVAf/Z4F2W+ERoQJTNbk/TzqKe4sxP4te7FOplNhSEKr/OhJe35S+rOv593Tq
KXSmss0rPZq1rg+gZWN1YDEqwm/YiB/d98MDbFJjrDT8dL4GmNZNEa6p6DqNf85o
OK6VWHTzWkNVVRPTouS67647dwkcf8WBmJDaCZ67wNS6YZxBdaPKM9YPc9Y1yGfA
8OOK8RTW1PL7DLsJLsCFhQ2IqHPqcip37xRSZSKCvTXDFR7vxrC7hvJD9SKVjTJ0
VYMPpGsnqFiSxK9uJab6hbIoDx4XXrR2oCGE7xtFS4YNfOx22JYTgG+cfP8OQoch
4KajMWm2bt7758FjvOdof5pGxDgOpw==
=xhXZ
-----END PGP SIGNATURE-----

--Sig_/dX5Z+..yBvC/XOO+yqG3Ki0--
