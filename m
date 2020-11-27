Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E4D2C6074
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 08:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405312AbgK0HYR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 02:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389420AbgK0HYR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 02:24:17 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E959FC0613D1;
        Thu, 26 Nov 2020 23:24:16 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cj5j805v0z9sSn;
        Fri, 27 Nov 2020 18:24:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606461853;
        bh=5jevfUsngi/iISg8CFOC7weL4DqqhG4znQEtEJ18xFU=;
        h=Date:From:To:Cc:Subject:From;
        b=eQ7XxXeMSNleUeWVsxER0pk3nhjubhI6TNp+tt7sBz+E97lGAcAGAaRadSkhqfdGN
         9RUZ0eTf1/NfcuDksSiJdtydg8SkvnZpNKYEgub/B9o4YDO7qKZzirJ6iNJNoSxE+S
         L9kGdiIJjYA8GrgF5ipqlTYS3QAt+i6KzwYXS/RgD7EQOHOZ+XtFQOFaJBDcWcCLBx
         DY9q9b14tU4EEuh3xMh8aSBDVNsPxDX9jK1kpfin0BekHqdaoNWEzl1X2qiJk1mkEX
         nO+25pBhTdjcq0oL+BgkAUxDxHENSRYIweNWkjkw1lWSkttZehez4m8A+WWLaCQeej
         7BHDZliI2qr6A==
Date:   Fri, 27 Nov 2020 18:24:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jack Yu <jack.yu@realtek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: linux-next: build failure after merge of the regmap tree
Message-ID: <20201127182411.07c15471@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ogV5BQmY97hKupnX66xZZKv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ogV5BQmY97hKupnX66xZZKv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regmap tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: sound/soc/codecs/rt715-sdca.o:(.opd+0xf0): multiple definition of `rt71=
5_init'; sound/soc/codecs/rt715.o:(.opd+0x108): first defined here
ld: sound/soc/codecs/rt715-sdca.o: in function `.rt715_init':
rt715-sdca.c:(.text.rt715_init+0x0): multiple definition of `.rt715_init'; =
sound/soc/codecs/rt715.o:rt715.c:(.text.rt715_init+0x0): first defined here
ld: sound/soc/codecs/rt715-sdca.o:(.opd+0x108): multiple definition of `rt7=
15_io_init'; sound/soc/codecs/rt715.o:(.opd+0x120): first defined here
ld: sound/soc/codecs/rt715-sdca.o: in function `.rt715_io_init':
rt715-sdca.c:(.text.rt715_io_init+0x0): multiple definition of `.rt715_io_i=
nit'; sound/soc/codecs/rt715.o:rt715.c:(.text.rt715_io_init+0x0): first def=
ined here

Caused by commit

  6f4a038b9967 ("ASoC/SoundWire: rt715-sdca: First version of rt715 sdw sdc=
a codec driver")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ogV5BQmY97hKupnX66xZZKv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/AqZsACgkQAVBC80lX
0GzJ7Qf/cieAPpN/cNkQHzRF+Cxdmk9JoAWVhA9g2xaWwBKMK23reD+5kHf4paDs
qspxcbBTgULd8XPFi9LuWCEtlqUvLnkzX+KZ1mOhWPDhhIb25qW5Q1EPkTAUKupu
ApW/dFWJtsNNs8c6H/8dOUP/T7soiLN6swFB0iGfj2C7TxlVQ0yv7K2ZSJw7yoUY
jxe4Ltwuf2uM2t6I1g0MYFui1/5fNmBtcYOpkdXdVLf1eKE3m1AsrMYL8yyZaCDs
CEd+eACJY7Ku9fvs6RmcwZbXx+4a84XwFh+RsIx3QipoXISXIYGOa2nU2yCBWob8
4SWG0JnYTQZ2GO9XMxUuIdhPC8zLAA==
=ZKt+
-----END PGP SIGNATURE-----

--Sig_/ogV5BQmY97hKupnX66xZZKv--
