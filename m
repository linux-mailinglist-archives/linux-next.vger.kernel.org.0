Return-Path: <linux-next+bounces-9043-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E045EC62D92
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 09:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB8B63B783D
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 08:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB0123F429;
	Mon, 17 Nov 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pjTojQXD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD730FF1E;
	Mon, 17 Nov 2025 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366666; cv=none; b=OWI1nawnHJafCUiY/C2/AnJzYesj0xU1Ve8R5iswpRfp+MO7Z47CjGXx4/4weRO6/zMjnBZQc0QxKQWnpJxB4vaZXgP0hE5ZBYvuQhfXHM8K9/uBv7KgRFJ6Dp2u0Y9ECcpQZz5eqAe7QidNjJESGfkqeIS8CmFK542WFQQJ3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366666; c=relaxed/simple;
	bh=wDKZ2sA8XF/02eCDV3WatDbP4RManbnLa9q4WTi1wdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KEPmx138CfhxJMQCAp2ucqC5EbFlr42Rp9VQkK+W8R+FyFA0Eu11ClSGoqB18SDuXnY5wtjuiGZs3WUEG5e7H0oY0Iiee0ZH4u9avsuqvEChWdT8vdmPnxhTWGQ4xFMO0bUzfNY8Quncj5fS3UIE/U6dtWmxFsfGjKudvU59HMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pjTojQXD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763366658;
	bh=KQGd3gUVvtFwCPcQ69bpvd5G90QfDSj1Z/D2EXde6R4=;
	h=Date:From:To:Cc:Subject:From;
	b=pjTojQXD7AI1RWSNAcXIP3BLiaNwsmy3kWP/KTxto1RkOd50iJYhpWvBMcDnav3Og
	 kEX3j/YrHL5sG0Pq/t1lvONqVPtoksNLX4y1eL4tlbQjYmvF48Eh7+eftre/VXFZFQ
	 i/5a5XS9CHEZ2gDFv51/b/musT1U+tBSPXhzxhETkxmoYU1+Pq24pD2Urj34DlCErn
	 lYR2h59UDmxi4hNI8xEWHczoFIFGF9m52BKaIlHqGPiCkmOJw3P+rx15kCQmk8w9PI
	 +PmREJSM22zIiC2CBnTATkVr01uKFEdAo77NZUQDdJVIdxoMI1/GeoUWPNdbiSw3Hq
	 BDaqrhvsTBlrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d90dG4WBPz58bC;
	Mon, 17 Nov 2025 19:04:18 +1100 (AEDT)
Date: Mon, 17 Nov 2025 19:04:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, John Hubbard
 <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, Tamir
 Duberstein <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20251117190417.44f20ddd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bf16UQZwBNJOCnS6=jRaYBG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Bf16UQZwBNJOCnS6=jRaYBG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0277]: `Chipset` doesn't implement `core::fmt::Display`
   --> drivers/gpu/nova-core/gpu.rs:233:13
    |
233 |             self.chipset,
    |             ^^^^^^^^^^^^ `Chipset` cannot be formatted with the defau=
