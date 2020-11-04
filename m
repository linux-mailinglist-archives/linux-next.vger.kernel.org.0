Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098C22A5CF0
	for <lists+linux-next@lfdr.de>; Wed,  4 Nov 2020 04:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgKDDKi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 22:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbgKDDKi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 22:10:38 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026C9C061A4D;
        Tue,  3 Nov 2020 19:10:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQs9175Qcz9sTK;
        Wed,  4 Nov 2020 14:10:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604459431;
        bh=SsW5g/UyUkFm9CgpdNzPe+OG9d5DrqLHuqDsjw83HH0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dyOU6Cu9VGZ4reRd50pOl+zRAIXwwhaO88NTZh6mfyPiu5vRebbgL1eMijsUpctHH
         Unre+6Y4S3Hiu7WYNBN1UhNwRvm5I1QosisUrRDMFUMOJVSLhUhgWowZfEZbcYVSnb
         ajj76ovIOLaYq2Re5yZCHiQFMAEB7gGSal3isLisY1drSX9COIXiupbFUqQRx99e0n
         2U1xGerY5wfYYnQ4WCP2xmE9uqqJLU08kIzDU0BggXyH0AEntqWF1uIN7t4YtGQQnP
         Bt2Nc1RYZBNzvROWFejgfMfKmJcPudAcEOwHXr4GAgWhNi6rWN7NsZRe8tTcfZQdJF
         UEW3gNVrGptHQ==
Date:   Wed, 4 Nov 2020 14:10:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20201104141028.420c9274@canb.auug.org.au>
In-Reply-To: <20201030125016.3423d2fe@canb.auug.org.au>
References: <20201030125016.3423d2fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZPX5B4egHID6jI83QT7gl6i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZPX5B4egHID6jI83QT7gl6i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 30 Oct 2020 12:50:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: "irq_gc_set_wake" [drivers/pinctrl/pinctrl-rockchip.ko] u=
ndefined!
>=20
> Caused by commit
>=20
>   6c684f5e79ea ("pinctrl: rockchip: make driver be tristate module")
>=20
> I have reverted that commit for today.

I am still getting this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZPX5B4egHID6jI83QT7gl6i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+iG6QACgkQAVBC80lX
0GzdfQf+PwmQN3DON6ybViK8bPQRaU7UqeGEJXFCMFKFUKVyE/fwRZVFsST6/EI7
BZdqNtZ2o3QLgyq77OM4D8oJGeBxAgCsIXv+qE8UN2786w+bETZ6Uw1rPYTcgKHI
D6ABeDMjfPpyhHtGe9hm6Je1YTXLfMsAXoR63Z96OMnJ05mrHF+NgW4qo3HzcKYZ
gDJTRQF0BvxAePCfwJ4cok+E53bd55wbdwq1xSp0/0+Sx/bVX629aErd1U2DCdkc
9LGfVP8kqVhnxMoNs6jnyDM2MkiNu7OmaF5nHRCo1BEzfgw4BQ5RKTgLXFjiNM7V
1oUKCunn1P8iIjKPJx2QEle47yetAg==
=hH0l
-----END PGP SIGNATURE-----

--Sig_/ZPX5B4egHID6jI83QT7gl6i--
