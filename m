Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F260E3D50A0
	for <lists+linux-next@lfdr.de>; Mon, 26 Jul 2021 01:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhGYWq1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Jul 2021 18:46:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:43086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhGYWq0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Jul 2021 18:46:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0BC4608FE;
        Sun, 25 Jul 2021 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627255616;
        bh=K3Ipz5/fSzqnumrv7X+VcBJf96RklfBddytOAzqbouY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QGlJ2Rpd7ZMs2sm5julAlk0FIwLdphRYYjNozzQtUhdhkRahzk/IBy0zUUj64ezpY
         S5e0RNuNSNw7VEg9YzwGdzrbgTb4Rec2rg49zk/cF1k1bK+xyJL1/bgyj9MPWMKy95
         APn+kGs0K6NjT4IJzh+CYxGbA3jUzi434BpFkLlmmMDQJAN98AEIsqyB61eXkxTLFa
         O5m4lfecrEAMirY868CMlKZaFa3Kt0pUF+tJjrj11947fFoZa5nw/2OdR5NFgO7jO0
         3Ld4lD7BfRfi/hCQmJBITc04YQ3oiVNRzb7Z/wI8GFXhcadDCZpxBA9h4PKwhKfLcD
         u1OTSPt6SSJSg==
Date:   Mon, 26 Jul 2021 00:26:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 23
Message-ID: <20210725232647.GA4670@sirena.org.uk>
References: <20210723180812.47cfa78b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <20210723180812.47cfa78b@canb.auug.org.au>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2021 at 06:08:12PM +1000, Stephen Rothwell wrote:

> News: I will be on vacation for 2 week froms Saturday, so the next
> linux-next release will be August 9.

While Stephen is (hopefully!) enjoying his vacation I'll try to provide
some holiday cover, I'm getting my second vaccine dose on Monday so
between the time that'll take, potential side effects and the general
time it takes to get the first -next build on a new system I'm not sure
exactly when I'll get going.

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD98zcACgkQJNaLcl1U
h9Akywf/bK/j6o9dpvb3ebwujQE5uvVmHDL4MGJChNd4Os9wvf4RV4yYoETCBxt0
azNytDEpLNIgXFAJXAeclCNo68IidTemvZnMWthqxBIX9mU30twYW/6WHNIBgB+p
3S5o+SR1FlHpvDwo7ErA3WhLxwYKUzfCyMb3gqY0T+GXeoXl/ZIZfCyWFvxMJD7o
pudCxgH24dNy+1zBT0OF2vql/PrfWRPy4FTlJFWSKDEUs2a/TXvvqKY+/ierWxnA
6JKnAyhqiPq/yE0XKkvwGEPsrs1V4zkqMhKMAaNKMJmahJUyopighbNYTCYbd/NO
iX4n73kSiLptDN32VsBW4LG33AQjBQ==
=ouJC
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
