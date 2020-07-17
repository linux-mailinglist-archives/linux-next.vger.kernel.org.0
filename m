Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633BB2234FF
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 08:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgGQG40 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 02:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgGQG4Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 02:56:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7DAC061755;
        Thu, 16 Jul 2020 23:56:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7MNN3DsLz9sRW;
        Fri, 17 Jul 2020 16:56:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594968982;
        bh=n7VCJbjUrStWDVEYuqNH30t5LZh0dvMt7lv/SvZMe0M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oUFfN+SuYIpBNYyVWFsWoJSXTCwkBe7Opi7lAY/R6p0Qw8vDKzGrW+3+4zxh8tBxN
         UDl4o5gsxUTTS3VxKvMbPgUo2ginzwN59BPU5QCdnqQKdXGFHNZESH+KXrlkrUPf4A
         ZvFrIdkYYk6786IZ+yHOqFZkVsOqyrcWi8gVQ36IZyWJ+/OuHOgfO2YiuB0pXndaA1
         wypqFiGndMFZ0nQfI7/XjRPjM9zZokzD5XRVhtCg3Vk/h/R+LKC8BlwcnekGvoEI7D
         mN1kfd9ypIICdAxjxZskFfktCKqAY5h92t2KCLPFiFnGC1sQrK54sfCLL4zY34UNg7
         8NexLWTcVtIdw==
Date:   Fri, 17 Jul 2020 16:56:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Uros Bizjak <ubizjak@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20200717165619.666a59a6@canb.auug.org.au>
In-Reply-To: <20200717064401.GB2504@gondor.apana.org.au>
References: <20200717144656.4bdbf81f@canb.auug.org.au>
        <CAFULd4Ye2d-8BY7aY+_2tYwcXsfSCe3O6aJ4LF0KhvWTjVt0rA@mail.gmail.com>
        <20200717064401.GB2504@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//_L_FnKGXoDJAzhE2cJqR/4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//_L_FnKGXoDJAzhE2cJqR/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Fri, 17 Jul 2020 16:44:01 +1000 Herbert Xu <herbert@gondor.apana.org.au>=
 wrote:
>
> On Fri, Jul 17, 2020 at 08:27:27AM +0200, Uros Bizjak wrote:
> >
> > I will prepare a v2 that leaves needed part of inst.h. =20
>=20
> Your patch has already been applied.  So please make it an
> incremental patch.

Thank you both.

--=20
Cheers,
Stephen Rothwell

--Sig_//_L_FnKGXoDJAzhE2cJqR/4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RS5MACgkQAVBC80lX
0Gwoiwf/eg39Fth8e4Ag38K97tYmFbaLGq3BgqrbbX9+Gos9kv8ThpS7H/e+jFAD
PKC31zTrjXlP/jgmFlh5jDqKL8SddhkqFx9eIbJUTB3oehSlO2nq20jKup4Tv/j4
4FB/SQMoDTgqg6YhrtillLYL8UoiR1yPTz/X9f63bV+xUTwlJ0B6fT1dPeX6gUOf
A8DkbkpJiOV4iRA6dJ2krbfPhLddStksX083Ygny0/Ru/GypbtMD3KHCYbGh0c3w
GVyxFv1Yj0pXN4azkobcohvULoVvAPW8yDf1Fjhu5jPBRZ4UhB5SY6YnD1H6m+m+
D9z39vtucFoWpnjRDDjIyiO4KAXiyQ==
=w5KL
-----END PGP SIGNATURE-----

--Sig_//_L_FnKGXoDJAzhE2cJqR/4--
