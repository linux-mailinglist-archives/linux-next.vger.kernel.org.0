Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43AAA8A97D
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 23:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfHLVjZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 17:39:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44133 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726530AbfHLVjZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 17:39:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466q4B1XBLz9sN1;
        Tue, 13 Aug 2019 07:39:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565645962;
        bh=0ODdc4jwNEI8tBoNVuK1oJEVG49Nb6xIuolDFClL8tM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DeELis/Fpcv1Vf/zfOCuUk1CTTSsbNTBb6ygM4imNnqfuyflIjGYrAc+24cQMz2Ua
         Nr42+TjioO6ee8sUd37s4BLMqsEjpy+BTVv57GXcD4zkhil4tFBZGLHf0KaB9rkrxb
         D1aDu667uD99D8kaVNtTXKePnnMBiY4iIz5ZYrsOWTQzKD+veUggXK6BWtqly3D8ld
         FKI6wS+En1b1PplwDT8S1etI79lzKA6c4DrpbknYW7wnMU9pU1Ht2rO7xW1s/VSOnJ
         8v/gRTo7/xWF666sr6SiWyypIwauA1i7Uy+qdNOgivP2Mbb8Pk4vLIbG0IWzU56w8u
         ODOloy2GNwDsg==
Date:   Tue, 13 Aug 2019 07:39:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Aug 12
Message-ID: <20190813073914.2465e92e@canb.auug.org.au>
In-Reply-To: <CAMuHMdUEoBj-JBZza4==9TENfFk3BckCPO+mrZjhu1vOr05_0w@mail.gmail.com>
References: <20190812193146.4939f5f5@canb.auug.org.au>
        <CAMuHMdUEoBj-JBZza4==9TENfFk3BckCPO+mrZjhu1vOr05_0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xdLrJqR.jPwaZzL0VXYgbGa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xdLrJqR.jPwaZzL0VXYgbGa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, 12 Aug 2019 15:38:06 +0200 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> Looks like commit 8e72ac275c63a44c ("Add linux-next specific files for
> 20190812")
> made it to git.kernel.org, but the tag didn't?

Thanks for letting me know.  I made some changes to my scripts for
yesterday and there was a bug that I did not notice :-(  I have added
the tag and pushed it our just now.

--=20
Cheers,
Stephen Rothwell

--Sig_/xdLrJqR.jPwaZzL0VXYgbGa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1R3IIACgkQAVBC80lX
0GysUwf+Kpk3y8lBWnC86Xg7CyhDuwwpIlSdVAXUuvJFEqbxk4Pt6DTFG7m7hUgm
YJPzmv3xujML+h0iJKgrLdxGalpuiNoz5QMJu3D98Dnk093BIvedJOHVVkJ7mf2R
43PQeuhneCLYWI6yDdGAI5kVDQmZ/Ojwqi74SzOi6yJzEcJxQonizXkE8JURo/0k
AyMq/DC7RAbnY6mP7ti09Wo9QMqH8KiXZxv9EX3QvTTToH+UovY9YFOPxHf4xLtn
yHfcgpGCEU/TwOw1VO6+QAc2brLYKUXHM/qlDwq5GEsiEFASDn7CXuFEwvdjHlOd
Gy/k+BPk4AHmc7uVeRxpUNxufq8N9g==
=h72d
-----END PGP SIGNATURE-----

--Sig_/xdLrJqR.jPwaZzL0VXYgbGa--
