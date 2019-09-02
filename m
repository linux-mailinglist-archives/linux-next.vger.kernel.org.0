Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE89A5E0C
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 01:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfIBXVY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 19:21:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbfIBXVY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 19:21:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MmLB246hz9sDB;
        Tue,  3 Sep 2019 09:21:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567466482;
        bh=FA76O+zB0ringJEi75QQWTVfQoSEMOzO+UEOqqeeWUw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ac5iqZwF7B46oSJpRah2KyljOLaUVQZoPZ/vSsz13/GIfCDLqO8ilx4bbrN/YY610
         b/4qDmdOb7VZP5ztsduVq7ZakIxAT6zKZZ2N3zV/TGSKsyuXHZHjS3DxWs2GOt8ace
         147KSo1wIY7jVr9SAnJsc5OfZUGX1ZlQ6WIsWtWiE1yeNFhVxN9ljgRJUSPD6I48cT
         nGUhTOCML6ySJamH29935ENSvx6SPBY+TWXnGmxsZTJblM1MIxNYPnLkdzmOf4YN1a
         IpXSGaeQjglSkL9JaJtcQbbAm7vir8x2tgjcTKpUruj9DHs25ih+a/JeLjMs1tvubN
         5wf4UuEmCCUcA==
Date:   Tue, 3 Sep 2019 09:21:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
Message-ID: <20190903092121.0b817e0c@canb.auug.org.au>
In-Reply-To: <20190903090722.556b66ba@canb.auug.org.au>
References: <20190902161935.78bf56f1@canb.auug.org.au>
        <20190829153116.7ffc7470@canb.auug.org.au>
        <16836.1567440079@warthog.procyon.org.uk>
        <20190903090722.556b66ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r2XJS4Sosxbm=QDiC8u52dh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r2XJS4Sosxbm=QDiC8u52dh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 3 Sep 2019 09:07:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> > > I then discovered that I needed to install libkeyutils-dev :-( but it
> > > built OK after that.   =20
> >=20
> > ?  The kernel shouldn't require that to build. =20
>=20
> I was doing an x86_64 allmodconfig build which seems to build (all of?)
> the samples.

Of course, this breaks our crossbuilds :-(

e.g. S390 allyesconfig build:

/usr/bin/ld: cannot find -lkeyutils

--=20
Cheers,
Stephen Rothwell

--Sig_/r2XJS4Sosxbm=QDiC8u52dh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1to/EACgkQAVBC80lX
0GxJ9AgAkJXf1LISxdmBZkwrezYEApgmQzjtGcA6dh20ldlNgYMwIR0AoL9EHzKR
5ZHTYLS1J3LVya49TJvftNa7akxjoiGI/ygRTvgJS07K+Ark791wEBFggYUsTAps
Bb2vQfEtWpvvU9qDwmXv8EB0s2bLT2PRpw1ZJFJqaWyKwBf9qCuFuIvFCoI7NJw5
8P/t8L0tjUek2d8YX8cas0lZZCxjDXOiYDGpfJ8uP6ekw07mIQrFu6hd6NXHB+iJ
vXRQqtgFtWEY5m6LZq6rgOyut+t7BSY79W67Jav2+kaZKd3PNxOBu6n+EqsfDSQk
us3w2oFn/vF+F/TBWmSrYKg9v+0P1g==
=sdwf
-----END PGP SIGNATURE-----

--Sig_/r2XJS4Sosxbm=QDiC8u52dh--
