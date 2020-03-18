Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F4F18992E
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 11:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgCRKWK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 06:22:10 -0400
Received: from ozlabs.org ([203.11.71.1]:51827 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbgCRKWK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 06:22:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48j5gh2C2Xz9sPk;
        Wed, 18 Mar 2020 21:22:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584526928;
        bh=iBfOx8srpXU9WH3boIWbFOc2BJhReZAiQMKbqxHy1k8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uW6UTiGikvwH5OjyQqyQIvIWaJhmY4tg98UqCeh8qLi98oQrkp3DaSc5OF1CjssqZ
         dNY5BbNJ36O0Efn5BjP7r5JIxLM3tYw2nryJ0xhT5gFys4/f8tygn8shUnL8HPoRp5
         myvoXC6AQnXDdgJK+2KI+FXJ459bQdITyPxtSIcrOVsrWR11Sy8Qx6fXiNd/Fwz9uk
         FxCoxT8GlsbtvamyHeLqDdGu/ODDW6FlUSewCsWWlVT9NkdE/PaNKwg2yaPst9xT14
         3hg8yDOCHvfyQdreYIcRxmYTrydnvKSVIYwJhFZ6njJe254Lp4jdr4y2t4H1oCbRwJ
         HL5bJVe7mbW6g==
Date:   Wed, 18 Mar 2020 21:22:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-next@vger.kernel.org
Subject: Re: Please (re)add trivial.git to linux-next
Message-ID: <20200318212206.4ed15ffe@canb.auug.org.au>
In-Reply-To: <nycvar.YFH.7.76.2003172149190.19500@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2003172106170.19500@cbobk.fhfr.pm>
        <nycvar.YFH.7.76.2003172149190.19500@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7qiXFtbMPBgl53ZkLSSs0dW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7qiXFtbMPBgl53ZkLSSs0dW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Tue, 17 Mar 2020 21:49:34 +0100 (CET) Jiri Kosina <jikos@kernel.org> wro=
te:
>
> On Tue, 17 Mar 2020, Jiri Kosina wrote:
>=20
> > I will try to revive trivial.git which I've been neglecting for quite a=
=20
> > long time.
> >=20
> > I've already pushed first part of the queue to kernel.org; could you=20
> > please readd
> >=20
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial.git/ =20
>=20
> ... more precisely 'for-next' branch of that tree.

Added from today.

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

--Sig_/7qiXFtbMPBgl53ZkLSSs0dW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5x9k4ACgkQAVBC80lX
0Gzeygf9GMRXR1Fb9AytJ2rOtBF79p1qTAmOSmjya9Cfu2Ml0v9T4vgyeY4aFUn6
3AXKo5MLCyGjtEVCn6xobXhyA075gMlHCV4CCYS1QVIa9KbGNOgfca+zfK9pnLUH
Puvb/arW9V5gfUtgBFHbqO7KVaJkUIkzDrrlfQHu5Xz3PHHvznaMdJiOl5daLooN
4p7N9PgFW2/lc7GLsswQ/V2f4pw52xVX3qZJww479py3tG/eFjhHCChTWzruAt+C
bq1V2bC6xqbwhLIKfPL3JWHf0KC8cmP+VLF6Xn2R/PDowr9RWfHFo17FuMzCnwm7
VpHcW8NOQiO1zTmukkoZmCGVM3tAhw==
=IYqT
-----END PGP SIGNATURE-----

--Sig_/7qiXFtbMPBgl53ZkLSSs0dW--
