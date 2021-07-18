Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948713CCB48
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 00:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhGRWWf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Jul 2021 18:22:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229585AbhGRWW1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Jul 2021 18:22:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GSfXb34Vmz9sRf;
        Mon, 19 Jul 2021 08:19:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626646767;
        bh=lGJade7f6Gmlbv7+Tcrbi04X7FCxS2n77Iwvwhi8Iv4=;
        h=Date:From:To:Cc:Subject:From;
        b=pzYgrR3xbjQ4FardN7hgg40OB5nCkCFRR1fXgEd+Lg6RyYKadTuV1xL+4CAhrxPwc
         LB63d7dZ4l6Y11DAT9at6pPGXY/pb7A1gbQaHejJMThv204ir7swPA9X61tmSPMVCa
         i6Om7jsSmwbEd8BDrNEffwjgwZRpUoJzoOv3uNwVJHHDPehR+5+58XYGgpBtxlPzJ+
         p30zgliPGuQlEkCFyPHPFPZCp/DPMSzoN/P5Q0Izjkc5MLfbqT7L5oEite2HPqNday
         C+1z/nBdYcSksAu5CdxJpEyOcnPqwnXbGQG3u59LrJBrOzF/Rv/fHRqtD7HhOuvmSq
         7TyXa5KGTvL9Q==
Date:   Mon, 19 Jul 2021 08:19:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Moritz Fischer <mdf@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the fpga tree
Message-ID: <20210719081926.5ea11131@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//6D10d/MrW.NuwxBhH/EH9e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//6D10d/MrW.NuwxBhH/EH9e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6c17b7ff1d11 ("fpga: zynqmp-fpga: Address warning about unused variable")

Fixes tag

  Fixes: c09f7471127e ("fpga manager: Adding FPGA Manager support for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_//6D10d/MrW.NuwxBhH/EH9e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD0qO4ACgkQAVBC80lX
0GyELQf+IOKpZ2sgUBzMCEUn6MfIwC5hVVKWOS70XAhJePkxIZIsothZzzCwCH7P
PBFuEyv3GQYWrit/UE5ht+S5CPpF6k0HCJ3CpF9ZFZ5WhUPY8jEKwFQenqJgx1/b
ORPQjcxpUlPR6DjIE7ZJIA1JWsMrEKveZXVdef4spSU9HEOyKeSsNmqF/2QMaKuz
gAIRi9NKy4/CeHwmj2hp7K5B9qUgK+EIF5ZRMc0BcZm9kV5fSFcczAOTe+Z5m39J
5sKwo66yTXfDybhZFFU1sZoyZWhRw1oCNh4cJxKX6ZQQgqSy3zKCfa0IQ/9Kaq3f
MsrEraMjk6awyAUSGRBF7l/ldsuWdA==
=iddK
-----END PGP SIGNATURE-----

--Sig_//6D10d/MrW.NuwxBhH/EH9e--
