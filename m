Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBD8438F26
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 08:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhJYGMG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 02:12:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41103 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhJYGMF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 02:12:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd4Ky4tSNz4xbr;
        Mon, 25 Oct 2021 17:09:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635142182;
        bh=lARUbalfcU75V5nPICqhWN/XA1PYjayw6a7ig82sc4U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QaSxyvH4J1bYRo7QWV1ijOC01xTLv7Jh/qK9TqHO8j+OofGK8zTqJh1ZhvEaWZKS6
         0tDb3a9T2t16fwpntNLUIZaf55NBts4s4m8j8uWSHfjUuEjKRASFgn88+uJrtvWRS6
         ZOHOwjMQ8D3vAnZ6uRCo3wqApc/FZPh3NX1/qvMWwf+0kF65NgNKgJDXjsEsYbI74m
         /zcNury+wUUhM+RQXRVnSeIu0mX5BlVyFmkYQOHa/tlisMVlL9h4AS+2CzsSLdHjss
         +XyjUbgzatjWh90DPrBPw/e/GRFZmFN9xFZO7YyGLmSQKOYnB3vVuPGRdItVI8W58S
         o2eH3oi997O1g==
Date:   Mon, 25 Oct 2021 17:09:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Eddie James <eajames@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211025170941.7eb30042@canb.auug.org.au>
In-Reply-To: <CACPK8XcWyJYj94q+Jp+KgTnM_f4vyY_gSyjUXN8ZPOtnbpJjfg@mail.gmail.com>
References: <20211022193853.296c4ee9@canb.auug.org.au>
        <CACPK8XcWyJYj94q+Jp+KgTnM_f4vyY_gSyjUXN8ZPOtnbpJjfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wfzeW/Q3XN1d2s72avONvOM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wfzeW/Q3XN1d2s72avONvOM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joel,

On Mon, 25 Oct 2021 05:58:37 +0000 Joel Stanley <joel@jms.id.au> wrote:
>
> If I apply this patch then the build fails in a tree that doesn't have
> Willy's patch.
>=20
> Unless someone has a better suggestion I'll send a patch that includes
> both headers for now, and make a note to remove the mm.h include down
> the track.

Don't apply anything.  Just remember to tell Linus (or whoever you
merge this tree via) about this conflict and the resolution when you
send the pull request.

--=20
Cheers,
Stephen Rothwell

--Sig_/wfzeW/Q3XN1d2s72avONvOM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2SiUACgkQAVBC80lX
0GyDqwf/dmqvaiG0RGqHJ/W7F7KtYPPb4Ig4JKQswP8zpd+JPbUE62StUEzrDoDv
EHZ6rAPHBhEA/wT47cHKbfUcfARYQ64QNyFOARms9iz6OgPi18+iG3KwvH8CrJR2
jMjG6BSAuyHrzpK9s7IcB4veuKCUTcgV9fw5hMI61/aUh8c7y6c07XonGyI5agn+
DnY2DsbflF8eQQeCNjKap/OTs4ONZOV4oG6f+RXcAecp7hSZuOk8NpteJh7Oh6hn
WIOsyDNaAOAMTSsWvvLi7pzFd5PHEdzefz3efCxQ/0nObRwDD6pr2OgsxEajNjcv
iyEB8SbtDKOhGoLIUaNZ/6/r3L7W6Q==
=9oEj
-----END PGP SIGNATURE-----

--Sig_/wfzeW/Q3XN1d2s72avONvOM--
