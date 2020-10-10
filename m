Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB9C289D68
	for <lists+linux-next@lfdr.de>; Sat, 10 Oct 2020 04:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbgJJCLq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 22:11:46 -0400
Received: from ozlabs.org ([203.11.71.1]:41011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729998AbgJJB4e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 21:56:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C7Sj26rZrz9sSC;
        Sat, 10 Oct 2020 12:56:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602294983;
        bh=eYPbb6ElmOJQvXN3d1n2Sgf+vSxFgjwhseVmuM/8sCw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a5mX9SZRU7sYyzYHqLx4D9WX51ATtQivy7eRM5kigd6wzxSjsxVSL0xQbky51JISz
         47lCPGcdIwF/nEucbC7kTOncQc9qn/HJATA05qIiFBjp0K+6oecQsOI6AQRw28KNR/
         8FFS3g0TrxeKk/TCSjquaMapz/DGYkUyMlGvWj8m1javflUZPGpuk3AM6/4UfxC7TC
         EjRAUqJzscDpKAc7CITDl2tKnSFSAqWm4R7ughLn876Bs1CLEHUbBi+R2go+hBbLr7
         JtvpLrij4DlPh+mhPJT1xhPy/jv+u+0iTYJPjHgMDRuWhS/IcLkNCG2X3dwFvk2esu
         uTrRETrBkLpaw==
Date:   Sat, 10 Oct 2020 12:56:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Request to add counters branch to linux-next
Message-ID: <20201010125621.1191879a@canb.auug.org.au>
In-Reply-To: <ed25ab31-0e76-233c-34de-4e227c0b5801@linuxfoundation.org>
References: <ed25ab31-0e76-233c-34de-4e227c0b5801@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RTnJO3AjqSS3m45M9.L=8s4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RTnJO3AjqSS3m45M9.L=8s4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Fri, 9 Oct 2020 18:44:15 -0600 Shuah Khan <skhan@linuxfoundation.org> wr=
ote:
>
> Please add counters branch to linux-next
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=3D=
counters

Does this contain stuff for the 5.10 merge window (if so, it is a bit
late - but I will add it, if not then I would prefer not to add it
until after the merge window closes).  Will it be merged directly to
Linus Torvalds or via some other tree?

--=20
Cheers,
Stephen Rothwell

--Sig_/RTnJO3AjqSS3m45M9.L=8s4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+BFMUACgkQAVBC80lX
0Gy/4gf/VvS2c/jKbsYnBGSvZD8EM5gePxLP5Pj5e3uf7xm3GU05ea+c9y9rv5ZE
MsDnbL0Pkgee8DT5Y+zPyry8iQJfkgVh5icj8LNC3IVqay2bnFid4BWPyYKVxqkK
i+by3ZPjWCrrS4svRe26zLN5Yj4GQg09zHMIhzK5wOJjfHhheLMQMIkQ6YuCwQGf
fAnBAEa28jIwzRKz1ZoCd4joW4S7RKlxk0/xeYyB7SHhG91De31ZoLmT8r56T3oT
Eggg7WHZIIs61abWjma8VUV1k351fxQAWMyhlfmiIXn+VVnTRC938A4QcCVytGjd
ZjPX/OE764HsEODKm8Hf1ZCyQAnxWg==
=+zN3
-----END PGP SIGNATURE-----

--Sig_/RTnJO3AjqSS3m45M9.L=8s4--
