Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2449940D9D9
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 14:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbhIPMZA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 08:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235816AbhIPMY7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 08:24:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F742C061574;
        Thu, 16 Sep 2021 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631795016;
        bh=tvQq/RW41hq/eoH7cIdOm3NJUM6nb/RsZdxMfL9AGos=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=t1idrWy8hu31ChYO5iT7xmctdT0+1FAE7PImMBwdaFWH9bPaZvt7aZgTR1AV4FNqK
         ZqTABwKYTs7StWYeX+KGgcRx3LxLaRwkWMWURFGWNeVcKIzLmfR9VEUkYREwNDUSh5
         19zD7xQfErUAFwZcar6oZgFv7bkFfEfALf4Mz0w49DHbl+SOxoyH2PLi3s9taMRBky
         zy0wecn+2wJ4Ny6ZdktftOlHY6wmXIZTkZfAu/CuEHW3979HmVQdU0UmAZG5aY291/
         8Agevr/GKC7bvcovjWCkJ7ww89VbSPccrfMhY7/5zn0Vp2+SMFVJdb97hBRIB+P/lY
         NyDE6fhI+BYmA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9GTN5WkNz9sRK;
        Thu, 16 Sep 2021 22:23:36 +1000 (AEST)
Date:   Thu, 16 Sep 2021 22:23:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Improvement suggestion for creation of next [Was: linux-next:
 manual merge of the dmaengine tree with the driver-core tree]
Message-ID: <20210916222335.3b1751e9@canb.auug.org.au>
In-Reply-To: <20210916095229.cvsjr4wbro26gev7@pengutronix.de>
References: <20210723155354.082a62d8@canb.auug.org.au>
        <20210728071014.dkdvqmiw2lma6ooa@pengutronix.de>
        <20210916162740.3327df56@canb.auug.org.au>
        <20210916095229.cvsjr4wbro26gev7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CmgR6j7xBX=jSNy_rpkk3N+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CmgR6j7xBX=jSNy_rpkk3N+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Thu, 16 Sep 2021 11:52:29 +0200 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@p=
engutronix.de> wrote:
>
> I understand that starting from tomorrow the short log will be shorter
> for the merge commits.

Exactly.

--=20
Cheers,
Stephen Rothwell

--Sig_/CmgR6j7xBX=jSNy_rpkk3N+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFDN0cACgkQAVBC80lX
0GxYQAf+M7Hu05ePLL/Fiz550aUVGqFKg5wiEycQTn4kZcT7dElZiY2m3YY7v6Ar
L7WiAeFAeQVVAN4Uefp0I8KPGLexGOWqICDO8VI887crPXrX061bdp6clyIBjV+t
taria2IjF1YddWRfo7HIvEWLQ2IUGIGa3k7Z9138GiXrqggmOz/+aZvQMe68mv0q
jvoLw4rT+P01Zyh9mSE0TP3TDFL2QwRFCW8Kqjo1jKbXY98jnZulFnfjB7a4bsQi
wOvut1FFA6pu5usqjlzBvfeqtJ2f1KZwEXTWWZZGKuXTPUdCEN7UXPE95sIP3BPl
GxO6qNwzSUGOWvqjDt3BJ/aBuUUYgg==
=x0dK
-----END PGP SIGNATURE-----

--Sig_/CmgR6j7xBX=jSNy_rpkk3N+--
