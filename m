Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E4545A521
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 15:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237378AbhKWOVM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 09:21:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:47942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231683AbhKWOVL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Nov 2021 09:21:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7F8C60698;
        Tue, 23 Nov 2021 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637677083;
        bh=74Q81dtWV0c3wvFnBgiMpuz+jzF3Y0CY+3Tq7ge8Kyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dcKq0xnuL4ZiUV1gZZ5yqmhy1iagvHhuY6zdxLEJEnf4C4BA2M+yDn3btE91byLWo
         MzPeHAqzSy30eDLyg1vKt2OgF2pCXQXWUViSATY9fsGuR04plDew7OFEWsKD/0AWw8
         /e5YwFKlhwFDXkx7BDeAndxxztOiuqQsFDcv1jryPM95seCRnDvuNi3Eu+3B4zUDdP
         A8Zpc+uNxndDfZZVHEzqZfQ9d2hH17jLpv1TMcpG1B5OLg5FpC0g9/KgDbfoaSTWYw
         IWBebUlg5pY+bf0BrYlLSxF6FQi+mUZCn1h2UnYTE/v/5lbHFJZndFiyTzgwKt87tU
         /hUJW0E2R0HMw==
Date:   Tue, 23 Nov 2021 14:17:58 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Message-ID: <YZz4FkRoiVIbfgEf@sirena.org.uk>
References: <20211123184142.50ff56c3@canb.auug.org.au>
 <9df5380a-3fb6-8c1b-677a-3159e99c4869@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VRrzslfoPwG8ZGVB"
Content-Disposition: inline
In-Reply-To: <9df5380a-3fb6-8c1b-677a-3159e99c4869@fi.rohmeurope.com>
X-Cookie: A closed mouth gathers no foot.
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--VRrzslfoPwG8ZGVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 09:26:45AM +0000, Vaittinen, Matti wrote:

> As a second thought - do we need such a stub function at all? I guess=20
> anyone who is actually adding a call to the=20
> rohm_regulator_set_voltage_sel_restricted()  helper should also have the=
=20
> implementation selected. Failing to do so is probably indication of an=20
> error. Compile testing could perhaps be an exception but this is=20
> currently not supported.

> Should I just drop the stub or make it inline? Am I overlooking something?

Dropping it does seem reasonable, I can't immediately think of a case
where the stub would get used.  I've queued your existing patch to try
to make sure that a fix lands tomorrow so (assuming no test issues)
please send a removal patch on top of that.

--VRrzslfoPwG8ZGVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGc+BUACgkQJNaLcl1U
h9CsHAf/Tiu3WxnlNrLesXz8FSuC52Jh6ypxWLLe4QHUpqubtGSa4dHl4OyA1UVF
NkuGYLChPzPZGgfJA2pB5CPzyydIYiGIaEXDNMToje9D2WgDQnX/b/cbx+9AVJVB
2Vr4I6eKh+XbXQrpaqadya3iWCK2AIl0P7Nc4hDICSvm1OiKq9K34SPLRbc+Hd60
kttq0IP22inE4UOCQ5ODGyOcLfV7r3SS+fkqNGUC/xl0Bh5712Q8z7M6/J+px5zU
u+6irhM5Ud7eVj+kUApDuvTgvHRmp/OUCeGHNDpZW/BECDU0mXLHnLqqjKH1L/Dx
mVCap01SbEI924xz3xp0SNbQmINqUw==
=486o
-----END PGP SIGNATURE-----

--VRrzslfoPwG8ZGVB--
