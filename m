Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC30A4CBC
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 01:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfIAXbk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 19:31:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53567 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728942AbfIAXbk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Sep 2019 19:31:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46M8cT1bmzz9sPJ;
        Mon,  2 Sep 2019 09:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567380697;
        bh=yvwWYiQC+UmHvczUtkNqjLKuvX3b5tBigGh+McnD/GE=;
        h=Date:From:To:Cc:Subject:From;
        b=WLtnQ4kbBphOJyRyEz7AA/SFpFkcz+t3XXhyaPR3RhcZ2WhDM9BDKA4Yop26nP0rl
         SXQBBXJC34QDM//czkiHWs2MFcbc2XUiQSCbbm9SEfnRjP03uA+oZItCj6hUdYfCXQ
         qBVJ5Br6egrOlhs70aCf9AD2S9RkUP7svxM67kVeOr3dakEEaq96kj5CroGaeDylz3
         3Hu3a2I3zJzl48Ao6anmyrBHXZ6hqx5BcxwSnXAW6DArJ1KwuEHyBraVTqdVeDayBG
         GlpIkKzrYfbmv0sWA/0tn0IHWEuwYgYxPwiemh/in6TYNcD9xvlK1VY2vfZRE/Y79c
         YUnmp6DPo5UUw==
Date:   Mon, 2 Sep 2019 09:31:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Nosthoff <committed@heine.so>
Subject: linux-next: Fixes tag needs some work in the battery tree
Message-ID: <20190902093131.06f66c9f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NpxQRVpHDJD68n3oZg+17+I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NpxQRVpHDJD68n3oZg+17+I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b19aca4eb2d2 ("power: supply: sbs-battery: only return health when batter=
y present")

Fixes tag

  Fixes: 76b16f4cdfb8 ("power: supply: sbs-battery: don't assume

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  38fa8b9f75ea ("power: supply: sbs-battery: use correct flags field")

Fixes tag

  Fixes: 76b16f4cdfb8 ("power: supply: sbs-battery: don't assume

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/NpxQRVpHDJD68n3oZg+17+I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1sVNMACgkQAVBC80lX
0GzSnQgAiTv/SojGYLDlG7Kfs+uXY72oLvltpkIGO0PqQygnLzixlOYs0WsJfUYC
1lmtDd65RENj3qDyBb21Fl649b2SWlXgfEmVNGamGStQnB00zkGzdZchvFY6xeH6
3ZJ9Bzc2rd2YpUb+V67CBDgLXxo6U/tbBiugWnZQsjCAhCJLSDurs0CRjBrs4sZD
uTGAg2GlOKANrLmq1QcA/Qz5/xUUkj2KckK2HVUHwyB3N9ElbNoyQHL8jJ+ulE4t
7v5hsrQ5xVTPFsR/136vHPktXGABa9vMksCrg8KMdXkq7kUc5Bccx+nTlGo7H1BQ
hAWQWuHxdMslrQwdIohvPhspJVI7UA==
=Fql/
-----END PGP SIGNATURE-----

--Sig_/NpxQRVpHDJD68n3oZg+17+I--
