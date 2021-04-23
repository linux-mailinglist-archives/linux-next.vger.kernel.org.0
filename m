Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2663693CF
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 15:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhDWNho (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 09:37:44 -0400
Received: from ozlabs.org ([203.11.71.1]:59021 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240985AbhDWNgg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Apr 2021 09:36:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRb0F39tJz9sVb;
        Fri, 23 Apr 2021 23:35:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619184957;
        bh=daUQFFEwMMybYrOEm10p4BFIfHa+Oi4Il2zr3ldWm+0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p12ShYAU4cP4gLk538PGF0czfYIHpJcFrCspkitH5j78WiY4UR2/TQKifLWw0HsIs
         uI5UZf4vG2wtTIMSC220Ngn20+WQbJtY02suxhZKno2TWtoiAxkn5Gin9YdZD2AGzM
         O8yWsNRbPJDnPe6K7/eqP+U9sCzeUdtLBiLdEbrnE0tjRMlwYCChtq5GuenUwZuoAI
         p8SiI0QB/X9yEdRn7Zq159w+Ma5T76akpka9okOCfU/w+D4S26JnKP7gdSa7bbu8zu
         i16BaEMDZTkV7b7jh0UgofbVfi7D7GspGXRo+LVX0JLbwG1TSpstKINnRWlLLn/CBr
         nHCZ6JiMeJwjw==
Date:   Fri, 23 Apr 2021 23:35:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Apr 23
Message-ID: <20210423233555.1fae8e11@canb.auug.org.au>
In-Reply-To: <20210423230655.3738a6d1@canb.auug.org.au>
References: <20210423230655.3738a6d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SeRa5qiRDLRIcgNL=vQVICl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SeRa5qiRDLRIcgNL=vQVICl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 23 Apr 2021 23:06:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Non-merge commits (relative to Linus' tree): 13678
>  11650 files changed, 651895 insertions(+), 285075 deletions(-)

This is the largest linux-next (by number of commits) ever ...

--=20
Cheers,
Stephen Rothwell

--Sig_/SeRa5qiRDLRIcgNL=vQVICl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCCzTsACgkQAVBC80lX
0GwLEQgAiQ56rHjSP2XFETAf3e/AZWdVV7FtkWgs6La2HqFj9Ml7hbKJTZpjmOhJ
xbg0BQxtZz53+ezyqmIkvKQNDxCVODQ5EPRHgIuDws6khmT0FuhMbvSdWEuXvUDy
cl2WFlnLt9pSGDuOgTnX2COOFH/ofrNsvuierIvUUEF5hkC3Jll5x7HyaSBAfkS3
u4dTdl6aICc5ryqu/HSLqFmIUTxBIgsD/9H6L6ZOk04PuuiqV78CPJNL1+NWtf2h
Vokh7PDpIaNVapA5v3hh1s3ZoJyPjjYDNFOwsa8PTvqwdtAWeDK8FHj4jDn5Zpqv
5RWjSEdWbEjMqV9GdDtdvT4tAzhaiw==
=0tpz
-----END PGP SIGNATURE-----

--Sig_/SeRa5qiRDLRIcgNL=vQVICl--
