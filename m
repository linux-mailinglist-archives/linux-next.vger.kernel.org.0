Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5788428ECC0
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 07:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgJOFiK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 01:38:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56883 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727743AbgJOFiK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 01:38:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBdNb3zHwz9sTK;
        Thu, 15 Oct 2020 16:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602740287;
        bh=Pt8LjKgGq33bQukX2abO50Dh63YayqxF9AfEAMjXIfM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tUwscPaBlRP6WZmY7ciKv90D0jxXioq+gHz60etFssexKsrO7djRwHDIOS3eVrOPx
         IqicghYsnz3gjQmvm8yPUJBHQgTw1m3yGR9kom0egYa3Wp1GgWTpf+kTiMqJhPzrnQ
         xsg7gojBZrSzwvvF9+5KcdvmM89z9v8kiHfC8f9TfPwXp66UXAk0z84IW0+POoP3Y5
         6IatvQb/68FM6+5sRaoMeTeo58AQm3E45mIGOy2aEj9rQxd7MEDjx5YE3Bb6j4jnL7
         CYjC0ppCdKSo0v3FFH7JOJ+dnZezjZArHbsROuWXFmaNMuI8ELivG9v8ZAwWz1MsFk
         KBvqRUDqHTVYA==
Date:   Thu, 15 Oct 2020 16:38:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Gow <davidgow@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Patricia Alfonso <trishalfonso@google.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kunit-next tree
Message-ID: <20201015163806.1c5696bb@canb.auug.org.au>
In-Reply-To: <20201012195649.2047671f@canb.auug.org.au>
References: <20201012195649.2047671f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=GaUy3TVfmDad8_QFA6brEc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=GaUy3TVfmDad8_QFA6brEc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Oct 2020 19:56:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   lib/kunit/test.c
>=20
> between commit:
>=20
>   45dcbb6f5ef7 ("kunit: test: add test plan to KUnit TAP format")
>=20
> from the kunit-next tree and commit:
>=20
>   e685acc91080 ("KUnit: KASAN Integration")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc lib/kunit/test.c
> index de07876b6601,dcc35fd30d95..000000000000
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@@ -15,11 -16,16 +16,6 @@@
>   #include "string-stream.h"
>   #include "try-catch-impl.h"
>  =20
> - static void kunit_set_failure(struct kunit *test)
>  -static void kunit_print_tap_version(void)
> --{
> - 	WRITE_ONCE(test->success, false);
>  -	static bool kunit_has_printed_tap_version;
>  -
>  -	if (!kunit_has_printed_tap_version) {
>  -		pr_info("TAP version 14\n");
>  -		kunit_has_printed_tap_version =3D true;
>  -	}
> --}
> --
>   /*
>    * Append formatted message to log, size of which is limited to
>    * KUNIT_LOG_SIZE bytes (including null terminating byte).

This is now a conflict between the kunit-next tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/=GaUy3TVfmDad8_QFA6brEc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+H4D4ACgkQAVBC80lX
0Gy2ewf9Gc6H3OuCtFtyrKy/NJE+EHoIhLs0cB0TsKM+UIkpWGqwg0+wcysC/aUQ
/CVpC98+t9m0OF1+EDlf//rExJJQ6iZ8LW/v0cuNnt7V42HZF1UTca0Aubj4xYcJ
ZEt/CY+IZaQev5gzyGQRKWpxPK6ODdHr8TInSZa5BWQrUOv6XZg49eBPMBcWjzts
VoiI0K17pHtbHTccoq5oORia7Iues8bXG9gOzlozMWboWWGYpOfXo0M4ze1M7VQ0
VoDz7bnTpsnZEBimVWSakdW845dn0Qhh2TvHZ4vPVTmGfDekQVqC6cqSqfuC0cLm
gjbgEE7s2x2vDopHJeZ8kOFDd8Qtcw==
=6iGr
-----END PGP SIGNATURE-----

--Sig_/=GaUy3TVfmDad8_QFA6brEc--
