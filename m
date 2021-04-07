Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D5A356B82
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 13:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351894AbhDGLrF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 07:47:05 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44019 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234728AbhDGLrE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 07:47:04 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 730911810;
        Wed,  7 Apr 2021 07:46:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 07 Apr 2021 07:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=3u9hoaAscFACYx/m5gKZ40JLi46
        hYSsEP3rEip+wmfE=; b=mCuHcMoVTB31vlvnHv9zHOeva2odOK7oEhpJUR3Sj+M
        QxGYGJjXy2jiIF+cRkDO7P6TP1G4FsCZ5fsfSAqNh0+HmiCaAlnKz0pEyd74qf1g
        yCxPzaXrBLXpz5ef4xeAN/zMyTGYQli2DJ+gVLVpFceSBQWQRB05VsF4yE0dzeWx
        ABpBg3VoXtB/X6gUZYbg9W9sOKoeGHZfAn09pNHrzm6iMz9g/yaRIaVxLV782ouE
        Op0esPCzXcq+lbq8uEY6vyo0gEtxMdPRTX1GtekcxA0T3+Ax2R+j0S3Y3q0vtwqB
        Wo2p7yRlwn64rWVmjBN5+vmNw5CLBUxRhsmyGAcXYDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3u9hoa
        AscFACYx/m5gKZ40JLi46hYSsEP3rEip+wmfE=; b=TAeaN2NKVXUtO+cUPxdf6W
        4bVcLr74I3hIWa4OBfa2e6Kh0B5YDbVFvQvYaERh97iLyQcHtdVC17Pq1uAHd1f1
        cO/MZXBO5WrTpit9KHNcRTye+P7dyek07EdAgtAoaON6DK2Jp7Kj/wWdPvVRpQyo
        //CbdDDoXCJDf3dGX27JIzNJxYABy8LY9kZ3r6ooMNammTQMjmxhS/5ydUrajBZK
        TI+R102H4/2oPRGX59Cj1pnlB1X7czaAsYvtGjPO4d++xn+6IYrRxa+lOkPN5nqC
        96G8r3xDdvnZhn3GH9uVinkwv4PkZERekpNnOPGexTQIia9Noqs9gDtDW86//6aQ
        ==
X-ME-Sender: <xms:rJttYIOl8yReZwWUye92edjkNns86VUv8RP0rHtTjsfQJtw3aYVnNA>
    <xme:rJttYO9GKxm-3ranT4GFhVC9lG3dTjLhsQtVoSyj8ZF9SQ1PDDod_OHmOG8a3IKIl
    uOb4VV5z07t2Dvbsbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rJttYPRF3DbUgW-Q00bXGLyl6IdzaoO8yWhFlIYht9tOs-wkEHGnAQ>
    <xmx:rJttYAttdpxB3xR56rCleN0drv3O-Uze7G9Z51_wVTMrjIerzmShBQ>
    <xmx:rJttYAcUzFAvlmNjtaNaEMPa0_VTqzL95u3IbOOhCXXU_FIhdy2ReQ>
    <xmx:rpttYI5Pl73pTs8qtCUgK8UFogSeAlxCqH1ext-Yp--qveHCsdBtjg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id ACA28240057;
        Wed,  7 Apr 2021 07:46:52 -0400 (EDT)
Date:   Wed, 7 Apr 2021 13:46:50 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20210407114650.2ed2p5aqkwwicm3k@gilmour>
References: <20210406081100.4a866aa6@canb.auug.org.au>
 <20210406081147.7a5332ed@canb.auug.org.au>
 <CAK8P3a1W9oHfx47-_d1ytHN+ZJAQ3ivS4RfcbiVHQ-fU840-ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibffx5pg3eyhmcpt"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1W9oHfx47-_d1ytHN+ZJAQ3ivS4RfcbiVHQ-fU840-ag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--ibffx5pg3eyhmcpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 11:44:27PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 6, 2021 at 12:11 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Hi all,
> >
> > On Tue, 6 Apr 2021 08:11:00 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> > >
> > > Hi all,
> > >
> > > Commit
> > >
> > >   3b493ac0ac04 ("arm64: dts: allwinner: h6: Switch to macros for RSB =
clock/reset indices")
> > >
> > > is missing a Signed-off-by from its committer.
> >
> > Sorry, that commit is in the arm-soc-fixes tree.
>=20
> Thanks for the report, I've temporarily removed the sunx-fixes branch mer=
ge
> from the arm/fixes branch and will send the pull request without it.
>=20
> Maxime, can you fix it up and resend the pull request?
> Feel free to add any other fixes that have come up since then.

I just did. Is there a way to prevent this from happening when one
rebase a branch that was partially committed by someone else?

git rebase --signoff doesn't seem to detect if there's already a SoB, so
it might produce duplicates which isn't great either.

Maxime

--ibffx5pg3eyhmcpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG2bqgAKCRDj7w1vZxhR
xcz+AP9kz8QR1UMM/xxCe6lAs7i17ioNddxuCx5+y0I2o3F1xQEAi/1g+aksWTHX
oxYWyoT9IKHj7ZiOqxuor1zRspZx0AQ=
=5Q4L
-----END PGP SIGNATURE-----

--ibffx5pg3eyhmcpt--
