Return-Path: <linux-next+bounces-5851-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB24A66F21
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 09:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C83111899DA8
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 08:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D42204F85;
	Tue, 18 Mar 2025 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="grJqnVi0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B18F1A3029;
	Tue, 18 Mar 2025 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288163; cv=none; b=Mb8Q/YZe3jfuESkrECUpeagIWKbCzlP4VPR5XCi3YD1eI/LPQe0ZbbA/KcwswBPXjiqDqwvQHQKTxdUNQef5WmYr+F9vE5ryEpjWMrtTv/SglGAQiLv0ixxBsr6koj6WYKiFRomw98N32q4VD9mloTol4D8B9JGxPpRBg3UrEI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288163; c=relaxed/simple;
	bh=351VADBxcA8G0TVQkPiO4YdsXS2AUSp+41hNQz1iCu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RwCs9X3B1zQefFEaIW/oNmVFrqBA/5PCNSH+hvbo8cbmqLakSxzZvOyuWh62AcMcd9rwI09TCfRzsCh9LnYzKMF6puaqi/h7hYGkIbjOLxLRTEIyIr/tgboEk3HIiRN0oMTUyiiBG8CYkSOZelMQCr/+nhbcKb1K0ZVzpBFqd6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=grJqnVi0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742288156;
	bh=lZVo1AIJavhSTe49lqBICSvxw2ghWK3kQflifTtOJSA=;
	h=Date:From:To:Cc:Subject:From;
	b=grJqnVi0elTuUd52y2f8wSvD45apNamTINUW08cVi+CSxhhG2Urotwq4D0bfZ0Zna
	 KQBBjqNj/hSR1f4ELhEJ+IEStaqKUn5DDfgI/X69xrb/GZPPfjx3R7e+Xk8gVwvdPK
	 0umbGjdz1fKklfFjrqIXM56xiZvJBm3idQemr439iMWVSRWHiqzWF903Gq9wljFjFO
	 SyE2L0v2L6SSBpC+77YjZP2nthZKkZ1PhgiKZrKMk0JvfjQR91V4v0EjAH8dUZdGKq
	 fIh7enjqxw9eTFYwD4IfYMoXjqDjbOge+XBb+p/iWdoUyH1a/maFWNPkrOwcLHs4Yp
	 xjAzbx6947IBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH5KR2ZWRz4x3p;
	Tue, 18 Mar 2025 19:55:55 +1100 (AEDT)
Date: Tue, 18 Mar 2025 19:55:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Boqun Feng
 <boqun.feng@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mitchell Levy <levymitchell0@gmail.com>
Subject: linux-next: manual merge of the rust tree with the tip tree
Message-ID: <20250318195554.0ae541e0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vHBCovO1dUts/PRDbiOsvwl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vHBCovO1dUts/PRDbiOsvwl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got conflicts in:

  rust/kernel/sync/condvar.rs
  rust/kernel/sync/lock.rs

between commit:

  f73ca66f0d7f ("rust: lockdep: Use Pin for all LockClassKey usages")

from the tip tree and commit:

  dbd5058ba60c ("rust: make pin-init its own crate")

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

diff --cc rust/kernel/sync/condvar.rs
index fbf68ada582f,c2535db9e0f8..000000000000
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@@ -8,17 -8,14 +8,15 @@@
  use super::{lock::Backend, lock::Guard, LockClassKey};
  use crate::{
      ffi::{c_int, c_long},
-     init::PinInit,
-     pin_init,
      str::CStr,
 -    task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UN=
INTERRUPTIBLE},
 +    task::{
 +        MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NO=
RMAL, TASK_UNINTERRUPTIBLE,
 +    },
      time::Jiffies,
      types::Opaque,
  };
 -use core::marker::PhantomPinned;
 -use core::ptr;
 +use core::{marker::PhantomPinned, pin::Pin, ptr};
- use macros::pin_data;
+ use pin_init::{pin_data, pin_init, PinInit};
 =20
  /// Creates a [`CondVar`] initialiser with the given name and a newly-cre=
ated lock class.
  #[macro_export]
diff --cc rust/kernel/sync/lock.rs
index 360a10a9216d,7f611b59ac57..000000000000
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@@ -10,10 -10,8 +10,8 @@@ use crate::
      str::CStr,
      types::{NotThreadSafe, Opaque, ScopeGuard},
  };
 -use core::{cell::UnsafeCell, marker::PhantomPinned};
 +use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
- use macros::pin_data;
+ use pin_init::{pin_data, pin_init, PinInit};
 =20
  pub mod mutex;
  pub mod spinlock;

--Sig_/vHBCovO1dUts/PRDbiOsvwl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZNRoACgkQAVBC80lX
0Gz5YQf8D8vp+Ws7lw8BDrjTYUgNp30qKtjlG7b5tHpXMjdON9KXQMsCl6H3fz+r
e/czATUqPoqmjqiIC0dKt9yTSvd13EwGlJ4B4WjX/k/jw+Fn4x5V1sLBLE0vV2mV
1tnzlJ0mxwEYmCf9EKsBFXJTOyp68jxZ/4Icaiefth7aPiJ8n7RPXlExwcGP/52x
qvwfNPb+URZpBeJjQKXI5oQ7c/qxpOb6zbivQoSBdkFlPlVvAf9fV9pELLOBBdwo
/WjHQDQxEpEO/WBl0/VVBlUlAc217mmDK9DCIOhzTkiiQLT43n1HRpka5ZujZpb1
yMjVZBPmwkl8vILuQbu480H36BZzuQ==
=qb7g
-----END PGP SIGNATURE-----

--Sig_/vHBCovO1dUts/PRDbiOsvwl--

