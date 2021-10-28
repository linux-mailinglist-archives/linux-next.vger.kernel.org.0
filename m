Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2862243E0D7
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhJ1M0S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 08:26:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42071 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhJ1M0O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 08:26:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg4VB54D2z4xcD;
        Thu, 28 Oct 2021 23:23:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635423827;
        bh=GMYE4SYZASWRCosrfBXshBBnJMu+LqrdyvB+8D9N5rs=;
        h=Date:From:To:Cc:Subject:From;
        b=ZVpSyKjGmnGnzAwD8czqwf+HyFc0MDHvHfDVnsUdZTFjXNnsmnA/yVtXeoSBBr4Kl
         cKi05DoJYHCfJhHkioxTNOvK2+Mkqe8xkHCGxUtuu1EUiXsAngKo8cZqWSdoB5UPZD
         OvCim+ouV/A7QqZmtl2htC1JoNMsme8nlKNnhmsA+Gf1Hjzo2UNlyLEP1vvyLVRfFY
         JSEEWUmq8PilC4CrN+WYWp+wtTu3tGP4/xrILuTo+Tt2aALiHVEK0m1ziD9QuW3DAi
         QqOdPJu5jEFauC7yiz2qyXKyt53ZWqn6S9GdKsbMf7UzybkD2VAHFjd6htF+fQ1213
         +sA+PVcYk4OQg==
Date:   Thu, 28 Oct 2021 23:23:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Kalesh Singh <kaleshsingh@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20211028232345.5ffa43bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1+P0+xfwwSLE5M9dP2QCYQk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1+P0+xfwwSLE5M9dP2QCYQk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/trace/histogram.rst:1766: WARNING: Inline emphasis start-stri=
ng without end-string.

Introduced by commit

  2d2f6d4b8ce7 ("tracing/histogram: Document expression arithmetic and cons=
tants")

--=20
Cheers,
Stephen Rothwell

--Sig_/1+P0+xfwwSLE5M9dP2QCYQk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6llEACgkQAVBC80lX
0GyESwf+PZeq/CHAMeJdoVgczMXrwBy2rsd8eAgHxRpuPAsMytRox+oxr6RnGaSR
scdxLrm5aWiC6IcTBtcXgRvF044FFDb2IHpibTeCEjzRiDPRuewh9r8b27qUifhk
1UbCmWe1Lf5z3O8YFc78FOrn0nT6jvD7n2876KXPT7kvka/1bZ2cOsQJY4i2aUgL
zcM6IV+n3jmuzG5954ALrnZsDEEUIN311+ghCTY3MYWtf4AzgqOE1Y849iZDSgEm
79QNhZOk3Fz6RWRhTo0UOWvyx5r0xECYTntob1eMt35qbrER7ZlV2cZwCfuSf51o
CQlOUwo48/d4CHc7sAcVIrqWCR5JzQ==
=evCq
-----END PGP SIGNATURE-----

--Sig_/1+P0+xfwwSLE5M9dP2QCYQk--
