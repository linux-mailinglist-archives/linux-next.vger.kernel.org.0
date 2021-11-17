Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084BE454548
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 12:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhKQLEB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 06:04:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhKQLEA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 06:04:00 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FC4C061570;
        Wed, 17 Nov 2021 03:01:02 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvKjL3ZBfz4xbH;
        Wed, 17 Nov 2021 22:00:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637146856;
        bh=RtfnGt8HIvX8gJjNg0RB+qEpTL+Cr6T2c8qv8d5pI0Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rti8rBfiUmCqx+F+bXUB2rB3TRL2dB570+jVuAxbpi4Z+yyuYuEhBfpe8PfI7A7H7
         lRjY5HZrPzrS/C9OxpuXxvVFf1rb9FfbwKDD3UER/YR8v7Rjml5Krq7R+V8fjTTppm
         RX3sqN8EoecqWVro0ygsuZ1FnN1dDa1iAyN3Sor41Ty3pk1CDk0shsxV3F2GjgbAAV
         1/PzreNP0kpvZQIlaEbdIrqUQFwNeAGVCJt7OOJwZ/yR+17jSfylCXC8Bg24JpWsoz
         eWc/9auugoUONJ6lv+UXED91ZfKWwqAgB4SNlNoKWW4kK7E3tDkgnA1guNDHUc/Chi
         2sv3GkVUdj99w==
Date:   Wed, 17 Nov 2021 22:00:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org
Subject: Re: linux-next: build failure after merge of the drm-intel-gt tree
Message-ID: <20211117220053.179a82e4@canb.auug.org.au>
In-Reply-To: <163714535048.4529.4694769143307309201@jlahtine-mobl.ger.corp.intel.com>
References: <20211117100223.52c7460a@canb.auug.org.au>
        <163714535048.4529.4694769143307309201@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WpZm5acPgFKXFiIr8uVD1kW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WpZm5acPgFKXFiIr8uVD1kW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joonas,

On Wed, 17 Nov 2021 12:35:50 +0200 Joonas Lahtinen <joonas.lahtinen@linux.i=
ntel.com> wrote:
>
> + intel-gfx mailing list (Stephen, can you include this going forward?)

I have added that to my contacts for this tree (so, yes :-)).

--=20
Cheers,
Stephen Rothwell

--Sig_/WpZm5acPgFKXFiIr8uVD1kW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGU4OUACgkQAVBC80lX
0Gwtwgf/QNDmqkupa9pHTublHJve4GjVHVX+cQ0FNkZ6ZVlfXI8eM9lspa3PNcna
+3/e8s30k0xEUPsEgJw+tWM1aRQsSY4VcK2dR9doJJCwWnYWldjL8Kod+4jsslmQ
80Cz8sBIUwzI+GQADbAddiQtjQh0KKnhN5nSmgmieh0elip7UJxh/CGhHGIaMlIb
k6nC2u/NRaaRmA10+pZlJX7Bp0V5sblPdZAuxAnj83J37Y7TngyxCfq82MGmMHkr
qMWzawgN3CsMCaUxHTSU4V34yMqxuBAK2I8eKBf1rCmWfP/uG1a43UE3xgTrVMOP
jiooGKH7xjADdEBiDnvSM2aTuvnnPw==
=FIHS
-----END PGP SIGNATURE-----

--Sig_/WpZm5acPgFKXFiIr8uVD1kW--
