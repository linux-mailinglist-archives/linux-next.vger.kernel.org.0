Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75334418D27
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 01:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhIZXwI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Sep 2021 19:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhIZXwH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Sep 2021 19:52:07 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F01BC061570;
        Sun, 26 Sep 2021 16:50:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHjFJ00yLz4wgv;
        Mon, 27 Sep 2021 09:50:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632700228;
        bh=aii5h+3EAHKiS9SNEcuZB+Rk9zSBTEMBdKvDV4h26/Y=;
        h=Date:From:To:Cc:Subject:From;
        b=goGzyK/RiC71AfUD+6MragVKp53bmZ8U6ddwwpGPCkon6dVYXBsIQS6aruCwBqzyS
         yHnA39WIkQECgk8UIHy9IHUJknci7txHUj62A45DLaCqbAlQeDgKI9J4DmVeMLNkmi
         9B0dJaUkrbOww8nzNOIMJQikvYmRFDPA7poAJlr8EUban08AxQLbBqSGi5lBGNDL4k
         6EiJDZXWIliYsRtFo7E7hOEUdpWCfwiEXoU0bTPGsH7teizQZpFVXY01BCghoHViDf
         SjFGsPp7/n2wsZ341Zqafol/Vrb0iAsC9KiCMBSzJ1Qqx/n1NR2MWBq0gZc6PO+9wK
         8ugkDOYdpMaxw==
Date:   Mon, 27 Sep 2021 09:50:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Antoine Tenart <atenart@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the thermal tree with Linus' tree
Message-ID: <20210927095027.11b0066a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uoWWWX_68Yogj0fmPVZZoQh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uoWWWX_68Yogj0fmPVZZoQh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the thermal tree got a conflict in:

  drivers/thermal/intel/int340x_thermal/processor_thermal_device.c

between commit:

  8b4bd2566747 ("thermal/drivers/int340x: Do not set a wrong tcc offset on =
resume")

from Linus' tree and commit:

  fc26023f8816 ("thermal/drivers/int340x: Fix tcc offset on resume")

from the thermal tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/uoWWWX_68Yogj0fmPVZZoQh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFRB0MACgkQAVBC80lX
0GyCfgf/brT1qq4PDyrzDcGYY0Eym9KcFqUXHCVlJBbU5xumgA1/+08AeuLcbxFJ
7LAZ6ZaBH1JOM+mjJV4cpo9GzEJteAq1MGQ1O28/n62c1fgAYwqHVsaBGD7ViEO8
llfMisyhuwRdD/GdAcn3qqS6GUyfXjIaE9FzgPYGQLajynyTwzqCw1KK8l60xEAa
dNtLspISoEWKWLj2Wb+gdOH8pOHNNx3NqRE6fTz0rZ5r5hPXvj/aua6VAxZDAzkj
V2k/seje4KCrcueYUivdrKOYbxNZpbvPBRM6wUfqqEh8PH3GVcD1gPBFPaN6DBxX
2PACeR1IcRhRoQS48+ubEV194Du4Gw==
=kVoV
-----END PGP SIGNATURE-----

--Sig_/uoWWWX_68Yogj0fmPVZZoQh--
