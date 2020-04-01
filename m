Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D4319A6B3
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 09:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730426AbgDAH5J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 03:57:09 -0400
Received: from ozlabs.org ([203.11.71.1]:36853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731850AbgDAH5J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Apr 2020 03:57:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sdnw02FRz9sRf;
        Wed,  1 Apr 2020 18:57:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585727828;
        bh=uaZXpbcktI4nhxoWwcmc0W6HK6J4xMMOw9PQDeoXi2g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Bh2qGyCg6Bf/4eZ82jvzwDp8FxZPnJyxs5L02gRtLnW8gSDc2SbANbX2Oqp72D/Y2
         Ru1q8K3YC2PN/exQtn8HyGhq3uI+RkRJk4kmGRz24yd4iPRGR44q/eOlW0dMxZ16uz
         MvRuRPdQL/PkPMNsjmy0c1U6Kdpvczcxr6rdssQHa/Zt6dCGsND8k17bKN1pouKZot
         ZZhkFLGBotopTEe7jGmAZ7kQTmep8z5RNRUZQrERPC7pAsvBy9vePShDBJPk6tMSd2
         QtvXzl1XLzvrls/NknownTosjLDAYgMNCSmp222cDw4LFEcJ552cQG1aoI7IIvBQUq
         O6JQFQSgBIWpQ==
Date:   Wed, 1 Apr 2020 18:57:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Message-ID: <20200401185706.464bee26@canb.auug.org.au>
In-Reply-To: <CAMuHMdXFHWFucxZbChxaM6w4q9Gu5pccMBP46N4Av1E2rNKddA@mail.gmail.com>
References: <20200401151904.6948af20@canb.auug.org.au>
        <CAMuHMdXFHWFucxZbChxaM6w4q9Gu5pccMBP46N4Av1E2rNKddA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/horQwCCD3=O_VL_8S_LhHaQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/horQwCCD3=O_VL_8S_LhHaQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, 1 Apr 2020 09:49:00 +0200 Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>
> Thanks for your patch, which I assume is a quick build fix.

Yep, rather than reverting the other patches again.

> I see LinusW has already applied it...
>=20
> > --- a/drivers/pinctrl/devicetree.c
> > +++ b/drivers/pinctrl/devicetree.c
> > @@ -103,6 +103,7 @@ struct pinctrl_dev *of_pinctrl_get(struct device_no=
de *np)
> >  {
> >         return get_pinctrl_dev_from_of_node(np);
> >  }
> > +EXPORT_SYMBOL_GPL(of_pinctrl_get);
> >
> >  static int dt_to_map_one_config(struct pinctrl *p,
> >                                 struct pinctrl_dev *hog_pctldev, =20
>=20
> As exporting symbols has its (space) cost, and of_pinctrl_get() is a tiny
> function, what about making it an inline function in
> include/linux/pinctrl/pinctrl.h instead?

Makes sense to me.

--=20
Cheers,
Stephen Rothwell

--Sig_/horQwCCD3=O_VL_8S_LhHaQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ESVIACgkQAVBC80lX
0GxUBAf/UF08ITAeC5ymlwSt/bIRk+QQQ4XDhvCh03sypQxzc+5PFaTNanv+nZtS
OHMSe5343RHvX6FFWO/jh0IRdVicLhWBGJmqWscxbuVs2wepMAz7cVgiW+L75g3Q
JNOHFLClPWeeIn2RYTGQRPojASMfjUbarGZcUzLgOtV+vjARmGxFILuRXO1lpTck
urOm1i7Djwa+QdAX8PuYU/z4hI24S7aytnXTtBgqPTDdyUribpPeNipe1P51Ahdi
KS640N3SdpOktuyld1sk29GgOhaTC+pMYPbwlRJ8Cg7mCIH5pjjPwnAsbvnQhPkv
WHsNDXy0cUxfPCRx9gSpknQDgZfPDg==
=gRhl
-----END PGP SIGNATURE-----

--Sig_/horQwCCD3=O_VL_8S_LhHaQ--
