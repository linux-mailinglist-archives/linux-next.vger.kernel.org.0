Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499FF53F240
	for <lists+linux-next@lfdr.de>; Tue,  7 Jun 2022 00:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbiFFWvg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jun 2022 18:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbiFFWvf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2022 18:51:35 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE664BC14
        for <linux-next@vger.kernel.org>; Mon,  6 Jun 2022 15:51:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LH7yT3LNJz4xD5;
        Tue,  7 Jun 2022 08:51:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1654555890;
        bh=1A61UY9JIDcFRZ4vU3MjM6sW+Vz3VaF/XVW6B0qvSfA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nKrOQqGQ3h8x1J/X5SU8WWSrqc+PXfjY6zcyWSjw2bctMAdsu3tFBUg2mA1ZCCXOa
         ZvvPfPyeV4yzvPNUAjWbexaxpa5TRZiP2ogZ4dE45UujQo5HPQnCd4HR2is751eGJW
         /moDCKXhmaNqTuOyWQS4FAktq+IyfO/2dFun00m5qJB7pjkSGRp0Qre9VXxKiKaU06
         26tlaM5fwo/hkM4nGGe99NHxHPQpW6vBX34bVCPSaAa9H7jV/MMhH/6MhGC7fn6/Lp
         MYw+kA2us5VgaDvTX6GKWC9AWOVK80NHlpNBAkPeqC81vMvPbQFdH3OjXP2neYMYL8
         6PBBQaiTMALCQ==
Date:   Tue, 7 Jun 2022 08:51:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     <Conor.Dooley@microchip.com>
Cc:     <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>,
        <linux-next@vger.kernel.org>, <Daire.McNamara@microchip.com>
Subject: Re: Please add Microchip RISC-V branches to linux-next
Message-ID: <20220607085128.58e003ed@canb.auug.org.au>
In-Reply-To: <5ecd9c16-ce86-3666-3c2d-a14218659d79@microchip.com>
References: <5ecd9c16-ce86-3666-3c2d-a14218659d79@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ariWqPvZlCbqwjiW1CaD6zO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ariWqPvZlCbqwjiW1CaD6zO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Mon, 6 Jun 2022 22:06:19 +0000 <Conor.Dooley@microchip.com> wrote:
>
> To take some work off Palmer's shoulders, I am going to send him
> PRs for "my" (Microchip RISC-V) device trees going forwards.
>=20
> Could you please add the following branches to linux-next?
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-for-n=
ext
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-fixes
>=20
> I had a quick look on lore, but couldn't easily see an example
> of someone requesting a tree that goes via Arnd etc, so in case
> it is relevant that the PRs will be to Palmer rather than Linus,
> my branches are aimed at
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/ for-next
> &
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/ fixes
> respectively.
>=20
> Please let me know if you need any more info,

Thats perfect, thanks.

Added from today.  I have called them risc-v-mc and risc-v-mc-fixes in
linux-next.

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

--Sig_/ariWqPvZlCbqwjiW1CaD6zO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKehPAACgkQAVBC80lX
0GxDEQf/W/7RK8A2H13yO1q46btlEHIg+GNter0IuVV712m24wiGtglZho28Lhw7
0Ah5E6MvrG2rk9Jp7JfdX+Frqi+mud/WtfPlBZzX/LIr396sb+QBtb6qq4DxQWK1
couzj3aah92Apu3h9iarJUuiGvedDBIEj20i0SB3+qZWzmCJSolmtT/O63jhHDKl
/QVcg+QB8wUgK941tHZhFDTwglchuhdhdQe8Q26G0d21fV2zFrgs0kAGpP6t8FNW
ECcP/eWkpmd8vZr58I/Am3/gs8lhqiCtUpoVsYnAhStqnT+Pbmf8JW7keK/gQ95y
92ZkVQqUA4gPB2n5kXoP5yhqHkqVWA==
=2viQ
-----END PGP SIGNATURE-----

--Sig_/ariWqPvZlCbqwjiW1CaD6zO--
