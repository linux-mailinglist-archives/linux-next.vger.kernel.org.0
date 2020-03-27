Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED7C1957D0
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 14:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgC0NSf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 09:18:35 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1974 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0NSf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 09:18:35 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7dfccd0001>; Fri, 27 Mar 2020 06:17:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 27 Mar 2020 06:18:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 27 Mar 2020 06:18:34 -0700
Received: from localhost (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar 2020 13:18:33
 +0000
Date:   Fri, 27 Mar 2020 14:18:31 +0100
From:   Thierry Reding <treding@nvidia.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        "JC Kuo" <jckuo@nvidia.com>, Corentin Labbe <clabbe@baylibre.com>
Subject: Re: linux-next: manual merge of the tegra tree with the arm-soc tree
Message-ID: <20200327131831.GC2282366@ulmo>
References: <20200327092741.1dbd3242@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20200327092741.1dbd3242@canb.auug.org.au>
X-NVConfidentiality: public
User-Agent: Mutt/1.13.1 (2019-12-14)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585315021; bh=Tpo3NqFxWgOJjyev4XqBDbAl2TDTNnyAFczdL+YC21g=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Disposition;
        b=lfWDXAOR96Sjlm0y8L+D1ypT1+v1R9xGvPHeDtbELVHNFCjV1GaDYuazr2kJTBDxJ
         Teel8GiBjWyk1OJUGbAbQzOUUzLp1cloS+Sg30/xyn8ECTmamNs3AP6L94p2svkR3l
         g9g8eTGYP+0alfSdBm3rTgPOqay0fmkCtoJlBcUCsdwJq3j8B7sQ+ZKnnYozLFNCrI
         eo1Yjbxu38HEFqf3DZsEu3V69ebQj85GB7uKb/RlUNoQDDSKI/dKNWoAH5+VVJKiwj
         oflTlgPqfyXQPMAfv+4gJmYTaq9DSfd/MUvInfAoz7+aaJHE8gvXWdTHDOwnYvHh2K
         lvMIRiIECsfEw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 09:27:41AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tegra tree got conflicts in:
>=20
>   drivers/phy/tegra/Kconfig
>   drivers/phy/tegra/xusb.c
>=20
> between commits:
>=20
>   5a00c7c7604f ("phy: tegra: xusb: Add usb-role-switch support")
>   23babe30fb45 ("phy: tegra: xusb: Add usb-phy support")
>   d74ce0954cb2 ("phy: tegra: xusb: Add support to get companion USB 3 por=
t")
>   58e7bd08b569 ("phy: tegra: xusb: Add Tegra194 support")
>=20
> from the arm-soc tree and commit:
>=20
>   f67213cee2b3 ("phy: tegra: xusb: Add usb-role-switch support")
>   e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
>   5a40fc4b934c ("phy: tegra: xusb: Add support to get companion USB 3 por=
t")
>   1ef535c6ba8e ("phy: tegra: xusb: Add Tegra194 support")
>=20
> from the tegra tree.
>=20
> These are slightly different patches (the latter has been rebased).
> Also there are further commits affecting these files in the tegra tree.
>=20
> I fixed it up (I just used the version from the tegra tree) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Olof, Arnd,

There was a bit of back and forth on this because there happened to be a
conflict with the USB tree. I tried to clarify this as replies to the PR
request:

	http://patchwork.ozlabs.org/patch/1254523/

But I suspect you may have missed those replies. The bottom line is,
there is a v2 of the pull request that has the patches that are now in
the Tegra tree. That's already part of a PR that went in through the USB
tree as a dependency to resolve the conflict.

So as a result there should be no need for ARM SoC to carry that PR. But
if you still want to merge it, please pull v2, which is here:

	git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-f=
or-5.7-phy-v2

Sorry for the confusion,
Thierry

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl59/ScACgkQ3SOs138+
s6FG7xAAtsFMFTXn2daJeAwduvHdzjYOHqDpnNb4BtG0GPNzYa972YzaOyVoDT/v
7YxiIgLgXT8Nu1T4xA+CIJS9U9vtRv+Auvsd0knHCTAcU/plvVWf8E2eB7eITDaB
k3HdW8shjJ9LO+P5juQiOnRX8gcUEXW8jrzB4maccsFnKPr2vN/xISm/zYAKYYX3
pbZzGpl29ThP2hT/0MtWycK0NsXZM3GvAqsksnTScGRjRAg0LokpZiZxq2e9d+VE
L3b0bWXqB6Bb7bqQX9oAKb0rS5nlg8im0y/cCapklk5UtfREAiIDtD4Y1yz91NwW
y7gBiMJpjlk3eHPUv3Zf5KTNSArueFcz1qknm9UGYpSFw1oplLauGo15L8IkYQ83
XYFqNuYlbel7AI68LZeurpMWBYSWDz4SjD7mz//WQ+Q/RwGNoSVS1+1YA4IezM60
rrckIpHm9PuPtr4v21AqaFCeQ69TkRSY1rNg1h9yj1gPE65/BK7B8hg4ptIaQpCR
Fgue7ST3LkGjmnLY4ke0kz6jm3q1rnAVt4nBb8AoV7YdWXgfI51XfyWTy1Fmp1U+
jvg4TsYiPj5CEpG/dKfm5l9YrjTIHivMqUjTTQ90hL9HcYjmV+2UJOZwHsxQMr7r
AxhSoQ4EJaqQgf0LV3RdkH18HKmz/pQaFecWKei9gj1Ck7wNCqU=
=MO7Z
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
