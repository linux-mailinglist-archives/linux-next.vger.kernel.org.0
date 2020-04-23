Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D841B5D98
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 16:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgDWOVS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 10:21:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:57694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbgDWOVR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 10:21:17 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F3B52087E;
        Thu, 23 Apr 2020 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587651677;
        bh=dkcU0t+EplZWMUkU5I1QLEqbHzCXqQKPnyuulGisQ08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vTpj5dnpot5l8IgBBpDcnobHQoHK5BEt9bczU88GBK0oxDc1xiJwYIkQVYaCqwk0q
         jRm/p3jWJ324cTVBLYTAE251lVxBm0HKsf9HaFRgcEL7UrKqnfsbsl0c104d98CI50
         dqqDIS3XNVOUmBX36MHZWXFnGdxGbUMUIWC1a79w=
Date:   Thu, 23 Apr 2020 15:21:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200423142114.GJ4808@sirena.org.uk>
References: <20200423155539.4492a0cc@canb.auug.org.au>
 <20200423113041.GI4808@sirena.org.uk>
 <20200423230400.2cb1a285@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5cSRzy0VGBWAML+b"
Content-Disposition: inline
In-Reply-To: <20200423230400.2cb1a285@canb.auug.org.au>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--5cSRzy0VGBWAML+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2020 at 11:04:00PM +1000, Stephen Rothwell wrote:
> On Thu, 23 Apr 2020 12:30:41 +0100 Mark Brown <broonie@kernel.org> wrote:

> > It looks like this is triggered by PowerPC not including
> > drivers/firmware - there are missing dependencies but it works for other
> > all*configs since the dependencies all get built in those.  It would be
> > helpful if PowerPC were fixed to include the firmware directory to
> > improve coverage.

> $ git grep drivers/firmware 'arch/*/*Kconfig*'
> arch/arm/Kconfig:source "drivers/firmware/Kconfig"
> arch/arm64/Kconfig:source "drivers/firmware/Kconfig"
> arch/ia64/Kconfig:source "drivers/firmware/Kconfig"
> arch/mips/Kconfig:source "drivers/firmware/Kconfig"
> arch/x86/Kconfig:source "drivers/firmware/Kconfig"

> so, sure, it works for some architectures.  We would need someone to do
> the work to make sure that adding drivers/firmware to all the others
> does not break other stuff.  Until then, please add the needed
> dependencies.

I am doing that but that still doesn't mean that the architectures
shouldn't be updated - to me this is like the architectures that don't
implement standard APIs, we should fix the issues they bring up but it'd
be a lot less noisy to sidestep the issue.

--5cSRzy0VGBWAML+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hpFkACgkQJNaLcl1U
h9BA6Af+I+z0/uHCaM4nJAyL74UcrJgDaHatvsURmLfbU5NRt8ZMzq2fihSh9XTg
mVh7u47QPw0YQNVcLzvXeIjkDYX1eGOH2QSYbLyLoa0+VKOU+iJs5oqP5fE+sOyb
hfwd7dVNIXuqE7jhF4xsc6/iHMI8E+ANlHEyO85ofAJ/qBiJ9bbDMhA2flpUKjX0
ELKVuh9Y1YpORn5l/Xg4FDo2Xe7BBK0BItIafDD8WNk5M/JuDUQQ1lv2G61IGQnH
0OGRPyn7LqO4PS+LO9hxpJZClAry9xnl3ofKRPZczCAL4uyoUr047nRmV5ziXcz5
r/iIfOgXDt+s65hKE9GbLWrdv3Ethw==
=8hG7
-----END PGP SIGNATURE-----

--5cSRzy0VGBWAML+b--
