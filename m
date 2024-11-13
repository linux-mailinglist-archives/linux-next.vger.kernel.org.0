Return-Path: <linux-next+bounces-4769-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC849C6927
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 07:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273521F22B02
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 06:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61291632D6;
	Wed, 13 Nov 2024 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fzw1Vwo0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A3BA34;
	Wed, 13 Nov 2024 06:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731478604; cv=none; b=jMFMYM/UVPw2WgDECY9nw8o2mLXCCc48pJy8dRgqGbE59qmDdbhHDpKwzRwGfpB5646+SjLItFWwm/YGJeixHSl+zZcj6X9Y4jpiIM65DsLqTW+7RU/cEuOvJrTKOsLPPeNw5IWLkUHHTJq9zZdnMLhph9Kv9aJtofGQS9Se+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731478604; c=relaxed/simple;
	bh=FHM81tIBFRM5Ie/WaKTJyJFIO0yMk+P49yMfam4MxIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=llb5/So8XwWDxR+xnMzPHLcGFCe91tG3DTyJNUj+MrjbQAgENVv8KflBqiByPgMNbFAVGMVq4TGvp7B/7h6HaY5a5MiejwkufM0brHGD1gWGpPO7Cam3OCAiYi5EeI3W1QC1uxdVB7X9vjclg6hJTdf/LqOYMyKBwbSUJp6/zB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fzw1Vwo0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731478596;
	bh=7Zd64h1B5pjZvnuqa9Jo0l6S6S6sUxdlNThU4gjHi6Q=;
	h=Date:From:To:Cc:Subject:From;
	b=fzw1Vwo0Zoz3jnYT50IaQdNXDQ+kHMaMOXKn9BF/Ef0TkKbfHL9C3ZccoCV3F9blZ
	 brSG1bDLWn590MdzkCzaI3PUjqctTohyZOPmTBi9P82p0pMEUGTn4Exn72sGc41EPn
	 Ug3eqhZqCDbm4yWg2k9v44YYz382bOLMqsGQ932eZfdWPlQMJVLhz7JSKJ/wuaWs1t
	 PPOQAlg9OLsfOalXQj3iwMIJO+sCZo7MG1ZmmxhoIr/NdSDdri6Z3oofqWfT1d2KqJ
	 opiXD+pXUa7oLc9d3M6BKCPf+SJ+PpHyMElNSUI4D55uUcqGTac4x0v2uOwHLpv7p9
	 NcsO75iwUy7OQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpCjJ5Z0Cz4wbR;
	Wed, 13 Nov 2024 17:16:36 +1100 (AEDT)
Date: Wed, 13 Nov 2024 17:16:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Aliet Exposito Garcia
 <aliet.exposito@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the ftrace tree
Message-ID: <20241113171638.5d1343e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/phQEpWEK1bGSpa3TGyrFSzq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/phQEpWEK1bGSpa3TGyrFSzq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/lib.rs

between commit:

  ad37bcd965fd ("rust: add tracepoint support")

from the ftrace tree and commit:

  ce1c54fdff7c ("rust: kernel: move `FromBytes` and `AsBytes` traits to a n=
ew `transmute` module")

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

diff --cc rust/kernel/lib.rs
index 5dc3f2c11031,bf8d7f841f94..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -60,7 -56,7 +63,8 @@@ pub mod str
  pub mod sync;
  pub mod task;
  pub mod time;
 +pub mod tracepoint;
+ pub mod transmute;
  pub mod types;
  pub mod uaccess;
  pub mod workqueue;
@@@ -89,32 -85,9 +93,32 @@@ pub trait Module: Sized + Sync + Send=20
      fn init(module: &'static ThisModule) -> error::Result<Self>;
  }
 =20
 +/// A module that is pinned and initialised in-place.
 +pub trait InPlaceModule: Sync + Send {
 +    /// Creates an initialiser for the module.
 +    ///
 +    /// It is called when the module is loaded.
 +    fn init(module: &'static ThisModule) -> impl init::PinInit<Self, erro=
r::Error>;
 +}
 +
 +impl<T: Module> InPlaceModule for T {
 +    fn init(module: &'static ThisModule) -> impl init::PinInit<Self, erro=
r::Error> {
 +        let initer =3D move |slot: *mut Self| {
 +            let m =3D <Self as Module>::init(module)?;
 +
 +            // SAFETY: `slot` is valid for write per the contract with `p=
in_init_from_closure`.
 +            unsafe { slot.write(m) };
 +            Ok(())
 +        };
 +
 +        // SAFETY: On success, `initer` always fully initialises an insta=
nce of `Self`.
 +        unsafe { init::pin_init_from_closure(initer) }
 +    }
 +}
 +
  /// Equivalent to `THIS_MODULE` in the C API.
  ///
- /// C header: [`include/linux/export.h`](srctree/include/linux/export.h)
+ /// C header: [`include/linux/init.h`](srctree/include/linux/init.h)
  pub struct ThisModule(*mut bindings::module);
 =20
  // SAFETY: `THIS_MODULE` may be used from all threads within a module.

--Sig_/phQEpWEK1bGSpa3TGyrFSzq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc0REYACgkQAVBC80lX
0Gxsegf/R97g7fD2p7OnMLV8l4qPmLZg3ThuQORm4Sm7an69nANyUSzAMe1+5YNA
9foUACb5LT9m/wp8O8DxlWuZjw6ojP7fEQq6+7jICaa9JQjm0nsZZnp8Tcw0+et5
k7dx/lKQXuKzsxoxjizGQWjen99zN7G+3AaiBPC32EmWFgFNEVdyCtDFHdqgZxZ8
clK+WsWvEwmcwHLPplLSZET4toF3MVwmxS/uHiFi8MfL/zZBT9Mb/dMDtGA/m/4B
2/NGzNHCxZqmkpJruruG9Gs3PbzsjDCLzgGNUlWCWHrZ2+8ikRTfjtDF01UHifA2
Yt7Ii6xZnd8ra3FACKPTiSuIpwNMnA==
=f3vH
-----END PGP SIGNATURE-----

--Sig_/phQEpWEK1bGSpa3TGyrFSzq--

