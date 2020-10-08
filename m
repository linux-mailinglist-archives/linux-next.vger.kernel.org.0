Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B31C287530
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 15:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgJHNUY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 09:20:24 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56861 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729885AbgJHNUY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 09:20:24 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id A4098CC1;
        Thu,  8 Oct 2020 09:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 08 Oct 2020 09:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=+heDfJakzKF+R2u0q1lN7twC7gD
        CHgtByTX1mOeLU5Q=; b=FTHJ9hoLeLwdWCd9lHDqKhQe6kynAYEnPxEmOKlHPCB
        rBk1kIKHMFa3vYPD54fnHb4k+uhc2hwYWOqFwQIX3/RASeAa3ntf3VhaQVhfci5V
        rUa2M6+ysjWfWnUY9obF5WeB8cD2cReuf1mvT/p8F7Gn0fnLs5EH8HGepGb9T1t3
        /ufZVuiaSyI9F04lBx1/QFBaMwUyQORv4Gt41GMhAHFN5frwN014Gr0ReRzDwJ0R
        ++ixgjsrf3/RJxW5vVlPNPbBcfO1lVxIObCKsDDVIbepwSsyrN+Bq2Mp6XdOc0Dt
        rsFJyPQC3pV1C3kTrrG6gZIXJrxcrT5ihHQiS+ntCeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+heDfJ
        akzKF+R2u0q1lN7twC7gDCHgtByTX1mOeLU5Q=; b=Tx9WRZH2LxOnH9hOCzITms
        nIGrPyiwDYWv6MWYPQe1rX+zvFnnRC7yWg8tfC17Tld3ItMN1OB0aC5dbKkEENsm
        Ud9l3oXjiZalmRw6TH+20vAhbfGbRVJ37Qp1Hxy1uz5t7RDNIHobKSXe00vW/sAp
        dYyWUdrPP5n9JCoXxiLXj1IREerHgiA9p1zj1SmsKeIoBnZUfk7OgCTzlcIX6JGV
        DTt51YO5kBIZJZDCyFatGrc+95AA4xdvXfCxWPTCravXg3gfT00kYW9A1ejLc2OT
        5ny/zY7pYvAoX6AkmruQoigzGpWU79dcYLuw5ZcjXLoQmdhNDygU8Ij02si8eLKA
        ==
X-ME-Sender: <xms:ExJ_X-AaO918uQgO33-7hBRByqlJJXcsr_GczFAQWl-H1QT6IPDvnw>
    <xme:ExJ_X4jNxZrCQ5QqMj1FGe3gU5bLZ_qbdYcJ5yoyZogdTaBxjd8AgXPTgaoQL6Mlr
    AUpPiHF6Y1cxGCpxYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ExJ_XxkLof05unpkecc-iI6Rar3DWBXvZrgMsqn_pJTKU2XgCe0ibQ>
    <xmx:ExJ_X8ybedtCL3e3owJleY4mOq-2v9foLyahXn7BVweo3px_9XRNvg>
    <xmx:ExJ_XzRiFHnYuHsLry0Tfs5MMb7BNcuqHSE8QFWTWpoILS5rN4TqfA>
    <xmx:FhJ_X0IDFH9GNF_2su3-BNN0O_VDTcu3c8PfhLx6ooR8INWYVYZ3Gw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 073E83280063;
        Thu,  8 Oct 2020 09:20:18 -0400 (EDT)
Date:   Thu, 8 Oct 2020 15:20:17 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chen-Yu Tsai <wens@csie.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yangtao Li <frank@allwinnertech.com>
Subject: Re: linux-next: manual merge of the sunxi tree with the arm-soc tree
Message-ID: <20201008132017.ju5ih5prn4aifeml@gilmour.lan>
References: <20201006145637.57d20ba1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nar4feg742sntlic"
Content-Disposition: inline
In-Reply-To: <20201006145637.57d20ba1@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--nar4feg742sntlic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Oct 06, 2020 at 02:56:37PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the sunxi tree got a conflict in:
>=20
>   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
>=20
> between commit:
>=20
>   0dea1794f3b4 ("arm64: allwinner: A100: add the basical Allwinner A100 D=
TSI file")
>=20
> from the arm-soc tree and commit:
>=20
>   7e66a778cb8b ("arm64: allwinner: A100: add the basical Allwinner A100 D=
TSI file")
>=20
> from the sunxi tree.
>=20
> These are 2 versions of the same patch.  For now I am just using the
> version in the arm-soc tree ... please sort this out.
>=20
> I fixed it up (see above) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The branch in arm-soc has a build breakage (that doesn't happen in
linux-next since the clk tree has the commit to fix it) so I sent a new
PR

Once that PR is in arm-soc, I guess that merge issue will go away

maxime

--nar4feg742sntlic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX38SEQAKCRDj7w1vZxhR
xVH2AP9J/UDmbsh8i7nc+j+/V4LS37nq/ODXBfuJ2roRxTBSNQEAjXoQ9IxrzTUR
EmNB3t5eIApr1TCyADosIA54XVBWPgk=
=Mq81
-----END PGP SIGNATURE-----

--nar4feg742sntlic--
