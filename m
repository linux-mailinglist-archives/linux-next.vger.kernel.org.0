Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12646362428
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 17:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343865AbhDPPku (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 11:40:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236325AbhDPPku (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Apr 2021 11:40:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5741611C2;
        Fri, 16 Apr 2021 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618587625;
        bh=8MtiE0FbPfA5YxzFgo5RoQ19Q1k97WY5Ev8YkCTv+UY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R9jfhMgNlKrbkQqvBG2w9VDECCzOhF42xQmH6ojPk97zVkg2PEsicKwPp1iYsf+Sv
         31hkUfcaK3s65Xj3BgWV5fs9Pf6vqXgt2mKBemjBsUYYnVZO4Dj8/mzrb8novWNISu
         jqCndQVUfVE/ao4PV5Vi3UpZ34vojdcUwyTo8OjUYzI2FjIHXRtKHQmpl2LosOfZid
         DrcVo6jx7TEOa6wpbGD+cHnFiMLlfHjql3MmDJZOV/bWLa7lkf5Bm/Sh5wQUD64Bf+
         3MFaEtrzoXGJ8WsqxuoIUrXO7qTGQ34LPnDPsqBQypjbCikH8Bgv7CnzkIfHU4uIA8
         Ze6Ph8IsemPiQ==
Date:   Fri, 16 Apr 2021 16:40:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [next] aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
Message-ID: <20210416154001.GE5560@sirena.org.uk>
References: <CA+G9fYtVGhCJbnY8Hro2qx-i21cOeEBD6t_yz7B=O6Y7gD5bkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Oiv9uiLrevHtW1RS"
Content-Disposition: inline
In-Reply-To: <CA+G9fYtVGhCJbnY8Hro2qx-i21cOeEBD6t_yz7B=O6Y7gD5bkQ@mail.gmail.com>
X-Cookie: Snow Day -- stay home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Oiv9uiLrevHtW1RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 16, 2021 at 08:45:04PM +0530, Naresh Kamboju wrote:

> The arm64 allnoconfig build failed on linux -next tag 20210416

> fpsimd.c:(.text+0x144): undefined reference to `sve_load_state'
> aarch64-linux-gnu-ld: arch/arm64/kernel/fpsimd.o: in function `fpsimd_save':
> fpsimd.c:(.text+0x1f8): undefined reference to `sve_get_vl'
> aarch64-linux-gnu-ld: fpsimd.c:(.text+0x230): undefined reference to
> `sve_save_state'

This was already reported and fixed yesterday.

--Oiv9uiLrevHtW1RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB5r9AACgkQJNaLcl1U
h9Dwowf9GZ9742dGy47lBFFIRtJQfW3YeR6Zec4B/fzeFbndskot54k1di5PRkPz
KErwcdoeNCOpi5Q/6HsJLMdfP1Oytd64POEGtOdYiv6TsqCs+Bhw3UX5zRk66Fjn
an6+YhpecHkV5VleIMNk7BYxA7BqObsKuXrUKyi3wW3L15P/uf3lCuj+yir8EMny
G63NSzw0sCt1Du3SQMGL2mS2CwrN2CW8UAUBYzP5fAb1iksx7Ea0jhkYGERudMGF
pPIOVCRe9AXMLeOVndz5Y4QEgPvlSYh1shbShChPtLhYfdnAc9VOjxoP6pyz/lRw
50PbzdNzHTnfUtIh6kQc+7qz8BZgxQ==
=5A73
-----END PGP SIGNATURE-----

--Oiv9uiLrevHtW1RS--
