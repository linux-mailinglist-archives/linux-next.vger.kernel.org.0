Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D232FFD6B
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 08:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbhAVHai (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 02:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbhAVHad (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Jan 2021 02:30:33 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6ADC06174A;
        Thu, 21 Jan 2021 23:29:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMW9l4mt0z9s2g;
        Fri, 22 Jan 2021 18:29:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611300590;
        bh=+sU56v/j7B/BMjzYJrqFxjhvQY3A0vL+IeSq9RxWC8E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pNFuX/nv9JpIxhg+yzYm/hMCuEevyeivW4N1AbD6+ONqcKZarHSvPgZT/TqOklD6o
         FZL/8hALb+9b/P09j0FyvB4bIql0U/5eNCFEqMrxFc+/c6nEr6wYZmrh8UVfIuDCJt
         jsb7Z+p6TQLD4MbWlCvUmb48928Xodps+4R7QlI79Df/FIj2R7CwG1QxfTDrF5OClW
         /U5s1iDMegGaA1UYInZoPrFnCjtMyPA80gjEBMmgBuOk4OPVwHZgQLpfou/n6oRxlq
         rhPaJ1+yLjIKjNC5U1kT8cO03QeRKS8N0KHJIHkWIT+GxmA3Zfb0obC5ctkLrLr0YY
         HwE01RPK+96EQ==
Date:   Fri, 22 Jan 2021 18:29:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20210122182946.6beb10b7@canb.auug.org.au>
In-Reply-To: <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
References: <20210122115918.63b56fa1@canb.auug.org.au>
        <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ty/_2YWrLOgQlLIyr8B2db2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ty/_2YWrLOgQlLIyr8B2db2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 22 Jan 2021 08:17:58 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> Hm that has been in drm-intel-gt-next for a few days, is that tree not
> in linux-next?

It is not.

These are the drm branches currently in linux-next:

drm-fixes	git://git.freedesktop.org/git/drm/drm.git	drm-fixes
amdgpu-fixes	git://people.freedesktop.org/~agd5f/linux	drm-fixes
drm-intel-fixes	git://anongit.freedesktop.org/drm-intel		for-linux-next-fix=
es
drm-misc-fixes	git://anongit.freedesktop.org/drm/drm-misc	for-linux-next-fi=
xes
drm		git://git.freedesktop.org/git/drm/drm.git	drm-next
amdgpu		https://gitlab.freedesktop.org/agd5f/linux	drm-next
drm-intel	git://anongit.freedesktop.org/drm-intel		for-linux-next
drm-tegra	git://anongit.freedesktop.org/tegra/linux.git	drm/tegra/for-next
drm-misc	git://anongit.freedesktop.org/drm/drm-misc	for-linux-next
drm-msm		https://gitlab.freedesktop.org/drm/msm.git	msm-next
imx-drm		https://git.pengutronix.de/git/pza/linux	imx-drm/next
etnaviv		https://git.pengutronix.de/git/lst/linux	etnaviv/next

--=20
Cheers,
Stephen Rothwell

--Sig_/Ty/_2YWrLOgQlLIyr8B2db2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAKfuoACgkQAVBC80lX
0GxDIgf/bj7glZsQ4jBfYddzSje7xWzy4RX2JtpP7EHkmQxVoFlr7XsV6HLBt6lV
1Uo2w7k75Q9EG4cHJ2KIHO1qwxwOlA0ZXLr/a5moxKORSYOC26IHV2ikpjNPzdl4
aqcK6NS7AX0ymDj+YZEC0MPx/TQAG80Frz1XntuV48MJkFwZaIfpcxj2T3f4h+lK
J30Don9wFbhcL/z0CX3EopQhXNAPAFQ68B0w09dIunadmBGK9IhbSyZCG40+d5XO
LnIOJJ1k+odXmVyKQI8jjG7Crk/RRZ4u7vnk10ueSk0gro2oH+A7OWFnVUo0667j
4wkal1M7G4CgRSZHeUIQMB/jWUqiXQ==
=1/em
-----END PGP SIGNATURE-----

--Sig_/Ty/_2YWrLOgQlLIyr8B2db2--
