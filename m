Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B9C20F030
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 10:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgF3ILV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 04:11:21 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:49653 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726994AbgF3ILT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Jun 2020 04:11:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 003E31D8;
        Tue, 30 Jun 2020 04:11:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 30 Jun 2020 04:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=yukiWG4+/ly7JtCnXK6DCjbY4VA
        w3gMXnpgtsQjFZVg=; b=SELh7P0sMski6k9gGuDVi07e2pPeTwTkTRtGbtSKupn
        0wAd5s3wdCgqAhOle7g7CvLC/zz8TWRi4s1373wh4Kp/i5DCson+HRexHqbcBwDe
        3vDIoGmmj7L29DQqIj3FgZBjxoqA1YxfcYgoJ7Ht9TBvFJiPoclmi6GmDTPSHzvh
        fN+L4CF8Y2iuN2EtjaJa/lWk7ZmcRayYcx8wKvEylwwF4c2OUOeYPh4q1353xq1t
        BXxyWqXicGCNJF+siFIZz7KFhGpIseWhwNW1r9jOa3+U7YpeA/Aoqtjr5XWH+TfE
        M2AkZHXbjcrMtiqlQp/YK05Bv92b01omamTftjgFXBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yukiWG
        4+/ly7JtCnXK6DCjbY4VAw3gMXnpgtsQjFZVg=; b=EJYXh7SdJk/uN/3seSbz7w
        O9WwKY5Yc8GC2JiwiR+7NTNCQovhukV5YeNVAdMa0tJBEG98Lvp2zNVKJ0llSjJd
        CDplzhpuRrfpOa1fAJC3/D3PusDqc6wxwLgeCKNQrlBM1w6wb9Mh7IxtKl2/nxHo
        vh7aV1YDPbkNnoV6kyAbRHtWZvpJ5osXxwTKYEufUj679Vj10i4qpVcXqyJjYG+X
        Y5MOyRtaYQp8AOa1WanTIDTcqbJz/8O/nzDjOnFBdXZy4GDnplylt2qIb2jv63Dd
        m4QPrXg9jkjRHgmm9eWoCOs98DwoGcs94YGYFJZo1qzQiSq/oiTYcfW2iZWuCqcw
        ==
X-ME-Sender: <xms:pfP6XrSfyHAbUMOMDhRJGEEHdhhqw00ITL8qexFNXGIdvKHynlQZKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddtudcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfejvden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeine
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
    mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pfP6XszTzd6zhaIlKjnLgvYLgaD13449nHvW7NzpisI3nGBfebg5rg>
    <xmx:pfP6Xg3OXOlaW964t4d-BF9qN8xnMZ9FVnVMOmH7AoMyDIfYfyP5rw>
    <xmx:pfP6XrDVgjzHKFHroOvF6TY2N_P-1YTlKJhUPilwYwgbn5jMCv_odQ>
    <xmx:pvP6XgbnXF1yQw2e82FLSjxHKcLMquy9JZdbSSdsRSx5U1ZG1y9GYQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4674A3280063;
        Tue, 30 Jun 2020 04:11:17 -0400 (EDT)
Date:   Tue, 30 Jun 2020 10:11:15 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the clk tree
Message-ID: <20200630081115.mmqdsm3vlnj4yagu@gilmour.lan>
References: <20200630095341.0f4ae8ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2qobstjoeo2rlygl"
Content-Disposition: inline
In-Reply-To: <20200630095341.0f4ae8ed@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--2qobstjoeo2rlygl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 30, 2020 at 09:53:41AM +1000, Stephen Rothwell wrote:
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> WARNING: modpost: missing MODULE_LICENSE() in drivers/clk/bcm/clk-bcm2711=
-dvp.o
>=20
> Introduced by commit
>=20
>   1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")

I've posted a patch solving this already:
https://lore.kernel.org/linux-clk/20200626112513.90816-1-maxime@cerno.tech/

And it's supposed to be in clk-next since friday, but it looks like
stephen didn't push his branch?

Maxime

--2qobstjoeo2rlygl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXvrzowAKCRDj7w1vZxhR
xeGBAQCBlmtRQFo0TEShz973jA5R+qD6nWnG4ozE0jy88VYdzwEAsF8rPI7SLF3X
9GY7xxDiGC2adoek7GNNdVg97IA4hgY=
=N11O
-----END PGP SIGNATURE-----

--2qobstjoeo2rlygl--
