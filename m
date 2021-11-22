Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E518045972B
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 23:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238864AbhKVWOA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 17:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233806AbhKVWN7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 17:13:59 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADFAC061574;
        Mon, 22 Nov 2021 14:10:52 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HyhL15X1Zz4xbH;
        Tue, 23 Nov 2021 09:10:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637619050;
        bh=8fWNml51gkmMKtVNqFQEJdpeFTwUXPWk3Ijc+C7T5QA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r69MHDv/BT1vlIg+QqDkEluouO26zdPVA2R5fpuY257B5UAGLxiLuCVfuithr1ryg
         rbnl35mj3ZKWtrmjaTVk+62FfoWbAos+ooPxwTFAufYPpkwayldaYIfDrTht9gnzcD
         s6FcQLTEXKiOiwVWSZf4jDE5Z5/Uq1oo4bdzVkSfWekMgVLKrESwMFEpPiVOYdX2Z7
         9Sl/htEkLvLWFqPA0gJi8ge4kGJB2kEqItmZYXZGBWKLf57WjVQOGdW8VPpZBjNlCI
         kLTKdS/8qM6ZoZ+dm+QGICcPIshVBnUP+vit4yOMGlkyFPyFVgDj38W5YowxpSbyDm
         EHo79dIip0YAg==
Date:   Tue, 23 Nov 2021 09:10:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nishanth Menon <nm@ti.com>
Cc:     "Raghavendra, Vignesh" <vigneshr@ti.com>, <tony@atomide.com>,
        <kristo@kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: Re: Request: Add Transition TI Tree to linux-next
Message-ID: <20211123091048.30adf6cf@canb.auug.org.au>
In-Reply-To: <20211121032548.c56zt66ac5hjbu7j@garden>
References: <20211121032548.c56zt66ac5hjbu7j@garden>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/34ZL2q2F8Do5ePr4IHJzIyl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/34ZL2q2F8Do5ePr4IHJzIyl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nishanth,

On Sat, 20 Nov 2021 21:25:48 -0600 Nishanth Menon <nm@ti.com> wrote:
>
> We have been working towards a rotating maintainership for various
> TI dts and potentially related areas that Santosh is currently
> maintaining. As part of this, my tree[1] is now integrated into the
> common effort.
>=20
> Please replace my current tree[1] with:
>=20
>    git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git#ti-next
>=20
> We will follow the usual rules (GPLv2, contributer's guidelines,
> reviews, successfully tested, meant for next merge window and intent
> towards linus's tree via submaintainers) and this would be a rebased
> tree as needed.
>=20
> [1]
> git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git#ti-k3-next=
 (ti-k3-new)

All done.  Tero Kristo was listed as the contact for that tree, and now
you are both, along with Santosh contacts for the new tree called "ti".

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/34ZL2q2F8Do5ePr4IHJzIyl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcFWgACgkQAVBC80lX
0Gy9Ygf5AerihBKZILTb9unwj3dBAWl/qyc3O3Xc4U/AQ7ahdcmDGMiKij+dqAs1
+M5/mHQ4FesiwmluPz6XaBfkeTP1frdHT8rDcBWwS6gw6FlgxmlBeN2ww3CVcGJr
BtPqYp3470B57s2poZXOfug52PIWa9kop1XyfMiyMwtkYCh/v90VnVQcGRm+EF+S
1Qf6DJCN1FoPzxj5LOPGGmNfIAfOfnND6MwXhh0lumNsdEaXJElMmyXz/xz25qYY
nW5QbWjt1TChm36bNDCJY2keHw59oTljcWTe4PA656aq4enNtiQMHpLKkn+8mHQN
5kQsJAU3/BI1XubczgbNGwty+e40ww==
=zzx+
-----END PGP SIGNATURE-----

--Sig_/34ZL2q2F8Do5ePr4IHJzIyl--