lt formatter
    |
    =3D help: the trait `core::fmt::Display` is not implemented for `Chipse=
t`
    =3D note: in format strings you may be able to use `{:?}` (or {:#?} for=
 pretty-print) instead
    =3D note: this error originates in the macro `$crate::format_args` whic=
h comes from the expansion of the macro `write` (in Nightly builds, run wit=
h -Z macro-backtrace for more info)

error[E0277]: `Revision` doesn't implement `core::fmt::Display`
   --> drivers/gpu/nova-core/gpu.rs:235:13
    |
235 |             self.revision
    |             ^^^^^^^^^^^^^ `Revision` cannot be formatted with the def=
ault formatter
    |
    =3D help: the trait `core::fmt::Display` is not implemented for `Revisi=
on`
    =3D note: in format strings you may be able to use `{:?}` (or {:#?} for=
 pretty-print) instead
    =3D note: this error originates in the macro `$crate::format_args` whic=
h comes from the expansion of the macro `write` (in Nightly builds, run wit=
h -Z macro-backtrace for more info)

error[E0277]: the trait bound `MsgFunction: kernel::fmt::Display` is not sa=
tisfied
   --> drivers/gpu/nova-core/gsp/cmdq.rs:532:9
    |
532 | /         dev_dbg!(
533 | |             &self.dev,
534 | |             "GSP RPC: send: seq# {}, function=3D{}, length=3D0x{:x}=
\n",
    | |                                               -- required by a boun=
d introduced by this call
535 | |             self.seq,
536 | |             M::FUNCTION,
537 | |             dst.header.length(),
538 | |         );
    | |_________^ the trait `kernel::fmt::Display` is not implemented for `=
MsgFunction`
    |
    =3D help: the following other types implement trait `kernel::fmt::Displ=
ay`:
              &T
              Arc<T>
              Arguments<'_>
              BStr
              Box<T, A>
              CStr
              Chipset
              Class
            and 22 others
    =3D note: required for `kernel::fmt::Adapter<&MsgFunction>` to implemen=
t `core::fmt::Display`
note: required by a bound in `core::fmt::rt::Argument::<'_>::new_display`
   --> /usr/lib/rustlib/src/rust/library/core/src/fmt/rt.rs:113:27
    |
113 |     pub fn new_display<T: Display>(x: &T) -> Argument<'_> {
    |                           ^^^^^^^ required by this bound in `Argument=
::<'_>::new_display`
    =3D note: this error originates in the macro `::core::format_args` whic=
h comes from the expansion of the macro `dev_dbg` (in Nightly builds, run w=
ith -Z macro-backtrace for more info)

error: aborting due to 3 previous errors

For more information about this error, try `rustc --explain E0277`.

Caused by commit

  c5cf01ba8dfe ("rust: support formatting of foreign types")

(I think) interacting with commits

  38b7cc448a5b ("gpu: nova-core: implement Display for Spec")
  75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and ha=
ndling")

from the drm-rust tree.

I have applied the following patches for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Nov 2025 18:16:10 +1100
Subject: [PATCH] temp hack for "rust: support formatting of foreign types"

from the rust tree interacting with "gpu: nova-core: implement Display
for Spec" from the drm-rust tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/nova-core/gpu.rs | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 19755af6ad04..be2055da1755 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -178,7 +178,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Resul=
t {
 /// Structure holding a basic description of the GPU: `Chipset` and `Revis=
ion`.
 pub(crate) struct Spec {
     chipset: Chipset,
-    revision: Revision,
+//  revision: Revision,
 }
=20
 impl Spec {
@@ -220,7 +220,7 @@ impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
     fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
         Ok(Self {
             chipset: boot42.chipset()?,
-            revision: boot42.into(),
+//          revision: boot42.into(),
         })
     }
 }
@@ -229,10 +229,11 @@ impl fmt::Display for Spec {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(
             f,
-            "Chipset: {}, Architecture: {:?}, Revision: {}",
-            self.chipset,
-            self.chipset.arch(),
-            self.revision
+            "Chipset"
+//          "Chipset: {}, Architecture: {:?}, Revision: {}",
+//          self.chipset,
+//          self.chipset.arch(),
+//          self.revision
         )
     }
 }
--=20
2.51.1


From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Nov 2025 18:25:53 +1100
Subject: [PATCH] temp hack 2 for "rust: support formatting of foreign types"

from the rust tree interacting with "gpu: nova-core: gsp: Add GSP command
queue bindings and handling" from the drm-rust tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/=
cmdq.rs
index 6f946d14868a..ede05d1d82aa 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -529,13 +529,13 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, =
command: M) -> Result
                 dst.contents.1,
             ])));
=20
-        dev_dbg!(
-            &self.dev,
-            "GSP RPC: send: seq# {}, function=3D{}, length=3D0x{:x}\n",
-            self.seq,
-            M::FUNCTION,
-            dst.header.length(),
-        );
+//        dev_dbg!(
+//            &self.dev,
+//            "GSP RPC: send: seq# {}, function=3D{}, length=3D0x{:x}\n",
+//            self.seq,
+//            M::FUNCTION,
+//            dst.header.length(),
+//        );
=20
         // All set - update the write pointer and inform the GSP of the ne=
w command.
         let elem_count =3D dst.header.element_count();
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/Bf16UQZwBNJOCnS6=jRaYBG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmka1wEACgkQAVBC80lX
0Gy5sQf9HK+aP+Ye/AdQ7UCoIshmoO6vg8Qd+SUJfJyO1Bu+Ic5vdzpxylzVN+sj
LX7nBELWLUV1424yDe0sCX0SQJzCHk1tdk3gfAAQ5HuInCfI2Ja0nroVcVV9j3uy
2/FouBeZ98onH3f478Nt78SgQloylsLgXXr4nsEr+RWV9Tisot+pTW0LCOY+Rcx8
v4azJamgx0eS69LFMPsG0vioP7dw7uAgtYHnYD8+8fRkHqGXt8YM/g28DkFVsUPT
l+JO7WwqNFJ2jkWnxeJ2qGaiXq6WWCjpMctePCmY02K7/CvAyermfwm5CeHakLz6
+rj0Y3uGh4EW2ZNQ69iRjXdsQpqX0Q==
=D7vE
-----END PGP SIGNATURE-----

--Sig_/Bf16UQZwBNJOCnS6=jRaYBG--

