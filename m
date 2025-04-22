Return-Path: <linux-next+bounces-6312-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56594A96036
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 09:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30138188F60A
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 07:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353EB1EF372;
	Tue, 22 Apr 2025 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZCJD4Ipg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB2F510;
	Tue, 22 Apr 2025 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308575; cv=none; b=r6rYESg27iovIHQ09SmQX1ZbgmW/WGtFWa9RJIwmGn0Eh0RQc6/P4zJhycv87jZ+3QgxheCTRbYfCSpoYp0mvwljmaYOrwlWYW2PiMXfkP8v7bo+krDypOfR9l/gZCOx4sfmqVP4D1wJM2ruqm4etTfHiW54G+lq+9wSo8ji0ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308575; c=relaxed/simple;
	bh=B9eLIGv+xZ+SQpXzz6TG8j/zU/4zK5nGoVFjzLQLlWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QC0GTKfLe4j0GU/3WHkazPyYYSH2vbF7P2Q/VNBdvTad0ZuE2/XcyIbWjPbWhlxUPrhi47sLDZ0CYR4KbxymAp6nN45zpTU/0KdJ0uizIfukmrcUOpeE3HciDcSXXXpTi2F9xAmQ4XEMXPL228GJlIPG9hsZjSYlpv+07Krxbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZCJD4Ipg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745308569;
	bh=HBDUayaCITNc7yVwlnOQFS0ndJIZG3QrKdnU0xNhlyY=;
	h=Date:From:To:Cc:Subject:From;
	b=ZCJD4Ipg/jzKdOZQ+kuIqvl22Gz2KEsb/ntFcFvX8QkDjI0yNhjxpx/9gWHC8ydbA
	 Ip+6kMbs8AxmBrvOcqJinBTm7yHfbEsSFAi9I0b/Ug/1yiaIzQ8WSAnXjgaGVm9AUw
	 c5Z0ShPXQSV20vHzp2sF7mlkTZocDOfvvXpwSv2ACSdFnwsDjrFM+vu+v+H87w56ub
	 XYl7aJ76Ybt5QzqJI1iZgwKmQNliRveVSKrSS9MwQ/Ou2jJ8a7ewYMyKS/BIRIujwZ
	 Ioez5FFjn0xssor/5fpQIOISSzeqPNPdOcEoe3UdhHUIkvUoS+pCrK/VPIN6SBjt2a
	 WfqN4+3U2ss2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhZLK1Krwz4wbc;
	Tue, 22 Apr 2025 17:56:09 +1000 (AEST)
Date: Tue, 22 Apr 2025 17:56:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Kurt
 Borja <kuurtb@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drivers-x86 tree with the
 drivers-x86-fixes tree
Message-ID: <20250422175608.1ebc8a4c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jsv2WZczDGO8a9FpTLATG=V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Jsv2WZczDGO8a9FpTLATG=V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/dell/alienware-wmi-wmax.c

between commit:

  4a8e04e2bdcb ("platform/x86: alienware-wmi-wmax: Fix uninitialized variab=
le due to bad error handling")

from the drivers-x86-fixes tree and commit:

  32b6372ddd43 ("platform/x86: alienware-wmi-wmax: Improve platform profile=
 probe")

from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/x86/dell/alienware-wmi-wmax.c
index 3f9e1e986ecf,faeddfe3b79e..000000000000
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@@ -189,48 -174,61 +214,69 @@@ static const struct dmi_system_id awcc_
  		},
  		.driver_data =3D &g_series_quirks,
  	},
 +	{
 +		.ident =3D "Dell Inc. G5 5505",
 +		.matches =3D {
 +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5505"),
 +		},
 +		.driver_data =3D &g_series_quirks,
 +	},
  };
 =20
