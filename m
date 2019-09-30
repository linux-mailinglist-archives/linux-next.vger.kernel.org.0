Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03489C2940
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2019 00:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfI3WCD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 18:02:03 -0400
Received: from ozlabs.org ([203.11.71.1]:60807 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfI3WCD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Sep 2019 18:02:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hxFh6fXpz9sNF;
        Tue,  1 Oct 2019 08:02:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569880921;
        bh=ZuXAopI0JO8YV9UZ/DETcXwxpmkRYtyPjwg3ZFHrsxI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KurzC9EIMXgjjSocxwGxMMu6J3YiSf0sqr0UNqAuIIEFVp3o1kyIMJy580bps1/Eo
         HuZoJeFP0v0nSJLqsd5ZNQ827qgCXjrnL7YQi/sZlcfBH5GJVXPbIxmhDMrwIIopVg
         9zpUIU6pZQUpUeBD6InhjBm/7c3nOZ5pvKbI314B+dUkFeW1veKycaMmTly+6HJrFd
         xuXvk1TZ08X15IknjT39X9bZQ/TmycGl4YQ+yXONmbCbRnoNB1A20oXs5gVq2bHZb+
         8Uhr0tXupkz7saHad3LJPXtkusJ8+3za8Hd+CamVlHYG4Xf22WpEAjLH3ajL2T92bM
         pNZu6QB5tgivg==
Date:   Tue, 1 Oct 2019 08:02:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Request to add linux-kselftest test branch
Message-ID: <20191001080200.0e9a5a31@canb.auug.org.au>
In-Reply-To: <CAFd5g47Aq4kWeU2NU2ogSAcf-Z5XNEzk90Fjh8z_s2xv2Vs+Ng@mail.gmail.com>
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
        <20190926150538.GS2036@sirena.org.uk>
        <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
        <CAFd5g44bbh8cd=kfwLR2eFf0FRuO0d5-Mszo7P0JRLbs7e8CQw@mail.gmail.com>
        <20191001073913.256b5669@canb.auug.org.au>
        <CAFd5g47Aq4kWeU2NU2ogSAcf-Z5XNEzk90Fjh8z_s2xv2Vs+Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mW28Y2FhLXbXvT.R3oYV_i4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mW28Y2FhLXbXvT.R3oYV_i4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Brendan,

On Mon, 30 Sep 2019 14:47:34 -0700 Brendan Higgins <brendanhiggins@google.c=
om> wrote:
>
> Linus had a minor complaint with the KUnit patches, so we had to fix
> them and pull them out into a separate branch. We didn't get enough
> coverage on the updated patches in time for rc1, so we are hoping we
> can get away with sending them in as part of rc2; if that doesn't work
> then it will be for the next merge window.

Ah, OK.  And I just noticed that the "next" branch is actually my
"kselfest" tree ...

--=20
Cheers,
Stephen Rothwell

--Sig_/mW28Y2FhLXbXvT.R3oYV_i4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2Se1gACgkQAVBC80lX
0Gxtwwf9EGiqiyhAc0RPYdFf2mcwUUD7OQAtD/8pjLrjfadw0Yszf2bfRK6Pp7VP
SP6SMH3rPz2Cz9i9UzygIUS6pjB3Bg4iwcI1NAOflWnbcy+mHsfMdlztRuHIB1e7
BkqyypQWCk3KO54CdFWAwnAulS/ntker70cV7wTj+xWGiqYJRL4jCV0hERIJOQ9x
GwEmHcIVvAbvEOiEVlHnZxxtGNZZ+b9YBQtTDOa1AWzuMsVHNx5hg/WR9l/obIIC
6OQkPdQroGs/THnXQbpclqJ0mPg5LDdXbo9wTb4ASss6bN+zLWQhpdMJmbWwOUm7
hVW5uA/W3urOSghGEWfzJLKIurzBmA==
=OSoa
-----END PGP SIGNATURE-----

--Sig_/mW28Y2FhLXbXvT.R3oYV_i4--
