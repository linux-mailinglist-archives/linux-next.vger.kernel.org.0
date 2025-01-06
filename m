Return-Path: <linux-next+bounces-5039-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AC6A01E7C
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9408A3A2ED5
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 04:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6691922F6;
	Mon,  6 Jan 2025 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NrlKNPRo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851119067A;
	Mon,  6 Jan 2025 04:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736137040; cv=none; b=JfHHNbZmXzvmcelx/O+EYt9hc4cHekisI2oMDYW4xTXitdVtolqBLsjIPoZiqoPk/yXOrNC51MjrW6UcP6juky2z+fQmFEgbh7Gv8nDzy9wPzRFHoQFPyGuW30I7xGQJXSRmFlld/XgVQKzDLwCWVO/+Nu4e3ojncIeimADgJl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736137040; c=relaxed/simple;
	bh=/y12qkjYXk3xqV626Q+O1lhNYIyZO2fOmWkdqkIKofE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kEwSAGlvdZ8GpCE+k2D75zfVsiFjZhmx6t0CsOo5SMHmBnqUPB3oTMqI+DYd/C5g5TXWFiHZwBvR8O6GGSbr9dCfF4/cSt/KOSYNbWoy6kX42rPuNVXSkIxOsoXMCOSfwj9Qk/JwMkHSa5FF6ls6aDBKadaEIxG/fDTEbAd8YlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NrlKNPRo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736137027;
	bh=SgdzWvmAt6xFrvNkKLhruD4VpPPdAJMyIetA9F6IApc=;
	h=Date:From:To:Cc:Subject:From;
	b=NrlKNPRoPlfPVj8bJ9kv3NWaV/8RrbtcAO4zH6st9DdCNmdIWOEMpsJe62wI3KQnI
	 e6x81El3a8XcrKTfaWGs4tREqvJMm++MfWBShrXosvK/LeVkMyhB8Rl/IY7mEyq19Q
	 BvgEmkRlfhSdoYQKMYxQrmiJ8VUaScb7H4MYf0B5oe1SGl57AZhAzQIwDXW7LGB2jo
	 Y2D+y1aK5cPygeXu+SiE2CeBrrV9Ll/bwQc+2yhRBwuvFhia2tfxpOJOkw1G0uxO0p
	 6L95ahOpAVBFr76d3I2/doMpR84DqzodvKcFizfgKJYjgNNgsLzd4jaJgMIAqleNhQ
	 rzDiNc5uFtISQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRLVW0SXlz4wcr;
	Mon,  6 Jan 2025 15:17:06 +1100 (AEDT)
Date: Mon, 6 Jan 2025 15:17:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andy Gross <agross@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Stephan Gerhold
 <stephan.gerhold@linaro.org>
Subject: linux-next: manual merge of the usb tree with the qcom tree
Message-ID: <20250106151712.4cf70651@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mrjQ31PkxdYDlutWXBknb68";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mrjQ31PkxdYDlutWXBknb68
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts

between commit:

  ab8f487d2f89 ("arm64: dts: qcom: x1e80100-qcp: Enable SD card support")

from the qcom tree and commit:

  42943457e49d ("arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB switches")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9a7b45066be2,f45df1396eae..000000000000
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@@ -943,13 -977,79 +1048,86 @@@
  		};
  	};
 =20
 +	sdc2_card_det_n: sdc2-card-det-state {
 +		pins =3D "gpio71";
 +		function =3D "gpio";
 +		drive-strength =3D <2>;
 +		bias-pull-up;
 +	};
 +
+ 	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
+ 		mode-pins {
+ 			pins =3D "gpio166";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 			output-high;
+ 		};
+=20
+ 		oe-n-pins {
+ 			pins =3D "gpio168";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 		};
+=20
+ 		sel-pins {
+ 			pins =3D "gpio167";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 		};
+=20
+ 	};
+=20
+ 	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
+ 		mode-pins {
+ 			pins =3D "gpio177";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 			output-high;
+ 		};
+=20
+ 		oe-n-pins {
+ 			pins =3D "gpio179";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 		};
+=20
+ 		sel-pins {
+ 			pins =3D "gpio178";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 		};
+ 	};
+=20
+ 	usb_1_ss2_sbu_default: usb-1-ss2-sbu-state {
+ 		mode-pins {
+ 			pins =3D "gpio169";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 			output-high;
+ 		};
+=20
+ 		oe-n-pins {
+ 			pins =3D "gpio171";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 		};
+=20
+ 		sel-pins {
+ 			pins =3D "gpio170";
+ 			function =3D "gpio";
+ 			bias-disable;
+ 			drive-strength =3D <2>;
+ 		};
+ 	};
+=20
  	wcd_default: wcd-reset-n-active-state {
  		pins =3D "gpio191";
  		function =3D "gpio";

--Sig_/mrjQ31PkxdYDlutWXBknb68
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7WUgACgkQAVBC80lX
0GzgVwf/UllXrEbDFORDcvwFDjYVlBRY2L1DYnQlAas3WJHO3daPTo5NFm6zqArs
9P8Cdl1tEpKIEyL9x1uHcCeohNsFAatM1ol1rRlOW2ILxKK4ehgI1KijZeYSy7oW
4k464kGI9Nv6olrlsrfk6pgd/hgWSFjZPJ25AoIqBBqhNXez4/b9MW9JmtdLcSDx
vzuPMbp/MXGtqEaoLyjnJ9g4PVJYVffZoVdGcbUYoMfO6oZSBvgH0mkBsfoiKCyY
Bg+9s20U95qHXw9i3k7WuGw2Bh+TFoT2LTCldhkAO5UxqotRKD9C42TjjATS9vgZ
nkcjvz1tJTzPS+ZW9POvqbmIm0klGA==
=JtLP
-----END PGP SIGNATURE-----

--Sig_/mrjQ31PkxdYDlutWXBknb68--

