Return-Path: <linux-next+bounces-5879-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF8BA6877F
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 10:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F0913B4310
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 09:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0FA2512D9;
	Wed, 19 Mar 2025 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MSgLBUVF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE725178D;
	Wed, 19 Mar 2025 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375272; cv=none; b=Pn0sbTAc5F8kaSTQxZGoJw/km+OtH9cDqpK9cDYofPHdZJ0ZigGNgn4SoGq4aKciKXyigVISl1pXloZWbwyNtswi4I/ESAlGYxzzpUSKUPhySh8MJTRIcPjI2mFXK9Cm1pOS48fyAwFpevxNRZIvqDKFiMN8au49Cs4me9Ifl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375272; c=relaxed/simple;
	bh=gtJ+pizVKw2MhmRMZNJBWxxhnxiEQftH75HmPDMpvUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SyJfXIiDEEZOoK/58ctQuIL9Ja7JqcSFFrPrmwRHVAU8vVM3Y/Urg7qSigv8IjzH0kaOJyjbaWLOc0iTEzerMDmQJgDiRfW5Dp716jWQ/ReV57xKZ0RMnzqvd9u61x/WMbXrAs1NrZoOFYYGqTz5dq4zGLTznWUHsS790RR7Mk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MSgLBUVF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742375268;
	bh=qP/XoP4fN6Ss9CghqYcT+VLJmt1QhOCkgi0pnLbDRmQ=;
	h=Date:From:To:Cc:Subject:From;
	b=MSgLBUVF/Zp62VVTzmRnprI7ZQNPLTYzsVUVE0CwfdzpNRGAy6YSDhtIEbg+BfCAF
	 dt37zcc165NvZX9ZV7rEaLiADE0OntpxZBytJUMoXoWV1rv530wnUG8JVR/F2vIy9X
	 k/iSZeNTAzz54B2VMNzqQcFdITZLfrRYYZq3SvKA54ElVCYgmwZHMSh2ZwI+tP+UKF
	 Bp9cuChgFSrTM63Kwz5Npac3gHjo0oKQADOzGZktxOxbdVSJNQzChQCNz0PffCcQko
	 s9ZONoU6+vM4m8glQx+i1smPjEOFHMUyt6qpZslNnU+dGN5przjBgQiEsOHtB9ih0m
	 n6vIEW/5plLSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHjXg1dM8z4x21;
	Wed, 19 Mar 2025 20:07:46 +1100 (AEDT)
Date: Wed, 19 Mar 2025 20:07:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Dave Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, DRI <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20250319180556.4475584f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G7IqSOMy=6nrw+DRW7jzKU_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G7IqSOMy=6nrw+DRW7jzKU_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0053]: method `probe` has an incompatible type for trait
  --> drivers/gpu/nova-core/driver.rs:30:20
   |
30 |     fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<P=
in<KBox<Self>>> {
   |                    ^^^^^^^^^^^^^^^^ types differ in mutability
   |
   =3D note: expected signature `fn(&kernel::pci::Device<Core>, &()) -> cor=
e::result::Result<_, _>`
              found signature `fn(&mut kernel::pci::Device<kernel::device::=
Normal>, &()) -> core::result::Result<_, _>`
help: change the parameter type to match the trait
   |
30 |     fn probe(pdev: &kernel::pci::Device<Core>, _info: &Self::IdInfo) -=
> Result<Pin<KBox<Self>>> {
   |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~

error[E0599]: no method named `enable_device_mem` found for mutable referen=
ce `&mut kernel::pci::Device` in the current scope
  --> drivers/gpu/nova-core/driver.rs:33:14
   |
33 |         pdev.enable_device_mem()?;
   |              ^^^^^^^^^^^^^^^^^ method not found in `&mut Device`

error[E0599]: no method named `set_master` found for mutable reference `&mu=
t kernel::pci::Device` in the current scope
  --> drivers/gpu/nova-core/driver.rs:34:14
   |
34 |         pdev.set_master();
   |              ^^^^^^^^^^ method not found in `&mut Device`

error: aborting due to 3 previous errors

Some errors have detailed explanations: E0053, E0599.
For more information about an error, try `rustc --explain E0053`.

Presumably caused by commit

  7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")

interacting with commit

  54e6baf123fd ("gpu: nova-core: add initial driver stub")

from the drm tree.

I have no idea how to fix this, so I have just used the driver-core tree
from next-20250318 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/G7IqSOMy=6nrw+DRW7jzKU_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfaiWIACgkQAVBC80lX
0Gzd5gf/cPm1IsUrN9ZA6Ow8dkPK3YSpp/aU4GD2ktEHnR+oKEI3ssr/YcrZFdLG
aE1erAP1mVjuw99ke1+2ttFPoSULP1BHPOGpXCzXY1DdhGDIz0qYXYsAZPD/7Ru0
RKTxk4Vl5t+9plq1dRirkkwMjGOSGSs3J6PVZPwNbJgF/PtRUEUntij0/iTXGFjx
oYPudEWoO1cNqzhdd7/4ZIJCufEyEuvduKONJvQBXM6aboL+yTBIxnPPMDXdF3Zg
EKrwyuTmn7Tln9NkK+ACVtBF6496t4SdK8bQryxwuomQ98tQmCUd/vTS4KP2tkQM
b6O2/Hpn/knL9WCUuVchof9khsSJFA==
=z0xT
-----END PGP SIGNATURE-----

--Sig_/G7IqSOMy=6nrw+DRW7jzKU_--

