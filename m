Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755931ED82A
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 23:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgFCVsu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 17:48:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43363 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgFCVsu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 17:48:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cjGR38NZz9sSJ;
        Thu,  4 Jun 2020 07:48:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591220928;
        bh=T4bo35WdUqV5VF8W6ZD/6TvXPrnECWNs35AYdJWcIW8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OKD32b0nIfo1QggonsfprSpHb0QBCyir0t+iattslSw78rIFoTMEh36FiBaP2+Od5
         WTs6uQ9WXRyLJAMTi3zwaAd6LqQF8bSJL1lEQHOQ8ZGKwDZTuvRJuWdu7efpHAxLjZ
         ezApjD7ttkud7fW45tg2mNoGOBJShsZjDliyaLTiJNLcCfP8IRDXx/ysxtTU5qpTuV
         D3/GFKjyzK20cfXU0UisSP9weIcxhG5aCM3I0JOdlKVC0kWPfgOGi3a8o/QNhg2UNN
         kfw7m+NCSK+MPwGiJSKqj1a32AwzaJ65E56rNWK0k12n0JRJ2y8HlnrZoGFGQprPrZ
         FUjnWwhWK+RGQ==
Date:   Thu, 4 Jun 2020 07:48:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tom Zanussi <zanussi@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tracing/doc: Fix ascii-art in histogram-design.rst
Message-ID: <20200604074846.43c6a4f3@canb.auug.org.au>
In-Reply-To: <69c291c76964642a417e5dd170d183ba6b552010.camel@kernel.org>
References: <69c291c76964642a417e5dd170d183ba6b552010.camel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IGCYWjj8U1LGZVbUr+ZkPkJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IGCYWjj8U1LGZVbUr+ZkPkJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tom,

On Wed, 03 Jun 2020 10:21:24 -0500 Tom Zanussi <zanussi@kernel.org> wrote:
>
> This fixes the Sphinx parallel build error when building htmldocs:
>=20
>   docutils.utils.SystemMessage: /home/sfr/next/next/Documentation/trace/h=
istogram-design.rst:219: (SEVERE/4) Unexpected section title.
>=20
> It also fixes a bunch of other warnings I noticed when fixing the
> above, caused by mixing ascii-art and text.
>=20
> Signed-off-by: Tom Zanussi <zanussi@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/trace/histogram-design.rst | 48 ++++++++++++------------
>  1 file changed, 24 insertions(+), 24 deletions(-)

Fixes the errors for me.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/IGCYWjj8U1LGZVbUr+ZkPkJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YGr4ACgkQAVBC80lX
0Gxd4Af+I2BgE4qmpExhvJ9+Gwf89s/UsvTnwzNEwUHmoGVGcAf42j9+MEYIgcvu
/5x1y2BdE+BQBujYj1dkIH2+9p75p5/GkLSPJPcgYgY2cSA9DEAdI5QZN0zNJykC
7r4IMahoDE4+y1iulObGP+pjUC9d/agFyqgp6iA4F2r5Q5Wnavlc39/p+kT7KBbp
VHZ7uGOezuuc/LtALvxzC5JcDoqZKq2Q8M5R8WKuPo2KNErUeQPa0qKj1UiDekG7
gpC6zpL4YIwAhl0iHQgI2THv6GG0vCPBqiLEcShgDL0OOtcKkmmVqYVZAWVGfr3u
bprVxGKyYq7fSeiz9Ld13KEgC8DWYQ==
=zfxr
-----END PGP SIGNATURE-----

--Sig_/IGCYWjj8U1LGZVbUr+ZkPkJ--
