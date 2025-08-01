Return-Path: <linux-next+bounces-7811-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9EB17D5C
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 09:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E249D586F1A
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 07:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74750158545;
	Fri,  1 Aug 2025 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mOCEVgP4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783F3C26;
	Fri,  1 Aug 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754032706; cv=none; b=H8cQkvPEcvAyieMiAH/srHUATVMf0pI3pt0PyApFtnDAVnNDFaPFwJxcc6cqc3HGxTwoOl4XR/laWP7R1JYWZ4UD2AbV8aXt9+XxUW0LHV2EXoKB0ZjEuHmS6OrnKWt/4ZtJ4dW0DiSCL/paJdrO2yuM2nB0B8kZoA8qZo0jPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754032706; c=relaxed/simple;
	bh=BOFyJw4ktBxPJF/jujwd4GVuA44Bxw4UBKAzqLYfmFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohf5ocnSU1GEKOEqqaZPyJW8ZBSm27sK6cfL+RtL0g3twlo9R86Im5QJjY/i2q7TrP/IIk5rH8IMTMw1wtu0hmhu5E660q8BYub5t3h3Azyn3PdPwWRLMHpJ4YCfDJ+8FrFrudvXyQWlLgivq0BKdj/ZlhSYdYqQf7tjtbkYsSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mOCEVgP4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754032466;
	bh=P/wEHpx1naDCEcAHIdugG1tNSMJQxPoJ4fhM/JvwLug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mOCEVgP4D8NUoGMxs+CJC4wg2sDHE0LL0TyC+OciHTDZyDPahMVZh8zbIW6jpQu8Y
	 wZmjEMowJq7VsOMBEOiLUE1vjrmgoLCp/3bddZeucNHJsdW8Pb/5jAd6QaqQD+eVr9
	 fA8b31Gmw2q3R6q/OMIWZ5UtZJ4UWtouxTF+sd4M68jgBXpV0dByV2T0WXhy6RDITY
	 DLtfRo21fedBSu+KpO5BnLBoCzJ4YLXo7qkPCKuJTjBqv/RZ6uVMdJPJg1k+XS7zD3
	 0PPYclPz2+g8V9Z8pw//zqP+VMv0uGH2JcAH9S0RdGjNOd7thfntucfpu08Kb2ljOF
	 LWbiE724S3ahA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btcdZ32zsz4xQW;
	Fri,  1 Aug 2025 17:14:26 +1000 (AEST)
Date: Fri, 1 Aug 2025 17:18:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
Message-ID: <20250801171816.1af66375@canb.auug.org.au>
In-Reply-To: <20250624195142.1050e147@canb.auug.org.au>
References: <20250624195142.1050e147@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RQb=0kK9bxoKZr9_/R35wlL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RQb=0kK9bxoKZr9_/R35wlL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 24 Jun 2025 19:51:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the rust-timekeeping tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>=20
> error[E0599]: no method named `as_nanos` found for struct `Delta` in the =
current scope
>   --> drivers/gpu/nova-core/util.rs:45:33 =20
>    |
> 45 |         if start_time.elapsed().as_nanos() > timeout.as_nanos() as i=
64 {
>    |                                 ^^^^^^^^ method not found in `Delta`
>=20
> error: aborting due to 1 previous error
>=20
> For more information about this error, try `rustc --explain E0599`.
>=20
> Caused by commits
>=20
>   2ed94606a0fe ("rust: time: Rename Delta's methods from as_* to into_*")
>   768dfbfc98e2 ("rust: time: Make Instant generic over ClockSource")
>=20
> interacting with commit
>=20
>   a03c9bd953c2 ("gpu: nova-core: add helper function to wait on condition=
")
>=20
> from the drm-nova tree.
>=20
> I tried to fix it up, but this lead down a rabbit hole and my rust
> skills are poor, so I just dropped the rust-timekeeping tree for today.
> A merge resolution would be appreciated.

This is now a conflict between the rust tree and Linus' tree.

The resolution being used is:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 25 Jun 2025 16:00:14 +1000
Subject: [PATCH] fix up for "rust: time: Make Instant generic over ClockSou=
rce"

interacting with "gpu: nova-core: add helper function to wait on
condition" from the drm-nova tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/nova-core/util.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 64fb13760764..76cedf3710d7 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
=20
 use kernel::prelude::*;
-use kernel::time::{Delta, Instant};
+use kernel::time::{Delta, Instant, Monotonic};
=20
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N]=
 {
     let src =3D s.as_bytes();
@@ -33,7 +33,7 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &=
str {
 /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@=
gmail.com/)
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Delta, cond: F) ->=
 Result<R> {
-    let start_time =3D Instant::now();
+    let start_time =3D Instant::<Monotonic>::now();
=20
     loop {
         if let Some(ret) =3D cond() {

--=20
Cheers,
Stephen Rothwell

--Sig_/RQb=0kK9bxoKZr9_/R35wlL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMajgACgkQAVBC80lX
0GxSxQf+LKPXq/Zq7qSk/o+YCOlGPNZXPzHIdC5XgK1N5uSHsVvt6/hy7BgdJGMT
s/m6TWc0NVefyOZqKkXp6ZdZ7TF0nmQ7k0cIrICrZjY/BaPjOmTTzztufTiYlaEU
ZY2ZTWIQsoWa64rzZNcDmtC82bJRY3fQ943iGXJrnEuSl+4pp/4C/ZVeiSOqkRJZ
dvCWseT9+eFcjTJtUpzJEpV+wnnmijeqMb+NA7bDSAlrN/ZY+rEXpi8yIztFrCnp
X8CgztqMFX4NZHX68hEHHZQEqWo2osT/rounrzDC0+LrogRaLrN3TvRmEiyRDbHB
Qdddc/+TZSkGWVd2vm5XOEhj7FxKlA==
=b+am
-----END PGP SIGNATURE-----

--Sig_/RQb=0kK9bxoKZr9_/R35wlL--

