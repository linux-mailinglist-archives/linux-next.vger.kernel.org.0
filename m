Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458D12F9570
	for <lists+linux-next@lfdr.de>; Sun, 17 Jan 2021 22:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbhAQVWh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Jan 2021 16:22:37 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41289 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728859AbhAQVVz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Jan 2021 16:21:55 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DJnsL58TBz9sVR;
        Mon, 18 Jan 2021 08:21:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610918470;
        bh=NDLVzVLSlhN3NeNo+Rx/IzyJ9vOfOA7IUc8g4526IP8=;
        h=Date:From:To:Cc:Subject:From;
        b=dV77STh19elPJt37ochdP4PBTmhQxBYFIKj5laflkX/3CaOXdxWPUz19HMpYr9reu
         3Kt9NgcULnoEqPbyMFUSx9ok8qQw14I79UcwOHajD9P7afq1COXNYkKR1RGlKP9DBr
         bXpEcQX8NKI67iIXkpD0SkQmJ3l3ECdgTjt8bXrN1tv9nGY9XMWT2zLvxy0z0JqxZ+
         My3F5Ax8ubPYjufQQ+SVoMf8NWMiXZJJeswlU8TQOsUHLesczSaw8KwJ4rrUkfGdou
         TSLUd+5NVdE99IFzVNG/+jhUa82d1Bgi/0mjShei03Umuv4S8p6QAz4U7j8a/Smdi3
         QFeaHqUNpb+Gg==
Date:   Mon, 18 Jan 2021 08:21:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the gpio-brgl-fixes tree
Message-ID: <20210118082109.725aff1a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6HOkRAobIJ/iOo0Ip.y+x_W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6HOkRAobIJ/iOo0Ip.y+x_W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ec6c3364b816 ("tools: gpio: fix %llu warning in gpio-watch.c")

Fixes tag

  Fixes: commit 33f0c47b8fb4 ("tools: gpio: implement gpio-watch")

has these problem(s):

  - leading word 'commit' unexpected

In commit

  56835f1c14bc ("tools: gpio: fix %llu warning in gpio-event-mon.c")

Fixes tag

  Fixes: commit 03fd11b03362 ("tools/gpio/gpio-event-mon: fix warning")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/6HOkRAobIJ/iOo0Ip.y+x_W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAEqkUACgkQAVBC80lX
0GwmSgf/d035JDbU439zOXRt+MbOLgen/b4Fu9fM28PCNdJfOhrLzixKrK9xf8Tc
KnwMG7fqWiGy0OEwIgZlJ4OxqZ4aWP4KsOQMuJbAnov+DaD2AkycVBI26UAL8GAF
3+ajmYG0SZ6ZOg+v+/x49FTQNpyixy/k4TzJ9TvydKzsKmk/izYhJLGFxcsb3ZXa
4unmOVgu2l7ImSc/jbXL7Xb8esOMzlonGETqUuuMojTbjh6Cg36Iwukb2YDjuehp
uffGJOSiYBcjlRfME84yq3aNqfFg828LoW7PdeO3N/hI3C0fbyJ4SDqf30Sj+ngT
bqkr4wh/0kfiHQqXInguKQ+3YqTKYg==
=tSb3
-----END PGP SIGNATURE-----

--Sig_/6HOkRAobIJ/iOo0Ip.y+x_W--
