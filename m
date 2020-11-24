Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58E02C2328
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 11:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731398AbgKXKni (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 05:43:38 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51125 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731324AbgKXKnh (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Nov 2020 05:43:37 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 5AEC55C0152;
        Tue, 24 Nov 2020 05:43:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 24 Nov 2020 05:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=lITX1qzbR2O4UpzNk+OdG6y12JU
        SmHJDkpZQUJ7dDOU=; b=Ni18EMJStY0GlcJcIPdVoli7dlSGrS+1A12TCtNjSj1
        my4SH6GmJ9wnddtP1NxDV3+/Yka0WGhKS8NHS7ngfTjMLKF9l58yVT/0y3gOQRgf
        FPAw3A6M/21X5JkZr78EhpGjMhTg79iugdnQyri0mCA5zLqODW9/n6bukhejGaN9
        DMo198iMWsFKTR7cFUTYRrRViIJ64DiVwXmXfiQzM02igT9AN9N4TBFd1X1/tOXs
        T6HAGv399NMc/o90ZHTJjPybwKfz+UmqSyHZokHWllQz9sUtED6wQvyBR6/qfcy0
        rKMi1TCDHBaLUlBI2WH/cHzqFRhDKx6DolrFO/54jVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lITX1q
        zbR2O4UpzNk+OdG6y12JUSmHJDkpZQUJ7dDOU=; b=nPWb7TULKGEIbQ3ZzCp5EX
        XNpH4DOs51fytyz1hkF2Y9x1TzTzAGuQaEi3pYieFExYozPRv2UmiVqTcOH6O2iq
        5htTdxgOqSzjVGCjXDKyhc7I+VMWQLmobI+2fM4WIzo2OwA3xC/GaasjldhaY5LD
        Qw5pekzqCLoxik0iXNqQdOiK1f7PUiVHVtqwBZJcYhQgLPnEQfp2tRX1qlRCtHgp
        KKG3G9j7LBm0iCxyznTUdiVXVjt1ViImzcty+D/B38FInVQzVRFTVbV92WHIS1d1
        CYQaVHhDAr87L9Z6Lu8U7oqGa1VB/+7mNqyQjiYquBdnXtLe30OaUxLxbxFBPMYQ
        ==
X-ME-Sender: <xms:1uO8X18wsvjvSIZZNivRaecmJXDSxo7Q7i5Q1klDhngkKj8bkeLSWQ>
    <xme:1uO8X5sO3jzOKQqSfHji-mfgnA9uvWZZwaHJ2YGDCil4A28neR4U9QPuHNnChY8Jx
    I_8Elu22i6s2gzQetE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1uO8XzDS70M2trtJoB6p3VmrraBpswQTjaq0w-WVSybNg4rKROZ1MQ>
    <xmx:1uO8X5cKFw2yaqf1w2I1lnQVkj7KT7YThOt-Igeu3GPs0MeUyqxKIA>
    <xmx:1uO8X6Pwyjdl8_FbwP8nDMu1kIUOC4tVvXMYN0D5KmQZY5IqW2KHAQ>
    <xmx:2OO8X3qqMC6S97idzHQktPdHk2u2hVzT63fj9Lp9TF19nkslVVLdTQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 850873064AB4;
        Tue, 24 Nov 2020 05:43:34 -0500 (EST)
Date:   Tue, 24 Nov 2020 11:43:32 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Message-ID: <20201124104332.i6ptfl7e7kcoc5yu@gilmour>
References: <20201124093115.0f358046@canb.auug.org.au>
 <20201124091804.GA11695@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xegofoq7xx3feejm"
Content-Disposition: inline
In-Reply-To: <20201124091804.GA11695@lst.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--xegofoq7xx3feejm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 10:18:04AM +0100, Christoph Hellwig wrote:
> On Tue, Nov 24, 2020 at 09:31:15AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the arm-soc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/soc/sunxi/sunxi_mbus.c: In function 'sunxi_mbus_notifier':
> > drivers/soc/sunxi/sunxi_mbus.c:93:8: error: implicit declaration of fun=
ction 'dma_direct_set_offset' [-Werror=3Dimplicit-function-declaration]
> >    93 |  ret =3D dma_direct_set_offset(dev, PHYS_OFFSET, 0, SZ_4G);
> >       |        ^~~~~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a centra=
l place")
> >=20
> > probably interacting with commit
> >=20
> >   16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")
> >=20
> > which is also in the arm-soc tree ...
>=20
> drivers/soc/sunxi/sunxi_mbus.c now needs an include of <linux/dma-map-ops=
=2Eh>.

I just sent a patch doing so

Maxime

--xegofoq7xx3feejm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7zj1AAKCRDj7w1vZxhR
xbROAQCXqyCRlo/C/AsJUGOO3hNS4yGFAEtFYGRsl5XPB+DpaQEA0rJAxdMrJY9U
Ib/IwuQ5SSk4NgoXJlc0Gu9LT88AzgU=
=zPoe
-----END PGP SIGNATURE-----

--xegofoq7xx3feejm--
