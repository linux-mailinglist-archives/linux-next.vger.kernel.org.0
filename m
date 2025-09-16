Return-Path: <linux-next+bounces-8337-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A5B597A8
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668A73A4463
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE252315D3C;
	Tue, 16 Sep 2025 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXpURD3E"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704E315D23;
	Tue, 16 Sep 2025 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029413; cv=none; b=uYryRoXYuO3ZsaCIE/f1v97Jel2au++Xr5B+q3RP5X/TLBKOsOQsOrV+CgY8LBwBARAmresybcuQlSB5MebATLMof/o0du7Sw8URUhSe+Nfoe4Jfd0+7bKPYeI+O0BFpC+KM20nmTSd7i3X56LiEfrgW6vnU3IihNer0teanqgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029413; c=relaxed/simple;
	bh=YlWUfhY+fHGgWcOdSCwJl+jwZZ2bGestw2/sLcvPGJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOGiwDvSJS1zqrcKtoJcSl3+/xTqWL7+smlte69FQLtsI6qF5IcU8PfXDJD/vbA3S6ZM7F5ioVHQ9U5Re97Tenas0cj2OcBO1Y7ktM6pdLpIswl56iYBnQae8ZaOK/GD2iJSEvbE25UEe5g8HNR+yJndhyrELFQKPfBh+dX1t5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXpURD3E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA637C4CEEB;
	Tue, 16 Sep 2025 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758029413;
	bh=YlWUfhY+fHGgWcOdSCwJl+jwZZ2bGestw2/sLcvPGJY=;
	h=Date:From:To:Cc:Subject:From;
	b=mXpURD3E9qE85AFe6RjsKLE42ttAV5sys/DoR/VDsjjrc+ZhxpYBlZEFcWUG7dnIc
	 9y58QEe9AUIgRL34wZx+dIuszL94sCB/hWHlN1K3KMld0EEmyjnuM23M7g5vvTa/6b
	 hqf9crxmqi/Jj1nNSSpmlYaR9cL2n9TfJRKVcaGQAHiPVTVOAntWa8easPHAVQWSAQ
	 30kUBu1lG0uxZ54/LqyHZ3fV5QRvkCrOy85uXUGp1tTCBhWbP/n7Qs0jD4fwhtw4zh
	 RRCsdXFyKjY5B9oEzrc3r01cdPp/9zU6gDRTjqf1wxpUALgF71Gz6T8svf5Zhv2IV4
	 8FTPgYHYRRFMA==
Date: Tue, 16 Sep 2025 14:30:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the vfs-brauner tree
Message-ID: <aMlmYa5UjLe_ATl_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ANOFwsJ639CcKaXb"
Content-Disposition: inline


--ANOFwsJ639CcKaXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/fs/file.rs

between commits:

  eed8e4c07d85c ("rust: fs: update ARef and AlwaysRefCounted imports from s=
ync::aref")
  c37adf34a5dc5 ("rust: file: use to_result for error handling")

=66rom the vfs-brauner tree and commit:

  e6aedde22dc42 ("rust: file: use `kernel::{fmt,prelude::fmt!}`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/fs/file.rs
index f1a3fa6987451,67a3654f0fd37..0000000000000
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@@ -10,9 -10,9 +10,10 @@@
  use crate::{
      bindings,
      cred::Credential,
 -    error::{code::*, Error, Result},
 +    error::{code::*, to_result, Error, Result},
+     fmt,
 -    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
 +    sync::aref::{ARef, AlwaysRefCounted},
 +    types::{NotThreadSafe, Opaque},
  };
  use core::ptr;
 =20

--ANOFwsJ639CcKaXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJZmAACgkQJNaLcl1U
h9ClrAf8CbiTOxg0tm9NSzWsqAB0YKNGpm3mKNhJyMpjWfk8SRVZwWuNi+pznqLb
NVf0jZD69Q0zdEbHKcdx12WX+LjHlol7jU0J+EF7ZlMg/Tv8nSdBvvW8mAju9GLW
QJwhoF54VFrcoO8aI5LnEV716Lj6OyeN3F4YxTz0kiXlNCLwqkWg0s30Ltgm6G6t
x4QMPVz68UDjJYGwrjEtjRVpFEKq9LFqbBLA8ovfiNkqXw2McFhQ2/md8ppB5sA1
JI5er1wReuqW740kLPyR5b4snndy+/YlXZSj0SVT7+pCbUrM4lxaGvPeIK23pN9s
dJtAANlimd0Dfduq3dWUqv+hgLCovw==
=YzX+
-----END PGP SIGNATURE-----

--ANOFwsJ639CcKaXb--

