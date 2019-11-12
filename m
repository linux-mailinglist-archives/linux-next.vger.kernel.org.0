Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC5EF96E7
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 18:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfKLRSn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 12:18:43 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43290 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfKLRSn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 12:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WA+IzDQ/Ni2wY/itYlQL/SLX/ESk+/rKj8rAozGCEo4=; b=ZGcoBdbcTIk0ow3cmixuA+yr8
        m+f1Cj2qTRLAtQVIGLykjdrbKa/5FDMExILg52kaOXkiWpwsfT68uI/B3FRgpgsb6Nm4otc/T9D6R
        PiAte9EHP0oqBLJ9UxmkJHaPLshZsXOML4Q6ZPh7qLeNbDdSP2Lay64La/ah9az7Nw8kQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iUZoI-0008KE-PN; Tue, 12 Nov 2019 17:18:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2D969274299F; Tue, 12 Nov 2019 17:18:34 +0000 (GMT)
Date:   Tue, 12 Nov 2019 17:18:34 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        acme@kernel.org, linux-perf-users@vger.kernel.org,
        mhiramat@kernel.org, Paul McKenney <paul.mckenney@us.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Subject: Re: Linux next 5.4.0-rc7-next-20191112: rcu: INFO: rcu_sched
 self-detected stall on CPU
Message-ID: <20191112171834.GH5195@sirena.co.uk>
References: <CA+G9fYtJNyMOw4rkfHMv+XxwhVPbqdsCHoCkn4aL2TsofyCfvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Content-Disposition: inline
In-Reply-To: <CA+G9fYtJNyMOw4rkfHMv+XxwhVPbqdsCHoCkn4aL2TsofyCfvw@mail.gmail.com>
X-Cookie: As famous as the unknown soldier.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2019 at 10:38:10PM +0530, Naresh Kamboju wrote:
> INFO: rcu_sched self-detected stall on CPU detected on Linux next
> 5.4.0-rc7-next-20191112 running on x86_64 device and continuously
> popped up kernel
> OTOH, arm64 juno device boot failed without generating any kernel boot log.

Juno is booting fine in -next in KernelCI:

	https://kernelci.org/boot/id/5dca98dd59b514e08a138e08/

Some config difference perhaps?

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3K6WkACgkQJNaLcl1U
h9AlsQf+MXdRzQjSw0EfyhUoQm3VUlK9eVtrGEg889ZA1Ma8tM2I1u/bdvbWAtOx
SqGlgL5d0xgZsaesdjwZomHL00E7oiLFh/ibaU24S09Ba8biPn6ilg+1jQwF+pL2
qsnTAkSXo/DtTcaJ2jcL8Y1ZiwJIynGnGBKcbzqyNyjdSI6wboDAfBbYiix8HK+H
iZ7VdQAMkwTa+zD3J/8Q2FszMzsuivY0zG0/YXiNhxOEu4rpp94aXyAOutfGw/6K
ZOX+hKMjT7JlmTO8GXmaJLr4HRr73I+uRXswiLt8xOZVZfUkzK+Hxk3Y1gGRzuOy
Sd/N6il9ZmU/zBEEaxNl4lmId1v2OA==
=Hjcd
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--
