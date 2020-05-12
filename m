Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA04A1D0063
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 23:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgELVML (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 17:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728379AbgELVML (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 17:12:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E60C061A0C;
        Tue, 12 May 2020 14:12:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w7so17720342wre.13;
        Tue, 12 May 2020 14:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=maujQQsZqVOh5dXh+A73CS4R9OgbmTuwmPlNeQ2JBZk=;
        b=u6rM9zM5ZIb7qd9/SfKbbTdPkeT7FIprdsz+fF/nff6zPcVgRHswByWxyWec1PgIUK
         RNGFKhwWSiN9rObXRtIAS9zC9SkjzR0L5jdrUcz7Q42tH3lPIKxGMFaHt3fvIpy4v3XQ
         BFc9NAnMMRqTN8QrkR8mg2oJGwVeglvDlViOl803ynnB7NqRdPem0a2XX7Y/uiqcDb3g
         TwaKR2aVkK+q82VIut52ai7y3+iyrlIf2erEDIioFOavlUMCd5/c+6LnjHxzsyM0m9bH
         QvpJqJ8Ci+FqH0II0wcrYfAyYE98lDE/BjoU2XGnUidI+3GmJEfiKcrf7a8pUMQ7Gwcc
         PUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=maujQQsZqVOh5dXh+A73CS4R9OgbmTuwmPlNeQ2JBZk=;
        b=iu4tUQ+6V728/t3tVHwrwaXeMfPcrdbkMa3jNchLYUk6EsPCF5DW6so3oAu59C8ZP6
         1mEdcxWeZqO/abR3S7lKKB+AiuYjTNOs2Hj7Epa1awt2Sbp/HthdeQLL5frc1gvhFht3
         kux7Bza15x9iiikueV6SmzY3oHs6zNk5IdSWMspCIKJsW9WuuaotRl9Z2CxIqte61dy5
         criH4uKU1t0tp88y26qeoZleiFUkB138SuRvk9Xxuvikcit7IhL2kqO1npc8yASgRClP
         uIX3CkGpIzNTLDU+5VySCLGeFiKQclB169u1vzf90HsSfMTu0x9x/oca3bFPynoJ0DdP
         8uQg==
X-Gm-Message-State: AGi0Pua/MBpNW4ICsxhSEtY8vCMD9+B5Uwup03smQJhvEclYZ8HwtJkn
        AHTUTvhsfb4xZcIfeJ1ebL8=
X-Google-Smtp-Source: APiQypJltmF4OjY1U4GlLKTpg/9mJ4tgnscsc4JAEAG7DNJPfL4rbJaBKdCe8DfoukVBk+j0f/YkKg==
X-Received: by 2002:adf:810a:: with SMTP id 10mr28017247wrm.101.1589317929860;
        Tue, 12 May 2020 14:12:09 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id q9sm9090273wmb.34.2020.05.12.14.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:12:08 -0700 (PDT)
Date:   Tue, 12 May 2020 23:12:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: linux-next: build failure after merge of the tegra tree
Message-ID: <20200512211207.GD3864641@ulmo>
References: <20200511085114.0cde64d9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline
In-Reply-To: <20200511085114.0cde64d9@canb.auug.org.au>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 08:51:14AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tegra tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: "host1x_driver_register_full" [drivers/staging/media/tegr=
a-video/tegra-video.ko] undefined!
> ERROR: modpost: "host1x_device_exit" [drivers/staging/media/tegra-video/t=
egra-video.ko] undefined!
> ERROR: modpost: "host1x_client_unregister" [drivers/staging/media/tegra-v=
ideo/tegra-video.ko] undefined!
> ERROR: modpost: "host1x_driver_unregister" [drivers/staging/media/tegra-v=
ideo/tegra-video.ko] undefined!
> ERROR: modpost: "host1x_device_init" [drivers/staging/media/tegra-video/t=
egra-video.ko] undefined!
> ERROR: modpost: "host1x_syncpt_free" [drivers/staging/media/tegra-video/t=
egra-video.ko] undefined!
> ERROR: modpost: "host1x_syncpt_request" [drivers/staging/media/tegra-vide=
o/tegra-video.ko] undefined!
> ERROR: modpost: "host1x_client_register" [drivers/staging/media/tegra-vid=
eo/tegra-video.ko] undefined!
>=20
> Caused by commit
>=20
>   423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")
>=20
> I removed CONFIG_COMPILE_TEST for this driver for today.

Thanks, I've now added a patch that drops the alternative dependency on
COMPILE_TEST because TEGRA_HOST1X doesn't have stubs for any of these
exported functions.

Thierry

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl67ESQACgkQ3SOs138+
s6GybA/7BU14TQ4Z1NzCM/jESg1chlADWIIY9m/Ql7EsFHBHJleWeAVF0QEdVGgS
j71Y1+T2NNtOThBeCjIbF4q9WPoJsQLG1R8vEAaHTqj6qND4lvtLXhcOqa3uKubl
MCWY4FHqZyYc6W7y11PwiJr5C7kuMrKkz+F4Zyp7XHRllUFVukcBk4W38t+3XjcB
FY62f/NGPjNP8yzkjRR/PHz1FdeeqKmXNr1z1Rrk1HWG+Q+BPBMUuwQAVBQ9as7W
C4M3CobcHeaXimwo4Vi7magGpxAnWunUmycDlsIrXvLRtPBWoyfmUo/Y8DjZMWvP
SA0XvTgsLEAZtBAwmKoRy16WK8S+ZBhP1VZnIkz/1vsfXjanCgBEBSaZNtOaKL72
Cau22TBLMyU7mDQ5boy5PCmdkt9gbmVX74qb19Nfq7UXXRpMddpBqsbMoD9+/DGs
usqcv/TSN6+MrI699gQj7MzlUPQjZxgjjs8pJlOJqVRrMWhbnDcA/9Cuy0kcUrbB
s43SCI2tP8Fb4WQcwR17VCGsKBLfo+tw/QwFC9f2kzFTZC5sWmiqOqYyfzF3bgp6
TYSgZ74MoeLaFvwmFFnHBEcrWp5ZIBx8zqRybsA8qXyGM9Xl/9nuW9ko+zSfAA30
NRU233oMrsuemqLiM3OFk14x3f92qzkBnUFyRIyEouWGsaiczLk=
=1Ja3
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
