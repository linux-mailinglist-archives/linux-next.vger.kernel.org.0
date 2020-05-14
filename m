Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B071D2C21
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 12:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgENKEu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 06:04:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:52090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgENKEu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 06:04:50 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12AB020671;
        Thu, 14 May 2020 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589450689;
        bh=VhAnaZdNlmXSbp59Sx9XLCCpM1aQvqXrWpEOZEkajfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AvTzHK+ECICAl69BC4LZZTZyz4mxf31wxPpuc0ftLDG6Fga54kWk96A2/KPx3JpC3
         fggD+dPhuusXWjdTdFtkoWhGtTVTMHWwDB7fgpyuDYHcMK9q6YyUl6+vIbhis58AEn
         hadKg11RU6pN6cwuNof3Vf9RS5kyO8XK9vgRwaPY=
Date:   Thu, 14 May 2020 11:04:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc-fixes
 tree
Message-ID: <20200514100446.GA5127@sirena.org.uk>
References: <20200514071257.5b1582ca@canb.auug.org.au>
 <f828c953-07b2-6a6b-881a-bf10f20a719d@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <f828c953-07b2-6a6b-881a-bf10f20a719d@ti.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 04:20:32PM -0500, Dan Murphy wrote:

> Did you want me to re-submit the patch with the corrected commit or are you
> going to update it?

No, just leave it - I don't rebase my trees.  Please try to avoid issues
like this in future :/

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl69F7sACgkQJNaLcl1U
h9CyAgf/cr1lElvfb4eZ4FXIqH1MB8AyuEUUtlLsmwCq9Gl1LdJS9Qdr81RS0fxE
874MBM+9z6ob3ncvjpP3LPGTAfvM8fNh6Lixuvhr76lcKc5kAcYOifh/DNx7K6tU
rreMWJbNlRBpfjya9KAUYMG7YCEQ6r1scUdFCkitnxU1SpuKoCe/PbAhRw2BA3jp
VgQHmQWG+J8JmkF4ih/a5Ud+8N7nBd5+9MOtA0s5mE5R1rLpy5FrNZcgKMxGPLXy
XmO/SZpW0aK18U5edVuRxO6Y7IQ1TV1exazUshffNZKSp3ipD4Vd/1j0jMl1HrzZ
2O1KNY3i1m65xtbH0IcPbP59DByJVw==
=xKXa
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
