Return-Path: <linux-next+bounces-8981-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 778A2C5B4AE
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 05:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D278A3BBAC7
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 04:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7E7285CAA;
	Fri, 14 Nov 2025 04:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MevuTmvJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF3274B26;
	Fri, 14 Nov 2025 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093890; cv=none; b=NGBt8YuGpnf1nTVSPRYsoqC5va/tdFjl4LEkqae266EF0isA/sQkuivzC24cCy1IS4g2wo+YyIFo7+mvPAt/NNJ3hETB9SwdIlwvsj2MjjTy894aDEUEdYYRXuaDx+MztWsPZ1JNru9HrMdccavPj1lf8Uo9r9apqfwag3/72ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093890; c=relaxed/simple;
	bh=aJN4gawHeNmO2BeVlyFfJTWjOD6mCi+SfU2KM3YrRuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZkuEIonP5tSn17gh7G1Gqt+n2T2H2JChnPGeCi9zvTPqd8l0VeBSu3R7YC7ZRy24wXcyyUy9JoTJmvdjBu6PpoWP8HbTqxYsh5JzC6OD5sqax5TGW6gJMtNv+bZ6K3o70mkEmy2W0nJ1wXrIakiP04FQCSzO9iW7ZYrh/vgDgsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MevuTmvJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763093884;
	bh=C+rnJ/xWezx9c7DqBeo2xQmQsZ0DGn9WOvG/QI7/7oo=;
	h=Date:From:To:Cc:Subject:From;
	b=MevuTmvJMXbAgse1QvnmwmlORlfjK3usKdAzkQZxOMGeSCfrXeWnI+kKOKQAZH9/e
	 2nx6zS/3aIrg7DvG4/MQ/cS9k2WGLqYDil2xcceqA5XXyeaPkzmwYdQ5UnPPscKKcT
	 V/X5LPp6pAl/B/Y6679WXRR3VmCrE3fIszz+RYenGra6mcwg91K4eRZ0uQHfeS2vct
	 BDCxQZsx+BKLgCPG7Suu0KQIhYXvPGpQPtaspdoZPtE31zDrIF0foBX6z/+vkCbH1n
	 sge5+P7nHRIRl62ZCvyhkBZcR18MCCcHoyDVx9RXIXNbnFr5UGynTsZn8kJwWXBbk9
	 OqKR7XTTRlnVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d73lc0FVHz4wyc;
	Fri, 14 Nov 2025 15:18:04 +1100 (AEDT)
Date: Fri, 14 Nov 2025 15:18:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein
 <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20251114151803.7dd56f68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sD0bUzDzN9HS9r4xZiI9pYw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sD0bUzDzN9HS9r4xZiI9pYw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/pci/id.rs

between commit:

  d8407396f128 ("rust: pci: use "kernel vertical" style for imports")

from the driver-core tree and commit:

  0e947bc22b0b ("rust: pci: use `kernel::fmt`")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/pci/id.rs
index a1de70b2176a,5f5d59ff49fc..000000000000
--- a/rust/kernel/pci/id.rs
+++ b/rust/kernel/pci/id.rs
@@@ -4,11 -4,7 +4,11 @@@
  //!
  //! This module contains PCI class codes, Vendor IDs, and supporting type=
s.
 =20
 -use crate::{bindings, error::code::EINVAL, error::Error, fmt, prelude::*};
 +use crate::{
 +    bindings,
++    fmt,
 +    prelude::*, //
 +};
- use core::fmt;
 =20
  /// PCI device class codes.
  ///

--Sig_/sD0bUzDzN9HS9r4xZiI9pYw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWrXsACgkQAVBC80lX
0GwFYgf9F0JfB00ODGY8y3fU728ebSCnr4siJrUhvokPBlToX408l4q/qgESEibL
L1Lo/3PuOBvQRRx2nr2VN0tnqN+6UJ7r4Y+MDm4uMU+85ncppbSNRbCjmsM6doJ7
54TIyAbwBvhtxBIPnnbN0dnFP1LR+220vAmtHdzd+aR1Mb3JnXl7EoG8DKO0fykz
LYKycg6w83fz3ZM1ZgIKBUfcDMnNBCppGJCTyOFUpDmX7tGhvtrEVdxj4YJW9aRy
axso/Rc7O/W5HWtnRjYX231ttvZRY8aPXn9WF5tsW6xdw7BTlb796+zfeXbwuVVu
/f9fY/jUtZJGlGgfiuuHfK25mqv5TQ==
=KgY6
-----END PGP SIGNATURE-----

--Sig_/sD0bUzDzN9HS9r4xZiI9pYw--

