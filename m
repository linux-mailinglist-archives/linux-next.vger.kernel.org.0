Return-Path: <linux-next+bounces-9342-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E01CA5A9D
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 23:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45CE5303371E
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 22:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E452E33BBA0;
	Thu,  4 Dec 2025 22:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d+bi/GVM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24433BBB6;
	Thu,  4 Dec 2025 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764889127; cv=none; b=bIsCSX+Wvn29VGLGxAtY61RuQZyHWRZWf0VmQqXdQXSC1IA9dtPS+eT6R/Lr+WVIs+PyuT+MrfAsJVHakqqnTUrprsRdwGpMuLB6mLwLbY1F+vDguJdGKb/o25aloP7njivYSzSeJ9OA037euojd8LQPY+ckMhjE1YyO2PPSUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764889127; c=relaxed/simple;
	bh=humO9dq2BR2AEhZUoQvxjOvBoEavyT0X3exOsS+tp2s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h9s54sfVp7Ioajt+uyLzu7VsrIr99wXd/C/U7+mtQaIlsZ1U0aLY8FNIXNKZ0uF0Ef/7mE9g07BIZy8dyD2EbR7QdbX9qCh6eYis89J6Vf/OuytxL7TONQo5MCHqsgWRHw+nlRTdgBRjlJZNr0p6JBd9lhP3fHDHeWsOjh2/6mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=d+bi/GVM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764889116;
	bh=WUM9+bEmQHP4uWYqKWd3faS4oDXm095il3o3Vj5FcaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d+bi/GVMJFtrfjG/HgtQv8rIMRuts7S/tPTCozoOlG8fJ8MASqAAJR29FzVfv23M6
	 Ie/JdjlAjbBjd9QlNwrXpBpFELYuxopuPsasgs6uCXBpgpEfI3SSwcp7CalAkQfQck
	 Zhl2xWVBW6niaOrP8e9I6kF2xYWgSfPWj/ND4H1aiRRMTdIIdteDFeZFx8b8JPdBFk
	 jED4GV67N0lvvwMHn8sWt4ssak2aTzgrI73toJzM/EkVzREcmXQwm2GuHWep4SyKPq
	 NT235vxxBzweZYHLNIXWX2yU8RvzI/RJZqwKf3ahrHKW18XxE9wVA8liWKArHv+Tmp
	 E6Ebwndlj0Uzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMqgJ353yz4vyg;
	Fri, 05 Dec 2025 09:58:36 +1100 (AEDT)
Date: Fri, 5 Dec 2025 09:58:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, Tamir Duberstein
 <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Daniel Gomez
 <da.gomez@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <20251205095835.552abf88@canb.auug.org.au>
In-Reply-To: <20251105155109.1b3fc7d8@canb.auug.org.au>
References: <20251104154500.5acb5340@canb.auug.org.au>
	<20251105155109.1b3fc7d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ik_yv35k4ceo.0Rp8GCQ4n8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ik_yv35k4ceo.0Rp8GCQ4n8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 5 Nov 2025 15:51:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 4 Nov 2025 15:45:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the modules tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > error[E0308]: mismatched types =20
> >   --> rust/kernel/module_param.rs:75:47   =20
> >    |
> > 75 |         let new_value =3D T::try_from_param_arg(arg)?;
> >    |                         --------------------- ^^^ expected `&BStr`=
, found `&CStr`
> >    |                         |
> >    |                         arguments to this function are incorrect
> >    |
> >    =3D note: expected reference `&BStr`
> >               found reference `&ffi::CStr`
> > note: associated function defined here =20
> >   --> rust/kernel/module_param.rs:32:8   =20
> >    |
> > 32 |     fn try_from_param_arg(arg: &BStr) -> Result<Self>;
> >    |        ^^^^^^^^^^^^^^^^^^
> >=20
> > error: aborting due to 1 previous error
> >=20
> > For more information about this error, try `rustc --explain E0308`.
> >=20
> > Caused by commit
> >=20
> >   0b08fc292842 ("rust: introduce module_param module")
> >=20
> > This is some interaction with something later in linux-next - presumably
> > commit
> >=20
> >   3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")
> >=20
> > from the rust tree.
> >=20
> > Hopefully someone can provide a resolution for me tomorrow.
> >=20
> > I have used the modules tree from next-20251103 for today. =20
>=20
> I have used the modules tree as is and applied the below merge
> resolution patch (supplied by Andreas) to the merge of the rust tree.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 5 Nov 2025 14:52:29 +1100
> Subject: [PATCH] fix up for "rust: replace `CStr` with `core::ffi::CStr`"
>=20
> interacting with commit
>=20
>   0b08fc292842 ("rust: introduce module_param module")
>=20
> from the modules tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  rust/kernel/module_param.rs | 1 +
>  rust/macros/module.rs       | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> index e7d5c930a467..6a8a7a875643 100644
> --- a/rust/kernel/module_param.rs
> +++ b/rust/kernel/module_param.rs
> @@ -70,6 +70,7 @@ pub trait ModuleParam: Sized + Copy {
>      // SAFETY: By function safety requirement, val is non-null, null-ter=
minated
>      // and valid for reads for the duration of this function.
>      let arg =3D unsafe { CStr::from_char_ptr(val) };
> +    let arg: &BStr =3D arg.as_ref();
> =20
>      crate::error::from_result(|| {
>          let new_value =3D T::try_from_param_arg(arg)?;
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 1a22de73d512..f6a94712384f 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -133,10 +133,10 @@ fn emit_params(&mut self, info: &ModuleInfo) {
>                          ::kernel::module_param::KernelParam::new(
>                              ::kernel::bindings::kernel_param {{
>                                  name: if ::core::cfg!(MODULE) {{
> -                                    ::kernel::c_str!(\"{param_name}\").a=
s_bytes_with_nul()
> +                                    ::kernel::c_str!(\"{param_name}\").t=
o_bytes_with_nul()
>                                  }} else {{
>                                      ::kernel::c_str!(\"{module_name}.{pa=
ram_name}\")
> -                                        .as_bytes_with_nul()
> +                                        .to_bytes_with_nul()
>                                  }}.as_ptr(),
>                                  // SAFETY: `__this_module` is constructe=
d by the kernel at load
>                                  // time and will not be freed until the =
module is unloaded.
> --=20
> 2.51.1

This now needs to be applied to the merge of the modules tree (as the
rust tree has been merged by Linus).

--=20
Cheers,
Stephen Rothwell

--Sig_/Ik_yv35k4ceo.0Rp8GCQ4n8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyEhsACgkQAVBC80lX
0Gyc0Qf+NR/YtRQ0eu5HmkYzmo7I1PspEE8Wu1hm89WJHOXLKduo7B2tCa2k93jf
emi0ofl5BNGlwrbG7M4wa8XtPsGsLEPzfroaDnoDbNVymB8ApYGRBry1JIWjLnVX
37BxOvuf04w9xNlSayB2wwZBNNBvhyf9O8LeyCP6OVJ/AYW/+N39stJgjkvrnhdk
vVGA6Dhi8PGYD2YzyZAbCM/WHkAM3aHLKszKVzQw1NkVPzWfedKcRVP34Z4OP4fH
GOlk9B2CK+IZZUEfbwJ/FG7jk+ox03XoLr+c8LPC9ae/94We8ll8WTUkVSsoBOea
yXhdiHE7Ej0suLwpbAgXUInP2WIq4Q==
=Kbg2
-----END PGP SIGNATURE-----

--Sig_/Ik_yv35k4ceo.0Rp8GCQ4n8--

