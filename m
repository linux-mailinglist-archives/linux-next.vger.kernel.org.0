Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19C3A13506C
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 01:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgAIA2l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 19:28:41 -0500
Received: from ozlabs.org ([203.11.71.1]:38791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726438AbgAIA2k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 19:28:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tRmj2jn4z9sPK;
        Thu,  9 Jan 2020 11:28:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578529718;
        bh=LS814onkvSihhXZk/7WZnWj4SNUmJxqt5+CWEeqw6J4=;
        h=Date:From:To:Cc:Subject:From;
        b=AWr0fZWg49Tb3lgOFEPexyIcJb6SxLVRjmGp6mQ/ODOsI98njzuK+5PWx+swcrukL
         9lBCYtuuFsJ+3y0fwwjMY0zVuGClN9mDJyF84PRZBXQWrMlT+82tCK+KgcAoYjIjb+
         g8iSkM18Qt5APK4p36hjwk353VpVLCQ5VafxlFo/BMFT9JijZyf08fi/BDYmhFUkpq
         ehOAI9LHdHQye0ntDAqtnGRsxF8U7JHQLQuBd4u+QTZw/T97FxT4h3HTYLQa+Vm3Jc
         7K9bn75h4H87aRtJyCtbbXsnEmCS04szPZ6gao3ogbRZfwiphuwoHtHGFyf+XCqb9V
         GTPqQstkS8BFA==
Date:   Thu, 9 Jan 2020 11:28:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ma Feng <mafeng.ma@huawei.com>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20200109112836.0649c578@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nnP7koDi38IvBl.12uEkaRd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nnP7koDi38IvBl.12uEkaRd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d5d3594db9f0 ("pinctrl: armada-37xx: Remove unneeded semicolon")

Fixes tag

  Fixes: commit 5715092a458c ("pinctrl: armada-37xx: Add gpio support")

has these problem(s):

  - leading word 'commit' unexpected

Also, each line listating a fixed commit should have a Fixes: prefix and
all the commit message tags should be kept together at the end of the
commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/nnP7koDi38IvBl.12uEkaRd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4Wc7QACgkQAVBC80lX
0GwsZAgAiaF/YbrsUyDMyB8fN2SjVm/9jhJKR106vntQ7DXPkxMoBgvJLtCmtnlS
dYigvt4Ib2+SvkSgjRk8+J8dyAhSQNCX4Q6YqK+v3xKxmrEULcqE+5vKsBoOMy+k
crFzq/NXmds7GH787ZDwS2gIUTF0LWi33Gy/Eztx2GEj0SDmCr0CEuTW9AND8kkR
fO1ZY5h3RnDN0vE+o6UPvT2P0qiqSq14bwnvcrqDnT9GCEeAsioTYt8cfsy1EtFQ
t/bCI7AYqvySf3mkRxKL0xA2UIFlQQxXO9vnJGkGuAj9EssbwzWMfAIf3jG2r5b1
iiyDi0lahOSZydNNdeRel4rGpOW12g==
=NuSv
-----END PGP SIGNATURE-----

--Sig_/nnP7koDi38IvBl.12uEkaRd--
