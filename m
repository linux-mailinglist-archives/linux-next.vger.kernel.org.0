Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28D923B2D5
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 04:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbgHDCpE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 22:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730167AbgHDCpE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2020 22:45:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2943EC06174A;
        Mon,  3 Aug 2020 19:45:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLJy46hTWz9sRR;
        Tue,  4 Aug 2020 12:45:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596509101;
        bh=lu2TmnDTRH3CP1zKMovkbNm+m7M9SAsGg5M7dMOb8OI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uFmebfHGkInmDrmP85RkLHHusiw/nMIbXNmovArLTl1yiZggIYB3NG3Sht/3mQ6zZ
         5vDZDt7qL8iLY6Ju7+DabUNrLOX8Wvyvm5ApeNOTRrn5H6QF14GTyWbSr3UUzbUpZB
         qO6+UC8OY0dhqIFaOVD7buyV5bD9TJxxJmjsW1IBoTao8Ds0ucHMxQl6fQLnauHVP9
         dwSuMGunBKVQ0q9GyAdoSyOONswHpPA9tbx1mln/WllcJP4WZShxLt4fDIwE3f3z9a
         le3PU2ifUtZ8xAsloMS9b00awnjjfBOGpoPvitO4vyev7g42AOCYwVm+++XAid1ALi
         xecu28JR7a8EA==
Date:   Tue, 4 Aug 2020 12:44:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the init tree with the block tree
Message-ID: <20200804124457.5cf2783a@canb.auug.org.au>
In-Reply-To: <20200803195342.781987c3@canb.auug.org.au>
References: <20200717194221.146ab662@canb.auug.org.au>
        <20200803195342.781987c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tnDU2AZAZiUYSoDd=oGN1RW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tnDU2AZAZiUYSoDd=oGN1RW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Aug 2020 19:53:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Fri, 17 Jul 2020 19:42:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> > =20
> > Today's linux-next merge of the init tree got a conflict in:
> >=20
> >   drivers/md/md.c
> >=20
> > between commit:
> >=20
> >   a564e23f0f99 ("md: switch to ->check_events for media change notifica=
tions")
> >=20
> > from the block tree and commit:
> >=20
> >   7e0adbfc20c5 ("md: rewrite md_setup_drive to avoid ioctls")
> >=20
> > from the init tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc drivers/md/md.c
> > index 5b6d46741baa,ee622b67424e..000000000000
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> > @@@ -7836,21 -7790,23 +7820,21 @@@ static void md_release(struct gendis=
k *
> >   	mddev_put(mddev);
> >   }
> >  =20
> >  -static int md_media_changed(struct gendisk *disk)
> >  -{
> >  -	struct mddev *mddev =3D disk->private_data;
> >  -
> >  -	return mddev->changed;
> >  -}
> >  -
> >  -static int md_revalidate(struct gendisk *disk)
> >  +static unsigned int md_check_events(struct gendisk *disk, unsigned in=
t clearing)
> >   {
> >   	struct mddev *mddev =3D disk->private_data;
> >  +	unsigned int ret =3D 0;
> >  =20
> >  +	if (mddev->changed)
> >  +		ret =3D DISK_EVENT_MEDIA_CHANGE;
> >   	mddev->changed =3D 0;
> >  -	return 0;
> >  +	return ret;
> >   }
> >  +
> > - static const struct block_device_operations md_fops =3D
> > + const struct block_device_operations md_fops =3D
> >   {
> >   	.owner		=3D THIS_MODULE,
> >  +	.submit_bio	=3D md_submit_bio,
> >   	.open		=3D md_open,
> >   	.release	=3D md_release,
> >   	.ioctl		=3D md_ioctl, =20
>=20
> This is now a conflict between the block tree and the vfs tree.

This is now a conflict between the vfs tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/tnDU2AZAZiUYSoDd=oGN1RW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8oy6oACgkQAVBC80lX
0Gz7kQf/X5QwiAPHyK7bYlksUQHSRGLY4mSn2LtuT6aKxWc0jx9fb2tZEAlDogfE
blOcxyr4C5ui+OFjV0Gy0Y8m6DGR3Mqwws2d1y87d40RcnmdzSzUjEVQ1yxDdeXt
GhOuys910vo4KW1t69qzcQrtr3LJ4rUr0dUp63Z6lLSLjYkyu0cBc/QEiNfTjdWJ
zfrqA/lRXa0GGtrWox66nvb4C1CyUVvJzn8ffcxEG8+vkBl79XIUfd6yd+ShY+1H
Nd7gfssuFs3/G1EQ66b03+MGTuZIXxqCuiuqs78oma62UePWKIzzvcACbhNtwEFT
4HAAGNl/35YP19BKuQvH4RgY7hxWrA==
=ASaE
-----END PGP SIGNATURE-----

--Sig_/tnDU2AZAZiUYSoDd=oGN1RW--
