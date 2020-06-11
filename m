Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E28C1F5FD8
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 04:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgFKCMp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 22:12:45 -0400
Received: from ozlabs.org ([203.11.71.1]:48477 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbgFKCMp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jun 2020 22:12:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49j6nj0ljRz9sR4;
        Thu, 11 Jun 2020 12:12:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591841563;
        bh=Ti4/i5bL9OOnPE6/+uEiwQ0QeYNMX1+rL2JOXR8WTxU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pwZuTqdpWj6LuyzyCFFnEFZbH9VtgsUdeybskJXRshdqoFYoUNVoIqGmK0hJCG7tf
         jGTuEaXMHBz4sz/qW+nhdH1woHmi7UGEiANGF79cIUml6OW8osTsLSsymHdCBdkvuH
         M4rAurZoaY31tdGKXW8qDCaUpthM7uuT+nIfv4P2sa5+44jRuXgZMpzqTtG/fS+a/2
         +kXR0fkp7YsMHGjSHVAymnYCgQMJktI1x2krkrx3gGqNdWQr22ljWpzQaJkH3No0dC
         aGYPJ24V9JHlcPkFfz4Ar2m9WGuvM7GFnFmfF8xN0OFwZFzPlCYTNSniAKG5iC/JgH
         cqUOGh6ghRXNg==
Date:   Thu, 11 Jun 2020 12:12:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Arlott <simon@octiron.net>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20200611121106.68108136@canb.auug.org.au>
In-Reply-To: <20200610121707.1f4c4355@canb.auug.org.au>
References: <20200610121707.1f4c4355@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KJ2VNu8x4nF9QujVQR8wAkr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KJ2VNu8x4nF9QujVQR8wAkr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Jun 2020 12:17:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>=20
>   drivers/scsi/sr.c
>=20
> between commit:
>=20
>   a711d91cd97e ("block: add a cdrom_device_info pointer to struct gendisk=
")
>=20
> from Linus' tree and commit:
>=20
>   6555781b3fde ("scsi: sr: Fix sr_probe() missing deallocate of device mi=
nor")
>=20
> from the scsi-mkp tree.
>=20

> diff --cc drivers/scsi/sr.c
> index 4dcd735ea49e,b9cff27e2c81..000000000000
> --- a/drivers/scsi/sr.c
> +++ b/drivers/scsi/sr.c
> @@@ -790,9 -790,10 +790,9 @@@ static int sr_probe(struct device *dev
>   	set_capacity(disk, cd->capacity);
>   	disk->private_data =3D &cd->driver;
>   	disk->queue =3D sdev->request_queue;
>  -	cd->cdi.disk =3D disk;
>  =20
>  -	if (register_cdrom(&cd->cdi))
>  +	if (register_cdrom(disk, &cd->cdi))
> - 		goto fail_put;
> + 		goto fail_minor;
>  =20
>   	/*
>   	 * Initialize block layer runtime PM stuffs before the

This is now a conflict between the scsi tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KJ2VNu8x4nF9QujVQR8wAkr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7hkxgACgkQAVBC80lX
0Gzz+wf8CiKOoljcEObryAOzL+9DOEauAFNU+4JrJFRPfL3zUlUeeeqyIlh3nb4+
kLZ7t2D6l1G3A2DbF2cYA52YR77gdP7bD8Ncl8VJpIkUzkLr0VpAO3MlSCLR6piJ
+u42PjeZpdMSgNsPnpeXE54H11MFWNtwIAGNKEisSRWU/TT4uhoyuJTqOSXSokdB
AlMUYLY70RTFrZhWDXwRpix6iqVvU/PDbGSDAx1fmAATHHPyIJpLXONUvBGDDGX0
jRJJXWPxwA/yvqHfPxgav2vGljY0BTty82F/P3Bzy1j5+QuO549hILzq8RaXutmy
pzj3cF6sXnFHXKvEMbjhzLpF+iC02w==
=okmX
-----END PGP SIGNATURE-----

--Sig_/KJ2VNu8x4nF9QujVQR8wAkr--
