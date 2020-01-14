Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0BF139EA6
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 01:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgANA6C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 19:58:02 -0500
Received: from ozlabs.org ([203.11.71.1]:39397 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728733AbgANA6C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 19:58:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47xXBJ17NPz9sPW;
        Tue, 14 Jan 2020 11:58:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578963480;
        bh=xzhfYEl3jUECW13fzefYrZJhju/7UmLdpLux5euJGFM=;
        h=Date:From:To:Cc:Subject:From;
        b=USd0rVW7ARBCjdekxDeQdctiLB8pFaG7s4ICwxkSR6rFZFgSvp6nAiKOcoOC2AQcY
         Oo0KO0iEbJWTWyBxt2wQwx9J9LDNlBk7aeYMtDTL1s4UWS5zcrN3J9j/e035Hfh0n1
         JvDEX/Q+prkfG3PVfYFNxC3Bk1aP5mJmiZu+er++1voc2AjjrVQoOpl1hQQxDS3sI6
         dbxCCV0SJZvtIAvf4HwNdnlGvCCIomWgb+q/U+4tKl9gwWc4Co4XdrycTO/B3sKkzc
         UCWhSP+tGYAPbXTGX5lUZBd056M+DvMfruyphKr1IJ7zE8Im/V225eTxYeO6P9AOTn
         jTmAQIG3gnDkw==
Date:   Tue, 14 Jan 2020 11:57:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jack Yu <jack.yu@realtek.com>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200114115759.123d5b80@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r9A53FvEKgyzy5X4JAG711J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r9A53FvEKgyzy5X4JAG711J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/rt715-sdw.c: In function 'rt715_dev_resume':
sound/soc/codecs/rt715-sdw.c:568:28: error: implicit declaration of functio=
n 'to_sdw_slave_device' [-Werror=3Dimplicit-function-declaration]
  568 |  struct sdw_slave *slave =3D to_sdw_slave_device(dev);
      |                            ^~~~~~~~~~~~~~~~~~~
sound/soc/codecs/rt715-sdw.c:568:28: warning: initialization of 'struct sdw=
_slave *' from 'int' makes pointer from integer without a cast [-Wint-conve=
rsion]

Caused by commit

  d1ede0641b05 ("ASoC: rt715: add RT715 codec driver")

I have used the sound-asoc tree from next-20200113 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/r9A53FvEKgyzy5X4JAG711J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4dEhcACgkQAVBC80lX
0GzVTQf/eGIocbfUE2GrOBBcfRa8TO3qvyX/pnVOXWPUZLiuqkiFj3MCXpqEkIG5
3QJJ1xcDBGEDIf/zSwJCmfGdFnuUfRL1M98BMlX/ifBY/LuZ3SGXnmsaNpG1No95
kBaTvs5bmZxeZ2+Kx7v+7acB0uiaBvBQwFZ9xe8oegCQi++IUfxZ5cgAe6Bta45C
qmQDX5WwVnxKoBQYlsILySVnGkPQSqfVUjU/spx14ENbjpdgEJtCj3Dbr6NYFa8g
mnXoxaluKHETF/uDBfBEsqXxrmXFCkuQl5wTRMeZrQgwY3vHKr6kI1fbWptPiOcm
in9Yf42mPeQ/YCDIrz2pzFD51hJwcA==
=Cq6z
-----END PGP SIGNATURE-----

--Sig_/r9A53FvEKgyzy5X4JAG711J--
