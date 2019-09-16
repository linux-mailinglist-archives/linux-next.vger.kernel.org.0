Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6197B43E1
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 00:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730626AbfIPWS7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 18:18:59 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46534 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728917AbfIPWS6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 18:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LoptWHwpijT7MWtOlC9PckiSoFJqym7PhES1gwSMA20=; b=g3aCrtWnX6AbTSRElvNW1u7R3
        OIVCWt57T7dH5LwPrSvYhxiLG/qFGQgE1W9EE1PUPw38kVaHTiWGLXTaC345rRsY8xRQFeNT+XTo/
        53CXypLZpGGF696TwSO5wx+syljydzYvAz5pA8FPyWdNNVSRqb079bUMjCHH2V3h0tcAo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9zKf-0005rw-6I; Mon, 16 Sep 2019 22:18:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 4D5582741A12; Mon, 16 Sep 2019 23:18:52 +0100 (BST)
Date:   Mon, 16 Sep 2019 23:18:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Roman Li <Roman.Li@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Jun Lei <Jun.Lei@amd.com>,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xinpeng Liu <danielliu861@gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the kbuild tree
Message-ID: <20190916221852.GN4352@sirena.co.uk>
References: <20190915214748.GJ4352@sirena.co.uk>
 <CAKwvOdkZ9_qp9V=H6tjpLyscct+g-aPqn-dPj8R+CGF4Rt_-Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xhJxprRH8Q4al5cy"
Content-Disposition: inline
In-Reply-To: <CAKwvOdkZ9_qp9V=H6tjpLyscct+g-aPqn-dPj8R+CGF4Rt_-Rw@mail.gmail.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--xhJxprRH8Q4al5cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 02:06:46PM -0700, Nick Desaulniers wrote:
> On Sun, Sep 15, 2019 at 2:47 PM Mark Brown <broonie@kernel.org> wrote:

> >   0f0727d971f6fdf ("drm/amd/display: readd -msse2 to prevent Clang from=
 emitting libcalls to undefined SW FP routines")

> ^ this patch is now broken due to the SHA above it.

Right, all the sites that didn't conflict are broken.  Like I say I
think there needs to be some coordination with the Kbuild changes here.

> b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> index 2b399cfa72e6..ddb8d5649e79 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> @@ -19,7 +19,7 @@ endif
>  CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse
> $(cc_stack_align)

I can't do anything with patches without signoffs so I'm not going to
apply this as a workaround.

> > + ifdef CONFIG_DRM_AMD_DC_DCN2_1
> >  -CFLAGS_display_mode_vba_21.o :=3D $(dml_ccflags)
> >  -CFLAGS_display_rq_dlg_calc_21.o :=3D $(dml_ccflags)
> >  -endif
>=20
> ^ this endif should not be removed.

There's an endif left there?  Someone sent a patch, I'm going to apply
that.

--xhJxprRH8Q4al5cy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ACksACgkQJNaLcl1U
h9DgwAf/Xz3C2AwblpHXUfgFr/B5z7uRUFylQhXku4Hsp+7VOtSdSeK7ww8Iff7G
aWROHIYOXKHunNlrmT95MPOEgfcPHNfPf4HGQCRP2lpT2pzQ7esSx7E8UUnnI+7A
fTTutRidlQWwM1BpBJZOOXlN4dOzmyrJ/vsx/H3fpEtaYKTD+veCDdIXpF4i8aN+
nw+LIaWQSYMgLidrok4kTQcGXZokWMYpz+5CNXtxjfV9j9UpSI1/6WucGMps9ER1
3CFlE7xaH5R7DKJD9DBEzVNMbcX6QaCFoyLG4Qhxyn92pQXIfqhekI7IQ2iyilTr
j1cEYeM1KP40iCJRtqjwnEP6OSmIUg==
=icNP
-----END PGP SIGNATURE-----

--xhJxprRH8Q4al5cy--
