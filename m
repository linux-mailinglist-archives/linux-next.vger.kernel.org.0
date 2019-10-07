Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4C1CEFC0
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 01:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729440AbfJGXwi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Oct 2019 19:52:38 -0400
Received: from ozlabs.org ([203.11.71.1]:42483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729285AbfJGXwi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Oct 2019 19:52:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nHN23T1Mz9sN1;
        Tue,  8 Oct 2019 10:52:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570492355;
        bh=iTTdNUgPqL+EI8rT/GKBOwDQlUUZ62j6eBr8bWTUKig=;
        h=Date:From:To:Cc:Subject:From;
        b=sP2Q62UY8pLQlMSqOtYXJwQzwTB0XTDhBGHe+DeyBtEJ0QWo3cIX+CNr5T3Xm1khj
         By9g5X5dJsOlESRTZhnEHAq0C4nABJUnxoUIUIAN4Gb1iXbwMbwRZUgeiduYtoOERx
         Skhnu6ZMuIaSP1BqJ9OiKxNKP9YgZ1CbVuCQjlfojnF0oquyF5KdmQdpQojk5fXI44
         oHmp3QqRZCiogsgoCfMy9FYlpSGqsVvd18ghM4J9/NKsS4EJaIO4yBmQWiOSQIxa8k
         RVJ9NLq5GVB+qp/WvVTNegWwpwx9ic5eKdxkYA/XsjOaQJ7vX9PfWdXmRk8QWmupME
         UOcAoD0EOE3zw==
Date:   Tue, 8 Oct 2019 10:52:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Message-ID: <20191008105233.7fb6c210@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yh3MaE=eKKzajLTtJa+_5FP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yh3MaE=eKKzajLTtJa+_5FP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/samsung/Kconfig

between commit:

  82e8d723e9e6 ("sound: Fix Kconfig indentation")

from the sound tree and commits:

  03081cc370b9 ("ASoC: samsung: arndale: Add support for WM1811 CODEC")
  dca6408d6f7e ("ASoC: samsung: Rename Arndale card driver")

from the sound-asoc tree.

I fixed it up (this latter commit also does what the sound tree commit
did) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yh3MaE=eKKzajLTtJa+_5FP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2bz8EACgkQAVBC80lX
0Gzsigf/bafPytDhT0/enXS5sBhyjMViKH5i01TIe0s4+Xc77eCeRDeoocwJsy2i
/oWpy/qlCiGAHbuI27fTVEjf6oPyZVst/Wi5zq+Dwg4/N0Pc+O7BShEadBxhp5rr
4F20AjXizQqHTrkyQkRHEN+QYGjZO2+LUhuHsbtGg3Iy/o2MG8EER+aqshYvdzD3
mZ01PhZP89q7pJmj1r11zyN6x2sHmrZrMEEuPp3qsDG2ACtv5szZqCJKYPID+2YR
R6uVE/gaJEfoKD1QVKMNB7Fg0vmf5TBs5aB6BWh56XNTzprNxtmul6K5wvi36ZK8
tvJcGlYrpIMFpN0hPNlbzY7+WGfDRw==
=L5/t
-----END PGP SIGNATURE-----

--Sig_/yh3MaE=eKKzajLTtJa+_5FP--
