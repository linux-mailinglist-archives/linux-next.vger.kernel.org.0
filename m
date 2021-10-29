Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CE043F4EC
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 04:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbhJ2CVf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 22:21:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40159 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbhJ2CVf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 22:21:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgR1q54mjz4xcB;
        Fri, 29 Oct 2021 13:18:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635473938;
        bh=K1xNm6+9jVe0vt7CtiDYI8nUjzqTqUyVmipOuvUwlBk=;
        h=Date:From:To:Cc:Subject:From;
        b=pFKFYK5BYmzlpeTFp/i2XH9RGlQG/6orqeGwdgiUJIwBuY5eY1kPaibeP/W2Qeu3/
         EzqJm/E2ER6+xB10JJ2TyFXMk3fGPUnB7mh14qazkU/OqIa95ogkRsDzeW7r2aozTu
         VQ2/gQB5EwRoybiDRPTT5xzWIJWNszD7/28djvFcAve5LLwNJERXV5kEE9ltLIyqak
         6ZsPsod89z4O1JU+czeuoq5Fq6FsCIMKMFHn3fBHlzFZ9fJiFhaTykXTEeBEkjwAiK
         GjiCy/B503CgLJyVb9Qs4N8Hm8GRwMna1jxPLadyFIOglkv2ysHqz8n8bURJS+bXEl
         lGBbmVFDja7HA==
Date:   Fri, 29 Oct 2021 13:18:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc:     David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the iommu tree
Message-ID: <20211029131854.042d8202@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W+QxdtipLWTbYA511L5V.Uc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W+QxdtipLWTbYA511L5V.Uc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/iommu/arm,smmu.yaml

between commit:

  e4a40f15b031 ("dt-bindings: arm-smmu: Add compatible for SM6350 SoC")

from the iommu tree and commit:

  e6b331271d41 ("dt-bindings: arm-smmu: Add compatible for the SDX55 SoC")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index f66a3effba73,5ccf0025ffa9..000000000000
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@@ -38,7 -37,7 +38,8 @@@ properties
                - qcom,sc7280-smmu-500
                - qcom,sc8180x-smmu-500
                - qcom,sdm845-smmu-500
+               - qcom,sdx55-smmu-500
 +              - qcom,sm6350-smmu-500
                - qcom,sm8150-smmu-500
                - qcom,sm8250-smmu-500
                - qcom,sm8350-smmu-500

--Sig_/W+QxdtipLWTbYA511L5V.Uc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7Wg4ACgkQAVBC80lX
0GxjBgf/S2LR+nuWdqyXNjvcl2ZR4xOYt7yqLRNonlInBWAywWOIN9/y4CSJSVKY
1Gq/XQSznQUlQOo1+Fac40IbQdq36V36Xs6P2kDDwbWZb9xQzgLx9xf4ErTz8QlS
KVazOligx7oztTLp5ETSq5+BjfyeTsRY/b82TpTtQnVDy4/CC3QZXVKtFtlYcsnN
oa+hwxKhnDHfSY8Ta62VtOEBUD4cgO2ky5ZubODgDi4oWDRCUZPzpVxGv8uAe4Un
Uvk7fea+tF9FwoBuQ/M0H2XwOdVTUXgHcfkZXBvrzrjuWU31CdAcQHkRy5UBIPyF
yhHgxLcmS1T/msNWK1t89YYueFDhiQ==
=Cg+8
-----END PGP SIGNATURE-----

--Sig_/W+QxdtipLWTbYA511L5V.Uc--
