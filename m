Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C71A6420A9
	for <lists+linux-next@lfdr.de>; Mon,  5 Dec 2022 00:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiLDX50 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 4 Dec 2022 18:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiLDX5Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 4 Dec 2022 18:57:25 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33746BC29
        for <linux-next@vger.kernel.org>; Sun,  4 Dec 2022 15:57:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NQNrz5R4Wz4wgq;
        Mon,  5 Dec 2022 10:57:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1670198243;
        bh=Tv6YY3v79KWJ1et7njPqWT1X79SwtsGWoLrQI17ih1Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WbOkWexd99dIkdvlDklrRFLIgk94gqSTgcjb4wFj9hMX1nvb864f3FpTkW4ea5VE0
         xEXzRyMlp9Wl2uV2qcVRLRvUhwnzD7VkE5tU33CS1WRFGKaUJkSCf3xTlD/BrVW/k5
         TQ6D9ZMIJ9DqEQHmi+eiqXGUAMTkAwOFQx/vaFSbohacZYYC+ge0ZMTWuJa/11dcad
         ZHWpvew9C5736kYS7A+pgKMgQX20iiTQgMwDTmIGR2Abu5MGJzxHO95Ms3UsY/maI5
         QHvHvJPG4ARGudU98Du/uRkYF99cgJXMT4pFnD9sGYUV4OMWrB1Ww6Bdc2YymOxYhn
         wtMEX+W0G1YvA==
Date:   Mon, 5 Dec 2022 10:57:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     <info@kernelci.org>
Cc:     <linux-next@vger.kernel.org>
Subject: Re: next/pending-fixes build: 205 builds: 2 failed, 203 passed, 6
 errors, 40 warnings (v6.1-rc7-310-gb04468dba0c6)
Message-ID: <20221205105718.38e244a0@canb.auug.org.au>
In-Reply-To: <638d2def.170a0220.a77ce.05fa@mx.google.com>
References: <638d2def.170a0220.a77ce.05fa@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8X8TOZIqrBYwtei5y.lUOC+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8X8TOZIqrBYwtei5y.lUOC+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 04 Dec 2022 15:31:59 -0800 (PST) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
> Build Failures Detected:
>=20
> arm:
>     rpc_defconfig: (gcc-10) FAIL
>=20
> mips:
>     decstation_64_defconfig: (gcc-10) FAIL
>=20
> Errors and Warnings Detected:
>=20
> arm:
>     rpc_defconfig (gcc-10): 2 errors
>
> mips:
>     fuloong2e_defconfig (gcc-10): 1 error
>     lemote2f_defconfig (gcc-10): 1 error
>     loongson2k_defconfig (gcc-10): 1 error
>     loongson3_defconfig (gcc-10): 1 error
>
> Errors summary:
>=20
>     4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =
=E2=80=98-mhard-float=E2=80=99
>     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7=
,=3D0x'
>     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3=
,=3D0x'

These have been around for a very long time, now.  Is there some way we
can get them fixed?
--=20
Cheers,
Stephen Rothwell

--Sig_/8X8TOZIqrBYwtei5y.lUOC+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmONM94ACgkQAVBC80lX
0GzO4Qf6A9dZiXu7PhwF3IKdFr58tH/1Vm8wGL63en0CqZdgftmyzYZ2IMmag1xS
4sekpkna+XQZmWHFOjFwNnWmu1EYXfVosaw7GfKfJRMB3Ggll19B9IEupjyyOwbG
y+t3fmHIKC86I7n4fJG5vF/ThbLqgeLNV+H5HDezbOS705kHiFNkJbYVVLvovPbh
NyopZlQMBzkmiGOGACncMUGQ1SBFerkNBpvbVfdwoZKI3RgnJ4xPKlsFEekjA8UZ
LhmO4pTs0KT8970q9TqxM3zH7V531mB6zQMfG8TKhwEvvzusIWNXMZmaLWkxacIC
J9dpSth/zzYc61GVB9dQvnlzWA2JLg==
=PFQa
-----END PGP SIGNATURE-----

--Sig_/8X8TOZIqrBYwtei5y.lUOC+--
