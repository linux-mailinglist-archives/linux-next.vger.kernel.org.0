Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756E338E0F3
	for <lists+linux-next@lfdr.de>; Mon, 24 May 2021 08:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhEXGUu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 May 2021 02:20:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50413 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231605AbhEXGUt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 May 2021 02:20:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FpRr829Pwz9s5R;
        Mon, 24 May 2021 16:19:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621837161;
        bh=rAM38WHocLc+LyDYrA7kVfPtaJ6djnNmloCRBT+YLpQ=;
        h=Date:From:To:Cc:Subject:From;
        b=jb7ftveOX5hpSk6sgLU9FveePObUsBYmM80t0TL9Vl1KiEfiuuK+5htPhFL9vNup1
         l1TCRnPdMosmhtz7RVoXK2L/huBbcJ8wvZymjwxJOWaf1VdXBfVNa7rbQyk7srKoax
         Jw4G60e1Ybg+Yvr0OEGLgY0jGLPNvS1DvhiEunfKNogkQc/+3qyb8gpvpy2hPcp6+u
         r6I54DXJvU95rnNlBWQPweRTsUBnm6eirkOzeK1219nJNcIU1QpRLF0b/ZK8BEB4U6
         mQrcRpNWCHwrj6315ZhGljm0r1c5kqwWiF4W8wn/QIe++/iNySUDy0RnTlf0HRvDWu
         RAN7byhuMtVeA==
Date:   Mon, 24 May 2021 16:19:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Luiz Sampaio <sampaio.ime@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the char-misc tree
Message-ID: <20210524161919.626b3344@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lhKHB4zHdYlpkNZQwqisKqW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lhKHB4zHdYlpkNZQwqisKqW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/w1/slaves/w1_ds2438.rst:56: WARNING: Title underline too shor=
t.

"offset"
-------

Introduced by commit

  c999fbbdcf77 ("w1: ds2438: support for writing to offset register")

--=20
Cheers,
Stephen Rothwell

--Sig_/lhKHB4zHdYlpkNZQwqisKqW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCrRWcACgkQAVBC80lX
0Gw3FQgAle2kxZFnjCS4POrwIJ5FoNDa2izLuXXysK3AcreaOYHlEUK9+2wlDhRh
M7jV/rwNt2zSrdu5XWCHTZWQaBR4Km54aNX5gqPohTnOT3B7zfHOr3lgq9SHGWVU
tht2j37uAfShQllsYpUOiVoaU4xu+vQyo+kL+zy/JzGhRKAOJKzSNm5lxpdmn9pZ
bAN7Cozfeo5I857OKGDIv/QiDWTwA9L340nKPGxqsvb/I3MKoai66ixha+XjoeZD
NRioKIjbWDRL5LHDzt41Yo5ESmPy5whAIETNxPRSnAFZX8b1qtMpXRaZLIjllhx8
url7aX25P0yl7Yt505zKmfFDfEw/wQ==
=sCSP
-----END PGP SIGNATURE-----

--Sig_/lhKHB4zHdYlpkNZQwqisKqW--
