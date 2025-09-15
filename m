Return-Path: <linux-next+bounces-8305-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7EB583FA
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 19:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C923BB902
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 17:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5C62857F2;
	Mon, 15 Sep 2025 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tG2/CdPj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4703527A12B;
	Mon, 15 Sep 2025 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757958650; cv=none; b=noeZVvLqLcqtsTrpOJ+598i+1ODZZ1aVLuLSOwSy2T5Is+LJ0ePQb9fcXZWlpJp7kO16NVbAlYCyN6thE+BPVAIXwNacbVQjenY/GpnagLhgca9+OVm5o0VppywLU5ulhywuAq3xCncy6aWNiLWt5Srusr/vKU9dJXOnK/UriQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757958650; c=relaxed/simple;
	bh=+XqlU8/ztReicKzQyBNA5n7TaZvOoYpp1H+eTWAgO4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bJyOQCV4adG2i78bTaAn+3bD9kuokG1Qby6FCMJBhoiFfi4/aNfSrWjkijxfaH88xa301vvx2mlmvCvAX/aYL9vINbAQx9fsT0/SdzspU3qr2C9PABtl3WLKPPe9widBnQ4+u/7DyhW7iOmoTA+S/G7W880jQyR7lLn7spz4dYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tG2/CdPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C573C4CEF1;
	Mon, 15 Sep 2025 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958649;
	bh=+XqlU8/ztReicKzQyBNA5n7TaZvOoYpp1H+eTWAgO4M=;
	h=Date:From:To:Cc:Subject:From;
	b=tG2/CdPjIfECoH5dm+TKKkpRyJImiUveYS1KV7vkfnhmusbwVSCiOIxBV4u59/hsm
	 rMYig+54ZR4Tlw7zEkIpMioAb83Oa5Om31PsxAVzz2CJmA8ZuRSnYYcfQOb2Omu2Wv
	 xTgZDwCuHxAAzgjx4ZV1aXz10rzQvEMT0RG8bnxeCfGoFcfpdJc0kPVCWl1NjJ9JgM
	 RyajNwljDFErEv6DQ9rS2zF8JbvL5ZW4XJjMr/xEENLlaQP+seQnbPwN1EPipZFhyO
	 J/7B4qxQMokTMFpM8fpLFERpWv0suEsfsqn6kl4Y+GC+dW5c9e16CpP5e9ZfK1SABD
	 9C0+1UtdkjJHA==
Date: Mon, 15 Sep 2025 18:50:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the i2c tree with the arm-soc tree
Message-ID: <aMhR9TJm5V5EqaoC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9/+GJgKmKY22WZfy"
Content-Disposition: inline


--9/+GJgKmKY22WZfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

's linux-next merge of the i2c tree got a conflict in:

  Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml

between commit:

  804ebc2bdcc85 ("dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I=
2C")

=66rom the arm-soc tree and commit:

  69329daf16af7 ("dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C co=
mpatible")

=66rom the i2c tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index f0693b872cb6b,32c3b69ccf342..0000000000000
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@@ -80,12 -80,11 +80,17 @@@ properties
            support for 64 KiB transactions whereas earlier chips supported=
 no
            more than 4 KiB per transactions.
          const: nvidia,tegra194-i2c
+       - description: |
+           Tegra256 has 8 generic I2C controllers. The controllers are sim=
ilar to
+           the previous generations, but have a different parent clock and=
 hence
+           the timing parameters are configured differently.
+         const: nvidia,tegra256-i2c
 +      - description:
 +          Tegra264 has 17 generic I2C controllers, two of which are in th=
e AON
 +          (always-on) partition of the SoC. In addition to the features f=
rom
 +          Tegra194, a SW mutex register is added to support use of the sa=
me I2C
 +          instance across multiple firmwares.
 +        const: nvidia,tegra264-i2c
 =20
    reg:
      maxItems: 1
@@@ -192,7 -191,7 +197,11 @@@ allOf
              contains:
                enum:
                  - nvidia,tegra194-i2c
+                 - nvidia,tegra256-i2c
 +                - nvidia,tegra264-i2c
      then:
        required:
          - resets

--9/+GJgKmKY22WZfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIUfQACgkQJNaLcl1U
h9B4DAf8COcoAPYvvYdJMilkIMan1GK1H3hmy2cEmARhScQjQrKL88ldXFsDqtsj
0saVt20JjRp2e/cBXJrMYZdzVE/T0VDY0dW2mpQFmksbl/mLFfv5IPyxv06Fdel5
3U/jqMI+mIGy1HtIcBZ4tklod8pg8tUCbxmJcHKZvmKBliZa/z1CB+0BbgEWVH+h
446MdG+xtzI8npf5jxtSHhUpreTCExfUfoRvzSxglXjCuPSyM6uzjYcS5B1KvKN0
ZqwgRsBN+LJq3EnEMfyC4n+R89ZIlmx/fc5gne2z37H/H3ucUikFK7u6SJ051xG4
L9waE1WSQTcvxCDA3yRFHMcVMQudFw==
=mTNS
-----END PGP SIGNATURE-----

--9/+GJgKmKY22WZfy--

