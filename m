Return-Path: <linux-next+bounces-6629-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD5AB0A8A
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3CAE4E0F86
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 06:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F35F26A0BD;
	Fri,  9 May 2025 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RZ2kBzVv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10464269CF1;
	Fri,  9 May 2025 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771858; cv=none; b=g7xXzPh8AjU+eDo8fnLMLRpxt5bNnBq1gACO9V21erAT4K3PACM0CUA3ZoaH2Xkkf8v3u8MbE9y0hm9v68XOTna7KdYBSNZr2CVDygDvIYIr4wCEmgcddWwL6wXF2WuStJUZg7hNmPnIsiSRk/eIjUa103uYobw3fI42Ew/0NMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771858; c=relaxed/simple;
	bh=3pCHYV5dd/XlAQ6W1527MXkbxAcUuZ5lPzQDfaBQcsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OzobD2+HCZvbd42gsYK0jPOale/OR6B2B0mFPnOl7ceLebGPYQojjBnbg2OfsqyGkQJ10jRX2a2Cr61LEAiOLlETZ6AGS9XZWiS1GY3hiuglC3QnuH9nKMfXlW0gSRU59U8J93e5goBxHYauaOKNidXxmC+aEPlMV9X7m+AX1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RZ2kBzVv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746771851;
	bh=7YWWfVTnLCfDAxKoS9Yl3oLGOs9FgUWThDFCavbDZRM=;
	h=Date:From:To:Cc:Subject:From;
	b=RZ2kBzVvq9v3Y8ACPhgrFrB7Qq/r7pPLQif3kICGKDTJSZgrlycS2gssYSN6W546q
	 TTaLeYAN5CDljsm7oKBTjNcZAS18BVRIhVymLBmS0nQGhrgxga0MKZlaUk/QZ1qGaV
	 ztkB2JwWfQuVxNoLm0eD+gqNoaki6MQd3sZGPReoF2Fnd8D3kYgnfPhQ9D+Psr1vgV
	 Mh0ywKnBy46trGtdTB87L4Ra0EMNCmsUfm+BJ38Zb6wNs8EYyDPr6gh+Cvw0aPp14o
	 9ai2xEXo3RtZqn+ZS4Ocmdbe2gniPMMEc71rF19/kMUgnX6EtNkfPmcGr04YojHhtJ
	 N6ej9g9ylj0NA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtzVL3KXTz4wbv;
	Fri,  9 May 2025 16:24:10 +1000 (AEST)
Date: Fri, 9 May 2025 16:24:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Luke D. Jones" <luke@ljones.dev>, Pavel
 Nikulin <pavel@noa-labs.com>
Subject: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Message-ID: <20250509162409.586abb02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zAJ=rGvYzYfprKVKM6hJi=N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zAJ=rGvYzYfprKVKM6hJi=N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/asus-wmi.c

between commit:

  77bdac73754e ("platform/x86: asus-wmi: Disable OOBE state after resume fr=
om hibernation")

from Linus' tree and commit:

  feea7bd6b02d ("platform/x86: asus-wmi: Refactor Ally suspend/resume")

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

diff --cc drivers/platform/x86/asus-wmi.c
index 47cc766624d7,27f11643a00d..000000000000
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@@ -4724,9 -4780,6 +4781,7 @@@ static int asus_wmi_add(struct platform
  	asus->egpu_enable_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI_D=
EVID_EGPU);
  	asus->dgpu_disable_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI_=
DEVID_DGPU);
  	asus->kbd_rgb_state_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI=
_DEVID_TUF_RGB_STATE);
 +	asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI_DE=
VID_OOBE);
- 	asus->ally_mcu_usb_switch =3D acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CS=
EE)
- 						&& dmi_check_system(asus_ally_mcu_quirk);
 =20
  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
  		asus->mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;

--Sig_/zAJ=rGvYzYfprKVKM6hJi=N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdn4kACgkQAVBC80lX
0GyGegf+KcUSkgRHAWU/cUoWvsjkbJBjogA3iJMxIe1jySBR3SkwAVB9dHqBD+/J
3Qrr4vRXrsgr9WKW1ti01xq4N0Purv99knIOFnmLCcBCW0NsSvgZrU8Q9eSwg3wG
dMYkO1pZlWEukD9SqMs0liwHzSeRf0ot5/9317hv2TQsdmlsn4PluZv9s6kvYqxo
G8dRN7XVveN/ptKGflIqbKmLX/NZIzYYo70OVdhpQT43zulcZR1gmzHQC0/c0wPZ
qYbvZH8smmOOPVYAdRt5UPICHMtjOLy5nYUKbbdzodZlv3NPR45p0buZo11ve+6J
lLZrOxCiaZ34IGDkmfRNbxbtX9oGMQ==
=E/IU
-----END PGP SIGNATURE-----

--Sig_/zAJ=rGvYzYfprKVKM6hJi=N--

