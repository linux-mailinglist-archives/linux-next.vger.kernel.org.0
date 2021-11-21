Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E504B458192
	for <lists+linux-next@lfdr.de>; Sun, 21 Nov 2021 04:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237789AbhKUD3Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Nov 2021 22:29:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54030 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237787AbhKUD3Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 20 Nov 2021 22:29:25 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AL3PmCJ117153;
        Sat, 20 Nov 2021 21:25:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1637465148;
        bh=dwovKqCilm51jOCmGaV3r/XWOt+HClI9vWaQx7Ppyz8=;
        h=Date:From:To:CC:Subject;
        b=DxjHSyw0jT0pcScnnM8Y3+4ehnepso0TOoiBg18EWW6q/8ENNKCAq+C5BfCFEsNH3
         epnXIKPaFdEZWn75uPaWMKlhBOpVoe5FavVhTnFdITyB4Sdfq+qOVn2jKr8okaB1v2
         l/U/sxnZv/+Hza5tzSIpkZSKcEVkR2VLOEmM4/Dk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AL3PmPq017265
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 20 Nov 2021 21:25:48 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 20
 Nov 2021 21:25:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 20 Nov 2021 21:25:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AL3Pmj0123626;
        Sat, 20 Nov 2021 21:25:48 -0600
Date:   Sat, 20 Nov 2021 21:25:48 -0600
From:   Nishanth Menon <nm@ti.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     "Raghavendra, Vignesh" <vigneshr@ti.com>, <tony@atomide.com>,
        <kristo@kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: Request: Add Transition TI Tree to linux-next
Message-ID: <20211121032548.c56zt66ac5hjbu7j@garden>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xskazjy2ohcxysn3"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--xskazjy2ohcxysn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

We have been working towards a rotating maintainership for various
TI dts and potentially related areas that Santosh is currently
maintaining. As part of this, my tree[1] is now integrated into the
common effort.

Please replace my current tree[1] with:

   git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git#ti-next

We will follow the usual rules (GPLv2, contributer's guidelines,
reviews, successfully tested, meant for next merge window and intent
towards linus's tree via submaintainers) and this would be a rebased
tree as needed.

[1]
git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git#ti-k3-next (=
ti-k3-new)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--xskazjy2ohcxysn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmGZvDUACgkQ3bWEnRc2
JJ3jFRAAnAiBqbXtaetLqGud1qLs2pdcoTs5hFCHIk3NVYHNZnhhHNaR2emEDivu
iMizYCNuNSeSqXDe8Xv8V9uwHZDeQn3yS88RWEgbptp7h0HTJaoN+rr28NgmqWTO
1urHj1D8os/P2uCupzWFkUzwdql2ShoncxOJk/spwctq7oVx/u3owhIyqkMJq9SS
uko6mDg4oruziTFFLxqxwaNovolpWe7+Lxt+x7gh/u6bR+jEEV0OZtuHTBWxnxZ2
XBc/VkcvnYp8xdo//vp3/g00BcvBbZbaN2tgomxUYomJKxuoRLH3hr0WOFvNrR/D
yDVSsGs0sR15WsWYLbmGJJlnMjqqMW47hxYAx3kwAqNL2qhvZ93iJbuWp3l+BOtB
FtID+95BcMAkr2D1A3MZUmEzmS1aEW/iaSlGcMrznezemC+i0xcHw5uUjbw9VAay
u27QDC5K/ZnbYeCIoSVn/9rtsEPuUipFtZynWWGkEbE4j36kXZHp268B5xhhsTRN
qs7SoOL2r3dwMsJ/9kZ/vm9ouE+K/5hSf6Eoy7+fOPhMOl7X8kCBi24USIMmTMot
h4rXx5BrkLK7DLMufmAzRMmmi03zR127sfCOU5XxWS8FKi2QpGxWgvBdPfodKMCu
T+lmrRj3fp4H9uTFlNC+mZkUpxyjzsxby+YQ8rVCBI5YakM6jf4=
=cCe1
-----END PGP SIGNATURE-----

--xskazjy2ohcxysn3--
