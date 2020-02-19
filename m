Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061E0165316
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 00:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgBSXbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 18:31:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43971 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgBSXbJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Feb 2020 18:31:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48NDVy4CtVz9sRG;
        Thu, 20 Feb 2020 10:31:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582155066;
        bh=bUdzaiogwTAzLgUj0GMde/X5/Yifm/ZX+t0QgWEoyJU=;
        h=Date:From:To:Cc:Subject:From;
        b=GvcrZW/Ch3xIYgXHIQntolRuOH7q+FOErdLyUIAe+Rxzan8rVHZf/EFD7NyGa2edX
         rgeQB3c2rdP66ca58dLl0DXtlM3ze3TKixLDSYQcAPFu1Va078ylXTLXzUiNiv4pmy
         MS0/kyVRdIBlgwWM9ER8wr5nDhgNxo2PsHhKRfYwSFLGAcRCklU36HAAKCCS9R6vT/
         mtPLiKSlGJV5u5+KUB0BX0WdBInddFz9qqV4FxNbMuwK08JZ2wDKGGgHnVe1l69vs5
         BI1Y8+aYDNd9YCRokEh5IfP8NpTOA7uEt7QkXu8QZMhmnwkKnqRXe8CTLFwGZy5yvm
         afO8W3bbMCx7A==
Date:   Thu, 20 Feb 2020 10:31:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: linux-next: build warning after merge of the mmc tree
Message-ID: <20200220103105.01d7c0c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JMRbqRM4ln7rc4sIn3d.xF2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JMRbqRM4ln7rc4sIn3d.xF2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/mmc_hsq.o
see include/linux/module.h for more information

Introduced by commit

  eb1814dd49d5 ("mmc: Add MMC host software queue support")

--=20
Cheers,
Stephen Rothwell

--Sig_/JMRbqRM4ln7rc4sIn3d.xF2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5NxTkACgkQAVBC80lX
0GyJKQf/Q+Vr4XyBdQgKKL3aiGpQANu7hw6YtQPXRFm/r3ECmOHCm56/6zSMgN5d
gDrQN2agT5xkM+kEp15RkQ1wTXSFxNfjN6MaQlIB6Q4KYc4DnTAcGZzyZXVPM94f
1e3bCGlbLwYSARUO6iIQ2K0yvgecLvtnnmgrX/Xnh1d3X05eIOOqKy9hupPPpxKB
RJiFUrkk1bG9U4cYJgFYAkIYmthvLWtvJsfn8gw5MxIc/+Oc+RfXTQRWhL7R+jg0
XvlGFjJ48jvZ8j3Uo+1KE09mL4yfB1L2KAR4qt7NVk4Y8rOsXGijsWPGZLnA6VtM
8qPiKYlAfovD7nPdnLdWwROR0PeDqQ==
=aan5
-----END PGP SIGNATURE-----

--Sig_/JMRbqRM4ln7rc4sIn3d.xF2--
