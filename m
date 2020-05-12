Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0EA1CFBA1
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 19:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgELRIF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 13:08:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:54540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELRIF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 13:08:05 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6E9C206D3;
        Tue, 12 May 2020 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589303284;
        bh=2QmFbWq2uNOkAZcEsYngCFmvRkluxWT6h1Txnq064TU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JJOMwmKHR3DIKhtyxBZ2ku4ztCB2onMmzAEym1RjctuRaab86+Nm066N9GYgigTQI
         ugc0zc112X+K6xZaZQ+jS1c6E0o3pJQeh4s2vSRbEMYR38L7k0Zn6hpAA8SqXzTTPS
         TXL9YajlSQcc4uTOUzKPPf9Y605txZCOFYsr/ci4=
Date:   Tue, 12 May 2020 18:08:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the crypto
 tree
Message-ID: <20200512170801.GK5110@sirena.org.uk>
References: <20200512144949.4f933eca@canb.auug.org.au>
 <20200512162205.GI5110@sirena.org.uk>
 <20200512163632.GA916@sol.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="huBJOJF9BsF479P6"
Content-Disposition: inline
In-Reply-To: <20200512163632.GA916@sol.localdomain>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--huBJOJF9BsF479P6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 09:36:32AM -0700, Eric Biggers wrote:
> On Tue, May 12, 2020 at 05:22:05PM +0100, Mark Brown wrote:

> > > from the crypto tree and commit:

> > >   a1304cba816e ("ASoC: cros_ec_codec: allocate shash_desc dynamically")

> > > from the sound-asoc tree.

> I Cc'ed it to the people listed in MAINTAINERS for "CHROMEOS EC CODEC DRIVER".
> I guess wasn't enough and I should have added alsa-devel@alsa-project.org too?

Yeah, you generally need to make sure the subsystem maintainers are
included as well as individual driver maintainers.

> > That doesn't seem ideal - Eric, Herbert can we get a branch with the
> > crypto patches in them to pull into the ASoC tree or something?

> We should just drop one of the patches.

> If you just want to eliminate the compiler warning about stack usage in
> wov_hotword_model_put(), then my patch in cryptodev would be better, as it moves
> the stack allocation into another function in another file.

> Alternatively, if you actually need to reduce the total stack usage (across all
> functions), then the kmalloc() patch in sound-asoc would be better.

Well, reducing the stack usage overall seems nicer overall - heads off
future problems if the struct grows or something, and if we still end up
allocating just as much on the stack then we'll have trouble at runtime
anyway - does that make sense?

--huBJOJF9BsF479P6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl661/EACgkQJNaLcl1U
h9DHTgf/fjky/uO1ZdltNrDpfN10a5OgwnU790zt7ycl2WSaOceAZV8BAFxTpBE9
nO5h9bTsm8rRRw2o/Bfce2+W7eVOIY+3IzUwZVxTplxhvl1u62nKu8nFa/3Lqaof
mQbG3W2PqJbFrweB4FcL5Im7HFxQv/Al87h289DYH+sa/HpSvk///i2ui8lAR0Hj
sjVLzylUYiJfkKhG5ylk9GfSH4NwhnGvQALlPWpG8ltIggaBeiKTrqLUD+TZ1pZX
9c9o96KZsTHnIFhsDpMk/1uZp1UprNLamyzLw6nFBcgzdBysnmLuSqo3sLIc47Pj
+kBR9tCllPwCOpSQDwk3PDGE3xxpYg==
=5UKG
-----END PGP SIGNATURE-----

--huBJOJF9BsF479P6--
