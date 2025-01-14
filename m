Return-Path: <linux-next+bounces-5188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EABA0FF82
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 04:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B346718846F9
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 03:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44030230D05;
	Tue, 14 Jan 2025 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f9FeKCQn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF11224B07;
	Tue, 14 Jan 2025 03:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736825559; cv=none; b=ChO4u3SdB/VCaEWYYjnJK4UW7bGw0WaWNGpyo49FbQHg//VMv6nxWY1AYX38jOb+zrrwjuF4jfzfDz3HhWDjNVLIOca3FsKFCYwNehL48KkBtDMZXzxPctZ05Ei0lQOAm+E51HcMmLTtvB7gBbn+9TgahRA6Mg1AzACUUI6FPLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736825559; c=relaxed/simple;
	bh=qBvuhlni8vDRM5Bu8xkZf0RZoterr6ybQLv2Kk2lqrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dVqJvM3LnhcNdiW2LthHOVBw3YnnoZ6HfEhehFQqj3S0LiJVc7sALzE+uQt+q3ERaDUQ7ArdzpOQ1dQcM6Q6NCW8x/phI8sifO5GqG80ENGnWNeHDHaTHrKzzXPjtq1xTEJrvSjnO6+UwSOAj9Vw3BwQJOY+coM0wwSangxIR18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f9FeKCQn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736825544;
	bh=GhRkzmrn+4Fr91Q160VEoFVu4mkWf4imqfWB6IQqu5s=;
	h=Date:From:To:Cc:Subject:From;
	b=f9FeKCQnrT3drGyvmY1c8NffnCeo5Q4glVI48CKXwc8+axnKc4uNoVATDVG/Ubh9x
	 +F4ziI0SQ4a2vH5wbauidcwOHw5cWs0rV+5VY3H6uJasfoKVKlJqY77WcnwPD1WSDs
	 0wI+EY+VM6Pb8yRG6Qg7DIx4WtzhHNpeOOHW+hBWss+dag0o4sduYxxI6Fasa6PJh0
	 5R8jMplzqoWrMBB56Dmb3Tw8y6gG96dYUbTU1l9IVepDfeDIZ3J9fnusipqaEktaKA
	 gAfenG18ENhLXx9fCPpENrYqPmfS/S/P4fWUcwtn+hGKcm6/n6FdZH4XfxOOExV+FG
	 sbm760TeEnHBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXF7C2yWxz4x6T;
	Tue, 14 Jan 2025 14:32:23 +1100 (AEDT)
Date: Tue, 14 Jan 2025 14:32:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Kurt
 Borja <kuurtb@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Message-ID: <20250114143229.0c6b8a87@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/99N.L3MhFRSs38y0dk0.aVu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/99N.L3MhFRSs38y0dk0.aVu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/dell/alienware-wmi.c

between commit:

  c1043cdb019e ("alienware-wmi: Fix X Series and G Series quirks")

from Linus' tree and commit:

  7c605f6460e8 ("platform/x86: alienware-wmi: Improve rgb-zones group creat=
ion")

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

diff --cc drivers/platform/x86/dell/alienware-wmi.c
index 341d01d3e3e4,b4b43f3e3fd9..000000000000
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@@ -694,20 -690,7 +699,10 @@@ static int alienware_zone_init(struct p
 =20
  static void alienware_zone_exit(struct platform_device *dev)
  {
- 	u8 zone;
-=20
 +	if (!quirks->num_zones)
 +		return;
 +
- 	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
  	led_classdev_unregister(&global_led);
- 	if (zone_dev_attrs) {
- 		for (zone =3D 0; zone < quirks->num_zones; zone++)
- 			kfree(zone_dev_attrs[zone].attr.name);
- 	}
- 	kfree(zone_dev_attrs);
- 	kfree(zone_data);
- 	kfree(zone_attrs);
  }
 =20
  static acpi_status alienware_wmax_command(void *in_args, size_t in_size,

--Sig_/99N.L3MhFRSs38y0dk0.aVu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF2s0ACgkQAVBC80lX
0GzZigf+JGCpfEnDepEZJPKlSbcf48Eo6jd2a6tjWfHRg8PEijgfylbOd7snCdfY
ydxCkXczIf3OYUSRgfOXBuOh0uFcjiaqvO57xx9CXJGApaFpjcu3S0WA5EhoM9Ni
4MSD5ZtAJo+oTn9CeJzJMuvDqbWmleneS5zJZLrDUwG+NZF5XMXqGo/ncB5M0vIk
iBdcUlBDTnY8sylSOyCs63cJlNPjHO4WAaCCkGq/0tStQ/bp8sm76gI2tu6gnWiF
I+a3vwvxLkDQhCUXdMG6Nsv/Xdr8qAscL9kV68Cm+C9p27+AlrDAUsBRSMFRycGL
WO/pCY/zolqEOWgHTk3WfbFlfwaIuw==
=ZGEe
-----END PGP SIGNATURE-----

--Sig_/99N.L3MhFRSs38y0dk0.aVu--

