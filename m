Return-Path: <linux-next+bounces-6459-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385BAA4835
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D24979A45ED
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D652238171;
	Wed, 30 Apr 2025 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Reb2KxWu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17DE236421;
	Wed, 30 Apr 2025 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008606; cv=none; b=daHdtdugBtFf2WEsh8SJHQdO79PrUc1ieSiVRMSNsMmg6QkFnyZZ/P6h9yLVH9xKPJpIn+hvyx+m2jYX1HOW/wm10dVQ33Oa74VYiHlZHs0DBKmy/HjYQ69SMXvVITFv78ZHQxuruYXapwmu8K9qz0GKncUJW5gB5qCtzrDyrs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008606; c=relaxed/simple;
	bh=PsytrW+F6fSslmgb1vPq1uiqbaYDXv5fielxCore7sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GhOhO+97MQoJOgaQKs2j5ynQHdH7BwFmkWb27fnV6nIm22/VBGUQl0mauB2JzpLjpFLjbNa6CjU+fYvNSr7UJHZX3tP2N5fo8X/gd7JL7gPBRmSj1+JC9M4u/KtK2Bkr/c8IMvQJS/WY06uO5t+5cQf7V1Ina6ueU0RNVs5QHTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Reb2KxWu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746008597;
	bh=mOg+Eer5yYuAGIadjScLyl+ZuswDytsi2ugLrmc9rmQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Reb2KxWuR+E/qw5SJGQ3XJpurNgPKti21gDgphos6hGQPlf1rMl0Rx/6SLS6EYOcB
	 NfeU9C+dEDV8NmdD3QhuPVh1hs4T20IfbRLWhv06AII2Ab5zcU2e0wta6fCQlHv4lk
	 YFKzQf3nalAOz0QaGOD81sqQd+NJHZ0uxA4DWhPIl+fk+yq0JVQxucDGQ/XOSIKAqd
	 bQBAGP6sUrxhiq6DPrT2y36OmmSpCOWHiofgV9sPKpTuY+5ei1Lnh+FJxxhKagt4xM
	 WVOlry1p8HmBf+AgM8clrN5MLfc4Lhg4+dlDWgubtf1WI988/Wbqb1F6nGdcvig3W3
	 71HqD0RSAqAIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnYDP60lCz4wnp;
	Wed, 30 Apr 2025 20:23:16 +1000 (AEST)
Date: Wed, 30 Apr 2025 20:23:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250430202315.62bb1c1b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h.XGZ+vmVX..EC58ryu1YHc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h.XGZ+vmVX..EC58ryu1YHc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust-xarray tree, today's linux-next build (x86_64
allmodconfig) failed like this:

rror[E0308]: mismatched types
   --> rust/kernel/cpufreq.rs:633:37
    |
633 |             Some(unsafe { T::borrow(self.as_ref().driver_data) })
    |                           --------- ^^^^^^^^^^^^^^^^^^^^^^^^^ expecte=
d `*mut <... as ForeignOwnable>::PointedTo`, found `*mut c_void`
    |                           |
    |                           arguments to this function are incorrect
    |
    =3D note: expected raw pointer `*mut <T as ForeignOwnable>::PointedTo`
               found raw pointer `*mut c_void`
note: associated function defined here
   --> rust/kernel/types.rs:98:15
    |
98  |     unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> Self::Borrowed=
<'a>;
    |               ^^^^^^
help: consider constraining the associated type `<T as ForeignOwnable>::Poi=
ntedTo` to `c_void`
    |
628 |     pub fn data<T: ForeignOwnable<PointedTo =3D c_void>>(&mut self) -=
> Option<<T>::Borrowed<'_>> {
    |                                  ++++++++++++++++++++

error[E0308]: mismatched types
   --> rust/kernel/cpufreq.rs:660:62
    |
660 |                 unsafe { <T as ForeignOwnable>::from_foreign(self.as_=
ref().driver_data) },
    |                          ----------------------------------- ^^^^^^^^=
^^^^^^^^^^^^^^^^^ expected `*mut <... as ForeignOwnable>::PointedTo`, found=
 `*mut c_void`
    |                          |
    |                          arguments to this function are incorrect
    |
    =3D note: expected raw pointer `*mut <T as ForeignOwnable>::PointedTo`
               found raw pointer `*mut c_void`
note: associated function defined here
   --> rust/kernel/types.rs:63:15
    |
63  |     unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self;
    |               ^^^^^^^^^^^^
help: consider constraining the associated type `<T as ForeignOwnable>::Poi=
ntedTo` to `c_void`
    |
653 |     fn clear_data<T: ForeignOwnable<PointedTo =3D c_void>>(&mut self)=
 -> Option<T> {
    |                                    ++++++++++++++++++++

error: aborting due to 2 previous errors

For more information about this error, try `rustc --explain E0308`.

Caused by commit

  a68f46e83747 ("rust: types: add `ForeignOwnable::PointedTo`")

interacting with commit

  254df142ab42 ("rust: cpufreq: Add initial abstractions for cpufreq framew=
ork")

from the cpufreq-arm tree.

I don't know how to fix this up, so I have dropped the rust-xarray tree
for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/h.XGZ+vmVX..EC58ryu1YHc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgR+hMACgkQAVBC80lX
0GySRAf/WW7rzTeHA3l0ZAB5B1EQrNsW2tSajnni4V8fSJjxEkabNXSLMeav92cP
gbW72/VJPXipxV+6QvCdvJiIGje3PIYuI8oqI6CeofVKr19pF3U6WXUwr5rp8ibK
UwX4FbFDwYmLFYld6RAJsZdh9jnNPSpjmxOnjiHyZtUJhjqsY6aSkXhCXIEItoct
vRredz7CpFlViN0BsUU6FlKKJshxROwtstf/UFu3oYfFT4rdiMHRslnyeIEvmvp/
lsBpj7VLn+zXOCKd6VfUB6MliKRvGANinD/7ngBv/+f5XQmvkt7tUh6N9T/GPW+T
13GVxKkKcSaHFLHsd+keEqspyXTkwg==
=cGNP
-----END PGP SIGNATURE-----

--Sig_/h.XGZ+vmVX..EC58ryu1YHc--

