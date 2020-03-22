Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8171318EC55
	for <lists+linux-next@lfdr.de>; Sun, 22 Mar 2020 21:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgCVUzq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Mar 2020 16:55:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44709 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgCVUzp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Mar 2020 16:55:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48lqXt09Gbz9sPk;
        Mon, 23 Mar 2020 07:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584910542;
        bh=h74q7qf3Kxe9VAdTUPVsvoDftxvwsNCfjxcWcXl7ky4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F4O0mHNzFcGSXMoTL+nzbjneJrbG29P9SVM6uhCvE+EqRS1Cx2WfZy240juH+PoGr
         htGsAQ5l3lgwROZU+tRfL6OuqwZN+tZj/uyK10IaAoNZ6Sd5x4z3suD2eUt7JYwRpa
         Jea9TpEujONMCwcBJzrpgYBVQYONRM7HmkTtK05DH1CB+ObCz7xgfXhl8SbnM1hVIP
         YDidhSaJzcYlAdOfCldSK1n+7W3+8p9HMeqhS2EaQa0/xTB+z+9kqCsSuQrEFHKK29
         nrswHZLZWvjNO4tAAUiCiX6Ihj9oeL7/GymNNeG1EkKTOSY9ubIkZNKbM31E5JNd9f
         j5T6zxyJW+wmg==
Date:   Mon, 23 Mar 2020 07:55:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [GIT PULL] Crypto Fixes for 5.6
Message-ID: <20200323075540.501e7573@canb.auug.org.au>
In-Reply-To: <CAHmME9omjc7N2jakS8-+XA8=wJo4XijO6ujYjn_XvE5Tm+2PVg@mail.gmail.com>
References: <20190916084901.GA20338@gondor.apana.org.au>
        <20190923050515.GA6980@gondor.apana.org.au>
        <20191202062017.ge4rz72ki3vczhgb@gondor.apana.org.au>
        <20191214084749.jt5ekav5o5pd2dcp@gondor.apana.org.au>
        <20200115150812.mo2eycc53lbsgvue@gondor.apana.org.au>
        <20200213033231.xjwt6uf54nu26qm5@gondor.apana.org.au>
        <20200224060042.GA26184@gondor.apana.org.au>
        <20200312115714.GA21470@gondor.apana.org.au>
        <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
        <CAHmME9pME41uHvhu5f_JGZbUNCuG0YVgRkBUQF9wtTO6YnMijw@mail.gmail.com>
        <CAHk-=wjGaHhVKyxBYCcw41j84ic1GbyAuGfN7nA9zCJyHZTw2Q@mail.gmail.com>
        <CAHmME9omjc7N2jakS8-+XA8=wJo4XijO6ujYjn_XvE5Tm+2PVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3dtKSHfbFlmX7Lvg5hiaNtr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3dtKSHfbFlmX7Lvg5hiaNtr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Sun, 22 Mar 2020 14:38:21 -0600 "Jason A. Donenfeld" <Jason@zx2c4.com> w=
rote:
>
> Per our IRC discussion, here's an email for your records:
>=20
> On Sat, Mar 21, 2020 at 9:43 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > Anyway, your conversion patches look fine to me. I'm obviously not
> > taking them for 5.6, but if they go into -next and get some testing,
> > I'd love to have that cleanup in 5.7. =20
>=20
> Would you put the "for-next" branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git into
> linux-next?

Added from today.  I just called the branch zx2c4 for now.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/3dtKSHfbFlmX7Lvg5hiaNtr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl530MwACgkQAVBC80lX
0GwoKwf8D6P9NcrB0LUi8RLsUiMzVf/StQEODWzdTL3p10UMyxM+Q4FfrjFoTN/0
RRYdt5C4fKi8NsGJ1mfAiXhV3Q5Kye4sideSjwGMtFhdMSbzAD4sojC758AjmKnX
0QGmCG/EwzbtnY91VwJmJPVh/NeqY5wDSwO5Gbhxy5GymTKWTtB9C9ZzhJZAH1UJ
QQs7LlhPXbbraXg1u8cTCjOI7Xtyypw0jVqxboc8q/ConOFZPEW9X9m0h4qpelL5
wABvMdBhg49Ws/7naIQ1I0wkldEFGsvm+bC1ijxDWj5tZMPDuKwc9J1DkUAAlGHN
Pd0ycbuOgN38LxhXdQ7v8m5vrPcvYg==
=0wO3
-----END PGP SIGNATURE-----

--Sig_/3dtKSHfbFlmX7Lvg5hiaNtr--
