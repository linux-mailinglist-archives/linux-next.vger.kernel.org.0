Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A95DF1AF7
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 17:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfKFQRV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 11:17:21 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45510 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbfKFQRV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2019 11:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6M+B3l0mYAuPdlo4NisvhpcZGxRIeK1UZtXEBEKLvTg=; b=fY/TbSAZEW7iHcxrOBDzEO4Ea
        9Akm9bpl42LHWpb5rdDUtKEZwLZzNHxLlZdYkzagbcFaWeIjgw+L4DenOhDwKRw69G2bm8q4qRpxJ
        y+eqyGboM0gsw0ycCt10QvM/OzKzcDD36PgBJjOfF4fcUMjf3pd3r6P3gchpQG4NhTYl4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iSNzW-0001oA-6C; Wed, 06 Nov 2019 16:17:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 5E53D2743035; Wed,  6 Nov 2019 16:17:05 +0000 (GMT)
Date:   Wed, 6 Nov 2019 16:17:05 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Linux-next-20191106 : arm64: Internal error: Oops: 96000007
Message-ID: <20191106161705.GA11849@sirena.co.uk>
References: <CA+G9fYvm_QEq+9e+dni1Y+bJswr9bU5=shJcC+wKjjOyiPsXXQ@mail.gmail.com>
 <bfced8c8-c64f-982e-8797-d48b5ec65291@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <bfced8c8-c64f-982e-8797-d48b5ec65291@arm.com>
X-Cookie: Shah, shah!  Ayatollah you so!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2019 at 04:07:52PM +0000, Robin Murphy wrote:

> FWIW this smells like a builtin driver had its of_device_id table marked
> __init, leaving drv->of_match_table as a dangling pointer to freed memory by
> this point.

Indeed, in fact I sent a fix for this to Linus Walleij yesterday having
seen the relevant build warning when testing -next.  Someone already
reported that it fixed the boot issues.  Hopefully Linus will pick it up
soon :/

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3C8gAACgkQJNaLcl1U
h9D7Wgf9F9Yw6Kh7mvViQn49G9SuO0EnkXYRHUVKyoPkOmKjvTneGozwupi7xFEv
k5zZ3ZeWF1wpyER0QTwCN4ifYYkws92Q3+EyUy+k/UuAxFjpuIXupYB+Q82Vy14Z
8KtOGNm7ga+2kNaIW2qXUQrPrqfc2diitgP+DO/7Fsl/lUpq3gC60eSzHWx8krb6
tkCMD/krVAGMwg35Bg3/i82x1AoDLMUSmuqvUns1ioWOaY6imO4GxH0fKV3H3IzN
9FVhQl4pcpNGhPAvCS5nnp6mYyiJ2m2vwE4TNl8mux627sfCXKPhOR60zhTasgoU
9Q9/phWOSE2PrOEKHfPkumPs/+YdCA==
=R1Wg
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
