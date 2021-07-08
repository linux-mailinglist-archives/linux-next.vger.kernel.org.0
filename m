Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D8F3BF3F9
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 04:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhGHC22 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 22:28:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230188AbhGHC21 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jul 2021 22:28:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GL0Ws31L4z9sWl;
        Thu,  8 Jul 2021 12:25:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625711145;
        bh=clxaCrf+ewpCCk7WFA21uPtixU9qtZxRB87nsm0TPIA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ABlheaBgoZRzFmFMp5muVCx1pWPeThQ8ZqPb3hnLk2m7s10OI8oQOzM2SLXJsWMxT
         Fe1Tw7ozIKMmX0kWIAV7p3amBtcSlJrOKgEty84LMgHcySySGPDXDE6/6ldlN1mC0M
         tXBZIk7bYXgBoA3m22L8fE6teqt4/LvWbIQrwLDd+fvxQsMPMiGbdKANbAvXdg5ZGR
         9ydTpQobMCJlXINsTu5Nx3D+0iyXXfTgby0G8P/bDqaXFFyQtghBwwDQQKfRewPo+g
         adcrJDslZt4FXKFu1eLZAK/vqAbNrN/G6Vg6tPAB3KPL4TysXGCWPtED0RDsgL8wxD
         1nVb+DaSErjDg==
Date:   Thu, 8 Jul 2021 12:25:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        "William A. Kennington III" <wak@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning from Linus' tree
Message-ID: <20210708122544.011171b3@canb.auug.org.au>
In-Reply-To: <20210601172026.6bc0a96f@canb.auug.org.au>
References: <20210601172026.6bc0a96f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/orWYshyxyqShMZqL.QpJ.z8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/orWYshyxyqShMZqL.QpJ.z8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jun 2021 17:20:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> When building Linus' tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> include/linux/spi/spi.h:671: warning: Function parameter or member 'devm_=
allocated' not described in 'spi_controller'
>=20
> Introduced by commit
>=20
>   794aaf01444d ("spi: Fix use-after-free with devm_spi_alloc_*")
>=20
> This has been around for a while (at least v5.13-rc1 and next-20210409).
> Sorry I did not report it earlier.

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/orWYshyxyqShMZqL.QpJ.z8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDmYigACgkQAVBC80lX
0GyedQf/YNk/zV+iVmegaUC9ZQqnHHOFwIlouI4uyNfeIhHgN+Ul2yGZUMEtPhnY
ijDieqxbsIeVXkw3hrv7WiOvwOIj+Bc/YBulMhuQCX46QOFktYNd967ifp717iMR
CeY7ZKp9O3zsGQKhbQZOIhKOC4TgYyiAIMVq4KNrXPWsEtpM5+8L6r/ARVUkm/Lc
MJEhnwGkoqrRa87xXsOr3MP3/lpl3oEBtWsHwbVlOncJDEUBRTsrScedzGJ11Ln/
Y2AsZ8sHCyn8RJyIHNbr3z1HQEnKzVeQ1sCtS2eUh6Ytz0mYLcnasMUpe16fB2ss
NiNpC7QuiPzHYm4k/kOSqWE+e+cB+Q==
=/0ki
-----END PGP SIGNATURE-----

--Sig_/orWYshyxyqShMZqL.QpJ.z8--
