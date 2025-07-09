Return-Path: <linux-next+bounces-7424-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC6AFE100
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 09:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5539176058
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 07:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD6626E175;
	Wed,  9 Jul 2025 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="phCH0oY7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153BB26CE3F;
	Wed,  9 Jul 2025 07:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045086; cv=none; b=W2FrnOAlS4nMecltqaEu7YaJbvUmeHmIyHBpPBNft3UId2ENEo02OO4gDNAhL/MjiYr4BqXll6jXSxAcnqxzooaPltBmCJr4W7Lnhxi0Smn1KxGhu424fwwRVChQcNq5NF27YrKfoyM9jHBWbc7OYVUFulUy7ExVn73hRHiMlwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045086; c=relaxed/simple;
	bh=Zg2yqmIawAcjnUxWeIFtD+iLiMBKl+ttmTor+a9wJDE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URFlalwX+FFhPBChik4g99AwtHURdjgGGgkXn2opANCAAZMO1Rq5U65+glZ1TL406ZiRWusMFIvepmbrMJ9SzUJno+oZrQWeKxzQQNybWt9ZISD5ZQX13EB1MNRi/xaTuSe8TMQt1H93hVJ9D4yZmslMqQBkv+34ZnKmMVeSOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=phCH0oY7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752045011;
	bh=rIjr5BfAbU/6+iVf8dDKK9BX4rSnCeVITcK5Ap37SY0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=phCH0oY7h/aDf3AnUoQ+FvjShix8v0suvoCTPX0E/kDUFHT0jzscWD4LOVsRBNIm4
	 RPUIyUDpDMRB/4C6EsG2j9b7w1SU0gjluBFx9E5vjbERV+ylEwsgMWl28v6Mz1C/aO
	 +ssqKw9FzDBxvoMDzaJLEto8/fAYA0AbQLKIkZ+7eYgmCmXX3K1Kqjt8fqbbNYCE4L
	 vJqkBW3iyE9eY8r5tcLj4q2780xRmTFrR/ugCxCDJiUUKnbf39R+VDI26JLItooJkL
	 1i86zQEzNVhrhoTqBsQj8H8vxayPKPxxcg3EtLuDiWNgyqUySfk3wRTJ50gxduNmYi
	 o89Pkggt+i/+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcTdH5f3Mz4wb0;
	Wed,  9 Jul 2025 17:10:11 +1000 (AEST)
Date: Wed, 9 Jul 2025 17:11:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with Linus' tree
Message-ID: <20250709171115.7556c98c@canb.auug.org.au>
In-Reply-To: <20250709160456.12aabc8b@canb.auug.org.au>
References: <20250709160456.12aabc8b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/stMZzDaa9fPajp_8DWqLJ9o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/stMZzDaa9fPajp_8DWqLJ9o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 9 Jul 2025 16:04:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
>=20
>   arch/x86/kvm/vmx/vmx.c
>=20
> between commit:
>=20
>   f9af88a3d384 ("x86/bugs: Rename MDS machinery to something more generic=
")
>=20
> from Linus' tree and commit:
>=20
>   83ebe7157483 ("KVM: VMX: Apply MMIO Stale Data mitigation if KVM maps M=
MIO into the guest")
>=20
> from the kvm-x86 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Actually, the resolution is below.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kvm/vmx/vmx.c
index 191a9ed0da22,65949882afa9..47019c9af671
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@@ -7290,8 -7210,8 +7210,8 @@@ static noinstr void vmx_vcpu_enter_exit
  	if (static_branch_unlikely(&vmx_l1d_should_flush))
  		vmx_l1d_flush(vcpu);
  	else if (static_branch_unlikely(&cpu_buf_vm_clear) &&
- 		 kvm_arch_has_assigned_device(vcpu->kvm))
+ 		 (flags & VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO))
 -		mds_clear_cpu_buffers();
 +		x86_clear_cpu_buffers();
 =20
  	vmx_disable_fb_clear(vmx);
 =20

--Sig_/stMZzDaa9fPajp_8DWqLJ9o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhuFhMACgkQAVBC80lX
0Gy6mAf/ZObl47K40W/UD9AP4MjdwrmrE2mz8balXdSNazAU7aZD+1GLU/XgjABX
hmgdXaJ5MRbAzC89OrUOiwhIKqC0QJQnDSTUNIP1jkDdv+BqJ2fBY2GolnBa3jLJ
S4buNQM2R84/6XJfc71BLUmBjvC05I0WkVLAu32p1ELMvI9VFCUxhF49YTzlWmC/
tx3Cj0jKdgFI2aHXqHw/+q5GhI5tyZZ66GSbAC4ncYv52IQ0sENct4oo4UZhC0tZ
Q9ipMnSREjIj4oG0uT16ySRlival1S0d8qFqnL6MetaPHM4yre6Dg1S+a4asYbXN
g36gzzWU1fqoEMu2ZdM4EnfMOQC+dg==
=paZS
-----END PGP SIGNATURE-----

--Sig_/stMZzDaa9fPajp_8DWqLJ9o--

