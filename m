Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9CA24D7A8
	for <lists+linux-next@lfdr.de>; Fri, 21 Aug 2020 16:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgHUOse (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Aug 2020 10:48:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:50844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgHUOse (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Aug 2020 10:48:34 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85B5A2075E;
        Fri, 21 Aug 2020 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598021314;
        bh=gqn0a5FadwlmVTfYD5SVnqq3kTHuanE7sCpllKh1y04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UaRTJzIItCbdtA3NCNdHcm+iLwJGTS5ZVC8tg6LxJzASbonnnw5Pvk7Xowa0eJJ8L
         WE7Qy0EhKcHh0g3whhKOycPke41mBQgK2ZoeM12ZDA2yx1F7X2dDxGlh7TzqVtYmpc
         vxDUxV+6RTDvtgvY/4R5w645MIDaF4Grq4gLBaMg=
Date:   Fri, 21 Aug 2020 15:48:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: linux-next: build warnings after merge of the sound-asoc-fixes
 tree
Message-ID: <20200821144801.GI4870@sirena.org.uk>
References: <20200821093901.4257afdc@canb.auug.org.au>
 <a8b47ba9-7b45-bef1-08a2-820fe48c4cc4@linux.intel.com>
 <20200821110117.GC4870@sirena.org.uk>
 <a982589b-9bc1-6439-99de-3ce6efdab469@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y96v7rNg6HAoELs5"
Content-Disposition: inline
In-Reply-To: <a982589b-9bc1-6439-99de-3ce6efdab469@linux.intel.com>
X-Cookie: divorce, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--y96v7rNg6HAoELs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2020 at 09:25:53AM -0500, Pierre-Louis Bossart wrote:
> On 8/21/20 6:01 AM, Mark Brown wrote:

> > A patch which was not sent as part of the same series and where no
> > dependency was mentioned :(

> yes, sorry about that, i just noticed the two patches were sent one after
> the other but without the dependency.
> Do you have a means to fix this on your side or do you need Bard/I to resend
> it?

I've just moved the patch to for-5.10, it seemed like the functionality
is only half there in Linus' tree anyway and it's a bit late to be
enabling new stuff for 5.9.

--y96v7rNg6HAoELs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8/3qAACgkQJNaLcl1U
h9Bfowf/W1Lia5rSjdpO32gXqslT0F3WHgrMMOEC+8TrFhTTSjILwYOU+PWxqD73
qIxlDai++3w+ItphVqoYe2cJ2h8U1M0TmkRUA1XqAemCvjbDG7YaVsLIcnNHuns2
ilACW7w3UreuXjmr69ZzF8QKkGMTZDEiEzULwnFsnghXEkqYoTBEo9ks36EkZxvN
cozp6l7J68EPh+OxbEyoYEHttfY0gy2Uaue2ZQgIdFjEK8VDqUaw4xxjzqTWc6uO
vFplWdRAkbkGgQz1Pbr3ATh1DC5pZPC7FRL0GbRQHSycCEhgKjiKor2Gtaesk02H
5SW0p96QicQlS1FUnPR84MrqUsYGCQ==
=0XjW
-----END PGP SIGNATURE-----

--y96v7rNg6HAoELs5--
