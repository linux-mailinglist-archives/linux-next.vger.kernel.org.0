Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0507445B21
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 21:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhKDUee (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 16:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbhKDUee (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 16:34:34 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E841BC061714;
        Thu,  4 Nov 2021 13:31:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hlb0647Cbz4xcG;
        Fri,  5 Nov 2021 07:31:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636057913;
        bh=i4XBsFKlHePIk36I8I1JYukXRUvnEx+toP0p5wmiIWo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hGBO3f0Npg1Q/pQcgJYwIGFqq5dgHP2X7l0Ed/Pe0CktQxLEt6fxTWDOhbHM42EnT
         eS0FzGtPsGe6534ISckxO+lmAjc1l5uksfnFZclhHXOYYcLEFsWWk3FWJCb/PYqK0/
         Mu34JXjoxnvlnOisIBN9pXSABXFmRNtt4L4jyzBwGRVbYKQruJO8taUNBHRsG0FHzp
         9jkIqC8hYRWMkvi+Bmlg5lHSaPZclmDH66VVTAvFxAY30EDweHY2Tzt1j9R82MBtZh
         GJYujz/um3x0OvSgHRRCKuo8ND/o88P+hVuW4rRjCCL6QJFTqQPCdZKz1HaVI41Wki
         3VDAIUF52Q++w==
Date:   Fri, 5 Nov 2021 07:31:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Daniel Xu <dxu@dxuuu.xyz>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Gary Guo <gary@garyguo.net>, Jiri Olsa <jolsa@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20211105073149.5bc4e8a7@canb.auug.org.au>
In-Reply-To: <CANiq72mLAc1OMTo6LBTy1bwxM_+BbrRSCNn1uKW0irezUXBFcg@mail.gmail.com>
References: <20211103141919.4feefaf0@canb.auug.org.au>
        <CANiq72=fuk-eVuCpW5jkDn71Pbs=1L2LhSvadR_bTjxcPvtVUQ@mail.gmail.com>
        <20211104080152.41c38912@canb.auug.org.au>
        <CANiq72mLAc1OMTo6LBTy1bwxM_+BbrRSCNn1uKW0irezUXBFcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Y+6VUZ6oAh1Wtd3i+KtWZJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8Y+6VUZ6oAh1Wtd3i+KtWZJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Thu, 4 Nov 2021 13:19:22 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmail=
.com> wrote:
>
> On Wed, Nov 3, 2021 at 10:01 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Oops, sorry about that.  I have added it back from today. =20
>=20
> No worries! By the way, I will be rebasing soon to fix a build error
> that happened due to some changes in mainline, so the conflict will
> disappear.

I would suggest that you don't rebase if you are intending to submit to
Linus.  Instead, do a test merge with his tree and fix the issue in the
merge and test that, then explain it all the in the pull request (but
ask him to pull your tree without the merge).

> > BTW, are you intending to submit the rust tree this merge window? =20
>=20
> That was the idea, but a few things need to be taken care of before.
> In any case, I was told to start submitting it every couple weeks or
> so, so I think Linus et. al. do not mind if it aligns to a merge
> window or not (though I might be wrong...).

Much better to do it in the merge window.  Linus almost never takes new
features outside a merge window (but you could always ask him).

--=20
Cheers,
Stephen Rothwell

--Sig_/8Y+6VUZ6oAh1Wtd3i+KtWZJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEQzUACgkQAVBC80lX
0GwTMgf+JPS238i+wto9si/BT+s7SME6hWLM3c3lc67qw2y+whjFwJWQK3KcLMVe
E8eHJWQ3pfoZrWmcu5uWIkZGZUbIp0z++xSxlwM9DUrHi8xpK2KwsoeaY9gdjr7l
7RiqFYpykRqMcbubbBc+YGStnoFQ4vT4RzakqLwHf769J1G6bjPFP7dEvzipujrd
8wyOu51sWl9AUQfTN3j8O/V21qUk1tTvRGaS48g48tjqjLuDtLwjL09pAI+Pzh9Z
BquHbYhJQmZ0vit1Y7lDoFyiYkrtyYukg1yilOL1TFFaqmK/P30kdBM/vBoOErWe
oHFnKaKY+d0Vx7Ex0U84Eh4oAejzyQ==
=ESlA
-----END PGP SIGNATURE-----

--Sig_/8Y+6VUZ6oAh1Wtd3i+KtWZJ--
