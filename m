Return-Path: <linux-next+bounces-5955-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C1A6D8EA
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 12:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8B118930C3
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 11:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6425DAFA;
	Mon, 24 Mar 2025 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WaG5Isex"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E425EFAB;
	Mon, 24 Mar 2025 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814395; cv=none; b=TeQeXGMPRnNpowDGuR1OpeUqSM+ctKrSGldYSQGtVUhe3e5gnjCnVBKuV0btZWw0Ogc75G5SFcqTFeJSOLK7ljbQDuCZZXE8l4k6BfEAQLgTKqAimNySr1lenW3AQd8ZrrA+eTFCGxcHhEhAk1w9Ln3YAUhhQbjzbQRqEHIreJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814395; c=relaxed/simple;
	bh=AJaKPNEfK8+vcbZlzVDNFlAvYVFydMBoBukOTMRkdeU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgwbqrFUMLDM7lQ8KR1mrJ+YXXdpEqUSV8wsYF3Uq2YzhHBMom8BwQNDAwIBDH/jQmEaDfr6XXLYflkMAlKXzneCWgzTkYK7KHfstttYMiQdyTcmLU/PCGEcNyDxXTqfZGfeXYMYbmmKAOE9v2/fFldKlUEHUxvBlA7CVogUdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WaG5Isex; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742814390;
	bh=0JI4Ym7vI68n0/W0jZxFNaj+ei/yHnSlaQAfikqusM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WaG5IsexH1MDaUFQFjCU+hvVw/UcXb2nyklMQ/hM8GzU0/6uWoJ8kAT0vcd4gvlxf
	 t5ac+/+nbXpCuYZ2MBKX5ZDVq3HcfVRDlFSYaTX/4b4du39ZyEJlM3octS7XVDhafy
	 mTeoemMtQQv/7c5xp/XjceyJZhu1nxrg5u1HgbGEthRdj7miLrFJITrMSRXrYsMFUD
	 EXU0WmKfg9P+ULgIurV6y7pM7UMI6z9BXZ8AwjTksaASVr9d9t9/lgdBwH+YKFTSf5
	 vywUYQKOErr3n08NGWnpVlSgc/qYOI9qRWbmEnnQ97dUdSxHxaX+W5RGXM7mvBMT0X
	 RnmoyM7s9dpMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLqxL0h8mz4x0s;
	Mon, 24 Mar 2025 22:06:30 +1100 (AEDT)
Date: Mon, 24 Mar 2025 22:06:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Danilo Krummrich
 <dakr@kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20250324220629.1665236b@canb.auug.org.au>
In-Reply-To: <20250324215702.1515ba92@canb.auug.org.au>
References: <20250324215702.1515ba92@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gPEUir/XdEBFjsCj8z+Xt9h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gPEUir/XdEBFjsCj8z+Xt9h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Mar 2025 21:57:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the rust tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> error[E0277]: `*mut MyStruct` cannot be sent between threads safely
>   --> samples/rust/rust_dma.rs:47:22 =20
>    |
> 47 | impl pci::Driver for DmaSampleDriver {
>    |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent =
between threads safely
>    |
>    =3D help: within `DmaSampleDriver`, the trait `Send` is not implemente=
d for `*mut MyStruct`, which is required by `DmaSampleDriver: Send`
> note: required because it appears within the type `CoherentAllocation<MyS=
truct>`
>   --> rust/kernel/dma.rs:132:12 =20
> note: required because it appears within the type `DmaSampleDriver`
>   --> samples/rust/rust_dma.rs:9:8 =20
>    |
> 9  | struct DmaSampleDriver {
>    |        ^^^^^^^^^^^^^^^
> note: required by a bound in `kernel::pci::Driver`
>   --> rust/kernel/pci.rs:225:1 =20
>=20
> error: aborting due to 1 previous error
>=20
> For more information about this error, try `rustc --explain E0277`.
>=20
> I have no idea what caused this - it built in next-20250321, but that
> no longer builds, so I have reset to the version of the rust tree in
> next-20250320 (commit 4a47eec07be6).

Actually, the driver-core tree gained these commits over the weekend:

  51d0de7596a4 ("rust: platform: require Send for Driver trait implementers=
")
  935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
  455943aa187f ("rust: platform: impl Send + Sync for platform::Device")
  e2942bb4e629 ("rust: pci: impl Send + Sync for pci::Device")

A heads up would have been nice ... and maybe even a test merge and
build against -next (given how late we are in the cycle).
--=20
Cheers,
Stephen Rothwell

--Sig_/gPEUir/XdEBFjsCj8z+Xt9h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfhPLUACgkQAVBC80lX
0GxfxggApZMatWGfB8ptEpZX0ZCycuBcB087oVx6vbjK4S6qXAF4eHM8grEz+N9b
+wiz/mUMJtak3XgqTjETVxI//2JEOujOBRUameDHuEMBKz12vYZNDmfVtZO0xfv3
B6AvnDB9aj1T25TFhA3qttMsx82VEtM7q/miABclhPLzc3fAUYHReOOW/vhHuqHw
F5Tyh6HHMKKlfxgTPpEV24BpxTCfjm11nTxROH+VbYKvuHfYEObM7mdNXcv2jD+k
1g8a1jcVoH7sGnefaOPhSjMzE+5QEXAVT6hHV/szrk2JqqF1PqKUPdSUj2OkukUY
CxIktVNWjRHP+KhOj3f4juhEdNQ1fQ==
=C9+C
-----END PGP SIGNATURE-----

--Sig_/gPEUir/XdEBFjsCj8z+Xt9h--

