Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061FAE0D17
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 22:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388748AbfJVUKw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 16:10:52 -0400
Received: from ozlabs.org ([203.11.71.1]:59979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387645AbfJVUKw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Oct 2019 16:10:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46yPlF0kH1z9sP6;
        Wed, 23 Oct 2019 07:10:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571775049;
        bh=9PRl8yVUpXPcfwRx4EOOwPnp3sP1faFOnEIpTD5ARm8=;
        h=Date:From:To:Cc:Subject:From;
        b=aw5J88gmOfdclDDPwGZiWI6yeX5z/J0EEczReCbL798ZCeSYF19yIwlHZFlMsxuL1
         ytJ7P4JtV3Gbn439pmyOpThHebyGr2S2QJS8zOfMOjMNOHYngJJXQ0i8TkkBKXQdXe
         j8VZbUy6iRbAylcsOAqlLNq3Tk2piU6BLwW25TqbZf4yYy3hNYOfPsH/gzFYn0vCdx
         NZPgvAq9s1pN8Ahh9l/XEiUh2Di+nrbG3VXpCERT6MqSanCsq540U87607hpiXYFQe
         CCa+r54rKBwn/LqYXsIGomsvLJioXoOF1zoegELM7q6B9WFQr5AUXhTRxFLLiezY6J
         cXvhf6R6jW69Q==
Date:   Wed, 23 Oct 2019 07:10:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the omap tree
Message-ID: <20191023071046.3e6109d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DsA48zTvy8mjIpLkK/c4I.W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DsA48zTvy8mjIpLkK/c4I.W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  40f3ee0ea7f1 ("ARM: OMAP2+: Drop legacy platform data for dra7 rng")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/DsA48zTvy8mjIpLkK/c4I.W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2vYkYACgkQAVBC80lX
0GzT1gf/X3G5hGsvOSXqS6c1YZVhtcjh8fB8sCXsBJWLVU/rjblcVBxLg0vGA5cT
kZc/tGloxGYNsYB5uSvDqFL1Ie/t2tivIjXYPtdoTW78IVq50R7ZPR44CxDFeGmS
eqfZYFoWPU3sAQg/9h1jKDjja2G+1PF6GSOJADJCJxzso0wSp5yW03/qOgYBePlz
3ITUVDJ7EQ4MugLV5wphEf6jLi9kHYnx9IQBLU1qoe56zAdW2FD0BJfNo9tPjYJI
zq9f0SRr1o7AhJqvsXikGSHC9kVVcludz+YAsUS+KpEdYuPGYRi0r2sU+/T4uK9p
BvePyW7GkIZO+gIBDEI61zItH8HQtg==
=EF0J
-----END PGP SIGNATURE-----

--Sig_/DsA48zTvy8mjIpLkK/c4I.W--
