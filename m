Return-Path: <linux-next+bounces-8834-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED8C33F2A
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 05:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 676BF34B898
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 04:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED7021C9EA;
	Wed,  5 Nov 2025 04:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FR4+ndTE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52B1FC7C5;
	Wed,  5 Nov 2025 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762318278; cv=none; b=J5q1fzfseowhqJ8mv7PcMiTZS4gVzu1yT4hObERFCnydIq+6jd1wUxWUYZ/6pAsVeturdF+tehvhnnqWFXJBrBHedSknDfWOiJ4WizniyvQlp9g6EjPAXNpPD5sSQ1N16c/zyyBG9CPVncChAjQ8PJT9pGEl2ckeFYpOxm2mxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762318278; c=relaxed/simple;
	bh=Rqt0rfJ9DyJDcUVxDeKKcSB70SdKUoesL1eeCo73ZcU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rjrPEKoVFpuCuVeCGvZ96fDBqYA/hIzLEnjJvgGinlSiW8PVGx3QrgHI25CgaXO47QKQQ8JZmJNaNm23NvI+BdIR6b+NgGG4d1GiGxjINM4MV1hLzViDdBHX5+unKrOULGHExIGkaY5sc0P6WRfi/DByyCPovcrPZ4XkldYdhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FR4+ndTE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762318270;
	bh=qhseKDsy4MSygtMUL1tZlcg8MsXp00Z4IjsBDJqxj3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FR4+ndTEBhwOG/Rj1+CefDf0WqihgR3LSW0mu6LTCauNg4pCJYpXjBamlQgv3Dr8b
	 RJox4VNkBCd1aYkEMOJcoz60/54U0Wk2+ADcmdH6FZNalOmZvpKUB4wqMfzOy8QitW
	 uiMUCt04xd3CKJ2pbReCNmJ3BZKaFZ0VdSn3yrPkGMmUPqdBiBf3A1Z+cc2I9mpj79
	 DFxYMeymMSoZoVNMP3w8GvLD6f8Im+d67i08e6K/5U3NonybfNZIpUQoKNGTGPexWE
	 9ruYl8x05hpVanTdY861Du/6UOgLYgfSE1xhLZdGq3aP/swyrJRoUVqHvSMphXhL8J
	 G4SOWhagXYYuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1Xvx4ZJhz4wBD;
	Wed, 05 Nov 2025 15:51:09 +1100 (AEDT)
Date: Wed, 5 Nov 2025 15:51:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <20251105155109.1b3fc7d8@canb.auug.org.au>
In-Reply-To: <20251104154500.5acb5340@canb.auug.org.au>
References: <20251104154500.5acb5340@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6VnHqlZ6EvRBuZsD/tpUQB.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6VnHqlZ6EvRBuZsD/tpUQB.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Nov 2025 15:45:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the modules tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> error[E0308]: mismatched types
>   --> rust/kernel/module_param.rs:75:47 =20
>    |
> 75 |         let new_value =3D T::try_from_param_arg(arg)?;
>    |                         --------------------- ^^^ expected `&BStr`, =
found `&CStr`
>    |                         |
>    |                         arguments to this function are incorrect
>    |
>    =3D note: expected reference `&BStr`
>               found reference `&ffi::CStr`
> note: associated function defined here
>   --> rust/kernel/module_param.rs:32:8 =20
>    |
> 32 |     fn try_from_param_arg(arg: &BStr) -> Result<Self>;
>    |        ^^^^^^^^^^^^^^^^^^
>=20
> error: aborting due to 1 previous error
>=20
> For more information about this error, try `rustc --explain E0308`.
>=20
> Caused by commit
>=20
>   0b08fc292842 ("rust: introduce module_param module")
>=20
> This is some interaction with something later in linux-next - presumably
> commit
>=20
>   3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")
>=20
> from the rust tree.
>=20
> Hopefully someone can provide a resolution for me tomorrow.
>=20
> I have used the modules tree from next-20251103 for today.

I have used the modules tree as is and applied the below merge
resolution patch (supplied by Andreas) to the merge of the rust tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 5 Nov 2025 14:52:29 +1100
Subject: [PATCH] fix up for "rust: replace `CStr` with `core::ffi::CStr`"

interacting with commit

  0b08fc292842 ("rust: introduce module_param module")

from the modules tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 rust/kernel/module_param.rs | 1 +
 rust/macros/module.rs       | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index e7d5c930a467..6a8a7a875643 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -70,6 +70,7 @@ pub trait ModuleParam: Sized + Copy {
     // SAFETY: By function safety requirement, val is non-null, null-termi=
nated
     // and valid for reads for the duration of this function.
     let arg =3D unsafe { CStr::from_char_ptr(val) };
+    let arg: &BStr =3D arg.as_ref();
=20
     crate::error::from_result(|| {
         let new_value =3D T::try_from_param_arg(arg)?;
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 1a22de73d512..f6a94712384f 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -133,10 +133,10 @@ fn emit_params(&mut self, info: &ModuleInfo) {
                         ::kernel::module_param::KernelParam::new(
                             ::kernel::bindings::kernel_param {{
                                 name: if ::core::cfg!(MODULE) {{
-                                    ::kernel::c_str!(\"{param_name}\").as_=
bytes_with_nul()
+                                    ::kernel::c_str!(\"{param_name}\").to_=
bytes_with_nul()
                                 }} else {{
                                     ::kernel::c_str!(\"{module_name}.{para=
m_name}\")
-                                        .as_bytes_with_nul()
+                                        .to_bytes_with_nul()
                                 }}.as_ptr(),
                                 // SAFETY: `__this_module` is constructed =
by the kernel at load
                                 // time and will not be freed until the mo=
dule is unloaded.
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/6VnHqlZ6EvRBuZsD/tpUQB.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkK170ACgkQAVBC80lX
0GzrCAf/cLu6vLUP9wtMFD7QMIN5HOMabsD21HuABrU9jQvBAzEVMWXrLJmb7t7g
gyLiTo6TpfpUGsSqTsdLCG7+4cO3KVkquV4QvG6cojDuesbP6eKq78TfM0Pt90MY
2PEf98L7S4FU6lvz8t7aWrSWiU8uiNGNJ8maodZmdlh2m5BgbDhCzSIeHLbSyu0w
ADGkpwJHvKElSRQmAeKvJgxSVKziIBaHJm4rPgdXukSB8TsDqe8C7faQN+xWZX5s
AtsB2S07FbXX68h7rHh0/+tsv58aYrVQfigyL1TDy/bCpPJWzHw7ZrEfPXc3dTOI
eDihBSnBWD3+Vc+rw3F651jdKjFGvg==
=jV7k
-----END PGP SIGNATURE-----

--Sig_/6VnHqlZ6EvRBuZsD/tpUQB.--

