Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 303FD153A49
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2020 22:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgBEVef (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Feb 2020 16:34:35 -0500
Received: from ozlabs.org ([203.11.71.1]:56187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727106AbgBEVef (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Feb 2020 16:34:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48CZZw6zZyz9sRK;
        Thu,  6 Feb 2020 08:34:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580938473;
        bh=WHWmgC92V20TWOcLw6cqHC4Npa7P7iAOG0Aue8L20SY=;
        h=Date:From:To:Cc:Subject:From;
        b=VWLJmndAsgyvjjAoWkjrxGvUjbJVi1VQSUynCmDSWg1IDiX5yLeYNy6p/8RjzLAJI
         kHlkVzpAaw+PiYNLJWDgAnypMpaNJzzsiMt9QxIi+e5kNfQY4XdA28/352K8ZCfWQ8
         6pTiFACXppQE86tOdnEHGYQVx+Ckzi9BRokIpT95+hA6ZJaZ8iii2P5O8g9mOQ6YdT
         75DwJ6vDvNpNpga/rpktKfgbgQRmW72m6585bp5fZ3X+COlb9nH236yFLQ6iwahgIf
         hMh/F+JOtxpnFG0+aGoi9OFiTd4hf15l30BFMyoWE4dghNSDtM3mLN6RSkn24EtnxG
         UPnkxTju8vfBA==
Date:   Thu, 6 Feb 2020 08:34:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: linux-next: manual merge of the clk tree with the devicetree-fixes
 tree
Message-ID: <20200206083418.3a6025f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/itjbU1yiKo8ojp_0haFe1Oo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/itjbU1yiKo8ojp_0haFe1Oo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got conflicts in:

  Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
  Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml

between commit:

  04dbd86539fd ("dt-bindings: Fix paths in schema $id fields")

from the devicetree-fixes tree and commits:

  e6747e24f15d ("dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7=
180/msm8998")
  8cff43d46cfc ("dt-bindings: clock: Cleanup qcom,videocc bindings for sdm8=
45/sc7180")

from the clk tree.

I fixed it up (the latter changes seem to have included the former,
plus I removed Documentation/devicetree/bindings/clock/qcom,gpucc.yaml)
and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/itjbU1yiKo8ojp_0haFe1Oo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl47NNoACgkQAVBC80lX
0GzUeAf8CMywMkYHpwZfBxydz0Psln0BS6hlNDVSHzbpenZhAuOZMKOE9/4NbSQZ
Y6IMWosY1v72zRgpxb2wEZQGQWppjzyGYOAk8Rp/m30y+4WWKCsxg+dxmeOL1CNk
QTfyRd0zXHLKTd6HqN1sfDHmM8kw/zrD3xei1SkkSCRG75Fny4Oyyt6Wo7L7VAhC
LowsqTxW7tVgKwQ8aZd1BVdvfXYUcptCfSLXjDqwHMnUB9unuwD0D8Wz0Zg0Zi7j
ZjtHM6o3VTISrXDbL63laZ43AXf1mbevpgLWKiedsG+3UG7zhn3/mNPp5BdcrjGG
z9sYlSJ7V9RAJvQWj/uu7PhPT90+qA==
=UlbT
-----END PGP SIGNATURE-----

--Sig_/itjbU1yiKo8ojp_0haFe1Oo--
