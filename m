Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BFA2FCAFB
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 07:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbhATGRW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 01:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbhATGOw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 01:14:52 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D2FC061575;
        Tue, 19 Jan 2021 22:14:11 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLFbN67GPz9sVy;
        Wed, 20 Jan 2021 17:14:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611123249;
        bh=ef18z/cenwcdzLl50hu4+uY4xk/N6+QlBcKknqZBSeQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r0jk7194isuBAEfK1EF51wWFK+yDXj0SF5eINlSAVwi1S/BVI3MvM+r8e4vMTbWxQ
         RE1IWMP2HmZf4m78eAtqV80PCO2SUcANNQFD9yPGomC3H/J5Wj6KXBjl5bMKDrCELc
         XN5nC5f2kqWf1O+/NHZNgHHRPX1iLGBIehfqbMEwym011+WlgZAepqjKP9q0S0c952
         pKWTpQ4LIQujzQ3T6LjNddj1QTGlrMQJ69sOQcwauRlA8LLrYCZ1OQPjazxI04xes4
         1Y02qq+dNP/QUQbhrNgMnaQMXwgP8qm6sqRj/tf/Gu2xwVCBlPiZ2k0ILhympBHKds
         of+F39fJVTNCg==
Date:   Wed, 20 Jan 2021 17:14:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210120171408.1a97a974@canb.auug.org.au>
In-Reply-To: <20210113151027.21f3f1de@canb.auug.org.au>
References: <20210113151027.21f3f1de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PCaC4M4FZhpZawp94P8vOkY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PCaC4M4FZhpZawp94P8vOkY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Jan 2021 15:10:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/driver-api/media/v4l2-subdev.rst:125: WARNING: Inline inter=
preted text or phrase reference start-string without end-string.
>=20
> Introduced by commit
>=20
>   25c8d9a7689e ("media: Documentation: v4l: Document that link_validate o=
p is valid for sink only")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/PCaC4M4FZhpZawp94P8vOkY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHyjAACgkQAVBC80lX
0Gw61Af+IZHSNrqttbLkAv6uRm6JJlbaLRjFYgAHyg7T/lx0A+K3/UTZkbDMIwe/
1giDLabUnbzlb57fuzaO9qM8OfrHB88L2CWZ7qgotYV33LdQQ1a+EMVFnKShYHM4
8Jvhi3yR3Huccloq+hG9MvyVWTJKE6Stodopa04ZmRGKnw3nkOxT8JOA/hxUR87d
ihpLMRftkEu30a8on8XYEPfDrovfDGmgGq4sx+UueEJ4KNm/lo0nCqvnqElA9g2a
RuQLo3sHGrkWKv/UOXalwjjHtyJvYinjoK+Ynbc7Popt9preCZSbhcI5a3dB+nF1
POLcaYZMUbWtoJblXcti5o3RNO4NEQ==
=P4VC
-----END PGP SIGNATURE-----

--Sig_/PCaC4M4FZhpZawp94P8vOkY--