- enum WMAX_THERMAL_INFORMATION_OPERATIONS {
- 	WMAX_OPERATION_SYS_DESCRIPTION		=3D 0x02,
- 	WMAX_OPERATION_LIST_IDS			=3D 0x03,
- 	WMAX_OPERATION_CURRENT_PROFILE		=3D 0x0B,
+ enum AWCC_GET_FAN_SENSORS_OPERATIONS {
+ 	AWCC_OP_GET_TOTAL_FAN_TEMPS		=3D 0x01,
+ 	AWCC_OP_GET_FAN_TEMP_ID			=3D 0x02,
  };
 =20
- enum WMAX_THERMAL_CONTROL_OPERATIONS {
- 	WMAX_OPERATION_ACTIVATE_PROFILE		=3D 0x01,
+ enum AWCC_THERMAL_INFORMATION_OPERATIONS {
+ 	AWCC_OP_GET_SYSTEM_DESCRIPTION		=3D 0x02,
+ 	AWCC_OP_GET_RESOURCE_ID			=3D 0x03,
+ 	AWCC_OP_GET_TEMPERATURE			=3D 0x04,
+ 	AWCC_OP_GET_FAN_RPM			=3D 0x05,
+ 	AWCC_OP_GET_FAN_MIN_RPM			=3D 0x08,
+ 	AWCC_OP_GET_FAN_MAX_RPM			=3D 0x09,
+ 	AWCC_OP_GET_CURRENT_PROFILE		=3D 0x0B,
+ 	AWCC_OP_GET_FAN_BOOST			=3D 0x0C,
  };
 =20
- enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
- 	WMAX_OPERATION_TOGGLE_GAME_SHIFT	=3D 0x01,
- 	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	=3D 0x02,
+ enum AWCC_THERMAL_CONTROL_OPERATIONS {
+ 	AWCC_OP_ACTIVATE_PROFILE		=3D 0x01,
+ 	AWCC_OP_SET_FAN_BOOST			=3D 0x02,
  };
 =20
- enum WMAX_THERMAL_TABLES {
- 	WMAX_THERMAL_TABLE_BASIC		=3D 0x90,
- 	WMAX_THERMAL_TABLE_USTT			=3D 0xA0,
+ enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
+ 	AWCC_OP_TOGGLE_GAME_SHIFT		=3D 0x01,
+ 	AWCC_OP_GET_GAME_SHIFT_STATUS		=3D 0x02,
  };
 =20
- enum wmax_thermal_mode {
- 	THERMAL_MODE_USTT_BALANCED,
- 	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
- 	THERMAL_MODE_USTT_COOL,
- 	THERMAL_MODE_USTT_QUIET,
- 	THERMAL_MODE_USTT_PERFORMANCE,
- 	THERMAL_MODE_USTT_LOW_POWER,
- 	THERMAL_MODE_BASIC_QUIET,
- 	THERMAL_MODE_BASIC_BALANCED,
- 	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
- 	THERMAL_MODE_BASIC_PERFORMANCE,
- 	THERMAL_MODE_LAST,
+ enum AWCC_THERMAL_TABLES {
+ 	AWCC_THERMAL_TABLE_LEGACY		=3D 0x9,
+ 	AWCC_THERMAL_TABLE_USTT			=3D 0xA,
+ };
+=20
+ enum AWCC_SPECIAL_THERMAL_CODES {
+ 	AWCC_SPECIAL_PROFILE_CUSTOM		=3D 0x00,
+ 	AWCC_SPECIAL_PROFILE_GMODE		=3D 0xAB,
+ };
+=20
+ enum AWCC_TEMP_SENSOR_TYPES {
+ 	AWCC_TEMP_SENSOR_CPU			=3D 0x01,
+ 	AWCC_TEMP_SENSOR_GPU			=3D 0x06,
+ };
+=20
+ enum awcc_thermal_profile {
+ 	AWCC_PROFILE_USTT_BALANCED,
+ 	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
+ 	AWCC_PROFILE_USTT_COOL,
+ 	AWCC_PROFILE_USTT_QUIET,
+ 	AWCC_PROFILE_USTT_PERFORMANCE,
+ 	AWCC_PROFILE_USTT_LOW_POWER,
+ 	AWCC_PROFILE_LEGACY_QUIET,
+ 	AWCC_PROFILE_LEGACY_BALANCED,
+ 	AWCC_PROFILE_LEGACY_BALANCED_PERFORMANCE,
+ 	AWCC_PROFILE_LEGACY_PERFORMANCE,
+ 	AWCC_PROFILE_LAST,
  };
 =20
  struct wmax_led_args {
@@@ -639,35 -1192,38 +1240,38 @@@ static int awcc_platform_profile_probe(
  {
  	enum platform_profile_option profile;
  	struct awcc_priv *priv =3D drvdata;
- 	enum wmax_thermal_mode mode;
- 	u8 sys_desc[4];
- 	u32 first_mode;
- 	u32 out_data;
+ 	enum awcc_thermal_profile mode;
+ 	u8 id, offset =3D 0;
  	int ret;
 =20
- 	ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPT=
ION,
- 				       0, (u32 *) &sys_desc);
- 	if (ret < 0)
- 		return ret;
+ 	/*
+ 	 * Thermal profile IDs are listed last at offset
+ 	 *	fan_count + temp_count + unknown_count
+ 	 */
+ 	for (unsigned int i =3D 0; i < ARRAY_SIZE(priv->res_count) - 1; i++)
+ 		offset +=3D priv->res_count[i];
 =20
- 	first_mode =3D sys_desc[0] + sys_desc[1];
-=20
- 	for (u32 i =3D 0; i < sys_desc[3]; i++) {
- 		ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
- 					       i + first_mode, &out_data);
+ 	for (unsigned int i =3D 0; i < priv->profile_count; i++) {
+ 		ret =3D awcc_op_get_resource_id(priv->wdev, i + offset, &id);
 -		if (ret =3D=3D -EIO)
 -			return ret;
+ 		/*
+ 		 * Some devices report an incorrect number of thermal profiles
+ 		 * so the resource ID list may end prematurely
+ 		 */
  		if (ret =3D=3D -EBADRQC)
  			break;
 +		if (ret)
 +			return ret;
 =20
- 		if (!is_wmax_thermal_code(out_data))
+ 		if (!is_awcc_thermal_profile_id(id)) {
+ 			dev_dbg(&priv->wdev->dev, "Unmapped thermal profile ID 0x%02x\n", id);
  			continue;
+ 		}
 =20
- 		mode =3D out_data & WMAX_THERMAL_MODE_MASK;
- 		profile =3D wmax_mode_to_platform_profile[mode];
- 		priv->supported_thermal_profiles[profile] =3D out_data;
+ 		mode =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
+ 		profile =3D awcc_mode_to_platform_profile[mode];
+ 		priv->supported_profiles[profile] =3D id;
 =20
- 		set_bit(profile, choices);
+ 		__set_bit(profile, choices);
  	}
 =20
  	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))

--Sig_/Jsv2WZczDGO8a9FpTLATG=V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHS5gACgkQAVBC80lX
0GxDtwgAnohW2PaukGes2IcsgKSwjw6I5T0hfF1uThR9EDYcxDercHnwoQiQ0yci
XHi902VSbW2wxcniV0uKfBHZaTw0iY0NayMojvSJUkSmLDlXn3OtAjtEm78d1Huj
ZUNiJRtTWLVggjwRcaNG2vT6+C/aCzylynxi4p1/H6xhhl2uXMjYUXscT4t4wkTU
7f/pDDVqglcCNzCIgS6PTWH/T9ZUdGsiRRi4f0PXWEgoJklk1jCXowV89S0hvERQ
NOapApjbYaH14KiMCdyQ7TGso0O9IvYe7P98qKtyAz+Xny6PRYRZNUKp2x4+FfXU
P5jP+9/W60tRkuyaAslU/4uaVw+/HQ==
=Je5P
-----END PGP SIGNATURE-----

--Sig_/Jsv2WZczDGO8a9FpTLATG=V--

