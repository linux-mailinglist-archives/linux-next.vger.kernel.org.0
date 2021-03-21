Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1F034350E
	for <lists+linux-next@lfdr.de>; Sun, 21 Mar 2021 22:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhCUVsy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 17:48:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44755 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231388AbhCUVss (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Mar 2021 17:48:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3WV36cX0z9sVb;
        Mon, 22 Mar 2021 08:48:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616363326;
        bh=8c4uVwI2rJbWaLIKFQY5LtweLwNmoqXVhQ0ScRe9ykY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WlVoyOk0tETScR7x8LodmJXot/RoiqfZmujx201yibfs7xLMm7tJVAGWGX1DhbecK
         Q2bsuGb0q2Bcs7oS2zfcBCCi9x2nTFlv9C9Or1qk+FA6qM6qOL7nHT38H8gtu+UFx6
         OPBOmYdiZZiLVvDVuERcDkbTuvOKrWg/6UryJ4YrPNxTEHGNzK5kZZaVCKb6DPF8Im
         7/N8lJ1ghr+wzmeVjZE3GFQ7a+52Bd2+RzW+Tup/zV0kVnZolle760Q0icYF56k244
         vi+NCiKlxoZBMFy7Wi0T4tlMvg7kS4QhKye/vDCKqNmVtd8RmjyYfPKJcOa3lEW8Hr
         UljP6gwjAxCKg==
Date:   Mon, 22 Mar 2021 08:48:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, glittao@gmail.com,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: arm64: compiler_types.h:320:38: error: call to
 __compiletime_assert_417
Message-ID: <20210322084842.23f9ce0e@canb.auug.org.au>
In-Reply-To: <53cc267d-aa0a-071a-f9f8-0b47ec4b2b9d@suse.cz>
References: <CA+G9fYu-t_JwoBVXKhiDUY-FRdX3F3LgbDw9bFeiuciwC70TaQ@mail.gmail.com>
        <53cc267d-aa0a-071a-f9f8-0b47ec4b2b9d@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xwA4.Gdm1ru6LnNX+E1nfnF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xwA4.Gdm1ru6LnNX+E1nfnF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vlastimil,

On Fri, 19 Mar 2021 19:01:28 +0100 Vlastimil Babka <vbabka@suse.cz> wrote:
>
> Andrew, please add this -fix
> Thanks.
>=20
> ----8<----
> From f97312224278839321a5ff9be2b8487553a97c63 Mon Sep 17 00:00:00 2001
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Fri, 19 Mar 2021 18:56:50 +0100
> Subject: [PATCH] selftests: add a kselftest for SLUB debugging
>  functionality-fix
>=20
> Remove a BUILD_BUG_ON left over from original resiliency_test() that brea=
ks
> builds.
>=20
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  lib/test_slub.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/lib/test_slub.c b/lib/test_slub.c
> index 0075d9b44251..b7ad6c0b07a6 100644
> --- a/lib/test_slub.c
> +++ b/lib/test_slub.c
> @@ -97,9 +97,6 @@ static void __init test_clobber_redzone_free(void)
> =20
>  static void __init resiliency_test(void)
>  {
> -
> -	BUILD_BUG_ON(KMALLOC_MIN_SIZE > 16 || KMALLOC_SHIFT_HIGH < 10);
> -
>  	pr_err("SLUB resiliency testing\n");
>  	pr_err("-----------------------\n");
>  	pr_err("A. Corruption after allocation\n");
> --=20
> 2.30.2
>=20

Added to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/xwA4.Gdm1ru6LnNX+E1nfnF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBXvzoACgkQAVBC80lX
0GyPswf+J23Z6wvsxqMz+OJYmNuDS4Z6KKjBPPtwcBELjSE/fcSvgEQYrD5VkzXT
NGcoSk70rtbit2693ClReevlcs8YvJCSVIsg4k+otGq9xil6PrlMeDy4QU0m7x42
ARDW+5ivwSez9VZOrn/hEBOUqf1qjz6qo2l75z842EwByjCqWubpoFRU1vWAdOmE
SPWp97eBenTKq8Jo1B1g9mmrbF9G/J2p3vKicctGO8zI6HLy+uu/3hki+fY5rX8Z
wnekVdcTuJIIueiYYJWdv1plrVGY2iKciAao0OkIX5fHOpC9n1yq4v7XSlmtTDbA
NktLLuuGxlEGG1Ry2Gxba7+4/D57OA==
=80aU
-----END PGP SIGNATURE-----

--Sig_/xwA4.Gdm1ru6LnNX+E1nfnF--
