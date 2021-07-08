Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156663BF3ED
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 04:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhGHCYu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 22:24:50 -0400
Received: from ozlabs.org ([203.11.71.1]:59379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhGHCYu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jul 2021 22:24:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GL0Rg52VWz9sWl;
        Thu,  8 Jul 2021 12:22:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625710927;
        bh=zIKl5clb3BQTrnUUuqcPhVpbX0L4JZqYz7Q5aow2jQI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fCDffvgS4qYOmCLwGhy8nukawJZ8a0UYH2IAbEYg+8+zYCLpdi5guGj/tvl6rjeQf
         CIe9NUg9ctlbeM5v68xfG5FeeaCyJpi0g/T4cTINw6+tUCWCwvvpprIsSUGJr5uMU7
         9LjlfwrG/VAFEqy15pLlOcN5yldhUH/kRwKAInND6wMvtaxnZDjOE6Sl9K82fHq0gg
         iSpyKkD043RGJ3lN2IGGNvUYEWJEU5cgrmB9+XsWrdEHdhK3zuZ2dfTT20O93rkkLm
         4QQjxcr6KjzbeAbjqWhQKZe/zGUubMWfhwp3Md6rZ94UuM+HfxK8Qmt/J3LCul28+u
         CSum9W3zT6wVA==
Date:   Thu, 8 Jul 2021 12:22:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Rajat Jain <rajatja@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <20210708122206.77856786@canb.auug.org.au>
In-Reply-To: <20210601183002.26176586@canb.auug.org.au>
References: <20210601183002.26176586@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yI1DXKZYufAyZlKaoEI.irb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yI1DXKZYufAyZlKaoEI.irb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jun 2021 18:30:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the usb tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected =
indentation.
> Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote=
 ends without a blank line; unexpected unindent.
>=20
> Introduced by commit
>=20
>   70f400d4d957 ("driver core: Move the "removable" attribute from USB to =
core")

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/yI1DXKZYufAyZlKaoEI.irb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDmYU4ACgkQAVBC80lX
0GzLTwgAjBOdQFAKaLco2TWvT/BdFoTmguGSh9NVzkMWtmQGowO5muuASvHEw1Re
SAEqPuARuSXLNkIfNnZvftM4GnlZ74T0/gRHjLPiaezRRRISnwlu5e56saGG5pXA
sShonhZ1Ssfb0mBq/HmNll+cKmNM3pKLlT1NlLX3Efg1H3QcnK2/a+ZdvHb57qY3
lAaZtLTH00R8kmI5fvOEYILecVmnPL6wd+/JgtfTlrNJSF4qX4bcCk00VXlEHUOl
LjrrhQmFpBHsLq5J01nH3dh/GwLK+XfhTdQbknN9ckmDE/uEtfpyQzHpnuiNuaNI
J6jzgtc/tnsAX0CERDGwjB8jS+yLfg==
=Kpgb
-----END PGP SIGNATURE-----

--Sig_/yI1DXKZYufAyZlKaoEI.irb--
