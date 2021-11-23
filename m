Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68128459F48
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 10:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhKWJeV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 04:34:21 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53119 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230270AbhKWJeV (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Nov 2021 04:34:21 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 987A75C0191;
        Tue, 23 Nov 2021 04:31:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 23 Nov 2021 04:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=pMYWGBRx3nGwaL6oZvq4t58u+sZ
        RBjgUygruXmCJF5s=; b=W1HCM60PgfVjKOWK0t1IWuOq3KxAMMWBufT9hbExtv6
        pGJQmgnHxlUbOya50gkuIdqToVuX1mYzX8FJNNhuC3SpqZSJwW739mnm08iiFilb
        4DTcod5BCd5zvRQHuKxrqiCkFomeTNI396jTTsLmjycGR7EQPC8hXXV4KxAPvRvW
        OydG9PYiH+drMbeKZlCHIfawOFIg6nRl5XIYhmdKm9Ic47MdOCGOATZYj7sAWFEn
        2v/nSXYfynHjU5UpoNEBYl4IMlZ086xzVFXxPXBFn8diXbOrvRJt+duSp6sKWSIc
        XbX/XYxNwqITRWg0FMl17lqXbWz8lWceVcaXpykZBfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pMYWGB
        Rx3nGwaL6oZvq4t58u+sZRBjgUygruXmCJF5s=; b=fhCoNefNFTlQCqvTs4f8No
        N0zvCk31Mc3J82TuHrgEY45YkJ2GGIv8rBw+v8Ju6qBU3PxgDmHx/dphY92I+3Gu
        f1+iOOLP40CUxRo6VwE0L/BguMJQNoISk3/4pjtzm0UsWve3C/TjxQR/gepiu64s
        3gwBVGjoObsXwUaQ6rQNSycfqmcL9M2p4osHN81o/mhDSemLu1Z4sGUqKSav366x
        A3nLh032FXmV/myScoUemKIA7IKrw9o/xmFGAWzXSKT1BiR8e9afi420ikFIT4qO
        sGdWYnsmXUzydZSEODgEsB67Xwefb9hQEMiONFdYB9VTzyulMOMTvYyAkHCBCaMA
        ==
X-ME-Sender: <xms:37ScYSkJ_eB5vOWn0xYXeuBQeNeMsUrPok2MLR6-b80xEE-izkne5w>
    <xme:37ScYZ3YuWkaE5Z96XWS4pUcOusOaM-E0Z_JIigOIXTKcaTcfHhB4o6yujokg74RP
    V_BlkDF59JeCR0ld8c>
X-ME-Received: <xmr:37ScYQqh2soyj2qXustfEkr3Dqm2pnhYfrob5AS_Yt5maNZ1tayBIeHTBuJa9IZfvk2DRdCw7Axx7OyoTEfXCVEzzUrlWxqPQNM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeigddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:37ScYWn54DFqcXJEr0Da3yVNdb2rqeyQKV0fsMPpLni7V5zgbhyGuw>
    <xmx:37ScYQ1M7pNx-xDg3q55KmeM-DGzQTkSzpuSucGVdZN9uRDC5q48PQ>
    <xmx:37ScYdurrPdf7p4cky4tCBCd78ielRrd155a8y8sKyhHH2l_gQDBIg>
    <xmx:4LScYdyRTu0wJumhGrHFpkjjMenxdTsqlD7NEv9NeaE2mDraa8X44A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Nov 2021 04:31:11 -0500 (EST)
Date:   Tue, 23 Nov 2021 10:31:09 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Message-ID: <20211123093109.ikenoaxyfbj3b53s@gilmour>
References: <20211123102717.1c3b086f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bzzzidilwh4bvcq6"
Content-Disposition: inline
In-Reply-To: <20211123102717.1c3b086f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--bzzzidilwh4bvcq6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 23, 2021 at 10:27:17AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sunxi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c: In function 'suniv_f1c100s_ccu_=
setup':
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:532:39: error: 'pdev' undeclared=
 (first use in this function)
>   532 |  reg =3D devm_platform_ioremap_resource(pdev, 0);
>       |                                       ^~~~
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:532:39: note: each undeclared id=
entifier is reported only once for each function it appears in
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:534:10: error: 'return' with a v=
alue, in function returning void [-Werror=3Dreturn-type]
>   534 |   return PTR_ERR(reg);
>       |          ^~~~~~~~~~~~
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: note: declared here
>   526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *no=
de)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:543:10: error: 'return' with a v=
alue, in function returning void [-Werror=3Dreturn-type]
>   543 |   return ret;
>       |          ^~~
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: note: declared here
>   526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *no=
de)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:552:9: error: 'return' with a va=
lue, in function returning void [-Werror=3Dreturn-type]
>   552 |  return 0;
>       |         ^
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: note: declared here
>   526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *no=
de)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c: At top level:
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:561:11: error: 'suniv_f1c100s_cc=
u_probe' undeclared here (not in a function); did you mean 'suniv_f1c100s_c=
cu_driver'?
>   561 |  .probe =3D suniv_f1c100s_ccu_probe,
>       |           ^~~~~~~~~~~~~~~~~~~~~~~
>       |           suniv_f1c100s_ccu_driver
> drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: error: 'suniv_f1c100s_cc=
u_setup' defined but not used [-Werror=3Dunused-function]
>   526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *no=
de)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   72dc8e122383 ("clk: sunxi-ng: Convert early providers to platform drive=
rs")
>=20
> I have used the sunxi tree from next-20211118 for today.

I fixed it and pushed to the sunxi tree, it should be good tomorrow

Thanks!
Maxime

--bzzzidilwh4bvcq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZy03QAKCRDj7w1vZxhR
xUe1AQD7QdKU9X/5R4tBII3BJWfLaWM7pgcziEJ8J4+rk49KJAEA5pUayt2NdkEr
73oh9csNmrqMNoOFnAobptIpnPM4pwQ=
=92Ze
-----END PGP SIGNATURE-----

--bzzzidilwh4bvcq6--
