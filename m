Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED49C3AC0FD
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 04:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhFRCwd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 22:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhFRCwd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 22:52:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3A0C061574;
        Thu, 17 Jun 2021 19:50:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5k1S6K69z9s5R;
        Fri, 18 Jun 2021 12:50:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623984621;
        bh=y+tQYfPV2iyhoKYTQzA2GZFr8dx5Rn431a0pLuQgcAQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JoJAyGXpx9jmFTskHkPKX5cIfdMf3IMhYYSjZujvBreJJhM14cjMQsoUamEeVK3ol
         2f9wVROIHmbFucPNvnEXVZV4FhSIrSL1jUvMaKXeXgo1tjk4uVMFhVdhXAszR+NVFA
         1Ww/J1gfBIVTsUYOPP7bXnJgyOqc2tMKFJ9RVpighlET0fU9XoAlTtOV6jzJ3j8m/B
         SIpFVkiEAmSfeXaI1PJ8ZWhqWbAFegkSnzP76oisCKJ6wZwnxPdCdYsUlcXF9m3RLU
         wc8fEACRXcrmeamsOZZjYSvs1a1XhJz+/oubWV5GNhjXybE4u/7f31AYAPbyuZPMb7
         VwA/tubJqmesw==
Date:   Fri, 18 Jun 2021 12:50:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-msm tree
Message-ID: <20210618125019.4a339135@canb.auug.org.au>
In-Reply-To: <20210618124203.14b57bef@canb.auug.org.au>
References: <20210618124203.14b57bef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/geC1j6Dsh5M/ZBQJvzNhoaJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/geC1j6Dsh5M/ZBQJvzNhoaJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Adding maintainers]

On Fri, 18 Jun 2021 12:42:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the etnaviv tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
>=20
> I don't know which commit in the drm-msm tree caused the failure, but
> it is probably in the range 558d4272b60f..7e0230fd096c.
>=20
> I have used the drm-msm tree from next-20210617 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/geC1j6Dsh5M/ZBQJvzNhoaJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDMCewACgkQAVBC80lX
0Gyxvgf9EOVLxwD/KHKU3XCKKtbWMDJhRi4MXsQndQ3FJmzXYfoWH+Weq7PI06FL
hUZCcTixJCklQ4IGVpDIlhkvwneUtCpg5ieEZyzoSMXu3d5W99DxmPhChoLOMsm0
O2QpfC164PWRLh29jLGKRnQDN5LkXOKCbf1c7B77wNJ9x8Yf1B7LtMG1vOI/qwQg
JmTPrvTjM+W3NhYstjaO5G4cnsg09J42kzdA3AV2rxyG8sRTIJvOxypw1I3Gi05P
H1BDkAwGi2CWJr3YJuzzki1kLtDFkx8s4JTPVZLPIQQwhwhKRazPD2DODk1Zqv63
9IoXpBIxtBRrKE8OjIunyuUAp5RzYA==
=tmtr
-----END PGP SIGNATURE-----

--Sig_/geC1j6Dsh5M/ZBQJvzNhoaJ--
