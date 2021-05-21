Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A5938BAFF
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 02:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbhEUAtv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 20:49:51 -0400
Received: from ozlabs.org ([203.11.71.1]:55317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235121AbhEUAtv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 May 2021 20:49:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmSdm2gdlz9sRR;
        Fri, 21 May 2021 10:48:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621558108;
        bh=U07ibIwPyAT4fMaPrBpkdalMUCC+z8EkVav/P1eW6Eo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=l2CYa4/cYADDpzcZhOIPvTG4uM0PPD82a0KgnHbrwtcxn/tbmg63eUeW01LjxZ/wt
         rNH0V8azKiEpYXuplJ1Yw006vjkz6o4iFRR1tQx5BD0KveZ65jJlO6nzJlmpwy9xrQ
         K7lTMuEk4dn3BRYgWMI4RnnIm/3yjDksM8um3qv89LXyn3HPQz+9Gv3JsyId/oGRM4
         4ohov+46x3F6OMuMlliLb94svpMyBoeZ5x581KSX5+nLMoIpQRM8ZR4QT+SHdEty8H
         V94AIoylJZchmIIPYhKLDxgbSi7UbEWWxQ+rGlTjeRSglHTQy5RJfo2bN8SNwce93S
         MnimWfPjaYX/Q==
Date:   Fri, 21 May 2021 10:48:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210521104827.1498c56e@canb.auug.org.au>
In-Reply-To: <20210511094649.41e707c7@canb.auug.org.au>
References: <20210511094649.41e707c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OFKK3EEHEazs=LRjmoBzKy0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OFKK3EEHEazs=LRjmoBzKy0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 11 May 2021 09:46:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the v4l-dvb tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/media/platform/exynos4-is/media-dev.c: In function 'cam_clk_prepa=
re':
> drivers/media/platform/exynos4-is/media-dev.c:1287:6: warning: unused var=
iable 'ret' [-Wunused-variable]
>  1287 |  int ret;
>       |      ^~~
>=20
> Introduced by commit
>=20
>   59f96244af94 ("media: exynos4-is: fix pm_runtime_get_sync() usage count=
")

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/OFKK3EEHEazs=LRjmoBzKy0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnA1sACgkQAVBC80lX
0GxqvAf8DWzqZIyNT15xeURrds7HyqK1hcHoYHBg5SqrUeYZTLQhqQ7SLLWcrwGI
r0VfdjagZCCU5PnYHJ0+JeomsmeGvvaWiv05PAw+FveyosAI4m1POHo93iS09PPk
RZwmz2J232ZrOzfUmIocjQx0HVSnCZgaRuLBVG0kG4ZLsJaUxjvtJxvHrVmsAdqW
OZdAXxSyeMSY5XJRGpj+LfviEbPuUIYorn6NGuTi3yy5AOnQmjfq0SlYi682mGhJ
wd6Uv48EsxNulamLppguoSaRuJ0PUXY/kMFOGtsIcHwyu0ARezGLClW4GcMRN/qQ
aS04H0pPkqSdKyREk9Sxcou+nYCvFA==
=r6sA
-----END PGP SIGNATURE-----

--Sig_/OFKK3EEHEazs=LRjmoBzKy0--
