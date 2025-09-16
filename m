Return-Path: <linux-next+bounces-8335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F38B5976A
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E68C173F87
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326E2313262;
	Tue, 16 Sep 2025 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLmK1ppK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD7D30C606;
	Tue, 16 Sep 2025 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028887; cv=none; b=picfCbZ8YD9ZwTmNFA2D1iaCbzTMgVKWMNr2cfDfxaUYM3DMg3lxWtOtmFAYs8wuW125xgrFVd8wM5Yenx7CV28BsgnwWpi5eLEHXD6POijorzfItDCbRz9QSpOpn+YJuUmhphKFHbVtqF9PA5chggeqnpi55q3BOWAQr+1qNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028887; c=relaxed/simple;
	bh=WrpHfUU5ZBIfOSEdQqcTXV5Sg7cFqPaWMFk5sUATfN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0Ff3fy80CvxaAocjAhEcU13XoGLTJYErQBMQSdDDtqmEEwRB2rbwURkzkHGQYT1Rl9nVZ3WI+Rwx4kP90BSkrua12wk7GBe8elCBz93bGUXrfK21gHBkNl42No7/w8JB5PAFwlWE79LcIyNu4i7GS+aYkkvxSST2xICwqIhM1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLmK1ppK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5F1C4CEEB;
	Tue, 16 Sep 2025 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758028886;
	bh=WrpHfUU5ZBIfOSEdQqcTXV5Sg7cFqPaWMFk5sUATfN0=;
	h=Date:From:To:Cc:Subject:From;
	b=HLmK1ppKc0zwgA2n6NyxlILwIVpaiYwTPjUFsDKCsfNGV11N2LBZgdSHxcdlllao4
	 mLeE0dheXJ64r+aHI7dHeT+dfpMJEGcJDNeeO97vBSld29YzdjkSrfWWR4nVmHsFEC
	 0VFt0fkVaMWZq7vxOLJNEKCl8Fje8iILnR8lVNjbs1Gf7rAQuuXRqbhfkVpTfmYc7N
	 myKjuS/Latn8WMKWx5liLE3na1ICbjcPASjYIxVqEWxRwkTlwXv2SeOWF+1CE+Vm67
	 b8QEn9t65Gz9Py+73u8R4IBPwSlfP1Mw2n+2QGQdlBiNhQAviysHqQjc8//AwBI8XN
	 myxq3d2g+2tZw==
Date: Tue, 16 Sep 2025 14:21:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the block tree
Message-ID: <aMlkUu2MzRYxh96v@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ia6n53zUKYXPQur"
Content-Disposition: inline


--5ia6n53zUKYXPQur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/block/mq/gen_disk.rs

between commits:

  f4b72f1558be1 ("rust: block: normalize imports for `gen_disk.rs`")
  c3a54220b54a1 ("rust: block: use `NullTerminatedFormatter`")
  90d952fac8ac1 ("rust: block: add `GenDisk` private data support")

=66rom the block tree and commit:

  e0be3d34f1089 ("rust: block: use `kernel::{fmt,prelude::fmt!}`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/block/mq/gen_disk.rs
index 46ec802699706,be92d0e5f0312..0000000000000
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@@ -3,19 -3,12 +3,19 @@@
  //! Generic disk abstraction.
  //!
  //! C header: [`include/linux/blkdev.h`](srctree/include/linux/blkdev.h)
- //! C header: [`include/linux/blk_mq.h`](srctree/include/linux/blk_mq.h)
+ //! C header: [`include/linux/blk-mq.h`](srctree/include/linux/blk-mq.h)
 =20
 -use crate::block::mq::{raw_writer::RawWriter, Operations, TagSet};
 -use crate::fmt::{self, Write};
 -use crate::{bindings, error::from_err_ptr, error::Result, sync::Arc};
 -use crate::{error, static_lock_class};
 +use crate::{
 +    bindings,
 +    block::mq::{Operations, TagSet},
 +    error::{self, from_err_ptr, Result},
++    fmt::{self, Write};
 +    prelude::*,
 +    static_lock_class,
 +    str::NullTerminatedFormatter,
 +    sync::Arc,
 +    types::{ForeignOwnable, ScopeGuard},
 +};
- use core::fmt::{self, Write};
 =20
  /// A builder for [`GenDisk`].
  ///

--5ia6n53zUKYXPQur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJZFEACgkQJNaLcl1U
h9CH9Af+N2HtVOdC1rC9ENUW2Rjlv/bPY6YkfCJP7zM3Jx43pe+pa2oUGB6KOjLw
0rN05z6OY9jz/qcCVsyYi6ocbM9B4lbjHlehj0KvF9UbB1jLVDIjEU2a33jZ/5Tk
mnO0KaCYbLwOZvgyyvTi9I7L0Uy0FtFymnGc03kXZQ4VLUu2LhM7UzsAE7e01aCB
aiUbauQJ8S5ootJcUwxW0ImwsjdJorKT/H2GWNSZEz+Mfm42S0Q+mJTN3572+0wC
UvFSv5M+GrYj+poLQaU21m+UnoOKlTWsvB3sD90ItHaXOjyu+qZzlEG4bCIwC3Kp
J3hMmiMjXUO/JSL8FqnJc6uagyWYXA==
=NDvU
-----END PGP SIGNATURE-----

--5ia6n53zUKYXPQur--

