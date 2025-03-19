Return-Path: <linux-next+bounces-5878-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D3A68778
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D489D421DEC
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CC3251796;
	Wed, 19 Mar 2025 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZtDZ6c6Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DA2251791;
	Wed, 19 Mar 2025 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375225; cv=none; b=tiGjPnmYvHawON6zPWms2GtOqIAYJ1QvxDm5dMxAurbBaUNAkaDExPHd9FncOQwzvT5OtG7PmmYhzUur36idK7yMaVrPI5ypV1pbpLtT1NbvLXuhrAPXQtNCKGj8/2XZYa39xbj0XOuLB+3I31R1JuVRuyXzjfogbKN5+SoqEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375225; c=relaxed/simple;
	bh=hWY0nosICvQQMzedolJNLPUt3NNOinGOkhL3odI2wwE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMZ8JUwgMeIl/nq20EaiWzKlVKd+BMYhiCHH09pdxCvwYl/EpAsl+IO5302jLIHof7eS05JW+tqqERlM8n9ynIkozErWWBLDUzkxfjEzIKPwO8oWNfxgJaOpF1G97gILO2a2aGDxRn9bHAOD2TZZXbx3bMhIlzgfvZ0zSsp/UQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZtDZ6c6Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742375218;
	bh=j5HEN2klVlKR7Gns3VmG0gsnSUCDnXXCMO2Cjuw/TGY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZtDZ6c6YRx3z45zlh+TT7rwpXkv7ypCRuy3CIylZ3zdaxxD+ABCihGbo9UDr7nvaG
	 oVavN/f5NB4ve2tpjKMQTvZHZwTkFQcGtO2rMHZJRoh7IjI165PlbtUFMa5pKw43JZ
	 1HDHSwNjq/QjXHk0yANKaxP8EirldtOUeKWsVoFKSXwxVCyRelxvtOqjyHA/zyCP5L
	 R1IvLFN87uUFzO/CUi0Xy3/JT7smbAUKeisJgd55UJR12khSNNKbzlLHJi1OAAYE+5
	 B4uRwJCTrhVllCyzqfY5CxZmn+wghlSooIBxfz0adYK1IEb9IrLc0TK6alkZbnFcZZ
	 /ovHYiTzkWKvw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHjWk0cdMz4x1t;
	Wed, 19 Mar 2025 20:06:58 +1100 (AEDT)
Date: Wed, 19 Mar 2025 20:06:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Benno Lossin <benno.lossin@proton.me>, Boqun
 Feng <boqun.feng@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20250319200642.05825b39@canb.auug.org.au>
In-Reply-To: <CANiq72=mC67W_O9u6-HpAnqmy5L_A+-t9fW0YYR_0UR+hFvopQ@mail.gmail.com>
References: <20250317215757.2412aef1@canb.auug.org.au>
	<CANiq72n05i322FfpSjFX=Wz3-9AgVRKLkKs1CHa-LxzWQ7-pew@mail.gmail.com>
	<20250318103504.4cbfe7e1@canb.auug.org.au>
	<20250318223706.604bc4c5@canb.auug.org.au>
	<CANiq72=mC67W_O9u6-HpAnqmy5L_A+-t9fW0YYR_0UR+hFvopQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GTXnt_KHovWjuevm0NSuR6y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GTXnt_KHovWjuevm0NSuR6y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Wed, 19 Mar 2025 00:47:40 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> On Tue, Mar 18, 2025 at 12:37=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >
> > When I merge the rust tree into linux-next, the complete resolution now
> > looks like this:
> > (the hunk in rust/kernel/sync.rs is needed due to a commit in the tip
> > tree) =20
>=20
> Thanks!
>=20
> I have redone the 2 merges on my side again, following the ones you
> did (i.e. starting on the previous merge you had on 20250318, then
> rust-next, then hrtimer-next) and then compared. I saved it for you
> at:
>=20
>     https://github.com/ojeda/linux.git rust-test-merge

Thanks for checking it out.

> There are a few differences, a couple important, another one not much
> -- all coming from the first merge (rust-next one).
>=20
> 1) When merging rust-next, the first one is needed to pass `rustfmt`
> in `rust/kernel/sync.rs`:
>=20
> -use pin_init;
>  use crate::prelude::*;
>  use crate::types::Opaque;
> +use pin_init;
>=20
> Would it be possible for you to run `make ...... rustfmt` after
> merges? It is quite fast (with the amount of code we have :). As far
> as I know, Linus is also doing it, so it is not a huge deal, but it is
> nicer nevertheless to have it clean in linux-next so that CIs can do
> `make ....... rustfmtcheck` (which checks if it is clean).

I have a look into it.

> By the way, concerning this change, we could actually remove that
> line, but since it was in the original commit, I kept it in the merge
> -- we can clean it up in a proper commit later on.
>=20
> 2) More importantly, there are a couple changed needed to keep the
> examples building (which are KUnit tests, i.e. under
> `CONFIG_RUST_KERNEL_DOCTESTS`). In `rust/kernel/sync.rs`:
>=20
> -    /// # use kernel::{c_str, stack_pin_init};
> +    /// # use kernel::c_str;
>      /// # use kernel::alloc::KBox;
>      /// # use kernel::types::ForeignOwnable;
>      /// # use kernel::sync::{LockClassKey, SpinLock};
> +    /// # use pin_init::stack_pin_init;
>=20
> And in `rust/kernel/sync/lock.rs`:
>=20
> -    /// # use kernel::{new_spinlock, stack_pin_init,
> sync::lock::{Backend, Guard, Lock}};
> +    /// # use kernel::{new_spinlock, sync::lock::{Backend, Guard, Lock}};
> +    /// # use pin_init::stack_pin_init;
>=20
> 3) A trivial difference is that I kept the removal of this newline in
> `rust/pin-init/src/lib.rs`, because the original fix did so (which was
> likely done because the "SAFETY" comment is supposed to "cover" it
> too), but it is not a big deal to keep it as you have it.
>=20
>      Option<NonZeroI128>, Option<NonZeroIsize>,
> -
>      {<T>} Option<NonNull<T>>,
>=20
> Would it be possible to fix at least 1) and 2)? Thanks a lot!

I added all three to my resolution today.

--=20
Cheers,
Stephen Rothwell

--Sig_/GTXnt_KHovWjuevm0NSuR6y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfaiSIACgkQAVBC80lX
0GyGzAf/W4RTRs/uBi17vx9fXosWQzsj/WGsvtwcL4T8UOiuf68WxZh8kydvwHj9
vX2eO3UYSMW2bT4bJAFePJn/PWNT94n6ExmzmXDrCw0WqwguvRJ2GTcYYQ0DFHW0
r9V9b+0tLXyoOu7GVRxdQHg2H3XvOPZ7qC4o90Y7bbqZ52hPA4RvGmkazQ74YFJm
VsCSnEofyAmVa0Vurh8HCchIfK8axlQBmnzB0h1p6976pkftoPAI5Xnu53JPUNyZ
w0QuWPSV69F/ztS27wM+V3CSD6zKrMgPf3FanpiZ4FwmrLkyg6PHnnpLzOu/yu49
eOzRMnQZIHI9rBewuMThDRM0ywsmZw==
=gvDe
-----END PGP SIGNATURE-----

--Sig_/GTXnt_KHovWjuevm0NSuR6y--

