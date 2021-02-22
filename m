Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3DB320EB6
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 01:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhBVAf1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 19:35:27 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230028AbhBVAf1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 19:35:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkNVP0McKz9sBy;
        Mon, 22 Feb 2021 11:34:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613954084;
        bh=VfRDpx9Wi8+jY8k+PQgcoSgXApxNBZo8N8v/1wCGGVE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k6LUzjgd1ctbO9PPupSfQlEdJJD+VCi1V9i0u+ovr1m2zQ5aNfv24AKAvXhNgQYnu
         svF5ggZQyMna+38+opjjpZctfOgwcHt8nYN3FenHHZL6C9hcUXu9Wk0z6+P0eD+nG2
         kstqSjITIrMaDKEiZdWpQqTQMTdeooGChaSgvt+vflR56TwFxpRmkIOXXqYjHgRd7Q
         X2ltyeFR8EyBYOgHp4E/hB9/KDONNqmzyFfuKuyIYRM9KZRGXSbzES700Vva16efTJ
         dcqGoDkID2jiAO7eYGFwGYKaKRkmgUH/9PSyHZPmdSSD7iod64cj5cjRzwCW1Rw9B5
         6I90UC8BWXEvg==
Date:   Mon, 22 Feb 2021 11:34:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20210222113435.4069cb0a@canb.auug.org.au>
In-Reply-To: <20210217160714.7c1fcaac@canb.auug.org.au>
References: <20210217160714.7c1fcaac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OpHqCtnaEfx4=QmD/GyWOum";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OpHqCtnaEfx4=QmD/GyWOum
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Feb 2021 16:07:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/platform/intel-mid/device_libs/platform_bt.c
>=20
> between commit:
>=20
>   4590d98f5a4f ("sfi: Remove framework for deprecated firmware")
>=20
> from the pm tree and commit:
>=20
>   bdb154f074a6 ("x86/platform/intel-mid: Convert comma to semicolon")
>=20
> from the tip tree.
>=20
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between the pm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/OpHqCtnaEfx4=QmD/GyWOum
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAy/BsACgkQAVBC80lX
0GztQggAn+Autg6qoSkksmP2g3ChKlmu0uubfd6VU7153z9HzA/j2wlUziyaO4ER
YBtMTO/xER+EZ/pLUkQM8BuBn4t5lTjN+2SmvyafT2Aezrzy4X15UkCXgveyIG/i
DTaIfHDKuvfonidIEDANygp19628KNOQjIoMIBNK70k/6ZW6FIfgfx0JgNmUfylL
F+fcWPw08RSR3Sk/u4yqj7Hi+weT1VHUNRY7i2m4u2B71915Xge/rf/zgIVFoej5
TEAHwTq3kzMLQHMZtdZHIQwHpW1bZpSo7veaeOLf+8T9W2vjAGmo1UzD+wFk5vo1
H1c6/QBsCRQjX8eTYAmulBUraWOADQ==
=rMRj
-----END PGP SIGNATURE-----

--Sig_/OpHqCtnaEfx4=QmD/GyWOum--
