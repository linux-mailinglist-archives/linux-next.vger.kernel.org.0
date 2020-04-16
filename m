Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD82B1AC216
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 15:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894836AbgDPNJa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 09:09:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2894835AbgDPNJ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 09:09:29 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 111F3214AF;
        Thu, 16 Apr 2020 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587042568;
        bh=W+N7f/ROs+1DQJjqsh04Z5iYGFtFPOdmGOJQwSuRZNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B5LLDE6h7OXt3tq4MtHbgQhqfyTj6KmX9/3gY43x02KWhfqQXTzlePuyJao+KyDY3
         UVCrROn5ObwAUMO60Zdqm+AILPO/Ca2j/R82M4npkzIlkhWilYBlO+EAvoJ/VtalWm
         uNB16KoyWfAWzMERIq2C3D1ynRQQUnkPPCpkAbZ0=
Date:   Thu, 16 Apr 2020 14:09:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: linux-next: Fixes tags needs some work in the sound-asoc tree
Message-ID: <20200416130925.GJ5354@sirena.org.uk>
References: <20200416094111.3f37623f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qD3brAgIG4LbUq6d"
Content-Disposition: inline
In-Reply-To: <20200416094111.3f37623f@canb.auug.org.au>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--qD3brAgIG4LbUq6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2020 at 09:41:11AM +1000, Stephen Rothwell wrote:

> has these problem(s):

>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes

> Please do not split Fixes tags over more than one line.

> Mark, since you don't seem to rebase your branches, please start pushing
> back on these before they are committed to your tree (especially the
> non existent SHA1s).

Is there some scripting that does these checks (ideally someone would be
running a bot for this)?

TBH aside from the missing SHA1s (which are a definite issue, mainly
coming from Intel unfortunately) I'm struggling to see most of the
things you're reporting as substantial issues - I'm not sure that
tooling should be caring about much beyond the SHA1 in the tag, and if
it is then supporting wrapping like RFC822 headers doesn't seem
unreasonable.

--qD3brAgIG4LbUq6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YWQUACgkQJNaLcl1U
h9D/NAf/UIyaddWWGiNokiLtMwXGYPX1+ZySMYxZJ5ZLfI29WsRbad/ePIyUTBlH
x8CHJJEvK1iMesrFn1pd+oFfbU4sZ5CQMbUGFaVj6tJ7lZc0JiyXczHZN30ZgbWo
asn9S9gB7DFGLRYF/ZVcFYFmIKcODrDmBOwG3KjE8dFsiNtMKc6zaZxN+G8edBmn
QchyTLJQ/J3Z03jOhGX78B4e+nMWKAY7FT8Stk0DTmPMTvl8MpNAPGn1uJnlBGkR
a312kgt4wSJOtXXpA7i7jP0mf6TEQy1bk5um9pHqOd4oISTXmupRSxgaaO+TypW8
7t8Phd/y8yzjtW4IvJP3CdretJDESw==
=T9Qd
-----END PGP SIGNATURE-----

--qD3brAgIG4LbUq6d--
