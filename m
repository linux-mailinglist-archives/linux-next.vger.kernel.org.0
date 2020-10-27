Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C44829B94D
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 17:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1764136AbgJ0PrT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Oct 2020 11:47:19 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58513 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1798571AbgJ0P24 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Oct 2020 11:28:56 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C150B5C00B5;
        Tue, 27 Oct 2020 11:28:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 27 Oct 2020 11:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=+j8L/tkOK2xm0FaOF8ANxNspBvG
        k+kVCGp6EG43vYds=; b=bZJWU9CDejPu3gS6i5DJOfe0oweoztX3ZM9csU/yK66
        eQBtl8n6janJuuK5/MMz64Awo5JC5YUUpQePD84OnHxWHspROtKOmztBzDUe9zOu
        F+2nIkzPGPfgX2yBweVjGcxyTSIRJ03cMSjis86LnoQ/z7QwGnNcrxTv2fW+2LGc
        ru0J/Ulhu3FRnL+FZCWQLfBaWhX8I6ST7765hT0JV1+ajU64GRznSmz+hyj22u9o
        LHYdy0wmZ8RRm6MvFvc3L3qR78peuegezHkeojjlL0GRmIz6bthQjuQYfsOHRytY
        1mXhiwzGsr8QMRsC731fWnlr0ajaFYaFarq9s0LaT9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+j8L/t
        kOK2xm0FaOF8ANxNspBvGk+kVCGp6EG43vYds=; b=oh1GS3/aANesytbAkP4zuk
        4+nRrdAwmbft7C8iYp3LBHQOtNbAGD7llnzsVtWiFOGXv2JAFoWWkUpvVSsP8QHg
        /MDXCuZtWmI384vfJgZe+DSV1bHW+nX9EWCikNIAl4Xi94tEcJ+75uW1/6XunhnP
        0QeYwTWqFoOaOLfaWsKbHON0Olc5UgAqOatqL0W2EChBXDFUvRbWi58pMvJlUatc
        FFZTwlN3i+tyTuSETbfXXr894Hwy/I2guzv4im57OypNYuhuSSyfI/mD2gd5o9A5
        /JDX3N/UVsHaCYClJSrdWJXCAXpsAnGfgTCsNtNQJsxRTNsvjwFjIZDyHhvAikXg
        ==
X-ME-Sender: <xms:tTyYX5saLanEbfKzl75eiF6oDLnQAnQJ3Gv1yyFAPgt_9JDmTdKckw>
    <xme:tTyYXyey9cbRV4kKmDrODWzGmeIi6cFl93HUdXyANDHD4AM4DxH-TpxKtp06tN0q5
    GSf1aob7hbseikcRJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tTyYX8w8AHopgpT2a-gmlfOJQHAlkeul_KLR6xQaT1Wx9erVh1-00g>
    <xmx:tTyYXwOXrGFMJ9IMYgAdmmH1flTe0GF9Pj8EuhvkH4GIWwREnzbYBQ>
    <xmx:tTyYX5_CMLOh05M22pDbb_7blCrOggsJ2XCvqZ91uEJjdEwI6tJDag>
    <xmx:tTyYX7Lk7wBVz7XzuYw0ZPCZ5KRGdVMdPl_oBdpmHkU9h7ucQ7N-7w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E91383064682;
        Tue, 27 Oct 2020 11:28:52 -0400 (EDT)
Date:   Tue, 27 Oct 2020 16:28:51 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chen-Yu Tsai <wens@csie.org>, Yu-Tung Chang <mtwget@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Message-ID: <20201027152851.bndhe5y7hm6lbtjg@gilmour.lan>
References: <20201027104220.0c8167d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2ggkixm6hracvjvk"
Content-Disposition: inline
In-Reply-To: <20201027104220.0c8167d0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--2ggkixm6hracvjvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Oct 27, 2020 at 10:42:20AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sunxi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> arch/arm/boot/dts/sun8i-h3-zeropi.dts:53.25-63.4: ERROR (phandle_referenc=
es): /gmac-3v3: Reference to non-existent node or label "gmac_power_pin_nan=
opi"
>=20
> ERROR: Input tree has errors, aborting (use -f to force output)
>=20
> Caused by commit
>=20
>   89cfb6d76fdc ("ARM: dts: sun8i: add FriendlyArm ZeroPi support")
>=20
> I have reverted that commit for today.

Sorry for that, Yu-Tung sent a fix for it that is now in my branch for
next, so all should be good tomorrow.

Thanks!
Maxime

--2ggkixm6hracvjvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5g8swAKCRDj7w1vZxhR
xTMgAQD7fW3EjnSSqoW4lyqB1oCbuJuOb6sEPoYBMIR7KmTv9QEAi2F4D9uaweQg
k/rsKnNY3QE98AZ71Ebgzm0PLClq0Ac=
=vlbo
-----END PGP SIGNATURE-----

--2ggkixm6hracvjvk--
