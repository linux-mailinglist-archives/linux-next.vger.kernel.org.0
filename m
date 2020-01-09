Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA7113514F
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 03:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgAICY1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 21:24:27 -0500
Received: from ozlabs.org ([203.11.71.1]:36125 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726913AbgAICY1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 21:24:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tVLJ3Ml9z9sRW;
        Thu,  9 Jan 2020 13:24:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578536664;
        bh=feYRiXgf79MA9R3HmP/RWQv0wmPGZpr38pcwO87gD+Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BVPW3l4Ju7MR7WVioerqAz46uuSfuCR5DVFpdU1o2n4IzjyOF0mGgS6p9sEshDX9/
         wGJVg2koVVPOp68/EGU2nXE9gYgMaD+4/p/wldgfLrliZXJJc5eSnRWSG3jt4oO/JK
         wr2posQhy/HICchgvzKevnvlllKpdYwBBURnq3yV866m3Va9ZJb+CfU7zcwZIOlH6K
         F29Z/W0xYZMBniRG1+3wbUxYTlTz9v7TWfGpauktL5KgZPzvk/g6VzoxLRXddpkFJP
         07Syg1R6KtIOSixqDaRlvhYAAm5lEjPcW8xVZk+beCq5rJxuHE+gYjs+ZjWBg3JbXL
         TvjGzQhNsXXMg==
Date:   Thu, 9 Jan 2020 13:24:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ma Feng <mafeng.ma@huawei.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20200109132423.1ff0d009@canb.auug.org.au>
In-Reply-To: <CACRpkdbZi3qV1RFvA4SDa_7T-b-eSaKGdA9_m4s_1gk=2MQNDQ@mail.gmail.com>
References: <20200109112836.0649c578@canb.auug.org.au>
        <CACRpkdbZi3qV1RFvA4SDa_7T-b-eSaKGdA9_m4s_1gk=2MQNDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GZF_vgOc+c6jCyQ7qTik7N3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GZF_vgOc+c6jCyQ7qTik7N3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 9 Jan 2020 02:58:46 +0100 Linus Walleij <linus.walleij@linaro.org> =
wrote:
>
> Do we have to fix this? It is a trivial fix to a non-critial non-regressi=
on
> problem so it's not like we need those Fixes tags to get it picked to
> stable or anything. To me it's just some random free-form commit
> message.

Sure, no worries ... just a learning exercise for next time.

--=20
Cheers,
Stephen Rothwell

--Sig_/GZF_vgOc+c6jCyQ7qTik7N3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4WjtcACgkQAVBC80lX
0Gy6+Af/X9Z2miIZ7EThhYvbQUCvjDXkw2pvamAfaQcvvKtnNvgx6c8CW9XaaGhz
1EvRRQ2sqTQC8F7BM6DAmxKfAz9oW+mBoJBJi4/YQxjlcBsXT2VT3f2N9qWm9ada
UOjLD9k4F0q8kmWG1TOF9LDWu+u9DPSn5gn/JEWy221hR8og5Z+0nyptwbtpmrsb
7nveNgMSKosRPvZDuK4CsKFvGo5/ywmVBqjeNkCvJTu78h52dfcdxD/ZDR6YibKh
UuQBQhBeMvTJbtqp7Drz95U0Oy+J1US2ZHwBtFGzgh+kZ/0TPghqR0u+0wwdaxdT
VVeH60H2kTZw/1Ei9vv0kzqbVbOSUw==
=c+dc
-----END PGP SIGNATURE-----

--Sig_/GZF_vgOc+c6jCyQ7qTik7N3--
