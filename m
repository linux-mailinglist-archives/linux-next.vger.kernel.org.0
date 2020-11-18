Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FD22B7B82
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 11:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgKRKlL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 05:41:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49773 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgKRKlL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 05:41:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbfVY2vL1z9s1l;
        Wed, 18 Nov 2020 21:41:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605696069;
        bh=SCySA/wn6QQF8qPRAczBg9qAxU0dJBy6SjnKwYcAFGQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jANG97vukQgf5/0I8/IZkFDiOEvwvgf8J55/yNiViRVFQf4G94vnDHIsee1im0djA
         cXn6TSmyek6cfsdvfYJLvQ3KxOyBE0tIcWnMgd69sR9NVO439Fk6D6ZGf9esvkKKs4
         F5PcAZe2ZaJuHvBGAMHFLovhzyPCfNDlbVycgBRiv7Vh+XFjbTapggi5y6SQd73Fo3
         Ij7OC/Kscd5W9owY64mUggTNirgwIUVD0GtyjT0urMOek123d5NXSV0DDbZuBapdXM
         0nbcllckktj3H+Hbi+FCiQWQRxkoIf+k0mnfsw32U8vCUZl1UEpAoRd/DrXY8q7bVY
         t7x5fmamjOfNQ==
Date:   Wed, 18 Nov 2020 21:41:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20201118214107.08eb9b7b@canb.auug.org.au>
In-Reply-To: <20201118093900.GD3286@work>
References: <20201117151225.6a50abf8@canb.auug.org.au>
        <20201117042359.GB7787@work>
        <20201118153912.1decf6cf@canb.auug.org.au>
        <20201118154500.127aaba6@canb.auug.org.au>
        <20201118155128.64c97667@canb.auug.org.au>
        <20201118050640.GA3286@work>
        <20201118093900.GD3286@work>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_WFM473AmapmYpnSN35ey7G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_WFM473AmapmYpnSN35ey7G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Manivannan,

On Wed, 18 Nov 2020 15:09:00 +0530 Manivannan Sadhasivam <manivannan.sadhas=
ivam@linaro.org> wrote:
>
> Patch applied to immutable branch and merged into mhi-next. Now you can
> remove the fix patch.

Thanks for letting me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/_WFM473AmapmYpnSN35ey7G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0+kMACgkQAVBC80lX
0GyBHQgAmc2nI2PQleoLzKs7OS9dzIV2YNLqVrGIV+siLZDW6Z98VpELec7tzwiy
xV5TuNfk8okk4Y0PYpTdn1SAv37EpXOYdJbf4lYDeetS+fMPeOXvYl1Wqcr5JLX1
zTD0Ps1SVW25R/dtcr4u9Sl/bSxxQRT4/ECfy0Exvq61OHjnFaTh8JBKKiFRC5uQ
GkYnr4bLv7va6IRinkT1M5i/vpllVM/xP8mXVQpj503FO19MO79MZjOBw3AWX9h0
ph0t0ImnNeLT2UPth430GaYVPNuI59dSctZ12uj9wlb+mhyN/+BXM56XWz4tIcSF
4VbW5gTM/zPWxLOLrHOYGuNx41JmiQ==
=fKPR
-----END PGP SIGNATURE-----

--Sig_/_WFM473AmapmYpnSN35ey7G--
