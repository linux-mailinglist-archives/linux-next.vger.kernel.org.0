Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0C23125943
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 02:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfLSBfF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 20:35:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:37946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfLSBfF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 20:35:05 -0500
Received: from earth.universe (dyndsl-095-033-172-209.ewe-ip-backbone.de [95.33.172.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16FAB21D7D;
        Thu, 19 Dec 2019 01:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576719304;
        bh=zlmjIO2b2FaAxQJsiqVFTASCy9VFPOanROvzfemYg04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TxrLoohY3XDvgA14Z27//h7jfxW7HgNwqhR3liMAnPf3Sg+y4hjvHwGb1zXNb+BgE
         Hm7y29f49ENkibEgd3Oyn60eSKCfxkHDknqox6clDWUpbgvs0xUMRP1BsFsGt5si3b
         Cs4ItrX6b2emX1Q04gbb2u3PVz9yGg4bD+J3uXZU=
Received: by earth.universe (Postfix, from userid 1000)
        id 58BF53C0C7B; Thu, 19 Dec 2019 02:35:02 +0100 (CET)
Date:   Thu, 19 Dec 2019 02:35:02 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Elliot Berman <eberman@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the battery tree
Message-ID: <20191219013502.npqamx4m63hw4af6@earth.universe>
References: <20191219110144.0ccba0bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="56lbjnfnwaqtrgrv"
Content-Disposition: inline
In-Reply-To: <20191219110144.0ccba0bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--56lbjnfnwaqtrgrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Dec 19, 2019 at 11:01:44AM +1100, Stephen Rothwell wrote:
> After merging the battery tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: "machine_restart" [drivers/power/reset/restart-poweroff.ko] undefi=
ned!
>=20
> Caused by commit
>=20
>   263ec7d0c497 ("power: reset: Enable tristate on restart power-off drive=
r")

Thanks, I already dropped that commit after noticing the problem myself.

> I have used the bettery tree from next-20191218 for today.

Maybe renaming the battery tree to bettery helps to get only good
patches? :)

-- Sebastian

--56lbjnfnwaqtrgrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3608EACgkQ2O7X88g7
+pqqSQ//asM/GhQXI+uC0W/yWFv/A8VIYcSpXuyrfcchR9hzCi85Dt6jm1znjrGa
lA9C9GVFFKrutVWx5ysKXcaAxYFV0zKl8VlxDkOAUgTJW6plfGANjDHhDdxj1hXl
VQBm/t7otXvn1jxm6475rjyUQtWCy9sLswWDgBl+p6GnEQ8EyT9JmaByQ6qPRd/7
MY4eVNtW9o8TK99Exzd327wR+2HGdubvJfW1oCKsMiyTKifBG4i0f/3iqbzzmNlw
u9oZzo67kY5TvF9QlWwGkggy207FNps3LZjmTLTmiQTyrieGUOp/iqg297AlNW1M
qZJGqnxc5qPkINTpxLOV9eU6xeiAGlvGCgZFVKO42eW2ErK1BzthrwiIw5P+fIjR
ribdi1MgEmcN1+F1SRyYTzt+QY4Fl6mevuYJXGEuXU4Oic6moEsUQsGC9J4eOVOL
WCev8yRVORpN8atk1iAkMmBEXdz+4cwp6BEPVMekawzm8U4/0ehsJmgLNd5xZyVB
M4KOYIHxPNPLIW+Fj2BOiNKWalWMRRp6mC50eTGPBfw4OeW8t/mY4DI6ejHh7CHx
axmxdsbS6QNScyxhRQgLSCaBRj08JUog/s4B0AL7wC9R1+ZejpI9rSvfGv1zkWMw
Kv/+GltEFda4rGgFWPbN9f7JRHbHkmCI0PZU7HYJCoAT9chpSqE=
=eNIV
-----END PGP SIGNATURE-----

--56lbjnfnwaqtrgrv--
