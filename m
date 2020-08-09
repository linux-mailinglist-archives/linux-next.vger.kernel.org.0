Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F72923FD69
	for <lists+linux-next@lfdr.de>; Sun,  9 Aug 2020 10:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgHIIoI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 04:44:08 -0400
Received: from ozlabs.org ([203.11.71.1]:56207 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgHIIoI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Aug 2020 04:44:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPXh353pvz9sPC;
        Sun,  9 Aug 2020 18:44:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596962645;
        bh=bkqpeA8hJXRKZhX5To79DYhW6lFpYbJLRp9jA2KTtMw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aSj9S23x5sFVombGEXAroKJ7zbce1TIAVXR8JsYXTVHwAz0RWGTcoNZqGBeegO1DQ
         PVtAmAjZfQmFjfXEUbSzRPU1Oxp+ZT6mTOMgMKu2kPjTLNsGNGEzGJNR05B3N82Krq
         GnTs61PeSt+N9v5XbNFSoB4lBRHVmVzzxyXQ7el57MC3jiBXv4nTBf2QRsfjtaygbh
         phCjqkYr4zTa6GRuHIHw2dnhF695C/FAjt80o83dfZPrE34ZVS4TxYjxO/cC4yvxIL
         A3r05TpApQ1eEY2FnHLIFqyzJWTDiUnkAy9X9xSqGGAGDIitYODM/0n91yeteJoGCc
         x7D4I6uEevAsA==
Date:   Sun, 9 Aug 2020 18:44:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Satya Tangirala <satyat@google.com>,
        Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: manual merge of the f2fs tree with the fscrypt tree
Message-ID: <20200809184402.20a29137@canb.auug.org.au>
In-Reply-To: <20200708103858.1196bb65@canb.auug.org.au>
References: <20200708103858.1196bb65@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=sT6bNjnPvTnddTKeX23DSc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=sT6bNjnPvTnddTKeX23DSc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Jul 2020 10:38:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the f2fs tree got a conflict in:
>=20
>   Documentation/filesystems/f2fs.rst
>=20
> between commit:
>=20
>   38dff4e50c12 ("f2fs: add inline encryption support")
>=20
> from the fscrypt tree and commit:
>=20
>   a7c77c387b60 ("f2fs: fix to document reserved special compression exten=
sion")
>=20
> from the f2fs tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc Documentation/filesystems/f2fs.rst
> index 8b4fac44f4e1,535021c46260..000000000000
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@@ -258,13 -258,8 +258,15 @@@ compress_extension=3D%s  Support adding s
>                          on compression extension list and enable compres=
sion on
>                          these file by default rather than to enable it v=
ia ioctl.
>                          For other files, we can still enable compression=
 via ioctl.
> +                        Note that, there is one reserved special extensi=
on '*', it
> +                        can be set to enable compression for all files.
>  +inlinecrypt
>  +                       When possible, encrypt/decrypt the contents of e=
ncrypted
>  +                       files using the blk-crypto framework rather than
>  +                       filesystem-layer encryption. This allows the use=
 of
>  +                       inline encryption hardware. The on-disk format is
>  +                       unaffected. For more details, see
>  +                       Documentation/block/inline-encryption.rst.
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  =20
>   Debugfs Entries

This is now a conflict between the f2fs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/=sT6bNjnPvTnddTKeX23DSc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8vt1IACgkQAVBC80lX
0Gxm8gf/ca3/+5VpjZjqqaJQvN9wDIrenb9IZk29DUn3iulxcY9XfuSX+g3KLAez
YP/l7qKs4GSOsniTjJp4wIh+fjT0asTkmMBLWuwN2vzTptmrHvGZBCA4hP7vekVi
HBlsJb3A/dZ77lZ5s3DboMUPBmecNE6oNtmiKPFzQPw0IEAWpeUvjVipiy2vzDZn
eAWs/oFbBjdpkj5S+a/obVDJygr3vwd6yz5QokPgYVqX3E22CUCCflEG0V0wLjOI
A2fKJHMarcVYOo+1RZmIHeOHZrMw2529CXVHi6EPndAPNPcrvnIL8lQRu1syt+4s
jpRomTKt8/ZimN9M8UegHgwVff6SIw==
=nT0Q
-----END PGP SIGNATURE-----

--Sig_/=sT6bNjnPvTnddTKeX23DSc--
