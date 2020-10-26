Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21D5298CFB
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 13:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1775359AbgJZMlB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 08:41:01 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:44211 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1775349AbgJZMk6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 08:40:58 -0400
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 08:40:58 EDT
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B5998938;
        Mon, 26 Oct 2020 08:35:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 08:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=OWQatLhFmozM/ZsQcueB5NiYtQA
        q2onEhmu98hEfdDQ=; b=P4gIx0PIvJEsCvxOVi7F7/26qearzxxjFcnqbOMbfb1
        PV/frK/1DFn8ZARl6OFf4rrK42Y/RtVH+MQJgiyRxcxerQrf5b0lMEPA5m0yYMTB
        fb4l1vhfAfpiIdLGEXuSeic/jyEKmU2pACHhHkTcEOPRoJMBVd7mT8xwoqeCZQmH
        /xnjCn0EJKv+ObzWPPug8EE/N9mGr+vceDucaBzHDyGZK1iMn4Kx7ABROnYiboRU
        nUoyfgWPxoQxhp571W/a7mXaNc2wgHeccK4ILyUr2YGx/RzKz3iXQsa6DXHtME6O
        kWMGa2ebO6JrxCyx7fSpGSy441tpYhX6c7buoX1kSGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OWQatL
        hFmozM/ZsQcueB5NiYtQAq2onEhmu98hEfdDQ=; b=IPO7MiHN7OQGLjXrrQcRw/
        CosF649E0keB+bSJh7esRytApOfRzVM/TKkBiaMkMHApVCm4GWuZcIgGWxIaQgOF
        Iy5x23d2x9bgzczs8CDXCNvcyTcF/ThbIeg+EDBRjHonhvaqzZXntMcgBy+awA+1
        pK4iVpqTjrcwnJ0iEsfozvGKdL5W5FwFiybu8FSfJp42w+cwP6Q05+5fmIbcA0rW
        ase1RInF19UItMSec5//3rHbvDQNb3eLXzWDTBjz+HafA1wQV04Z+HcOzBMb6s5x
        ykFa1MF++mKdy5OqmhO5/lFwHdMxVZYEDO66oZeU5nFNJqhYX1cyYtfH4DxYLa6g
        ==
X-ME-Sender: <xms:mcKWXwldQF-B1raQREgk4FIkjF_ugVnNepxIYUCpi7Mx1T-noIcXLQ>
    <xme:mcKWX_3OPzzb0zBevyzyWlFde470nNUiyWMH8Kd1Pswik5Fpdb9TA9-q8MoJYcgUx
    bU2WfUHzxKqiV79LnE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mcKWX-rHvin39259-ALijPr3Mj0P-mRJ5MClElFXDj4ZmtYoxZf8sA>
    <xmx:mcKWX8nGcqrpM0yJ9Fugyb5kCMXa6ytLtqU8WPayhQzEP6CNN-Pxxg>
    <xmx:mcKWX-39Bn1kPlZiVbQSBxAbLyVdAwhnWR3NSxwUVeOqRnHzIkRR9w>
    <xmx:ncKWX6_NCk9wUWfA4E6b2t-_-8Cwm39RvH_t9fNKhwRAh4OZerCTBg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 48468328005E;
        Mon, 26 Oct 2020 08:35:37 -0400 (EDT)
Date:   Mon, 26 Oct 2020 13:35:35 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chen-Yu Tsai <wens@csie.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yangtao Li <frank@allwinnertech.com>
Subject: Re: linux-next: manual merge of the sunxi tree with the arm-soc tree
Message-ID: <20201026123535.7p7scuadh2x5wo4s@gilmour.lan>
References: <20201006145637.57d20ba1@canb.auug.org.au>
 <20201008132017.ju5ih5prn4aifeml@gilmour.lan>
 <20201026085421.1536d873@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7t2wl4q3lqyl7ybn"
Content-Disposition: inline
In-Reply-To: <20201026085421.1536d873@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--7t2wl4q3lqyl7ybn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 26, 2020 at 08:54:21AM +1100, Stephen Rothwell wrote:
> On Thu, 8 Oct 2020 15:20:17 +0200 Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Tue, Oct 06, 2020 at 02:56:37PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > Today's linux-next merge of the sunxi tree got a conflict in:
> > >=20
> > >   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > >=20
> > > between commit:
> > >=20
> > >   0dea1794f3b4 ("arm64: allwinner: A100: add the basical Allwinner A1=
00 DTSI file")
> > >=20
> > > from the arm-soc tree and commit:
> > >=20
> > >   7e66a778cb8b ("arm64: allwinner: A100: add the basical Allwinner A1=
00 DTSI file")
> > >=20
> > > from the sunxi tree.
> > >=20
> > > These are 2 versions of the same patch.  For now I am just using the
> > > version in the arm-soc tree ... please sort this out.
> >=20
> > The branch in arm-soc has a build breakage (that doesn't happen in
> > linux-next since the clk tree has the commit to fix it) so I sent a new
> > PR
> >=20
> > Once that PR is in arm-soc, I guess that merge issue will go away
>=20
> I am still getting the same conflict (but between Linus' tree and the
> sunxi tree).  It looks like the sunxi tree has not been updated since
> October 6 ...

Yeah, the PR has never been picked up by arm-soc. I've pushed a new
branch based on 5.10-rc1 on our repo, it should solve the conflict.

Sorry for the inconvenience
Maxime


--7t2wl4q3lqyl7ybn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5bClwAKCRDj7w1vZxhR
xZ9DAQCQtJoAOb4OFB/Q4a/cWeyETlvXUauWCymo8SNl4099DwEA6WDVdM/znPlW
GGiynDekxPX0RkXaGi7sCoVnwfLTxw0=
=WdKH
-----END PGP SIGNATURE-----

--7t2wl4q3lqyl7ybn--
