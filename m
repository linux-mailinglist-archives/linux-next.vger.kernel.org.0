Return-Path: <linux-next+bounces-8336-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74EB59799
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5F93B06D6
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF8C313E16;
	Tue, 16 Sep 2025 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EN2fQACk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E6313296;
	Tue, 16 Sep 2025 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029252; cv=none; b=TSmrMs4ESXBfqWK8ojf342Vv4SodWX8hHInqRly//I/kLAzqoZL/8o3EkRBLEOIdHJGLuWOwosdJtsQQGX5VBB/OS0RFh/uSVEzyp729p+EGnypjboLUI3Pw97scLHkFrxH3DvocPCXQnqKvyVT/gac5qxFCXheomsLSytEIz9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029252; c=relaxed/simple;
	bh=ErN6HnTAqvbC8aDztnEdt32hRdQoSloMFcYtkBtalp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vy6dqHNZr+Q0mb6i2v9Wa5bCVOPpPqpmL/opxdBqYoy4Wf9DGHPqxsU74KZuUf9vYjd1xCYfQ76EhknwSQaoyA3tjwITL9jwJ3Kfi1/XAoW2YmY4Ad4uWi+UmWZbvEGE6of1yG4f3ioLdPTa3nUHoYwAEC/1tKdMFa9w8qMXpLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EN2fQACk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DA2C4CEEB;
	Tue, 16 Sep 2025 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758029251;
	bh=ErN6HnTAqvbC8aDztnEdt32hRdQoSloMFcYtkBtalp4=;
	h=Date:From:To:Cc:Subject:From;
	b=EN2fQACkO5p1uIuZ7gjDBDF0JIVQzMm3pmQPUpcy+1kfytpPriHFFE4Z6qsLuy6Xc
	 CIgD5PetYiLbk/YBTMfhW+7Z/+Kq5nRE3hWHx5VZwb4iNjuJrLOwKbtWIRJQ/spM8f
	 dzeqzGn5abtMsQgwaccxUwJPVGikrqTqgo6j1we5rLxB1nAeCm21x264NU74jgP2dJ
	 B5UBkoq4ebJCPN6CdnUHLIHb1OdyTB9c5L7QkuA7rgd2BRFtWNamDXKQvLBfjHr8CR
	 fR1ZwayqLsbHjkn3xBb3FW7OMGVacvGySb1l/ZwkabziajiXoGgApRFIwWjBe8NHv3
	 h0Zqzf226193g==
Date: Tue, 16 Sep 2025 14:27:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <aMllv3_nDxAAidQg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q7K+ibzzMAsNesrF"
Content-Disposition: inline


--Q7K+ibzzMAsNesrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/device.rs

between commit:

  1e180614b3608 ("rust: driver-core: Update ARef and AlwaysRefCounted impor=
ts from sync::aref")

=66rom the driver-core tree and commit:

  97bcbe585476e ("rust: device: use `kernel::{fmt,prelude::fmt!}`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/device.rs
index c2a6f5c203f04,303af0ef9bf73..0000000000000
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@@ -5,11 -5,10 +5,11 @@@
  //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 =20
  use crate::{
-     bindings,
+     bindings, fmt,
 -    types::{ARef, ForeignOwnable, Opaque},
 +    sync::aref::ARef,
 +    types::{ForeignOwnable, Opaque},
  };
- use core::{fmt, marker::PhantomData, ptr};
+ use core::{marker::PhantomData, ptr};
 =20
  #[cfg(CONFIG_PRINTK)]
  use crate::c_str;

--Q7K+ibzzMAsNesrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJZb4ACgkQJNaLcl1U
h9AIJgf/VmyfdOVI7FvbdDguDm/Rod8CJ64pZiNz7Gk9xOzNjrj/gjvdFUlJjiPS
yXU3qJuq4tD2pefhUrQoFcLdCTw73C8dI0zYPdhgr8EBwUXr9Zk+D5B2KDx7cWvr
BGFkflEUEB+wm7l4TVFPQVB9NzWrp1dq99TrT3MK96rWGCib7lCIOBzc3ULRmurZ
3y6epS8gkUgWHm/Za4uImyaIRPyVIFLyP7/+QjmFlkFnAxUu5vY+cvTRdXrjjxkS
DrXSckHZNaEbpUzyPSXjvD0WrPeH+uj3mmbO1dtV8oNsCMHEks8ZurJsLbmVd4Jp
6JLHpn8cXPI7ywcAhbI5jfh5zD2tkw==
=0L8K
-----END PGP SIGNATURE-----

--Q7K+ibzzMAsNesrF--

