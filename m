Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87F1430E75A
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 00:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhBCX3V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 18:29:21 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232733AbhBCX3U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 18:29:20 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWHtX1PGCz9sWC;
        Thu,  4 Feb 2021 10:28:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612394917;
        bh=VMnjnNXiZrDzJ55HtSmfigzckd0NP1aA+A4Q99Qj/a8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=snmtaSBKhtmYXPW70pGjCXQ7N2Q/HjQFjncALOdUFuoQplA7E13jhce3GM1nQNf6L
         x70Sn6VkP7ia6dP9sw9WzcWP/PyOiTDfGI9xjh6yVOg/2TL9guI7BD7oOpRLni4+7f
         wyLQZ4ciFUoIhSd3vajB5lM+/M9kCUdaI1mFCqdPeh5STJFtWCTU4Sa6pTY6wFHN0i
         rF5xEUxKU+PUB5JRQF00Jm/Vsu2G2MPNxTW0OQl1Gzo/7SPln9di526pYqbXGW+CY0
         8pMZqAb8BaVE6Ea63p/Ndoc9H1hC8NfM1WxISuSEKR0LZ2QADXEsMGGd2kSG9TqpiR
         V78I8gzsHOUrQ==
Date:   Thu, 4 Feb 2021 10:28:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210204102832.4b5539a1@canb.auug.org.au>
In-Reply-To: <CA+CK2bBpuiLf7y7qVDoo3k6vajoaTkrDNx+pnNBTMYY616iDwA@mail.gmail.com>
References: <20210202200324.5179db33@canb.auug.org.au>
        <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
        <5504da4f-7eec-ecb0-c47d-7821d06dc880@infradead.org>
        <CAK8P3a2Y9-5dhk1MaZhhnKQkbOtqOSqfqZA0c4ncBXgD8tJTZg@mail.gmail.com>
        <CA+CK2bC9oMvtkT3MZzxNMtCn1b0hafYPbLH3GM_Z_66j_NQeJA@mail.gmail.com>
        <CA+CK2bBpuiLf7y7qVDoo3k6vajoaTkrDNx+pnNBTMYY616iDwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MKHeHt7nA_CP1.GmjzpsSoZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MKHeHt7nA_CP1.GmjzpsSoZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

On Wed, 3 Feb 2021 18:21:07 -0500 Pavel Tatashin <pasha.tatashin@soleen.com=
> wrote:
>
> Stephen, do you want to send a new patch based on the current
> linux-next, or do you want me to send an updated version?

I'll send another one and include it in linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/MKHeHt7nA_CP1.GmjzpsSoZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAbMaAACgkQAVBC80lX
0GwdAwf/XtStpm7c2xZ/FPbq3UOMisN0sWut43Y4eddGGbv8XPVYEdap7rILn1ji
XG8OemMRn+QuFxqlJoPO++HIpvCZXxkH6hySuCAAe7ggyoO0y8IBpDZY21hYI6G0
NpJUHBATRoy1MBCNKbNZKqmw0ZZQHc7ViZetYTNovP/zfG9inokex4xyqCzWfLYY
QRHsrIMr5rnAOC+B77j7x0SOKPxZKTQc1f03pASPUpV51ZKPgqIOvC42VTYsQDIJ
SKoNj6C99pTTy4YXQkIccmN8k5XKKRdEiUPjmvq9I+5o90U2l0k5NWvcJGBmq8FX
rNFHVuzwVpRHzwfiIWoJjGp1SCYaoQ==
=vuAN
-----END PGP SIGNATURE-----

--Sig_/MKHeHt7nA_CP1.GmjzpsSoZ--
