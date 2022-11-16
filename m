Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF88462CDB0
	for <lists+linux-next@lfdr.de>; Wed, 16 Nov 2022 23:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234272AbiKPWa2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Nov 2022 17:30:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbiKPWaZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2022 17:30:25 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51645B5BB
        for <linux-next@vger.kernel.org>; Wed, 16 Nov 2022 14:30:18 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NCHmh3fdHz4xZh;
        Thu, 17 Nov 2022 09:30:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1668637813;
        bh=pxNujo1CgtF4mn/OS8LidMDNjBIryqmffHKJTKxIG9k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MkDsSv4Fk/H8nPaM0qBszwKCb/492w5KxjYbEEC/sFTcWabNvppsuxZr0GKClALE4
         nGeqXaP8u7y9A3MegsCEtEOdNBOj7/l3TMyDwS0xtirHxmWEHoPxpxMl9tCf4p2Z4L
         ZDSv7XZhhfuBCDOw6Z1sBHpeCbyGm7p/ksYEaxiM8vmOOOrmXlPx1F4lXVRQNbO78J
         OJ37U5yhk+ao9PGbVHUefEjVZ9IJzWRqMq1mBltJTcLYUZPqtTgg3C2nrnVFq0SsqR
         5a65LA21e7d/5dm+v7UDTDceVBUmrdIGuOQH1hV6bbXgdZ1sm5JuTyYcN6S7K7+dBR
         IqkHDedxUAVhw==
Date:   Thu, 17 Nov 2022 09:30:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Conor Dooley <conor@kernel.org>
Cc:     palmer@dabbelt.com, arnd@arndb.de, linux-next@vger.kernel.org
Subject: Re: RISC-V DT/SoC branch changes
Message-ID: <20221117093010.74cf9d0a@canb.auug.org.au>
In-Reply-To: <Y3PqngfnCG/jVyJp@spud>
References: <Y3PqngfnCG/jVyJp@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d3vc=pu+LFUO5B9.3O7zqF=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d3vc=pu+LFUO5B9.3O7zqF=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Tue, 15 Nov 2022 19:38:06 +0000 Conor Dooley <conor@kernel.org> wrote:
>
> Currently you've got two of my branches in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-for-n=
ext
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-fixes
> which are named risc-v-mc and risc-v-mc-fixes respectively iirc.
>=20
> We're doing some re-jigging in RISC-V land, and I'm gonna be taking
> patches for other RISC-V devicetrees in addition to the Microchip ones.
> I'll also taking patches for drivers/soc that are for RISC-V SoCs.
> The PRs for both will be made against the soc tree rather than the RISC-V
> one.
>=20
> Would it be possible to drop my existing two trees & add:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt=
-for-next
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt=
-fixes
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-so=
c-for-next
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-so=
c-fixes

All done from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/d3vc=pu+LFUO5B9.3O7zqF=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN1ZHIACgkQAVBC80lX
0Gwkowf+KCzfBQlNNaEj1MkD1vCw0bBrySShqNFwVsS9/J3z3hmg1Ly3xluxKL6d
e0/xSd1GmL5g4sre81I1rrwACStKHgL1yJ+Zn7uGnYaON69o7bXLBC8WjXmJOhKI
AuqpbaWpC5pM58prLO5wEuXH4eqFBK7UO6a+JMeKxFWuVgHlNGoRzImKxDoQMZlX
QZunBBMpUkYhAXLPLGG7z+zNKYUAud59LS7zUmJ+g00nOSDuQDe+ci85RIdV+2UB
/laQjcBbcBMBezfLeuE0Z6h5+9Y/bwqRwZslRuV3EwrlWsEK1JfA7v+sEqCxYTdn
vXqaGul24gjoNsWwdVxRnxMFrsBD1g==
=VCSn
-----END PGP SIGNATURE-----

--Sig_/d3vc=pu+LFUO5B9.3O7zqF=--
