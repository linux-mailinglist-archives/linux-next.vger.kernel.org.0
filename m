Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D3C36B715
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 18:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbhDZQmK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 12:42:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234958AbhDZQmG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 12:42:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F9BD613BA;
        Mon, 26 Apr 2021 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619455254;
        bh=e0AFV02WatfOn/ftPmzed+PCexSARnx927IgYwIZK7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DrR/ZY0+yIEY/A0jZIHfu9zlyVlfIIdbJlnj8s7Vc9b40DPf+l8Dqtpe6PxCgDj6t
         Qwof0IuNUWrRZl35aYbEarFT1Jzf2Vnm9z7EZT96jfZWiWfZfs4ekQkpE7OOLO2skg
         QmuCuSZNP89evusc6PQ7QQq05p/zIzhq5wDF/bP8tnGsuslFm0WX34C2HAj3dJLFT3
         RPsB+kUCkzU3o9kQJwVUiRJ6zZwsXspuXBdBP6OlchiDU/GOCimxySCCL0gVN2JPOE
         5dFBFPXG/Pc35yJJcB/SzgKn5ygNwibVXo5OvReWVtww33MJxzNMYJwYg5yVL/g98N
         XA0P8r8oYZwRQ==
Date:   Mon, 26 Apr 2021 17:40:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <20210426164024.GG4590@sirena.org.uk>
References: <20210329165525.32d51a3a@canb.auug.org.au>
 <YGFwWq//sh6onrUH@kroah.com>
 <20210426144121.GE4590@sirena.org.uk>
 <YIbpAaCV4rXe4YZ4@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Content-Disposition: inline
In-Reply-To: <YIbpAaCV4rXe4YZ4@kroah.com>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 26, 2021 at 06:23:29PM +0200, Greg KH wrote:
> On Mon, Apr 26, 2021 at 03:41:21PM +0100, Mark Brown wrote:

> >   spi: Rename enable1 to activate in spi_set_cs() (2021-04-23 15:36:18 +0100)

> I don't think I want to pull the full SPI merge into my staging tree at
> this point in time, is that wise?

I don't either, just putting it there in case you wanted it.

> I already submitted a pull request to Linus for the staging tree as-is,
> if there are problems we can work to address them then.

If it were a new API I'd have expected a cross tree merge of a tag with
just the API being added in it, though in this case since the API was
already there in mainline I'd been expecting it to get cleaned up with
Stephen's patch or something similar as part of the work in staging.

--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCG7PcACgkQJNaLcl1U
h9B0nQf/XnsPds+qn3ZR9xTg+JwTIyLU9KODbMhDRCjcSpv0GNULskTOGA3MKQW/
4v0FKLvOzFfEaWHI1L1qXlKS/GbpVupB5revYp7SBxpVmkUFMxkVbf490gM52VLm
A9CAzPNa6GGa+NWAcu1QsklLGsheRCarPCGYwSPaOpWgDokHyieAukl1t2iNomFr
hMikc889A9763edwTaxHYCe8Dpj6DumeAWhoa0Pd2+ozmy8hLNzBfONHqHY3lv+J
pDxUqTQN+/Xk8OfVjBCu8yyp9BwbuEm/QOLMxNPclVKVaOm3Px4DFk5X5qyJh/LU
cMveC7gvBi+TJAS2xBCqKhflZ80KkQ==
=PEnJ
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--
