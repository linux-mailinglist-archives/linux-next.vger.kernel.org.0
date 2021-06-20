Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0329B3AE0FB
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 00:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhFTWod (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Jun 2021 18:44:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34223 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229875AbhFTWoc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Jun 2021 18:44:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7SMr6Zpfz9sRN;
        Mon, 21 Jun 2021 08:42:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624228937;
        bh=ryN3VW4wUOBX143rkIRY0DHXX+TkHYGButZNlc6372M=;
        h=Date:From:To:Cc:Subject:From;
        b=uJPtN7iy14pOtwQUTnX2KesNaIVmCDakRU4Oq0fcSATaYikHNGeM2LKJY0PuFmUqE
         6MtOAxo1lJTatN3qkpT6Z5rt9aFkDY0HIA5+ezS9lYHIUAp7pU1Txyj6NpdJwRNb6I
         lLNCrN5yWZ9jsamQO6Cao5Mx0xpKr7Ee0eShwjuqC0v/hQGGBkcdXEEYz6NGKgkVor
         m3HIY+DhPS29dhmG811Nz7li1tkpWr3v2jwKoiaJHzIYB3ZK2XB+7vGtsaXN9GsuH7
         Oizv9vfVGdPlmpc7T5DFfprXTgDj1ICAWshEG5fr6HyJE5uZVEk6xmgo1tH/vDJo8B
         53tHS0i1Q83Pg==
Date:   Mon, 21 Jun 2021 08:42:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Sean Anderson <sean.anderson@seco.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the devicetree tree
Message-ID: <20210621084216.3c477f94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/azdgCMcLraYFlaPs2kP.3oi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/azdgCMcLraYFlaPs2kP.3oi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f92f2726e3dd ("dt-bindings: clk: vc5: Fix example")

Fixes tag

  Fixes: 766e1b8608bf ("dt-bindings: clk: versaclock5: convert to yaml")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 45c940184b50 ("dt-bindings: clk: versaclock5: convert to yaml")

--=20
Cheers,
Stephen Rothwell

--Sig_/azdgCMcLraYFlaPs2kP.3oi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDPxEgACgkQAVBC80lX
0GxbhAgAhU/vaQQMdI94H9bgvMSyrtAMiMdpvsr3GaU1Wh0DpWzEhGI5SZ3fBULL
R6tUaMEQAKIYhyg4mHabC104Tf8Zy3AL/RZsAyOKUDQZfnMv2K9pUFDIqhSyczGi
hA5J6euMUhE5NV9wIzPLT1XqH0gVVwMJ2Bs5IB+Gau2ZwfcFcrov8QmhTgZymeEz
zRH8T4GQaqXpXFeCUBHkik0XjZTgaihwW5pEWuht9mvByZzr8Gcn6ChDz7eGOGOf
m3qoCTc672sZxChV0+12LPTI0mXuekoIXFlWq4R2Y6d2sFdah73R9qpUUPQO++zs
EWCiyYoj3X8W0yqz18qxSBPivZYZHA==
=aM0T
-----END PGP SIGNATURE-----

--Sig_/azdgCMcLraYFlaPs2kP.3oi--
