Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E674C1B42FF
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 13:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgDVLTV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 07:19:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:60886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgDVLTV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Apr 2020 07:19:21 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4507020781;
        Wed, 22 Apr 2020 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587554360;
        bh=hPyeEWJ1hSOQS0OmoMPXcbl0oGIAJWeVZfJx5MYkO5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=urRs7yZjuISUMaA8YqNgAU/546T4w18pj4Ire2ZOKdB1LV3g4mIHUgcUP8xlJH+vh
         4/U83sOnlybwCuwidWd2kPlgzTMs4XZ+YcU6oQTBywyuWXxUDYmb+ZkZo1mOqtrpqB
         1HMtwUVDXAMiFIdwMBXM6oByukkWrbJ3YA6/B5yw=
Date:   Wed, 22 Apr 2020 12:19:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200422111918.GD4898@sirena.org.uk>
References: <20200421121130.44423958@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PHCdUe6m4AxPMzOu"
Content-Disposition: inline
In-Reply-To: <20200421121130.44423958@canb.auug.org.au>
X-Cookie: A stitch in time saves nine.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2020 at 12:11:30PM +1000, Stephen Rothwell wrote:

> In file included from <command-line>:32:
> ./usr/include/sound/sof/ext_manifest.h:20:10: fatal error: sound/sof/info.h: No such file or directory
>    20 | #include <sound/sof/info.h>
>       |          ^~~~~~~~~~~~~~~~~~

> Caused by commit

>   9e72f13ee541 ("ASoC: SOF: ext_manifest: parse windows")

> I have used the sound-asoc tree from next-20200414 again today.

Thanks for the report, I'm in the process of reverting that and a bunch
of other commits to fix this.

--PHCdUe6m4AxPMzOu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6gKDUACgkQJNaLcl1U
h9CTKQf+JcMSIU3aaXkHJ+5+keCc1TZZHMTBC3+Ka0YjjadM40jiPjHGciTQfFe8
+SO20Sxma+O3LYXvSdEYBkLobd5i+jZL9pv4Dv5ifuM3OjLJFpzvpezoYJK3iG5s
aGW6klKqE8yTBFDHkK+LlLq+lzCkHC1Fjqv4NlBvQP0sQeewu3RN9u5XFmoNPVqi
PymCm0t9F9d+SEoX9YlozvZcR9J9u3vWBOXVzA9TMsWgE//3NpTySkluXytz4iET
eEr7tAHnDffF3SX4qq5tiSOS4zryW4oyjJPspNQtRiRTU4nmUVvY28+Z4zWLgtmH
KlRPpugTtPGX+KFdk+IuO5BSUhYQmQ==
=Y01Q
-----END PGP SIGNATURE-----

--PHCdUe6m4AxPMzOu--
