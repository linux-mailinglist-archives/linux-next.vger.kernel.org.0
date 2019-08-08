Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B218575F
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 03:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388448AbfHHBBN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 21:01:13 -0400
Received: from ozlabs.org ([203.11.71.1]:47775 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387536AbfHHBBN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 21:01:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463qnK0hXRz9sN6;
        Thu,  8 Aug 2019 11:01:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565226071;
        bh=MsMFPAr56dFY8txzKEu0S50XsC7x6UWlqVj387uslpE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ul9uHSv2Ta3v3XNn4l0MbL7N55D+LloSbQoLFOMCydtRMR2w64dbN2GNiSq4Q4iVL
         auqDYaV3U9Rm736O4eZ4XEyF4qFkBDRqIStHXY6JBXedpNhm+xN+qFWHlFxxC3gIBo
         qwHRKRVFPaQ8JrQPwJgM4lPDerygjqIQ1eLt0/CI54EAHMhhE/ddu7qADHl0gKuJUU
         9Y1OC96+/Cm/h5LBJgyNZmS8yopeCvRXy7dA9DGXoFVb16PEGN1lc2TwKpFa78KhVE
         J1VSHRjVp7fVo+kDdHjWaOLEaOFkximdMWSIIMvfnBswO0y/s9OtWGnMarmYLWB2LJ
         qxIFiOKzVJ5IQ==
Date:   Thu, 8 Aug 2019 11:01:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        kishon@ti.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, lkft-triage@lists.linaro.org
Subject: Re: Linux next-20190807: arm64: build failed -
 phy-rockchip-inno-hdmi.c:1046:26: error: anonymous bit-field has negative
 width (-1)
Message-ID: <20190808110108.2db1b128@canb.auug.org.au>
In-Reply-To: <CA+G9fYvehn=5Rn0RHjFvCc1pCDFTUtxNeR11CQjD6rjM53D4ig@mail.gmail.com>
References: <CA+G9fYvehn=5Rn0RHjFvCc1pCDFTUtxNeR11CQjD6rjM53D4ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PnbChS=XA/gL0CFTVs6ccQo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PnbChS=XA/gL0CFTVs6ccQo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Wed, 7 Aug 2019 16:48:15 +0530 Naresh Kamboju <naresh.kamboju@linaro.org=
> wrote:
>
> Linux next 20190807 arm64 default config build failed due to below error.
>=20
> /drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:1046:26: error:
> anonymous bit-field has negative width (-1)
>                 inno_write(inno, 0xc6, RK3328_TERM_RESISTOR_CALIB_SPEED_7=
_0(v));
>                                        ^
> ../drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:201:50: note:
> expanded from macro 'RK3328_TERM_RESISTOR_CALIB_SPEED_7_0'
> #define RK3328_TERM_RESISTOR_CALIB_SPEED_7_0(x)         UPDATE(x, 7, 9)
>                                                         ^
> ../drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:24:42: note: expanded
> from macro 'UPDATE'
> #define UPDATE(x, h, l)         (((x) << (l)) & GENMASK((h), (l)))
>                                                 ^
> ../include/linux/bits.h:39:3: note: expanded from macro 'GENMASK'
>         (GENMASK_INPUT_CHECK(high, low) + __GENMASK(high, low))
>          ^
> ../include/linux/bits.h:24:18: note: expanded from macro 'GENMASK_INPUT_C=
HECK'
>         ((unsigned long)BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>                         ^
> ../include/linux/build_bug.h:16:47: note: expanded from macro
> 'BUILD_BUG_ON_ZERO'
> #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
>=20
> Config link,
> https://storage.kernelci.org/next/master/next-20190807/arm64/defconfig/cl=
ang-8/kernel.config
>=20
> Build link,
> https://storage.kernelci.org/next/master/next-20190807/arm64/defconfig/cl=
ang-8/build.log

I think the patch that caused this has been removed form linux-next for
today (it had other problems as well).

--=20
Cheers,
Stephen Rothwell

--Sig_/PnbChS=XA/gL0CFTVs6ccQo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LdFQACgkQAVBC80lX
0GzDtgf/aEnfScThkUKIL3HX/GJiKdIkq1RrUzMyRCDBGdYLXLEqa5AkuWd6x0qb
9MkNVLdg6ZatO2+T1JMstagNLw6X8ts3zQczqd/10e1mBlB2cw2jdO7jbLRmEO0m
fz2igYmPkgFEN2ErYfwxdx0emqHpLkt0unV6TfSGNIt83isODNkH0YKS7LrSK+PK
FDGj+eCgSFt8xjQ4Cpz+4XMngun6OMn8nRVCGj0kcRlDBvtSavxzQCFmI9HzF7Yn
fHQ85Zg7m17qilNAJ+8HgjA5t5u18471SQxsgPujsuP1iWvRgdA5hzFujmFLpLDf
Jxlds7woEgx7Q41L5gg56wTFwJs8Sw==
=u6RM
-----END PGP SIGNATURE-----

--Sig_/PnbChS=XA/gL0CFTVs6ccQo--
