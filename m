Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D696403167
	for <lists+linux-next@lfdr.de>; Wed,  8 Sep 2021 01:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347362AbhIGXKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Sep 2021 19:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347336AbhIGXKX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Sep 2021 19:10:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95322C061575;
        Tue,  7 Sep 2021 16:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631056149;
        bh=Mq9/SPIfXkdMbvy7Q3zqMZ3T8l9+fl8gK7s1l4+fsHI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bKT79A5BqnC1eR2Nfmpx2IK15ehTz1mdgdtlIDxAUoUH6u0rVG99CGpPD5pulVjy7
         WbAzWaFSKtKhLDitjym+e8KPau2xuJRcv0e7ZLqXlN+rzbnvANiduArHffDCsW/zSc
         w4APvJCfNQor/Rqa55s7jxXhD7zMWBRo/f48cqNjQSMABovZUtOy5YnJRtBh9sWTtp
         lobNraR+ZD09BInT3OdLgfSSCAv74qVqfYBfTKrJKi7H056pf4DgVFEx16xW6IF+aO
         /LIMF6xfDeYEo+h2AOXxEHS3gYPq9zvvdUr9sT9PPpkZDbfBqWUDGM/Cx67sYLVF7F
         pMtkTxcbhQlBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H41DN50wXz9t56;
        Wed,  8 Sep 2021 09:09:08 +1000 (AEST)
Date:   Wed, 8 Sep 2021 09:09:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20210908090907.74edb3a4@canb.auug.org.au>
In-Reply-To: <20210908090720.0748b861@canb.auug.org.au>
References: <20210908090720.0748b861@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+iy5pNjQfZLanJvd1YoNrgy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+iy5pNjQfZLanJvd1YoNrgy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Sep 2021 09:07:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Building Linus' tree, today's linux-next build (mips
> allmodconfig) failed like this:
>=20
> In file included from /kisskb/src/include/linux/compiler_types.h:65:0,
>                  from <command-line>:0:
> include/linux/compiler_attributes.h:29:29: error: "__GCC4_has_attribute__=
_no_sanitize_coverage__" is not defined [-Werror=3Dundef]
>  # define __has_attribute(x) __GCC4_has_attribute_##x
>                              ^
> include/linux/compiler-gcc.h:125:29: note: in expansion of macro '__has_a=
ttribute'
>  #if defined(CONFIG_KCOV) && __has_attribute(__no_sanitize_coverage__)
>                              ^
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   540540d06e9d ("kcov: add __no_sanitize_coverage to fix noinstr for all =
architectures")
>=20
> This ia a gcc 4.9 build, so presumably this?
>=20
> diff -ru a/include/linux/compiler_attributes.h b/include/linux/compiler_a=
ttributes.h
> --- a/include/linux/compiler_attributes.h	2021-09-08 09:03:35.169225661 +=
1000
> +++ b/include/linux/compiler_attributes.h	2021-09-08 09:05:47.790907780 +=
1000
> @@ -36,6 +36,7 @@
>  # define __GCC4_has_attribute___no_profile_instrument_function__ 0
>  # define __GCC4_has_attribute___nonstring__           0
>  # define __GCC4_has_attribute___no_sanitize_address__ 1
> +# define __GCC4_has_attribute___no_sanitize_coverage__	0
>  # define __GCC4_has_attribute___no_sanitize_undefined__ 1
>  # define __GCC4_has_attribute___fallthrough__         0
>  #endif

Just to be clear, I haven't tested the above in any way.

--=20
Cheers,
Stephen Rothwell

--Sig_/+iy5pNjQfZLanJvd1YoNrgy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE38RMACgkQAVBC80lX
0GyQpQf/XWOFr4+uQHNcLr1IWgODsMMXGZy2nUcbLn1NIeNf6agCc5mb1h2kNtvT
7fI9GZniwF6TBwStfeBUN0Zl55YlXUeWhA9Ilg5VmNdAiRZuFWUTXe2iX/StgQln
xbDUfbU9hCmfsb+Zy9/l1OGWMwbFJ5E7s9hc9oCRGpDEv/i13gC7330IEk34PqEA
t1exI4c3QAL++TsozH60aAlkrrMjmXW9mOGrC0mPxNI7C1tlHajUVczHPrFcutnR
p8plz9BKRvT8PedrnStQB3zTfcT3knTKlwYzO7J/Q/htsvWA/3FpEWREAX4VKFcb
yUb9rAIgxaT6R1TDv+bg/aXomdYIjQ==
=SM5C
-----END PGP SIGNATURE-----

--Sig_/+iy5pNjQfZLanJvd1YoNrgy--
