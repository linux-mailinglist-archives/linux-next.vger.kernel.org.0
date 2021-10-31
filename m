Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FC9440C87
	for <lists+linux-next@lfdr.de>; Sun, 31 Oct 2021 03:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhJaCYh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 Oct 2021 22:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhJaCYg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 30 Oct 2021 22:24:36 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E4FC061570;
        Sat, 30 Oct 2021 19:22:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hhg0P3lyqz4xZ1;
        Sun, 31 Oct 2021 13:21:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635646923;
        bh=DUO9TOyM77Bq9mupg3Q1Mb7ti0F3HKcOqB/TwJSBtS4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lpJmMXvZ3/rXvokfTgJlBRpbu0I2XmKDaJdfnt1n1id4WLANBhA6oaWgtPdChQzLG
         fAU9Rzrp6OZv3lZ88E9Trj7I4w5yMPtB0isrSKWWjHTfsMn4Gm16izveTCRdW/WMRh
         marTOmz51e9GCkdOOEJqEz+9JJb8qTmMvBuPuj4LdbK1UvAQ4rxkHvc3N0ykt7qd4I
         eZ9nfUgv2QwJ/n0e4rJfgVYCkUY1+z4OvSzKcBq543GxY9XRHdVBVQGkfPy8xGex2W
         yV/q5VkReU6//CMUimBk1LzcrJW49CUi7VO4lHYjfbUAX2Rfg4FUIHt/38qwtQ/5PQ
         UpXOBX1DKr59g==
Date:   Sun, 31 Oct 2021 13:21:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <greg@kroah.com>
Cc:     Marcel Ziswiler <marcel@ziswiler.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2] drm: import DMA_BUF module namespace
Message-ID: <20211031132155.7dc972e8@canb.auug.org.au>
In-Reply-To: <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
References: <20211027212506.3418521-1-marcel@ziswiler.com>
        <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tw5wYLogO=aZ9rmUAiMowQ4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tw5wYLogO=aZ9rmUAiMowQ4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, 29 Oct 2021 20:51:52 +0200 Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>
> Am 27.10.21 um 23:25 schrieb Marcel Ziswiler:
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >=20
> > Today's -next fails building arm64 defconfig as follows:
> >=20
> > ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from
> >   namespace DMA_BUF, but does not import it.
> > ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vmap from
> >   namespace DMA_BUF, but does not import it.
> >=20
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Fixes: commit 4b2b5e142ff4 ("drm: Move GEM memory managers into modules=
")
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> =20
>=20
> I added this fix into drm-misc-next. Thanks!
>=20
> However, I had to import linux-next while doing so. 'Git am' did a
> 3-way merge, which may result in a conflict when the fix reaches
> linux-next again. I also updated the commit description.

You cannot merge linux-next into any tree, sorry.  It rebases every day
(and so do several of the included trees).

Your fix patch should be sent to Greg KH and Arnd as the build failure
is introduced in the char-misc tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/tw5wYLogO=aZ9rmUAiMowQ4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF9/cMACgkQAVBC80lX
0Gx7VAf/doFfX4Te328O/6riL+zHiG+zdqagH9eFcsnoNyguGQvM2KXmYLwErGC2
/uKyTlihOeaU2o3bZmNhoEYxzeV/5s+owf4n+KNNy5NWQrtOy+dWBX70rkyhLbGU
+DOyfN6slXSkB4S7WkbbP83TMDkGWIaypa4OcOq5wq7Chc6lxwzk93XSVILxgrJO
2dNbhL72lzpj+ug6hwzJM6cLdk7Vqm3JWHZuHJwxAkJBUfF6wX/WIyIy2NP6gb/l
i7H7GLohSFcV5BC8rpxG5Mq06FHhrl+Jl97tr3Do+8vu4Eq4nZFGefaGdIELSeX5
Pz3x2dv4AncEN2lIwoQDnkWYfbmxkg==
=4Zmp
-----END PGP SIGNATURE-----

--Sig_/tw5wYLogO=aZ9rmUAiMowQ4--
