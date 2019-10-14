Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995D2D58E8
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 02:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbfJNAMd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Oct 2019 20:12:33 -0400
Received: from ozlabs.org ([203.11.71.1]:48711 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729450AbfJNAMd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Oct 2019 20:12:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46rzXB4bDMz9sP3;
        Mon, 14 Oct 2019 11:12:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571011950;
        bh=q74D+MFjNqBIEAS6oZBzpX6cMPiumc8l4RSDT5m31N0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZkcShoruEFGdM6CwcgDnElvAM3CMDxfWmCsDBXDEXZLZhZQ0ixH9F/Td2N29XIrmT
         GtVmcIY9yx+AETDfZdX7DG/6D+XkF/rZPe7COcNYZqFwhT2fbKHAEUmzJ4ua3RRpRc
         vQIGk2rgX82sS4lt+y4nc3sPO6Hrn+EggjmKS57zF4NwXiQBxg7r27u33vCCl33lBZ
         HQh7Ss0ImFRODPeGHM6ih4GECjmdfxSIDD9zAS+YJ0boencdiBMsxJVeogTNIz1w9L
         QlFaCg2uIlzVkMM7HtVZJf/gqM7p7mx9eiYqymxyy2b2JFEmb0RCG29j6csphBVZ1N
         +NEB+UxVeLp7A==
Date:   Mon, 14 Oct 2019 11:12:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191014111225.66b36035@canb.auug.org.au>
In-Reply-To: <20191008103045.2d4711e2@canb.auug.org.au>
References: <20191008103045.2d4711e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IynAOh40NwOY6_v=aXfuQML";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IynAOh40NwOY6_v=aXfuQML
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now a semantic conflict between the drm and v4l-dvb trees.

On Tue, 8 Oct 2019 10:30:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

drivers/media/platform/cec-gpio/cec-gpio.c: In function 'cec_gpio_probe':
drivers/media/platform/cec-gpio/cec-gpio.c:262:2: error: too few arguments =
to function 'cec_notifier_cec_adap_unregister'
  262 |  cec_notifier_cec_adap_unregister(cec->notifier);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/media/platform/cec-gpio/cec-gpio.c:11:
include/media/cec-notifier.h:98:6: note: declared here
   98 | void cec_notifier_cec_adap_unregister(struct cec_notifier *n,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/cec-gpio/cec-gpio.c: In function 'cec_gpio_remove':
drivers/media/platform/cec-gpio/cec-gpio.c:272:2: error: too few arguments =
to function 'cec_notifier_cec_adap_unregister'
  272 |  cec_notifier_cec_adap_unregister(cec->notifier);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/media/platform/cec-gpio/cec-gpio.c:11:
include/media/cec-notifier.h:98:6: note: declared here
   98 | void cec_notifier_cec_adap_unregister(struct cec_notifier *n,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> Caused by commit
>=20
>   10d8f308ba3e ("cec: add cec_adapter to cec_notifier_cec_adap_unregister=
()")
>=20
> interacting with commit
>=20
>   7e86efa2ff03 ("media: cec-gpio: add notifier support")
>=20
> form the v4l-dvb tree.
>=20
> I have applied the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Oct 2019 10:26:05 +1100
> Subject: [PATCH] cec: fix up for "cec: add cec_adapter to
>  cec_notifier_cec_adap_unregister()"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/platform/cec-gpio/cec-gpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/cec-gpio/cec-gpio.c b/drivers/media/p=
latform/cec-gpio/cec-gpio.c
> index 7be91e712c4a..42d2c2cd9a78 100644
> --- a/drivers/media/platform/cec-gpio/cec-gpio.c
> +++ b/drivers/media/platform/cec-gpio/cec-gpio.c
> @@ -259,7 +259,7 @@ static int cec_gpio_probe(struct platform_device *pde=
v)
>  	return 0;
> =20
>  unreg_notifier:
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  del_adap:
>  	cec_delete_adapter(cec->adap);
>  	return ret;
> @@ -269,7 +269,7 @@ static int cec_gpio_remove(struct platform_device *pd=
ev)
>  {
>  	struct cec_gpio *cec =3D platform_get_drvdata(pdev);
> =20
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  	cec_unregister_adapter(cec->adap);
>  	return 0;
>  }

--=20
Cheers,
Stephen Rothwell

--Sig_/IynAOh40NwOY6_v=aXfuQML
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2jvWkACgkQAVBC80lX
0GxhMQf+IOH2N5GUA3sEEihwFNdRMxh4bjsFiylBGrj+lpSR809XXKFgcKWndm4W
X8skcXPQJ9jcK+C7JOFRaKyvtqgCASaDdx0vHjT7LzpoHXxyRcaeUoDiXFFkpQN3
YiVPQphuHTqdCKcqGv5WEXM673PL/WzW1LmVWpMrHDdOkOiC2R2s0PUwmJ/p28CC
gSqZeEKU4Iyzdb+kPwrLetiwElqEEuXCGCAdXyDNnVU4pi7k6QMGzgN3dHsmE7Ip
lgFBBDdE4uKXloOGo56jTmChRqLeK9bc+T6JlnL0ygQyQkxZsLTXwHaEaGWXoyxB
iPjzVKtce5H34SnRjJhjSHqVH4P/1w==
=NVb/
-----END PGP SIGNATURE-----

--Sig_/IynAOh40NwOY6_v=aXfuQML--
