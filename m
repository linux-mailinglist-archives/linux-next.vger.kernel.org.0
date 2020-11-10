Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B692AE1A9
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 22:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgKJVYv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 16:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgKJVYv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2020 16:24:51 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A77CC0613D1;
        Tue, 10 Nov 2020 13:24:51 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CW18w3PWZz9s1l;
        Wed, 11 Nov 2020 08:24:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605043489;
        bh=+yPgWrdHMKiH/LUBVn7e+WTr8eTOlDMV/cf4j5hmyHA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M4BKIf+BSI6il165qGcbzuQIa3WAUvepJ1zupfuCei1/FTfIVQrzFG6nWew4yc9g2
         VJ+Cnbvogj2zx8LhRWl1VyKc1O2ojvxVvxD6WwaoApyatik8pZpwbJ1wU5DeiP5QvG
         OUUdrfPz7PKvwuLZc2r1VcCfhQ2DkSJ9Lsg0nRORHbe9OZ8xfmYy3WPUAAg22H8Lnl
         5/xX1K/M022u3LK+IMgG7plsfhL8mrSBOaVbL6P40FOpHUOPxyUomfICdk8zygJyRF
         z7LYneRLsLsBahNWHOCkCtL16asl4X1NKZZ2oZ0v+lXXyNdSfEiJuHvHPbdl9/Reak
         T/U4sNtyeIdvg==
Date:   Wed, 11 Nov 2020 08:24:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20201111082447.4ef81587@canb.auug.org.au>
In-Reply-To: <20201110190036.GT3576660@ZenIV.linux.org.uk>
References: <20201027151414.2018d5fd@canb.auug.org.au>
        <20201027045912.GG3576660@ZenIV.linux.org.uk>
        <20201110190036.GT3576660@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n6uGA+wBV._.2uX+xD0eJ8w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n6uGA+wBV._.2uX+xD0eJ8w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Tue, 10 Nov 2020 19:00:36 +0000 Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Oct 27, 2020 at 04:59:12AM +0000, Al Viro wrote:
>=20
> > I'll rebase that branch on top of sparc tree tomorrow (and eventually I=
'd like
> > it to go through the sparc tree anyway). =20
>=20
> Done - sorry for disappearing ;-/

No worries and thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/n6uGA+wBV._.2uX+xD0eJ8w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+rBR8ACgkQAVBC80lX
0Gw8jgf+Lm40WQW541yS9kdAMGibeqxu/EVgZKDIXhWF2pvjaQOBJIK5K67y/Saq
qvwmaCzgfA5B+fQgovbQ6fepzLOeHYzuv4WKISikjTPHrvTwvmi9hOsujAHTzIaP
nvvm3Udjkr9bbm618Dds30+nEiOeXQsTwzduFd75Me4JEo+xSplAT+hXf6bEt9RS
mNvK/U+volDvTSKpiqIsMs0Nazh4WEK3O/v5rcHnPmSXR85QiJQ5usiHAcFGAuhC
42IRpPaCuQojIcgzNUe6CHuFHbA0Hwm40WFBNSX2zH50M5R/xvFA5Cv9rqCgAsab
26E/NeFYnY3eLOPn7ziMiXwqbo6hSg==
=gyNW
-----END PGP SIGNATURE-----

--Sig_/n6uGA+wBV._.2uX+xD0eJ8w--
