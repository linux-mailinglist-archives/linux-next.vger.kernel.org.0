Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 356FE130F5F
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 10:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgAFJZU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 04:25:20 -0500
Received: from ozlabs.org ([203.11.71.1]:35713 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbgAFJZU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 04:25:20 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rqqK2f8gz9sPJ;
        Mon,  6 Jan 2020 20:25:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578302717;
        bh=QqMTVdOF4kD3oUVpX8KijE7FsTmrDvHpiYjIvWkE5+g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MSSdMaqewGwVsF6BRpU4YywWbUy98Z0zbHRSBqlowicl1pYjK8Ke89KP2I770Y3TK
         Taya34+Ya/IXH/ellXskCSMK5Z/OJHNVAvPjQOQCEOocr1dc5a0Ei/YY9UFZRXh504
         TE1O5oRQeTBSTtBWZygbcNhlIZ40vIUEe7ailrWXT8Co6W1sbTQvPEGLf+v0CoKQqC
         IiMOl1EBQb6fOVAgSTfRnx5BziRz0+7+MCebGagm4rB2KsTMs2FNOkSdGjMPWRR47H
         x3iMuUJx4eIiAgnDotj9yXBVEErz2d3Do/M4/M6JMI1/z278IuESYOU9xgLwUZgE4Z
         k0OZcJ6ddZvfg==
Date:   Mon, 6 Jan 2020 20:25:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the y2038 tree with the vhost tree
Message-ID: <20200106202507.7f8037cc@canb.auug.org.au>
In-Reply-To: <CAK8P3a2ackxPwQxb-yeQ1pgJ5Hbh44NXDUCSfROc94kmmtx89A@mail.gmail.com>
References: <20200106152440.05a36767@canb.auug.org.au>
        <CAK8P3a2ackxPwQxb-yeQ1pgJ5Hbh44NXDUCSfROc94kmmtx89A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bfn5fVltCGasNCC.1s/Fz+0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bfn5fVltCGasNCC.1s/Fz+0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, 6 Jan 2020 09:31:14 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> It doesn't. The rules used to be fairly complicated, but not
> (after my patches) basically any driver that has an .ioctl
> function must have a .compat_ioctl function and vice versa.
>=20
> > index 54158766334b,fbbf18ac1d5d..000000000000
> > --- a/drivers/block/virtio_blk.c
> > +++ b/drivers/block/virtio_blk.c
> > @@@ -310,6 -404,10 +310,9 @@@ static int virtblk_getgeo(struct block_
> >   }
> >
> >   static const struct block_device_operations virtblk_fops =3D {
> >  -      .ioctl  =3D virtblk_ioctl,
> > + #ifdef CONFIG_COMPAT
> > +       .compat_ioctl =3D blkdev_compat_ptr_ioctl,
> > + #endif
> >         .owner  =3D THIS_MODULE,
> >         .getgeo =3D virtblk_getgeo,
> >   }; =20
>=20
> Removing it would be better, but this version is not wrong.

Thanks.

I have adjusted my resolution from tomorrow to drop the CONFIG_COMPAT
section as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/bfn5fVltCGasNCC.1s/Fz+0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4S/PMACgkQAVBC80lX
0GyP8QgAoUR4mc6NwWc7w+ItDUykBYqPXd5q8TcRuvm6Q8DEHZW8uVagMTomu/go
e4eBNM1ah4g4WuI+wlgv9mzFwcc0jkISdPKBcFY0+KmtMPb9WO/ZHNWZxU+xpCPq
RcIEfuG51JHH4cMZGTTNOgqEfyR558wQC4nX5VzEJHw5qwGbfg5UEMuQIv3ZVtUd
Z5v35I1F1L5KJgFGEPNO6eGwDbLQX4MKNQajZcCKYOTPbDBWcGwBc4EuUr/QG/8e
g2sbeo1Ln6BCGzkGMLihkPJyBdeFYZj6/5nBrZ31A9vDDXDu2POHGKLrTIEKhTpd
AFNpqDmkWlLl0Y6ehazDqOX1Nd1/RA==
=/dBR
-----END PGP SIGNATURE-----

--Sig_/bfn5fVltCGasNCC.1s/Fz+0--
