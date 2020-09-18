Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF00426F4A8
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 05:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgIRDVW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 23:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgIRDVW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 23:21:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C59C06174A;
        Thu, 17 Sep 2020 20:21:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BszdC2n6bz9sSf;
        Fri, 18 Sep 2020 13:21:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600399280;
        bh=QWFtksh3yjkMB75ctEQqaVu/gD65BkYee5+lrSINvXA=;
        h=Date:From:To:Cc:Subject:From;
        b=lzfuRkfPorPRcXQOep5u2HpjA7fKRG66HrBKFgf1ZN6w07H9SFsvkUILIBMJsiS5t
         AYFEI+h7+KE3zXGcsMnT1eaffPAx5go1Tje3lHe7grjjc2BbZsILHISenfmk/dKGde
         bC0qa5ZR7vupueUf8es/+GM2z0khz6sivDGREQrwcz02YPZOW6cjvq/34AFVdgFiNH
         gYUFwSiLNSMjAm8GeuH9sItIY59ELARGu3BTe3CP7+nUGHXOpSxGucMvoeICH446im
         DlI+Yiv6z1FTh/U4OTO1L2jTbmsYNHi5bmmPEcQuPEgEFesPJluwhiup+t3lWJU7zu
         fyN+GBX+iUUXg==
Date:   Fri, 18 Sep 2020 13:21:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Iulian Olaru <iulianolaru249@yahoo.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20200918132118.1e753aeb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7vql5BJ46rqF4b2ptGYxYrD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7vql5BJ46rqF4b2ptGYxYrD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in sound/soc/sof/imx/imx-common.o

Introduced by commit

  18ebffe4d043 ("ASoC: SOF: imx: Add debug support for imx platforms")

--=20
Cheers,
Stephen Rothwell

--Sig_/7vql5BJ46rqF4b2ptGYxYrD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9kJ64ACgkQAVBC80lX
0GwSCQf9GQ457RX88RtL5Zkj7If+py1ZSAEACLgK7jpmznG36hSMUDOX4hiDnbCI
LviE1fWKk8HHKKDFC1JCNfgbOk1uGoN1cKtpvSjdO1aCERsosdq1NeuPhMe/0/qW
qesrLP5rDyRvxKA+J6Dqnaz1Biq/uSDVxE0JwBAY2/dTIckxoyRzJoG2KUKzcf98
+obMCnFXCmwRg2EuB/cH8i0ggPqXFqKn+RkeP/7kU3HsgPMVHkXprOo19oZMHKdU
zHaCCX+FMG3TeFyO97eRH5N4vII1hfqP9k94W47H5uph2oAj6lbOW1uaII2O64oZ
hPqdaqMnarc1/u6qq+9Ze+NVWTdm1Q==
=L998
-----END PGP SIGNATURE-----

--Sig_/7vql5BJ46rqF4b2ptGYxYrD--
