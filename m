Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F25436F98
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 03:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhJVBzq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 21:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhJVBzq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 21:55:46 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4A6C061764;
        Thu, 21 Oct 2021 18:53:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hb6nd741vz4xdL;
        Fri, 22 Oct 2021 12:53:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634867606;
        bh=upVFOZ+lnugwui2TvAVxtFcw4cFArSM7r7QeC47etps=;
        h=Date:From:To:Cc:Subject:From;
        b=fC5xd7CEVWDb4QS9YxOjsipsQwuIWODv9hJqHB5bQu4RY4OxNXKii5za0pYZ4jl9v
         fnhp3Pr3H392GOCr68slHAg0H3r6hHDoZwDcIDURywg6PLHD+7HsxqJ/SX8PKqIxlA
         9harmoe1DpLj/c4FeTB344ly8XlZhH0nAB1Sc2jRfQ3AUN25jejSmPqLeNfbBtgB1U
         W9ybIHcnmI6+CDK1JgNCdfkxUwD6ia3yQNCXz1uQWfOfxm70TeGdZIhbIjoFCBl/n4
         pFHmFYiBCZuOD8EMmUkg1IlHvl/z1TRRgMoeU+KdarQJ+FvlgXZIOfP8EfF1o4ttst
         eyQACsCFDdHhA==
Date:   Fri, 22 Oct 2021 12:53:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the regulator tree
Message-ID: <20211022125323.132b950d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ck4VImbxkQ150ojxxS+iO.m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ck4VImbxkQ150ojxxS+iO.m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/regulator/sy7636a-regulator.c:14:10: fatal error: linux/mfd/sy7636a=
.h: No such file or directory
   14 | #include <linux/mfd/sy7636a.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  cb17820ef71e ("regulator: sy7636a: Remove requirement on sy7636a mfd")

I have used the regulator tree from next-20211021 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ck4VImbxkQ150ojxxS+iO.m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFyGZMACgkQAVBC80lX
0Gyw5wgAiqrGJunK3lvQTpjGCuYkN/0xgbhZepNAHF950nBdVsd6yKwcWAHI+mKa
ZHeMbdDulOk6GU0kU1sDCIiNygq17Gjgy4Jn1NIhx57qSoKu5p43zEow8IXk4DDW
Ki74V/MCgdh9Xj9i5Njns/L6iPikBKtWH7Xq1FdBeXqpabZctWPBjSUqZf+JqoSw
TnCZh6QDj5zaRZMklW9Y+Z8oat26kdbYsJhEX6JZrmwAaINSFVN7J/+32Zkia8+b
hn1ZGI+nEbRcE+YESINjdMJZwAqbHTdVG+5tlvwFz5vBArV7e+xOobbDav4/Z8V5
jB5HA39PqAIAgQhejEZbdAd5iag/yw==
=tO3B
-----END PGP SIGNATURE-----

--Sig_/ck4VImbxkQ150ojxxS+iO.m--
