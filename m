Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D972D0715
	for <lists+linux-next@lfdr.de>; Sun,  6 Dec 2020 21:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgLFURd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 15:17:33 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbgLFURd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Dec 2020 15:17:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CpyQV141wz9sVx;
        Mon,  7 Dec 2020 07:16:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607285810;
        bh=K971ZTQdRzNtZFt93vuIi22S6tgu7F8ha3iBWUkfbME=;
        h=Date:From:To:Cc:Subject:From;
        b=CLOtZdgNL9XRJ07qZqLF3HEjdOcjO9PfWSyT6HOJgWUrnxIW/YZ6HpNyj2PlP/f9X
         t2cjxG2ct8KoFokx3StDgqVct0MFyZSY+NhXOiqoANeZ1WQybzGZzc4D+xz1mGp7fK
         OgLUScExZvDX4GV9pgLa/b1RSrlXNrNbO4wS4AbJfOW4LfCme6fkBysrOFn9bcL/cQ
         VuPkkv+Vk/tsVHmq5t37gYB9ZnHIjw1XdDbrb3d67cLifvF+xp3OcqkIkCjGJBQbJ2
         tw1bJAgDhLChJ67Oh/Z0WoRV1kmZ8P4xqIErKPinCWbvCHvPuSHP8Bud93IpwkRbbA
         1tbg2EaSS4p+A==
Date:   Mon, 7 Dec 2020 07:16:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20201207071649.272eba1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q/Wf3cS9Ij4js4y.9MpkJPB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q/Wf3cS9Ij4js4y.9MpkJPB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c3c882898d07 ("pinctrl: aspeed: Fix GPIO requests on pass-through banks")

Fixes tag

  Fixes: 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 9b92f5c51e9a ("pinctrl: aspeed: Fix GPI only function problem.")

--=20
Cheers,
Stephen Rothwell

--Sig_/Q/Wf3cS9Ij4js4y.9MpkJPB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/NPDEACgkQAVBC80lX
0Gz8pAf/VFrShv4SKrvjksSj2+EvmbxE4KBNTjdVHASh80V/o3tSvgXuep59IT5i
kyPHA7ZZyQt4yLxk79le8xB6p9mRooLdjrFMAy/1Lkc/eW7iKGx8oqByV4ZPsjwf
SqSfZwI71eYs/FUZs7zW+eYN5LP2uOgxvVLFIs43BwkH1E/ha1L8B4E12GijKgWc
yruR42pjYbBuCPErBudbulk/zmVn3+z4eER/3QCv3f5/dbTbwUS+jaqT7XQt61+B
u01f3RYBOrOd761oyq5ipcUUC5YrKLL4slqEAGe9u9G2MlvrnH9YnIC4jribDrQZ
xr4fATyHUWgWt6a3aD6AO7c7bL173A==
=WxIq
-----END PGP SIGNATURE-----

--Sig_/Q/Wf3cS9Ij4js4y.9MpkJPB--
