Return-Path: <linux-next+bounces-8352-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F69B7C9F0
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 261A317B912
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 11:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AD52EBDE9;
	Wed, 17 Sep 2025 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RegRqv4k"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014F2D374F;
	Wed, 17 Sep 2025 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758108625; cv=none; b=b8axIcK/ewvEDC9sYnTbyEe4uuO4yU0AwElTn2WhyFDT1itSVY4D+cGM2ZJXdQdNbriKSdgdH6e2IyV7LFuMUgERCe+oFfhocesPD7C7t/orpsCVbgNPhvFe8tCDXkAmwODt1mUOy59y3Ygnln5nrgY6rEjPLcPv9HwKhoWSYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758108625; c=relaxed/simple;
	bh=U73ZuhTRH7kkSTXDd6H/RUNbP8bfQiEWAv8P2TwQl/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/x7IYGKXsndxlTOMokNMLWucoqHGdhyIckzNG90HIr5R9vMWZtGI29oMBMJxyXOcdFRwID8IHScg/lQw5yYZspN11TLFDatjb8A9ij6V88dlkQJ7DHwO2txmCri0li/u/0keYxUZvHmEHyRfD8o4iMDbUI/ujPUmVLyahOR6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RegRqv4k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E03C4CEF0;
	Wed, 17 Sep 2025 11:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758108624;
	bh=U73ZuhTRH7kkSTXDd6H/RUNbP8bfQiEWAv8P2TwQl/U=;
	h=Date:From:To:Cc:Subject:From;
	b=RegRqv4kHX9J6153fQkbYp0Lv9WTVe0FvPFXQayEn7wsBLe+isCWFFJEH8wPgfbjn
	 bOaqzT2WRG4QMJ07YwPpULtbT+Uhf1hZl9tIetDNV/FtHqDFlHGaEf6Mh47b38ybAg
	 SIh39Dob3SHcp/N0wnFrSOpAo46ecDDMu1uIImvesAOE97JmHsWPUOTBnLH/ECP1yn
	 rzo6vkttNa/9Bz7gdz7aFWj3OFZ0F0fMjQrvsyHgb+a+awOUh41MHkK4TNLGiQLCAQ
	 5JmXv8rW8z1yh+BeponZf14+E9K2EGCfcS3nsLe3BlAiGNIiaYkmtbzULMhRUBfYiD
	 PcEpWnPyf9bsg==
Date: Wed, 17 Sep 2025 12:30:19 +0100
From: Mark Brown <broonie@kernel.org>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>
Subject: linux-next: manual merge of the net-next tree with the spacemit tree
Message-ID: <aMqby4Cz8hn6lZgv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WVZ/VwcYHLiZec4U"
Content-Disposition: inline


--WVZ/VwcYHLiZec4U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

between commit:

  0e28eab0ca512 ("riscv: dts: spacemit: Enable PDMA on Banana Pi F3 and Mil=
kv Jupiter")

=66rom the spacemit tree and commits:

  3c247a6366d58 ("riscv: dts: spacemit: Add Ethernet support for BPI-F3")
  e32dc7a936b11 ("riscv: dts: spacemit: Add Ethernet support for Jupiter")

=66rom the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 6013be2585428,33e223cefd4bd..0000000000000
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@@ -40,10 -42,52 +42,56 @@@
  	status =3D "okay";
  };
 =20
