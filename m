Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A972DA199
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503334AbgLNUba (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503343AbgLNUbX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:31:23 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1110C0613D6;
        Mon, 14 Dec 2020 12:30:43 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtLk10y1z9sS8;
        Tue, 15 Dec 2020 07:30:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607977841;
        bh=/s2WPvDJ27wPzNAJfhUULDr9Sv85rl1/IxJ0YMrcCA8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gdiHp/PWMNs6ECEuVxcIc7eXKPreghrv2N7c1Ve6xb2oH7t4aqyAI0teiIKlEofNt
         FjbB0DauEZY39ntfTTz1ttRb3WgpGKMCoRmgzbfzi/LFClOAhvpX0g8VmzurTKcFef
         XddZQj5/NBP3G8WDLJcq/JNxY57CI1HPQZOLWQIE4h54Ibeag7+66Ypou4LFzK1KMs
         X/boeStrRgrRJV6bGy9QunKZDcVnBA4TfJYyczXx4CoXa+05vO8oF8SomaJ6nLf7ur
         NbsTqSjL8MBcGvZEWtCOL4CYwfmLs3lJI2ufWFWYt++hO14Y/coOI5QHhAo40YAHm5
         Z6dcmQd5kb8vA==
Date:   Tue, 15 Dec 2020 07:30:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Cerveny <m.cerveny@computer.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the arm-soc
 tree
Message-ID: <20201215073037.5bb96437@canb.auug.org.au>
In-Reply-To: <20201208110413.04400395@canb.auug.org.au>
References: <20201208110413.04400395@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0VqBaD1pA7DIpvY0Y=8=wM5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0VqBaD1pA7DIpvY0Y=8=wM5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 11:04:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
>=20
>   drivers/staging/media/sunxi/cedrus/cedrus.c
>=20
> between commit:
>=20
>   c6e95daab1cc ("media: cedrus: Remove the MBUS quirks")
>=20
> from the arm-soc tree and commits:
>=20
>   503dab0b8a56 ("media: cedrus: Register all codecs as capability")
>   68b4a01f88af ("media: cedrus: Make VP8 codec as capability")
>=20
> from the v4l-dvb tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/staging/media/sunxi/cedrus/cedrus.c
> index d5fca10ea5b4,18d54f9fd715..000000000000
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@@ -522,7 -584,11 +584,10 @@@ static const struct cedrus_variant sun5
>  =20
>   static const struct cedrus_variant sun50i_h6_cedrus_variant =3D {
>   	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
> - 			  CEDRUS_CAPABILITY_H265_DEC,
> + 			  CEDRUS_CAPABILITY_MPEG2_DEC |
> + 			  CEDRUS_CAPABILITY_H264_DEC |
> + 			  CEDRUS_CAPABILITY_H265_DEC |
> + 			  CEDRUS_CAPABILITY_VP8_DEC,
>  -	.quirks		=3D CEDRUS_QUIRK_NO_DMA_OFFSET,
>   	.mod_rate	=3D 600000000,
>   };
>  =20

Just a reminder that this conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/0VqBaD1pA7DIpvY0Y=8=wM5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Xy20ACgkQAVBC80lX
0GxD+AgAkoniNsSje1GKDmeTzhWU/P6h9lax50ZAoOUqaSBten7vfx0EhOhVfTfs
+EmfiSoLXq2KNiNdMfpARwFCYTBa1GBbpH4wwogjMjl39FFsc2uX/Y3/EL/sTNvW
2h94FSGLbhl9q8cpo47gTi2GOa06NXyz5X+afQRxIugWkG1WnuEm41QktPaqEjSf
NKMR7iNT0twvE6z5ryAKoFFe4FhE8aE995/fBnpE7XTTeq22sLfbdbzMcD3m4xOM
18vB0b62GdSRqhbTKgIklQk8qbtlOINioKETfPsP5FjJQY0w1V58HvZW/jbN1So3
yf1VksxR+khrGZhSL3/YL6XYnkx58A==
=7/OA
-----END PGP SIGNATURE-----

--Sig_/0VqBaD1pA7DIpvY0Y=8=wM5--
