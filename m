Return-Path: <linux-next+bounces-8809-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C499EC2F505
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 05:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92D563B689F
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 04:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F344286D7E;
	Tue,  4 Nov 2025 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jqf3sc9V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F8728751A;
	Tue,  4 Nov 2025 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762231510; cv=none; b=r99/G4Y98bMgnoDsIfRlR0uz6d703+8kFIe2kvk7YLryyS9TqFmNC/6LEa5p8z5sr0GGw6/oOxwZ0XcLVUUGTI0v/C6xzDXBEbzLvhzjMH1ncD08ociku7yoICHsGD86IsJRrkd33ZGMDeIHE9/OFoXav3Qi7+w0Q1TfKLXT+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762231510; c=relaxed/simple;
	bh=ebwWvvaQIPOyWWfI6CAJXMVLP9pnTLRNHP/uCLQqX+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qO3We81EywAxxZBDVIp1hM1UljUn+Zibe3fU1JYGefrSW/+24mwVR1lBst1xQY1XLFiVbd7ftiB2QgrmJlVAKsCFkIAiDn36QnhYQIm9U0R/dRexVdi8JmFg3fl01Uv/2ub0JiwF8bT+eX6e8kXHGkgGxnGfXBxANW+IUZTojOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jqf3sc9V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762231502;
	bh=Yd8C21YWf8FE+uxSKbDQ4YBCZqNUCGqERnh2RIw67gU=;
	h=Date:From:To:Cc:Subject:From;
	b=jqf3sc9V6gbDpzdPiGo7h8pHOYT6kY8g0NbpopkWBL4aa5BjFl/OKKzUkVKe8fND+
	 1HZoyeg/anV3Q3OZl5zs8lqhco0jxlUtKrcTNHKOCZvHTMIeawT+V9/vAeeAwSNu7w
	 gF1VbMABhw1oD1iWr3LBctrqUqagQ66c3RUUia8HFodA4TwmuBoECY5TuaomHFV2/2
	 qtD79YB+OTDlkQmuCeUPdbUyzs1q3tI5V3kyeN/P16P296qFSPDxJ4Jfvg+8oxceF5
	 lsKqFrvct1W4gCzu3U6dXbMXtW0EJvixBVUP6goGrEvHfbs1cyeAQJOJ9KIFavm63R
	 vMOxhPNLLbtbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0wqL1zb6z4w23;
	Tue, 04 Nov 2025 15:45:02 +1100 (AEDT)
Date: Tue, 4 Nov 2025 15:45:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the modules tree
Message-ID: <20251104154500.5acb5340@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F/SflklNBMBjTT4qeomxxpr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F/SflklNBMBjTT4qeomxxpr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the modules tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0308]: mismatched types
  --> rust/kernel/module_param.rs:75:47
   |
75 |         let new_value =3D T::try_from_param_arg(arg)?;
   |                         --------------------- ^^^ expected `&BStr`, fo=
und `&CStr`
   |                         |
   |                         arguments to this function are incorrect
   |
   =3D note: expected reference `&BStr`
              found reference `&ffi::CStr`
note: associated function defined here
  --> rust/kernel/module_param.rs:32:8
   |
32 |     fn try_from_param_arg(arg: &BStr) -> Result<Self>;
   |        ^^^^^^^^^^^^^^^^^^

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.

Caused by commit

  0b08fc292842 ("rust: introduce module_param module")

This is some interaction with something later in linux-next - presumably
commit

  3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")

from the rust tree.

Hopefully someone can provide a resolution for me tomorrow.

I have used the modules tree from next-20251103 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/F/SflklNBMBjTT4qeomxxpr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkJhMwACgkQAVBC80lX
0GwDCQf/a3QuHcEzXdaRrkxbW90cKH0/aOOxuvQ3I2FkGB5XJSgvmurx025gr1eV
HlQ1ID0yuKzqAkuMS8r+10l8l8NMPyI1wRFoI9NwGupTo32PD7Aio1lkevG4tLNI
DE+tDmJhOHcqmISLqmAbfLxFYH1Qy0YpRwx9S6KExyBFrZMrUZZ9krwU7onfrhUX
hxODJABBQ3KWdsBrdMm045ep57+Z6DFSzZe2oGDHdUBvgoaNEdOR0iRJeh6rxsP1
fadUVRVykarBIIK5+pfunmu08VpxRoQoj3URKRr/rv3VCV6RgXhgigdu2+AIyi08
GjPL3694mCZt7EIjYDUBc7LjG/MXQQ==
=CW5Y
-----END PGP SIGNATURE-----

--Sig_/F/SflklNBMBjTT4qeomxxpr--

