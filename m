Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5380B4D42
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 13:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfIQLwD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 07:52:03 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58396 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfIQLwD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 07:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wp7StP4rT/mbiXf24Vyun+/GwFBtut0c59w3xd/51h8=; b=kvyTwDRfKZjTMJ+56Ufyxvwju
        o+L6wGYnoIZTWHmLV8f0Osf98xHfAVCLJNBk9VOnKJiQPsplKWN0o1Z93u3Vwh5DZV9RBMq19nYeF
        3hQVqv4UES+300gOn28To65flO4ppZ88v66V0Se5/wXivQfs+nEGCEo9AkkHScwOCsZZU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAC1Z-0007y0-QU; Tue, 17 Sep 2019 11:52:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D08DB27419E9; Tue, 17 Sep 2019 12:52:00 +0100 (BST)
Date:   Tue, 17 Sep 2019 12:52:00 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the omap tree with Linus' tree
Message-ID: <20190917115200.GD3524@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline
X-Cookie: Know Thy User.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the omap tree got a conflict in:

  arch/arm/mach-omap2/Makefile

between commit:

  3846a3b9511c51 ("ommu/omap: fix boot issue on remoteprocs with AMMU/Unica=
che")

=66rom Linus' tree and commit:

  0a55bff7003967 ("Trivial merge conflict between omap and iommu branches.")

=66rom the omap tree.

I fixed it up (see below, dropping the OMAP change) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

diff --cc arch/arm/mach-omap2/Makefile
index 8f208197988fe,8253112a4e51e..0000000000000
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2AyOAACgkQJNaLcl1U
h9CMFQf/UVx1pt5ZRQf/e/an14lTckTlmYm/N0qHbZeuP1JunvjvEYOUBQfAfara
DSJ7ggHpVlOEA84VzzWU6T/VsP0dQr2AIBWiwmuTnniJCZzQCTxv58PD7WdtOP6c
zNocfnyx29B3aVphzO9uveU9ibYJAc/nJa1+VVgLWF4ifTSyw7jWxtWrBkINj6gK
eC7QivXbBFCukzvPveq8LypHsdOxhIgh/AefRH3MjWOJmZttm9coqg8soZEu/pio
KlyuGUWGWRnfywkez9c358RhPmQgg2T3pXXIxAOpyly4UH93iGldbC3M6Be61XYw
g4BltQvqVkFpe1TebDfaCSO1hlxTng==
=c2yC
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
