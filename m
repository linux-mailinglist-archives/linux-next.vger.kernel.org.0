Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92411228D1D
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 02:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbgGVAd4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 20:33:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47311 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbgGVAdz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 20:33:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBGfm0934z9sR4;
        Wed, 22 Jul 2020 10:33:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595378033;
        bh=t4YKr40ldGIPSVvgBSIKYqBjCdBbWrBML68jKk8mQtk=;
        h=Date:From:To:Cc:Subject:From;
        b=K1Emy6isJPQ2I+ZvmHDT7Z3jx3dRJ5Gfp5tjB6uUgAdzcl3WucWqUAx+F5NBH2bhi
         RYumkoBjeXQrh+XVRJs//rvsgLKm3oPLxN9XYJQMuBQ4uKmNSzayOFja8y4tdqokJz
         OlfDtNFVni+dTA2RD50VM7ej2du0ZYcQhGl0bOUSBB5QuDSGLbkO6L3KqoTGAWcZHX
         tG60ChSWsPgOfsVEVbwIVTdiMLBypd9U0JYTZjDk0lGuV1LAkZYy3xG59Z7laY1sky
         3StEmYeLphuYg+YaQRXWo4yWXShHPs3j1QNFxB8itCQuOGk3ZY9YfahmT+xJKPIjg4
         4aITWtWxz0mog==
Date:   Wed, 22 Jul 2020 10:33:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20200722103350.6bfb8da6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lJsY_=raUOHs79k/V.xltzF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lJsY_=raUOHs79k/V.xltzF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  769785cebe0f ("PCI: rcar: Fix runtime PM imbalance on error")

Fixes tag

  Fixes: 0df6150e7ceb ("PCI: rcar: Use runtime PM to control controller

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.  Loooks like the
lines also were rearranged - the end of the fixes line is 2 lines above
the rest.

--=20
Cheers,
Stephen Rothwell

--Sig_/lJsY_=raUOHs79k/V.xltzF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8XiW4ACgkQAVBC80lX
0GxtwwgAo3VMXRZGHAdg8lcvF9Bu5+AVtorc5UDea85XMCGmR+IExHDWHXFA1hWk
OOrJU/ZQP4TDhMeT7ZER7DP9wfT7CGts3+IMGzfLCsik3sTyO6IadO3AkhdtvLLe
IY1tmAUGe3g+U2itWekBFeqjurJNVCnTT8UvLDfaqINwC9R+JT0h/pp1eJx5+7I2
T3hIjD6u06/YebpLm/X7wwjoWuB7ytTQK6jXsI6NAi5NBxPe7H1CVuYzmQFj+0dF
N+GadGwYuyExl1zjFshzrqmxNFlnWqThtYO8kBckoYsStZBoSq9nL6YJeWH3rjjV
WdXTiAcyqKv09Sk08/m2eAsW4HwEqw==
=gjyP
-----END PGP SIGNATURE-----

--Sig_/lJsY_=raUOHs79k/V.xltzF--
