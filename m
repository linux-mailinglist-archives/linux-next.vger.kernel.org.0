Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73B123A256
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 11:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgHCJxt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 05:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgHCJxs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2020 05:53:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D707C06174A;
        Mon,  3 Aug 2020 02:53:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKtWF122Sz9sR4;
        Mon,  3 Aug 2020 19:53:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596448426;
        bh=T1hiIwhe18BEViohyPd8wdN+KMPgi+lgSdAGVLJ+gas=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LYPnDAG3ec2BwZyLNZCTXOEFbJNAp0A2xx4AbrAYdRGbQ02NQMF0zjIjvxo34ghs1
         GTgSZikfRs1UBLe/j3KJPgQOzCybSnhlwHKTliDHU9x0wWLbPW7JkhCGd6UNh/abkh
         GtE12fjLdjBwS1PwMzw/SAs2lzYBqskH4Q+kFnckp305r4JirypsS+OIZ1mG4NzBLK
         YmD/Q3uxQ6UvXR8FRe79tZPPWootRe+1MXSv9LIo9pRtSZy3rFbDfJQGYMGcmbLZU4
         I89o6NSJz2Ev1XnpMBP1BgDWByH7DhoQ9pSBqO7O4A4y8qpjIJoljUa8VH/kLnQHDG
         wkTHw9PKCNQ/w==
Date:   Mon, 3 Aug 2020 19:53:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the init tree with the block tree
Message-ID: <20200803195342.781987c3@canb.auug.org.au>
In-Reply-To: <20200717194221.146ab662@canb.auug.org.au>
References: <20200717194221.146ab662@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EWMb.r6q5dcMb1uac.Isdeu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EWMb.r6q5dcMb1uac.Isdeu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 Jul 2020 19:42:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>

> Today's linux-next merge of the init tree got a conflict in:
>=20
>   drivers/md/md.c
>=20
> between commit:
>=20
>   a564e23f0f99 ("md: switch to ->check_events for media change notificati=
ons")
>=20
> from the block tree and commit:
>=20
>   7e0adbfc20c5 ("md: rewrite md_setup_drive to avoid ioctls")
>=20
> from the init tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/md/md.c
> index 5b6d46741baa,ee622b67424e..000000000000
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@@ -7836,21 -7790,23 +7820,21 @@@ static void md_release(struct gendisk *
>   	mddev_put(mddev);
>   }
>  =20
>  -static int md_media_changed(struct gendisk *disk)
>  -{
>  -	struct mddev *mddev =3D disk->private_data;
>  -
>  -	return mddev->changed;
>  -}
>  -
>  -static int md_revalidate(struct gendisk *disk)
>  +static unsigned int md_check_events(struct gendisk *disk, unsigned int =
clearing)
>   {
>   	struct mddev *mddev =3D disk->private_data;
>  +	unsigned int ret =3D 0;
>  =20
>  +	if (mddev->changed)
>  +		ret =3D DISK_EVENT_MEDIA_CHANGE;
>   	mddev->changed =3D 0;
>  -	return 0;
>  +	return ret;
>   }
>  +
> - static const struct block_device_operations md_fops =3D
> + const struct block_device_operations md_fops =3D
>   {
>   	.owner		=3D THIS_MODULE,
>  +	.submit_bio	=3D md_submit_bio,
>   	.open		=3D md_open,
>   	.release	=3D md_release,
>   	.ioctl		=3D md_ioctl,

This is now a conflict between the block tree and the vfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EWMb.r6q5dcMb1uac.Isdeu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8n3qYACgkQAVBC80lX
0Gzj+QgAlvI7u/eGcFYAZGpzbkVgp8++rH4m/kM2TnKu7fDR/+C4fqQYyNjempow
XcZ30gfCQqnsOxYQiIdp5B63f/ewc2R4/WifcgDBBLf6goIzSjptsxg6XgnoF8m3
3utbzm3kyuaZegtjz/YE43cXEi10qCtOJQBAkkL8Hm1oMkz78iyrvZ3GS2ef+V6U
KRT732QIQvlenrkE8OUOFA9k0eQtfa1zqQt4bhfNjKnClj/fOG3YIQQnMRhqsQ25
7iYssORLdQeDQ5r0vYEIPmDYGStS6OD+YB0c55QlWNgrGwWnnjPj5bl2sDUuIlL7
BZmpN0xQ1jxckMvg0S9D1mSMeOZZeA==
=N5bW
-----END PGP SIGNATURE-----

--Sig_/EWMb.r6q5dcMb1uac.Isdeu--
