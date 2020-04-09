Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1080D1A2DD6
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 05:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgDIDM7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Apr 2020 23:12:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbgDIDM7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Apr 2020 23:12:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48yR6K01pzz9sSh;
        Thu,  9 Apr 2020 13:12:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586401978;
        bh=a8wJcXOoSO96vrw4kf8n/9jQq4/HbjP3dnRcSeSQqSg=;
        h=Date:From:To:Cc:Subject:From;
        b=JfeFkrWMTgI4DUrgJEzI7zzictqFUcjkDb0NyNWSLWIYDjddP4aSFepFDzVX7Q9lU
         fcgK0WZInCdk8SPKnp079Gc0bE/lr2BjApcKkG54crMlIgN1A/rsufJ/jbg0QylJqh
         CBKEFKFEEnLWJqSpQSRyOkYs0mbaLd8lvUFcWwqnK5dg8y6qEnDd3Qi3d0UTetWgwZ
         NHyP2yw2XTnLqQvd03Mo9ousSRpO9WzObPPWikfyVkqiA9qkR5afD/cktOieawrXi/
         xlhiyk+Qzl9tGtCBPhuXgMd9sKw7xd5B3tcRIJRRL+5MboMlbSDEnwE7LTNJ7N7F4N
         WPM1XDDpFxEBw==
Date:   Thu, 9 Apr 2020 13:12:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
Subject: linux-next: manual merge of the leds tree with Linus' tree
Message-ID: <20200409131252.2dfde0b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GPKmm5.xLW2paourexw5EdS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GPKmm5.xLW2paourexw5EdS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the leds tree got a conflict in:

  drivers/leds/Makefile

between commit:

  457386350e6a ("leds: sort Makefile entries")

from Linus' tree and commit:

  3953d1908b2c ("From: Marek Beh=C3=BAn <marek.behun@nic.cz>")
  53cb3df9dd2d ("Sort Makefile entries to reduce risk of rejects.")

from the leds tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

BTW, commit 3953d1908b2c clearly did not get applied correctly :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/GPKmm5.xLW2paourexw5EdS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6OkrQACgkQAVBC80lX
0Gy0aQf/c9NSIkhqI3H7e0exL3hHsZd54Ls7wOV0y98kK0pQ3rWrBzmXPIddBvhe
zhNqVJWbB40lLNLsUlGI0P10NX7fBUcBmyNIubm3LrIcInXLqDDVd5bWqgpzqCGm
7n3RiFgN7IIIUx5yW/gBte9EMZOG3YJcNjX7I18hq1NuU4mxbYw2/y8yauu8OqPg
E4yu1uwBrHH1wIXgfCwIy8OjC7h+IBQBhd27ckjDMY96OsCOIUSEw8stsh/vhpb8
V2WD25JoEUGZgmFPJZC3zMeX3Cc3xZZusw6But6mR81D0Qrc+mWtTHGCmYRrr0A5
VXTDmJaFzzz3u5mYZBNdox51YcbkaA==
=f5DQ
-----END PGP SIGNATURE-----

--Sig_/GPKmm5.xLW2paourexw5EdS--
