Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F9C3A1F7D
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 23:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhFIV6D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Jun 2021 17:58:03 -0400
Received: from ozlabs.org ([203.11.71.1]:49127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230117AbhFIV6B (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Jun 2021 17:58:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G0gsb5QrJz9sW8;
        Thu, 10 Jun 2021 07:56:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623275765;
        bh=KtI+FrtnLjcslTw1sLwN057C10zoC4aGvN1cs+VX0Sg=;
        h=Date:From:To:Cc:Subject:From;
        b=aXwJbKjzD5bsFELyCbCCx3WRQxLKhiXvF2/mZ8C64zwxlAsmkmuNFKf8aGmFf0vti
         nrDQcrAtXOVPMB9lvbkTPElMl4SN/XXi0XP4MgVeg/8tb5SayramBPzdE6hRNa8ZiO
         SL+6Vxx0Nz3fa2KHFKZJw+3Sqx444FoFup+GiIWJBk//G5gFtCGpsAop0pJQVJGFkZ
         yvyx0iBoXYCuM4ufCcbFBt/C+O0cVBF3DdRrCsnvpaEch+8tq9o9S3FUgmklDWjG+F
         6ecQvjKfurg9UMhbYvKgTSZEzgsamChjPFF98+Cg43o14qOoL4IiwKIz3OA8eP1771
         ZlMHmgSbxfEoQ==
Date:   Thu, 10 Jun 2021 07:56:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pablo Neira Ayuso <pablo@netfilter.org>,
        NetFilter <netfilter-devel@vger.kernel.org>
Cc:     Florian Westphal <fw@strlen.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the netfilter-next tree
Message-ID: <20210610075602.3c5c7b2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_NqZtn/HkU1PF=XKAiUVtB=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_NqZtn/HkU1PF=XKAiUVtB=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c5c6accd7b7e ("netfilter: nf_tables: move base hook annotation to init he=
lper")

Fixes tag

  Fixes: 65b8b7bfc5284f ("netfilter: annotate nf_tables base hook ops")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 7b4b2fa37587 ("netfilter: annotate nf_tables base hook ops")

In commit

  d4fb1f954fc7 ("netfilter: nfnetlink_hook: add depends-on nftables")

Fixes tag

  Fixes: 252956528caa ("netfilter: add new hook nfnl subsystem")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: e2cf17d3774c ("netfilter: add new hook nfnl subsystem")

--=20
Cheers,
Stephen Rothwell

--Sig_/_NqZtn/HkU1PF=XKAiUVtB=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDBOPIACgkQAVBC80lX
0GzyJAf/QbBiLtA3ZNNgxTsfgI101t8h9iAyKsZXd4KGiKn2DMzVdHwXpaIffKrx
08gDkUKv5mFHlQsysiY5NHoOyT1+FkVwcTkRLc7U+hGvYe0QarxV8qqoDfIfifxQ
R+BvrCvOmdezi8+sW+uPYWaeYCrVlz2t3RnpatqaSbTBtJOF7ZD1lO1FudxsYdti
XVwOU03yI5IP/f3KfrMZ/QS4iC70ZcZ9ncVRENZaKHvTw7MFpq6usIR3vXr+mFPp
NInwgVWvi2/Tnz5GTU0SZFoZT5OpMWsmMjKoMvHNC2oQlinkAOQIBxOuP2w13upz
M0hCM7auJ7B6o+wMn65MT0QtaM9Ygw==
=eH+a
-----END PGP SIGNATURE-----

--Sig_/_NqZtn/HkU1PF=XKAiUVtB=--
