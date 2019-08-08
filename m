Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28CE986D1D
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 00:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404529AbfHHWXT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 18:23:19 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45272 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404520AbfHHWXT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 18:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OQ7uhUWhALx9FlIxfrlo0dKV2Xrg6fiEJzG/KQjm6lE=; b=xH6Ik9e4UlkEMo4XQTFlS8ZTr
        C3YvC4nMIlUlsAwCuex4dT6kivoBiG8ctXJpGiSueBRKjNrvETuwmnsmmKhmCWxJD8Pecp8kt9MSk
        DCIGERWYSTeGppbxEq7HiTg02HQKaPGEdUAl8gB2TG0cclAAoCi+u24da3QHyTPtW99/g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hvqoV-0004Di-Vn; Thu, 08 Aug 2019 22:23:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 3148F2742BDD; Thu,  8 Aug 2019 23:23:15 +0100 (BST)
Date:   Thu, 8 Aug 2019 23:23:15 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the sound-asoc
 tree
Message-ID: <20190808222315.GR3795@sirena.co.uk>
References: <20190809074325.65a72962@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8Bx+wEju+vH9ym24"
Content-Disposition: inline
In-Reply-To: <20190809074325.65a72962@canb.auug.org.au>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--8Bx+wEju+vH9ym24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 07:43:25AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   c42d8cbee4c7 ("Merge branches from Takashi to ease Skylake development.=
")
>=20
> is missing a Signed-off-by from its author and committer.
>=20
> Despite what the commit message says, this is not a merge commit.

Rebuilt the merges now.

--8Bx+wEju+vH9ym24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MoNIACgkQJNaLcl1U
h9Cmfwf/bdYZ9N+V5MaGXLgaC6NfsS9R4oWldWvU2feTg6jA/F7sE7pANkcmKtMV
SD3ckMrC2lklvOlSmFf9e8qE2h8qVDlP/bX2K0iJJL2PTii/2y1GZBPTleLxRuqs
0V6XvsdvC18LVz15ngUOhTCVcmAWeUNu6Idv/5nSlPyitDuDnBW0OHB28SZgr4KB
kWMxgw4gkh8Otn1iYlvmaf97u3r8czb2RGKYDlfNocWieh27qWaSjL4vBNm9Ra+N
ZwNwlTBeuLiln8Z7Xi6qF9LyNSEdXYCvXZKl5WcZMZyntJLPxoqmlVF55ctMoF0G
cQW2zCp/2tsByo8qX9zkUJMxUY5c9Q==
=3fjr
-----END PGP SIGNATURE-----

--8Bx+wEju+vH9ym24--
