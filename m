Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37376274F94
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 05:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgIWDgH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Sep 2020 23:36:07 -0400
Received: from ozlabs.org ([203.11.71.1]:49045 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIWDgH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Sep 2020 23:36:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bx3jt59KWz9sSn;
        Wed, 23 Sep 2020 13:36:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600832165;
        bh=MtXeczgxHCMCOhw5upnnvy0kfwQmSR6Qt9dVzzJLaj0=;
        h=Date:From:To:Cc:Subject:From;
        b=D7ERjTxLzELXXCCTfJzgm7XZwAOKft271gxmDWMF+nrw/eI7yUVMma4pU/P4+y/gV
         2d7xambn/kbsul+p6lGOIRqAtUAtD7st8eYIYnZkIZ7PcEdfFfybn97dLypm2aNCx3
         3OTTemeOUdYjNWo2eW+l7fWwLreGeBQc9ukax6uqVD225MkmtVL/SDN1i7TbdsGe7K
         JoYtp+524bwQYBrxcJhLzAG/0NSz9tCrz2BACM02tUTjWOdlqqDu5pWlFb9vp9yvtz
         w6rEGG4OFFgIy87MFFZ2E9o9MQehAi9d+Pnf6i8M/B3E4n7MiYWWqZjlNG/d5CbNOL
         TgtfB2I25o3YQ==
Date:   Wed, 23 Sep 2020 13:36:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Swapnil Jakhade <sjakhade@cadence.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jyri Sarha <jsarha@ti.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Yuti Amonkar <yamonkar@cadence.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20200923133601.293b4fe6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.1DoauiACeF/_K0DBRu0xdy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.1DoauiACeF/_K0DBRu0xdy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp=
_fw_activate':
drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conver=
sion from 'long unsigned int' to 'unsigned int' changes value from '1844674=
4073709551613' to '4294967293' [-Woverflow]
  751 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp=
_attach':
drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1692:10: warning: conve=
rsion from 'long unsigned int' to 'unsigned int' changes value from '184467=
44073709551613' to '4294967293' [-Woverflow]
 1692 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp=
_bridge_hpd_enable':
drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2125:10: warning: conve=
rsion from 'long unsigned int' to 'unsigned int' changes value from '184467=
44073709551613' to '4294967293' [-Woverflow]
 2125 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,

Introduced by commit

  fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridg=
e")

--=20
Cheers,
Stephen Rothwell

--Sig_/.1DoauiACeF/_K0DBRu0xdy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9qwqEACgkQAVBC80lX
0GwjlQf7BSZScMksb4Tc0d+RoBesYr35EISzCfuZU9ZW4qiyQDEo1etWVXXZpDhc
4tzreKqaXHdWBmDnz3iAtPiCvAa/rimO4ap5RoK4TPAJVVYt95rjMrc+9L+afLZg
usk0AZAWac/gUeP6n4lntfSjZ+U3O0TrtAnrRqj2xhuw2zLs4h5EZAt+vLj1v9MQ
koNYp6BJvt1BT0ZPUzxDougjXKLxzLUzl/t8LPUni2VGqZIGM2omyBqqPPk/EqDT
BMGT8UDlNI1U2Hf4v+UQyQud/6eNww+EoZ8DsovxrYdEsbpYXfABwcEvSrWArekc
vN4tP7nwI6eFTJJY7U4TsKhe5XIfTQ==
=O+t8
-----END PGP SIGNATURE-----

--Sig_/.1DoauiACeF/_K0DBRu0xdy--
