Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF86AD67A
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2019 12:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbfIIKMV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Sep 2019 06:12:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728117AbfIIKMV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Sep 2019 06:12:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46RkVN3cwBz9sNT;
        Mon,  9 Sep 2019 20:12:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568023938;
        bh=WtZHNMKTkVbJZEkFoiX0iM3pmN7GlX1AZgEOXkQakSg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Wsyn3E/2zaHCW4VqxqI5PS+I/rnEAQQ5mbiObekuOF7KTH3V19YqcE9FlHOBbZP1v
         uwq8/fSubckISd2IBOi+fIPEeIlwEN52ulKt2TKMqtAErLXMStfx4Aj4pzNnx/0q3v
         mxJzHFvjhf3fI5+7JcA69D0p+jmetgPyqMMz8cCqzhsFZxSiZzW5yVuGY2MPhKoijf
         H8jowi5wc09wIhSfkFMgqUw5Aio4zoEFpAqh0fxJgVddxJ5aJKqbsfLJPQKGdt4o+e
         W28JDvL6PgoEVkhELNM+wKDDGh7tJg/y3RwF/xHk7Fw0pBJE/SwrorGkZRfC94o20g
         UyUIA8xDfrrIw==
Date:   Mon, 9 Sep 2019 20:11:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, airlied@linux.ie
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190909201159.778590a0@canb.auug.org.au>
In-Reply-To: <20190908141307.GA7115@pc-sasha.localdomain>
References: <20190907090534.GB1712@pc-sasha.localdomain>
        <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
        <20190908141307.GA7115@pc-sasha.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x+8al_Rd8L9FcNKBXNLv=W/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x+8al_Rd8L9FcNKBXNLv=W/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Sun, 8 Sep 2019 17:13:07 +0300 Alexander Kapshuk <alexander.kapshuk@gmai=
l.com> wrote:
>
> This is my first bisect. Here's what I've tried so far and based on the
> output I got, I seem to be taken in the opposit direction.
>=20
> git bisect start
> git bisect bad				# 7dc4585e0378:next-20190903
> git bisect good next-20190730	#70f4b4ac1655

If you are bisecting linux-next, I will suggest bisecting between the stabl=
e branch on linux-next (which is just Linus' tree when I started that day) =
and the top of the first linux-next that fails.  (Assuming that the stable =
branch is good).

so

git bisect start
git bisect good stable
git bisect bad next-20190903

and go from there.  It will (unfortunately) be quite a few commits to test
:-(

--=20
Cheers,
Stephen Rothwell

--Sig_/x+8al_Rd8L9FcNKBXNLv=W/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl12JW8ACgkQAVBC80lX
0Gxqigf+I6xbGgy1s4thi/M2FwgBiKiGnIOia6WQIG+D0OhL0OKh1/YfMema9pzH
zC2rO39vF53JVihv1MQRe1HfTEj7nMrZjm6BPziPwtFbKjw5f67qkXOr7YhUTx5c
msTgV9Y0yzD+LHDYBm+CI0Vd29CQmXmFa6UlAaTDFY83yOXAYLUJgvDyPeyWzb3K
6zWUbV9+VIAY2ygo/YMH+6fFhEMqUm2g4AbzLjatQmhNq9gpUzDRgPnAXqsUPWXY
i7IDti6k+CbGWwj4w+CtUYwNEm8fA3RzXWgKnF2BxbdpnAURulM0N7dCokblBE9X
Wy44jyqIFkp/d4fCxxQRX2+dtnxwSA==
=94Wb
-----END PGP SIGNATURE-----

--Sig_/x+8al_Rd8L9FcNKBXNLv=W/--
