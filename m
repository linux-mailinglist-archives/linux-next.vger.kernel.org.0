Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5793EAE76
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 04:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhHMCRt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 22:17:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233036AbhHMCRs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Aug 2021 22:17:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gm6dX3WYCz9t23;
        Fri, 13 Aug 2021 12:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628821040;
        bh=YhK5Q0M5feZDSDGyHoE74LBF+nUvqpKftxyv3ToQjJE=;
        h=Date:From:To:Cc:Subject:From;
        b=Gfq4IwYDA88JEiZn+WgsB9ke4CLBc1lFnI7zMdrSIlI8e2/LN5+WsYtwlfDtbmsH4
         7S3E19wcQRxh5o2rPPf6SQWuUfJJPCsqOLscuKaLHy+3JMf055Sfo0WWAc8vdEeL+p
         sNshuzGZBx/wf05Zdo7jzFUqTUm1GIWEhe/qLANYfrFYtK/l5onYzZM26NaqWQjD6i
         D7oIr5HAgFd2Pjqd+6yFsOLPSS/htsKkpu55a7L/g0Zx3iR+EWbgn071X6QTeMdLmh
         6405cXMXLJcL6AvVt/n1/rKPOG2tFYRmNjEECCZb2kXUvVSF+woZGnNGa2elY4YYQk
         xiatO4RS9soXw==
Date:   Fri, 13 Aug 2021 12:17:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20210813121719.70beddf2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zb4+SYQ+grjkig8mt.8ppup";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zb4+SYQ+grjkig8mt.8ppup
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/codecs/rt5682-i2c.c: In function 'rt5682_i2c_remove':
sound/soc/codecs/rt5682-i2c.c:297:22: warning: unused variable 'rt5682' [-W=
unused-variable]
  297 |  struct rt5682_priv *rt5682 =3D i2c_get_clientdata(client);
      |                      ^~~~~~

Introduced by commit

  772d44526e20 ("ASoC: rt5682: Properly turn off regulators if wrong device=
 ID")

--=20
Cheers,
Stephen Rothwell

--Sig_/zb4+SYQ+grjkig8mt.8ppup
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEV1i8ACgkQAVBC80lX
0GyUhgf/dmXYkyg/I5c2ycEm3yeey6vga3jesQkyqr1pUTw7uKBgYK9r3Dd/hgIh
wF8eNWkU0GJ/hgR7CiknSjAYljE8G5wjLMo1smKbM/G3mPxly/ft45DOqx/wtVIG
hu0a9HucoERz86bg5oh/3v++Eoe8YdHyyqGtMUVKNnZuXk+8PTJn6jz/1HQOIS4y
qrWKMp5OQLZRSBhppyIUdXXJCKHTBRuHm6PU5MRuaoIeZF+7MB69OHqdF/fEPwZE
rF8GWkP63dYrh9zrDmEQZzyFNeUdoj5F/xcIzTWo06NHF7pW5A0AP4SxzbCm64WV
mkQZhAT1ElLKI7gS66LJH4ZriLCi5A==
=lvlF
-----END PGP SIGNATURE-----

--Sig_/zb4+SYQ+grjkig8mt.8ppup--
