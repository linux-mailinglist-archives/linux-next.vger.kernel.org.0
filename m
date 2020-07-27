Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF6922ECD4
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 15:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgG0NGl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 09:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728393AbgG0NGl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 09:06:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA11C061794;
        Mon, 27 Jul 2020 06:06:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFg730fB3z9sRN;
        Mon, 27 Jul 2020 23:06:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595855199;
        bh=sqoizSNL6gMISXSp6h102DAmnraM6MkbiSHOUbMRpts=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rQjooD/woyMFZFCDfVkYqOatLe1Bq2RCrTSUMSrRegTxJnoRIYM8b+K10PanLA0Od
         rTHtYdGEIxVsakYPxR05GOPqh0BgZ//w7gX+SH6+xzjzRlFVWCUZv5Bn0bKYpO6Clv
         0rL0QAvJ6SYA1cmwBmUYv7IgmzehMxkmV/mke98KehppchnLtBymi9CNEXmIW5F00A
         1hc00yOQ8nqz/2KIEoqJXD9p0OQ/eaSudzbzwAZVEH5volUF8cDboJji/Za+DsituY
         J2ywMgWgdXb9mqDPLCFYR5gLxs9cZgGHs1gUyva6KB8JgmWcSPIpMDbEXKuQZuKfx3
         1Tw7JM4BYWVAw==
Date:   Mon, 27 Jul 2020 23:06:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Subject: Re: Include krzk/linux-mem-ctrl (for drivers/memory) in next
Message-ID: <20200727230638.5089517a@canb.auug.org.au>
In-Reply-To: <20200727082938.GA25420@kozik-lap>
References: <20200727082938.GA25420@kozik-lap>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mI663HG724QXY_snrANMVwy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mI663HG724QXY_snrANMVwy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, 27 Jul 2020 10:29:38 +0200 Krzysztof Kozlowski <krzk@kernel.org> wr=
ote:
>
> Please include in linux-next a new tree for drivers/memory:
> URL: https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.=
git
>=20
> branches:
> 1. for-next
>    into next,
> 2. fixes
>    into pending fixes (for current cycle),
>=20
> The tree will have patches later send via pull-request to arm-soc (Arnd,
> Olof).

I added the for-next branch today, I will add the fixes branch tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/mI663HG724QXY_snrANMVwy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8e0V4ACgkQAVBC80lX
0GyS0Af/SNG83OcqcO/g2ABW0cyfodlxHAh01SWmJJ4NGP2vumyCQaG3Afh9PyR8
Ug0CXQczOj473JKdxEm5NLkVIfEOiTk/Bo5z9iiGJlxzwH3jl/iljWZutTHD0ADJ
x1do94OoYWLman56NFgIXR3m0edLvsp8lEKjM1fV80elR1mP7IBAh/QrQuaopVXy
bnyNJEGiW9y2uDjpC0uQMMBOmviv8Dj9wUHjJjNvAc6UwVRHvKu+jcAfrbQitPvl
c329EHn/lJQk8wK/ccEMMQJynsKpRHZAEtno9lFSgVPcwlA6dXZDYE0N+7gPhtLB
WGktLQIIOGhiFN8jZN5Hgd4fLRpnuQ==
=WowF
-----END PGP SIGNATURE-----

--Sig_/mI663HG724QXY_snrANMVwy--
