Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27C5DA517F
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 10:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbfIBIZL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 04:25:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbfIBIZL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 04:25:11 -0400
Received: from earth.universe (dyndsl-091-096-044-124.ewe-ip-backbone.de [91.96.44.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F40EC21744;
        Mon,  2 Sep 2019 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567412710;
        bh=hJqNd1nAJxTWeoG8cUFOGVuydTeiAcks6J/HnRnrdCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CSKXHmZVccWeRF1swatxhhvfPbdfotFTHJhA/Wq7BnjRstbc5TxYRywGykOTGOAh+
         eIq0L6cf/BwuM9gFhJ2eLGCSQWNiYDlkSMHlxJIBTQIvMavt7Fwh18IJtc1JsspM8e
         3fhI5XLsXL5L75XAx1RV96LcJi2yV8fSJTt+ckvI=
Received: by earth.universe (Postfix, from userid 1000)
        id 9A4513C0B7F; Mon,  2 Sep 2019 10:25:07 +0200 (CEST)
Date:   Mon, 2 Sep 2019 10:25:07 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Michael Nosthoff <michael@nosthoff.rocks>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the battery tree
Message-ID: <20190902082507.fmfays3lnnkyigmv@earth.universe>
References: <20190902071041.ukvc64tg5tjttk6w@earth.universe>
 <79b6-5d6cc580-3-35015040@57153312>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hobeijwfp3tvdwi2"
Content-Disposition: inline
In-Reply-To: <79b6-5d6cc580-3-35015040@57153312>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--hobeijwfp3tvdwi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 02, 2019 at 09:32:47AM +0200, Michael Nosthoff wrote:
> On Monday, September 02, 2019 09:10 CEST, Sebastian Reichel <sre@kernel.o=
rg> wrote:
> > On Mon, Sep 02, 2019 at 09:31:31AM +1000, Stephen Rothwell wrote:
> > > In commit
> > >
> > > b19aca4eb2d2 ("power: supply: sbs-battery: only return health when ba=
ttery present")
> > >
> > > [...]
> > >
> > > Please do not split Fixes tags over more than one line.
> >
> > I have fixed this and rebased the branch, so the issue should be
> > gone tomororw. Thanks for the notice,
>
> I think you missed that the second commit
>=20
> 38fa8b9f75ea ("power: supply: sbs-battery: use correct flags field")
>=20
> also needs this fix.

Right, now also fixed.

-- Sebastian

--hobeijwfp3tvdwi2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl1s0d8ACgkQ2O7X88g7
+prcOhAAm9EtUz32jofNUdITle8kHeokXBQnmIVM1qaac1+iEiO7DUt5F3tGCyyg
Jk5q8zZMHIzGeZY1TEvMPtxUnsPsrKEDRZTOYfLQ2uwMC4gKMgce8kTqM6aiQopl
BQzbJpS+zvDcMIUa1my7TynvmZaCLETwkUfY03QlJlvPIabzpdECcZr2h83jTSTL
p9JwUA1RJH3dqkrkLNjevjqh5z1DMTn/vvl8UnmypYmCSesypHl51VeWzM/RZ6DQ
5J/jkjelRsWmTaMnFOtG3WtxZOJDbk0GGbhMb2f8rRPgtlOQqSEhbOpxSlH7Md78
iTsZLL0FkZXqhR8nsbm5tEOZHemiF5AyNaGKM+y9S+24DI35EsZHQlpR+oFok4lk
YKbwNJSl483v9uaIb5LZPJxxDPJY7HtR0+tue8UPqjHOeb7SN47ppMJJo8nAZFA1
VlnAPEauj6GnI0JbbEIkHhK/HNS39aK+p+3ngiRPQV9HiRaVOC9QSU83LD+Eviza
f4lDVUtlhF3Hl3VTvEVdlrxzCC10ASX9ou+3B8VAbBnUGmioJG19cgqgDF3vFbEL
6c8gBk6S+Z9XrRla2cecBxM7nW+3ShzqLNAbdoY/hMRIHwBYE3PDLbhP8taIsIA8
5Z3PuLrFga0B9Sja0NZGG8LM1VeIIt12goRpFUfKDhvhWA7tMw0=
=MVak
-----END PGP SIGNATURE-----

--hobeijwfp3tvdwi2--
