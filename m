Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6CE1CFA79
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 18:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELQWJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 12:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:55470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgELQWJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 12:22:09 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66C9E206B7;
        Tue, 12 May 2020 16:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589300529;
        bh=auWCmjjq3v0fWHq4aHnc4pBsHWKq4S/upZDC+grvgio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R8+yeHyBqPrFn/brY4mLXlGh1Ues0feVlECxgDmBIupsxQYCN/uEzyG9huMyWmAnv
         kBntTGIHC+lSsumb/pWrZudHTyjdUbwbx00WiOZbR5FCrAC/s+Jb+9o1rx/A9MZF+V
         ON1ESwWgxDiBZJ+tiIQae9pCwK4nGt/Hz6A2JoBg=
Date:   Tue, 12 May 2020 17:22:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the crypto
 tree
Message-ID: <20200512162205.GI5110@sirena.org.uk>
References: <20200512144949.4f933eca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Content-Disposition: inline
In-Reply-To: <20200512144949.4f933eca@canb.auug.org.au>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 02:49:49PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the sound-asoc tree got a conflict in:
>=20
>   sound/soc/codecs/cros_ec_codec.c
>=20
> between commit:
>=20
>   85fc78b80f15 ("ASoC: cros_ec_codec: use crypto_shash_tfm_digest()")
>=20

Oh, this is the first I've heard of that patch :(

> from the crypto tree and commit:

>   a1304cba816e ("ASoC: cros_ec_codec: allocate shash_desc dynamically")

> from the sound-asoc tree.

> I fixed it up (I just used the former) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

That doesn't seem ideal - Eric, Herbert can we get a branch with the
crypto patches in them to pull into the ASoC tree or something?

--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66zSwACgkQJNaLcl1U
h9BIJwf/d+OLV0SpxeplooUGiuxQ8kkocjrS4gtv/7z7NlC0QeQzM6ZVMFNqzH1J
zpYTRpqNlwcE7FhRvVmstx9LJSk70PA1lokGLSfEj2bncItEFe0DEVOuxXChQCNe
XwSpNSWBRtYojsQkrwvdScpkq2PPFTKv2tnGePHCGki9bfGPAUJPReuYAeLXdJ00
QK/MwLFqJFIvWN1DpU5tt81ZcKu/aOZ6sVTs7geeplcGb/eBRx2FzP3Zsumsf7dx
5ww7Hx4a1MAjShkMbaKkXE/IWd1f6hDXQB/hmC4k5DaAc2z2pPWRT92JbxOFzbX+
ORws7FBcKLJgVVTbIFW4zok6Arl7+Q==
=unIm
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--
