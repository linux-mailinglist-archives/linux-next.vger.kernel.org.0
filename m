Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD812185A7
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 13:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgGHLKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 07:10:49 -0400
Received: from ozlabs.org ([203.11.71.1]:38487 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728611AbgGHLKt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jul 2020 07:10:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1xS56BKKz9sDX;
        Wed,  8 Jul 2020 21:10:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594206647;
        bh=XhXMD5CcbX40V+/dAoLEYM+yyXn7CkY3Pmqk+ZlW1Es=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f0fKPeVbsKzPh4JBO0U2WrDBb4rKQggHrZ6CsSHjdkX9M6FF2qfi19y19KMkl2dDG
         LDeYq8csjk1hijw6eLfFIxc3QcERfzndEOW24oPx3svLIqTcy1tHyO9lAn320Z9fCu
         NMah/3CX1yqEZ+iaCevJqVcq2mpkJViUdciWzTWHkz6l+B9ihnHhgaZv0m7DfJ/Ej+
         HUrqVhmxOBj/NgYF4W3Rlvdc3Ixu8GoKnHDaLAVk095QlDz6EDd2KRuWwA3MUbidop
         lqCAgcQchG6PzNuwaMI9/PN95uDiSotMBRrDD/DZ3F6jXE4LodjBMOV57HPgixGa7X
         1U+LBkS4wY+Tg==
Date:   Wed, 8 Jul 2020 21:10:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the clk tree
Message-ID: <20200708211044.3032905d@canb.auug.org.au>
In-Reply-To: <20200630081115.mmqdsm3vlnj4yagu@gilmour.lan>
References: <20200630095341.0f4ae8ed@canb.auug.org.au>
        <20200630081115.mmqdsm3vlnj4yagu@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WbWJTRmiXALElyekPJ_qGZt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WbWJTRmiXALElyekPJ_qGZt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Jun 2020 10:11:15 +0200 Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Jun 30, 2020 at 09:53:41AM +1000, Stephen Rothwell wrote:
> > After merging the clk tree, today's linux-next build (x86_64 allmodconf=
ig)
> > produced this warning:
> >=20
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/clk/bcm/clk-bcm27=
11-dvp.o
> >=20
> > Introduced by commit
> >=20
> >   1bc95972715a ("clk: bcm: Add BCM2711 DVP driver") =20
>=20
> I've posted a patch solving this already:
> https://lore.kernel.org/linux-clk/20200626112513.90816-1-maxime@cerno.tec=
h/
>=20
> And it's supposed to be in clk-next since friday, but it looks like
> stephen didn't push his branch?

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/WbWJTRmiXALElyekPJ_qGZt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FqbQACgkQAVBC80lX
0GwzzQf9FdIQwZ6iV2w8x8l3tX3Evj++77WF2fCFo0pUMEkZBcNTWs8CECYQe67e
OSiKrpomiwbHS3d5peYkXURCM1aSzGKOTaVCQ/uTv4qZnzh+u4bUnPV9VOcyiZ95
T80k+YefrWxMI8Atu5gyUChZyElvk3jmm4fqzzOww5SaZOfoUk1NJE4bYj+SB2NC
1gt3ukmknAardTv49nxGQhzhw59GxActobY2miu4p36rVCFIJjj+6z6Gq+7TW5AR
6nSsqOdqxUMOKFE6TMp3wuj4lMiMhHTL3NpPL/G273tDqU3Nun0lMtsRrP895Fei
+ztkwMm9Hx+epZQ30uFFedrRSp7wRA==
=i5wm
-----END PGP SIGNATURE-----

--Sig_/WbWJTRmiXALElyekPJ_qGZt--
