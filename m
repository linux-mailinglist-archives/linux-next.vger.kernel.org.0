Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D3241A334
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 00:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237658AbhI0Wly (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 18:41:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59623 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237501AbhI0Wlx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 18:41:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJHdm2p6Bz4xZJ;
        Tue, 28 Sep 2021 08:40:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632782412;
        bh=vNpEcXVVksqC51120o+vuN44SyPkZ6h7MAFLUntSm4w=;
        h=Date:From:To:Cc:Subject:From;
        b=ujJdXu7Y3+sNjKOaufQ+QtviH2EFFtkyWvPpKIJPUqE3xAtYY4JEHTwHPxzZeBIha
         rT4C5OXZaZOq0vZzzvHWASVxCoC6Y5fNXWsUTcSuePbkRhjHNVhKqbvTD+nBa7c/Zn
         EvInl57yMIx3B3MXpbBx22ncOcsqBMyuyKymRNjA5Ifp3y7hNJphcbONLkmLrIQ3Jh
         v8WK7jPwgk0eIkGpyXgLoX8eO9Xt5jcoi9wohXj5EXP6VmIJvxkCPzyzVXV1tUKwXU
         NSx4DZhuV1P+l+EEVOHjYRFKK32HP7os/WDNxvTaheriPMRfl3CUFkVOnAA3exlGUp
         kMlq8BhmoCYyQ==
Date:   Tue, 28 Sep 2021 08:40:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the rpmsg tree
Message-ID: <20210928084011.3f2318fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D=Ec0jQgV8qa76EBDocRZuQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D=Ec0jQgV8qa76EBDocRZuQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5346c95245ad ("dt-bindings: remoteproc: k3-dsp: Cleanup SoC compatible fr=
om DT example")
  e24acced0dd9 ("dt-bindings: remoteproc: k3-r5f: Cleanup SoC compatible fr=
om DT example")
  6944d19dfd0d ("remoteproc: mediatek: Support mt8195 scp")
  3c14c79a4c32 ("dt-bindings: remoteproc: mediatek: Convert mtk,scp to json=
-schema")
  fc265554dbc8 ("dt-bindings: remoteproc: mediatek: Add binding for mt8192 =
scp")
  d75e3e9fa929 ("dt-bindings: remoteproc: mediatek: Add binding for mt8195 =
scp")
  4d2236dbeb09 ("remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC r=
emote procesor")
  059efbbfa03a ("dt-bindings: remoteproc: Add the documentation for Meson A=
O ARC rproc")
  ee3eec23f843 ("remoteproc: imx_rproc: Change to ioremap_wc for dram")
  9da2a820edc7 ("remoteproc: imx_rproc: Fix rsc-table name")
  f64051b28d2d ("remoteproc: imx_rproc: Fix ignoring mapping vdev regions")
  cfaa53387e8b ("remoteproc: imx_rproc: Fix TCM io memory type")
  a46fb6875d39 ("remoteproc: Fix the wrong default value of is_iomem")
  c7e587505b2b ("remoteproc: elf_loader: Fix loading segment when is_iomem =
true")
  a57645ea04bf ("rpmsg: Change naming of mediatek rpmsg property")

are missing a Signed-off-by from their committer.

All presumablyrebased :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/D=Ec0jQgV8qa76EBDocRZuQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSSEsACgkQAVBC80lX
0GxW2Qf/SlHUvrrMKCeCW9VOFvQPkyotX9nw8jAEDvKn5dz6+YcMsBtMgpTZ+Les
+j+2Zz1ubY8TXf5cO+UFIF3aeNNRnUy8SKyPGvYUATWmrpuJvF+8YAFRE6EyHG+0
vqpp5ZKGhRlC6WD23U+darZip9+jGrw3zoa+gEgMhe9ukj19dN3DZ1aCYYiyYF+1
V38h4dV6fajjpGwq2UwDwM6Ti/QGBQzIXVS1JSehD82GvfTPLaC/R+OadmHS9U84
Uulupi16NLsnmAoTgIxL2kgxzkvqlwevbU/4NW9sqkun2T9ttzeRJmQiR36p+N0x
U4pae10biOmNAyEqk5IwXLlKaKsHKg==
=zY7Q
-----END PGP SIGNATURE-----

--Sig_/D=Ec0jQgV8qa76EBDocRZuQ--
