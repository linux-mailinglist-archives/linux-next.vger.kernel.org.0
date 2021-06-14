Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A8F3A71CB
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 00:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhFNWOF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 18:14:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39183 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231226AbhFNWOD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Jun 2021 18:14:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3lzd5KfFz9sW4;
        Tue, 15 Jun 2021 08:11:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623708717;
        bh=Fij6i0iOv5D+lzV77efCPEQp99R7jOV/kigxL0k9Gu0=;
        h=Date:From:To:Cc:Subject:From;
        b=ORjhtp4AmPvLYoCDl0rLFgm727b14AnZd/XRFGi0hZWIYjZn1VTlgQjKM7oYPMK8/
         YP4zim5aJpfhe2vULnyYPwbdBGs2jVvxPlMfEqGHQFr8j125bWGKbdUSzgGS27erES
         TSXxIdzerRJAgJkQgqV/hMROyb8RrsnYjppa4m+lC3CEXnZVdAhYCruGQyi9qt7GEs
         5+5loSdoYe56CzKNOSOWzN4wA2MrXWjOOE16jsOWGYbB2EoHCEF8iQjXj6Y0LSDBI3
         9371R9XyfC9D1PNPOMsR4G7FC0EpgO2xwWqc90owBUFGa94Ajzq7T4uB+MmTqBKh/a
         Oe4D3uhZ3Bnxw==
Date:   Tue, 15 Jun 2021 08:11:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20210615081156.708089b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hN9ecARLt=ZpVfTkbGV=fgc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hN9ecARLt=ZpVfTkbGV=fgc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  da0363f7bfd3 ("ASoC: qcom: Fix for DMA interrupt clear reg overwriting")

Fixes tag

  Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")

has these problem(s):

  - leading word 'commit' unexpected

Also, please keep all the tags in the commit message together at the end.

--=20
Cheers,
Stephen Rothwell

--Sig_/hN9ecARLt=ZpVfTkbGV=fgc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDH1CwACgkQAVBC80lX
0GxW8Qf/cFTUSDnnDHyIMCvZ41bMD9dFuYrHpln/qbXwH5/mo17/856gLlCHBktZ
OVeNQS5io3mVyAoHbIlaW2bgbvNEk9D0yOYvFgVMirlJE/yEOEQPgasdDMrwc8Ne
njhK62SMDQ7GzdLdMBmSMAAuDvIpA6N20oMQo3Ae8L6RaTq3e/jpG31gsX2EkC4Y
fjBgjNRp4UA/0Gm6wZ5jH/oYuXzznczDsGasVUrpEedWpy6naUX4VO9AScpK6pEm
pGAh7YCzzcE8cZn0hl/j8ElSBe4AycI+jPgDMTuUZGz0Ra1zEJp9iNcG8UL7Yjyv
fJug+fzby9uYWKVETk9x4a6du3Iz6Q==
=Xdar
-----END PGP SIGNATURE-----

--Sig_/hN9ecARLt=ZpVfTkbGV=fgc--
