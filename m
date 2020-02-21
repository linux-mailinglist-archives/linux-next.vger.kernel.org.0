Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18645166BAE
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 01:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729420AbgBUAhT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 19:37:19 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729365AbgBUAhT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Feb 2020 19:37:19 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Nswr31Gbz9sRk;
        Fri, 21 Feb 2020 11:37:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582245436;
        bh=EQuhY0L3tjyrV+e5s3kdmpoBw/FhFpNbreFbRDehgJQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ou0D0M4Tn+qdWBtM8pnp4XXeB4xTNhSHaRH3urtJCECdhf35ZG8f5Od4pWbAKiCw9
         gYOKmbX/yr8fvjTwzdd2tOVtDYXLvTq6m1DZ/WgVDubnH3y/KTrVNLIjQ9fWCR4ljZ
         Mpd8ydvrQ0Dd/8gTjhoo0zgzGaoaotQWqelq2pdY2ZLh8eAu7dRIEDCxikf76a3BQC
         qyT+/gulsCp7GCRLM0Hm22+qYYbQDE8Ih2Nx5Yzoz3MhhOVwwXToJ+uOG0kV5wx610
         AIugcURN4kiAhvyIOUtmLWa4Eg2DjlJN3sLwITbafJMayXq5flyt0VjEU0Tn3H23Vx
         58aKG2ACKbMnw==
Date:   Fri, 21 Feb 2020 11:37:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: please clean up the clockevents tree
Message-ID: <20200221113714.7293f125@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XO+x_x=CPLKMt9MuZV.VgnB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XO+x_x=CPLKMt9MuZV.VgnB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

All the commits in the clockevents tree
(git://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/next)
seem to have been applied to other trees as different commits. Please
clean it up as it is starting to cause unnecessary conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XO+x_x=CPLKMt9MuZV.VgnB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5PJjoACgkQAVBC80lX
0GzOTQf+L3xcd/+NV5ShyA6vz4VP+O58z55nrAXZMVcevDxZuWZpdYLTK+ysPp4b
OpRoamMKJ91MSyh8kICfd5+pcuQ8OE+LYB3esp00q7wLcBWN27Lhyal6wFChClxA
xUEnHVdAbQ6bo6L4NHNEvFygvHIcafg+IKyvOFagT2PBZ2Hkzn7LQSdcpep2dVbQ
EoMjFd5Cp+NGp6OCHBxxd/L9DLpi7Mu/FEqtsHIXcm4z8teaP/RiXvLLFelpbdKl
u2vXPCiDrgktZgQgWNvi3d6+RE5wX1DaKoX22qGkKa6m1JOBoYxx8Lzv2oNFrPtm
Roxkw2prv25QuwWpwSxsD1pqVgpPjw==
=5TYh
-----END PGP SIGNATURE-----

--Sig_/XO+x_x=CPLKMt9MuZV.VgnB--
