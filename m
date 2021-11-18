Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0E14551A9
	for <lists+linux-next@lfdr.de>; Thu, 18 Nov 2021 01:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241922AbhKRAc4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 19:32:56 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:35791 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbhKRAcy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 19:32:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hvgfn0Mz8z4xbs;
        Thu, 18 Nov 2021 11:29:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637195393;
        bh=Z1cEifPobgLU2OIv1QjpAXLWMTBmer7BKS5tz9FkZmA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V8WIrf8VCk8poxAMN9Y8vojaONclJKVIzFGIuS/2b3dH5rW1D9BnKRG44WnMEobhN
         gZie623aaR8AnegVkRjsLEwReySIlQEoGLq99p2p4pYpKl3OCEnqoUjzra9LAXwaGo
         xQDPs8qyU/9Y5tFTMqvSZC+NnoxOk7Fy6rSnep5RdZ97xNMJ0VZWRq2Gmn4ITxsv/d
         l3Shy6Xm1q6gMW8WQ6CoI+QkkPZsYUHVnGbn8xgxsw/PT+DdyBSuQmv6TkP9NxaM4y
         tdlOKnamghXv6W2kXXXLWhidoc5utK9xE3fHbfX8sEYFxpiBP8amqmE8ZU6v6du4av
         Rj+UYR61by5uw==
Date:   Thu, 18 Nov 2021 11:29:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <20211118112951.2b788952@canb.auug.org.au>
In-Reply-To: <20211116105112.4c99853d@canb.auug.org.au>
References: <20211116105112.4c99853d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ICAc4B1ZmPdCc9DjjP3lLPI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ICAc4B1ZmPdCc9DjjP3lLPI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 16 Nov 2021 10:51:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the gpio-brgl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpio/gpio-xlp.c:300:16: error: 'GPIO_VARIANT_VULCAN' undeclared h=
ere (not in a function)
>   300 |  { "BRCM9006", GPIO_VARIANT_VULCAN },
>       |                ^~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   ea708ac5bf41 ("gpio: xlp: Remove Netlogic XLP variants")
>=20
> I have used the gpio-bgrl tree from next-20211115 for today.

I am still getting this failure :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/ICAc4B1ZmPdCc9DjjP3lLPI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGVnn8ACgkQAVBC80lX
0Gwpogf/e/nqopUR0IM+ADSvb0zNsc7oQvCIed7mQoaalcNpvjq1PLs0nqBOOPOB
ypGmBqB2P88h9TlcKPWzGdBjQczUdu4tUiuNTIhkNB1Kx8dC0iePDTedvYYCVHEq
CNHHV1Nd9qOcg0hcg0P0Kwnkcw5+99675vmj8af3auevr5QwNx0HC+eHVcZv0IGg
X4sJIcRtqF3kXrXYMVAhfSjwKIpBeFJEHYNOsAd/u0vzEmw9eGSe64YuupP7xGLX
VWcg+ukHDKfTV8K1f0m6qt/c5o6g3iO0jY+7KGRhuAbopTv2UGGas9vZTizoeC9E
WntnzxOgFIwOho427q9QFang5fYcJQ==
=OeBd
-----END PGP SIGNATURE-----

--Sig_/ICAc4B1ZmPdCc9DjjP3lLPI--