+ &eth0 {
+ 	phy-handle =3D <&rgmii0>;
+ 	phy-mode =3D "rgmii-id";
+ 	pinctrl-names =3D "default";
+ 	pinctrl-0 =3D <&gmac0_cfg>;
+ 	rx-internal-delay-ps =3D <0>;
+ 	tx-internal-delay-ps =3D <0>;
+ 	status =3D "okay";
+=20
+ 	mdio-bus {
+ 		#address-cells =3D <0x1>;
+ 		#size-cells =3D <0x0>;
+=20
+ 		reset-gpios =3D <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+ 		reset-delay-us =3D <10000>;
+ 		reset-post-delay-us =3D <100000>;
+=20
+ 		rgmii0: phy@1 {
+ 			reg =3D <0x1>;
+ 		};
+ 	};
+ };
+=20
+ &eth1 {
+ 	phy-handle =3D <&rgmii1>;
+ 	phy-mode =3D "rgmii-id";
+ 	pinctrl-names =3D "default";
+ 	pinctrl-0 =3D <&gmac1_cfg>;
+ 	rx-internal-delay-ps =3D <0>;
+ 	tx-internal-delay-ps =3D <250>;
+ 	status =3D "okay";
+=20
+ 	mdio-bus {
+ 		#address-cells =3D <0x1>;
+ 		#size-cells =3D <0x0>;
+=20
+ 		reset-gpios =3D <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+ 		reset-delay-us =3D <10000>;
+ 		reset-post-delay-us =3D <100000>;
+=20
+ 		rgmii1: phy@1 {
+ 			reg =3D <0x1>;
+ 		};
+ 	};
+ };
+=20
 +&pdma {
 +	status =3D "okay";
 +};
 +
  &uart0 {
  	pinctrl-names =3D "default";
  	pinctrl-0 =3D <&uart0_2_cfg>;
diff --cc arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index c615fcadbd333,89f4132778931..0000000000000
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@@ -20,10 -22,52 +22,56 @@@
  	};
  };
 =20
+ &eth0 {
+ 	phy-handle =3D <&rgmii0>;
+ 	phy-mode =3D "rgmii-id";
+ 	pinctrl-names =3D "default";
+ 	pinctrl-0 =3D <&gmac0_cfg>;
+ 	rx-internal-delay-ps =3D <0>;
+ 	tx-internal-delay-ps =3D <0>;
+ 	status =3D "okay";
+=20
+ 	mdio-bus {
+ 		#address-cells =3D <0x1>;
+ 		#size-cells =3D <0x0>;
+=20
+ 		reset-gpios =3D <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+ 		reset-delay-us =3D <10000>;
+ 		reset-post-delay-us =3D <100000>;
+=20
+ 		rgmii0: phy@1 {
+ 			reg =3D <0x1>;
+ 		};
+ 	};
+ };
+=20
+ &eth1 {
+ 	phy-handle =3D <&rgmii1>;
+ 	phy-mode =3D "rgmii-id";
+ 	pinctrl-names =3D "default";
+ 	pinctrl-0 =3D <&gmac1_cfg>;
+ 	rx-internal-delay-ps =3D <0>;
+ 	tx-internal-delay-ps =3D <250>;
+ 	status =3D "okay";
+=20
+ 	mdio-bus {
+ 		#address-cells =3D <0x1>;
+ 		#size-cells =3D <0x0>;
+=20
+ 		reset-gpios =3D <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+ 		reset-delay-us =3D <10000>;
+ 		reset-post-delay-us =3D <100000>;
+=20
+ 		rgmii1: phy@1 {
+ 			reg =3D <0x1>;
+ 		};
+ 	};
+ };
+=20
 +&pdma {
 +	status =3D "okay";
 +};
 +
  &uart0 {
  	pinctrl-names =3D "default";
  	pinctrl-0 =3D <&uart0_2_cfg>;

--WVZ/VwcYHLiZec4U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKm8sACgkQJNaLcl1U
h9BItAf+MRlBszKhHGJfpPQK+0k+axpOJ26WKU3BirdKtFleT7QA0GHTejucy3KG
e2JodVAPsXKAintJOgHKh8Jy0vHnHwn72WBENaLjWs9f8jPS5RuEtcxwaNm9DnpX
6EormV8ApXBFM+ma/KjiTle90GSUdb85U8afyT7zfuLN3S0i1DeRfHmx407BUsBc
ERmOBZEBuGYFpkYLGEUyauS3lLDDyvIaMuge243sV8yTsOEdvKStQPFJJ/mdgSK5
sKAINXBlb8Rn93vgixNDPKrD1g/4uhfiEYLJBI1NFZPS6y5dcVff7p+WyVFifbBD
7GyLytqSTt9US+yfl6VJV9htQWzsmg==
=BooE
-----END PGP SIGNATURE-----

--WVZ/VwcYHLiZec4U--

