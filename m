Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2198B23B017
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 00:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbgHCWPb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 18:15:31 -0400
Received: from ozlabs.org ([203.11.71.1]:49561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729522AbgHCWPa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Aug 2020 18:15:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLBz25d51z9sSG;
        Tue,  4 Aug 2020 08:15:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596492927;
        bh=uvuVyOegpY742NA+RjM/n5Nh5iAut643rh7ZW/+PTMo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CB/8rrFX9aK3b6IJfDvJ9w/EEC5bur2ODk7ojnhZUhKudC1M45Umgw+FzTlzsgPDA
         d65CeByazbpFI4w8CEtm4Xwakmjn8cICfkJBteuPq4NLL5jzc407nayWSabzkU2wyw
         GkjBWvWJhCvpgT/WugdXBm/oozJ1Y0qlurcaZYLoUr+9vCeXy95TLPL/v90Znbzdqn
         wbMLnCe/2NP2z0YT2fETiPuMY/z1883pRMaFZDCcn3fo29k2olKajamKRKKkZPbkQK
         9uomM8Wq+ZZ/l5CjIgBwWc+XwHtM8hlyUOzPoITxrpqe0nD2RyCHXlVqFV1Y9EG8FO
         gW7u4oMxydvcA==
Date:   Tue, 4 Aug 2020 08:15:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: linux-next: manual merge of the crypto tree with the jc_docs
 tree
Message-ID: <20200804081525.5df251b2@canb.auug.org.au>
In-Reply-To: <20200724130951.5b99a9c9@canb.auug.org.au>
References: <20200724130951.5b99a9c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EHYpeW_/=lP3hPl7QBf58q2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EHYpeW_/=lP3hPl7QBf58q2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 24 Jul 2020 13:09:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the crypto tree got a conflict in:
>=20
>   Documentation/crypto/api-intro.rst
>=20
> between commit:
>=20
>   5846551bb147 ("docs: crypto: convert api-intro.txt to ReST format")
>=20
> from the jc_docs tree and commit:
>=20
>   9332a9e73918 ("crypto: Replace HTTP links with HTTPS ones")
>=20
> from the crypto tree.
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
> diff --cc Documentation/crypto/api-intro.rst
> index bcff47d42189,40137f93e04f..000000000000
> --- a/Documentation/crypto/api-intro.rst
> +++ b/Documentation/crypto/api-intro.rst
> @@@ -159,31 -146,31 +159,31 @@@ Credit
>   The following people provided invaluable feedback during the development
>   of the API:
>  =20
>  -  Alexey Kuznetzov
>  -  Rusty Russell
>  -  Herbert Valerio Riedel
>  -  Jeff Garzik
>  -  Michael Richardson
>  -  Andrew Morton
>  -  Ingo Oeser
>  -  Christoph Hellwig
>  +  - Alexey Kuznetzov
>  +  - Rusty Russell
>  +  - Herbert Valerio Riedel
>  +  - Jeff Garzik
>  +  - Michael Richardson
>  +  - Andrew Morton
>  +  - Ingo Oeser
>  +  - Christoph Hellwig
>  =20
>   Portions of this API were derived from the following projects:
>  - =20
>  +
>     Kerneli Cryptoapi (http://www.kerneli.org/)
>  -    Alexander Kjeldaas
>  -    Herbert Valerio Riedel
>  -    Kyle McMartin
>  -    Jean-Luc Cooke
>  -    David Bryson
>  -    Clemens Fruhwirth
>  -    Tobias Ringstrom
>  -    Harald Welte
>  +   - Alexander Kjeldaas
>  +   - Herbert Valerio Riedel
>  +   - Kyle McMartin
>  +   - Jean-Luc Cooke
>  +   - David Bryson
>  +   - Clemens Fruhwirth
>  +   - Tobias Ringstrom
>  +   - Harald Welte
>  =20
>   and;
>  - =20
>  +
> -   Nettle (http://www.lysator.liu.se/~nisse/nettle/)
> +   Nettle (https://www.lysator.liu.se/~nisse/nettle/)
>  -    Niels M=C3=B6ller
>  +   - Niels M=C3=B6ller
>  =20
>   Original developers of the crypto algorithms:
>  =20

This is now a conflict between the jc_docs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EHYpeW_/=lP3hPl7QBf58q2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ojH0ACgkQAVBC80lX
0GzP3QgAkvKZMbiiSfU94Gp/JbSdrD4VPT5d0SQ0Wj1HkqnrsiHiGooh6TmImD1h
sBEpq6AqxgJNfZkYPOJuTI6BL7l7rigV4fCPknI1yZMkE1puAMG5uNuLbRV/2IxL
AMdsKQ9f7OVnhMElPSHjZ0EYGswr2OJ05wIdPHSAbErgijnit/9DlJq+hkF8yv8s
MJl+ntRTWQ/sdlnzmLTxEj4lVnmVDPiLjW8KIw8rlrrLzlLltpoNCG6TJ7htLqri
QVFZ3mt3Q03+bGew6VnG+QEVrn3nSRNFf82oOkbIo9NGCIIhbiX8yuJg4stDAbUR
fPydPas9mQ3k7TUBUNdAKSi7Nnswyg==
=o06/
-----END PGP SIGNATURE-----

--Sig_/EHYpeW_/=lP3hPl7QBf58q2--
