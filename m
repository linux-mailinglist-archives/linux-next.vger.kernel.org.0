Return-Path: <linux-next+bounces-7423-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE80AFDFC7
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 08:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D4233BE9F6
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 06:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E23C26B085;
	Wed,  9 Jul 2025 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SkyFYlyJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A44156678;
	Wed,  9 Jul 2025 06:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752041108; cv=none; b=CGU134pwfzuJ5t4JTheYs/yfHcyYzqjLh30PWfNwQD5xv4pzgimOAOyK7wq7Q3csYlw3z2eu9HPQ1sIMFe90YGUovDvVme/W9f060LVIZzuXenbxbDwOAuwbrQjnK0traDW98HYigwtLfCcwnOLMLHwT9hiTSiG7seimivceYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752041108; c=relaxed/simple;
	bh=vy/DxLLlBv73YYntcTpcNlvYRslRUHxSeYnYnaMFcuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AQi/AIsglZ2iZHC0MgJQrcPtGd1/ptEzbcdTGJ1kYxQw0KnSoybiR9YkoxKOdyWKgKGvEoCG8HoSn8EOSn3l6Y8xMUrx4TVDiszVXxdksn9Qjj961aH9icpSpG3aARv+WoCQeVKwSHywuNdqrTEkwgVL7moeerGIbWwqMEErPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SkyFYlyJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752041036;
	bh=UtyfWyspUxfYp0JpUE65iqJngGZN/Z3HbFphQvQSFGo=;
	h=Date:From:To:Cc:Subject:From;
	b=SkyFYlyJTjMe+KeKJBktthBTR2smy0NmhPIdWoe6YjXl8dpEZZvkSoH6KRLcnOnLx
	 DIaFNpS9DTcX5x9Ejw8T/8WLVHsmWYelAVU+zD2NJnefYPszEobvY4pqpS/OkV2BfD
	 bywqNWpsxB7a0roioBaGvdrMz7Yy6Mk2p8lUA/+TMg7x1pYdaDHG2RLSNyuMIRaqZp
	 PFIPexwpTaiTdXfa2gDEA9hZfOywm0RQ5PAEZ9EKzDhdQ/hvg3BjoMVi43itMgFuNO
	 0fLpK2wMk6og74e4+Z+5De/ldimQv1dEDHeAaZWKP6Nv2RbcHswcER496/oL4uTfGI
	 1MUswC1jyE37A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcS8q16Hxz4w2H;
	Wed,  9 Jul 2025 16:03:55 +1000 (AEST)
Date: Wed, 9 Jul 2025 16:04:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with Linus' tree
Message-ID: <20250709160456.12aabc8b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aG3Odpe9u=Wvas08u+AMVVI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aG3Odpe9u=Wvas08u+AMVVI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/kvm/vmx/vmx.c

between commit:

  f9af88a3d384 ("x86/bugs: Rename MDS machinery to something more generic")

from Linus' tree and commit:

  83ebe7157483 ("KVM: VMX: Apply MMIO Stale Data mitigation if KVM maps MMI=
O into the guest")

from the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kvm/vmx/vmx.c
index 191a9ed0da22,65949882afa9..000000000000
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@@ -7290,8 -7210,8 +7210,7 @@@ static noinstr void vmx_vcpu_enter_exit
  	if (static_branch_unlikely(&vmx_l1d_should_flush))
  		vmx_l1d_flush(vcpu);
  	else if (static_branch_unlikely(&cpu_buf_vm_clear) &&
- 		 kvm_arch_has_assigned_device(vcpu->kvm))
 -		 (flags & VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO))
 -		mds_clear_cpu_buffers();
 +		x86_clear_cpu_buffers();
 =20
  	vmx_disable_fb_clear(vmx);
 =20

--Sig_/aG3Odpe9u=Wvas08u+AMVVI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhuBogACgkQAVBC80lX
0GyyUwf+PPPRkMkevTL7YlN8qHkrsrO5sb5+g6EL7D63s5antBz19xdelk/bY84b
KUeWkuJhc0ekLacTrHaBlDZ6BD+CNIAxWmu+HsrTiGsPDan6YsmEZuTn5vxw368b
n/VUK9GgxcVZ37xGA5UX0pl+mDh0RIj3KqBmlf8EhUrn5rae5bkiNHyvP2ij97DC
BR86XlZWpsgDizIGnWpxl+3NbJc6lGfFB3u2QYexw6MOdrFK8Nz8jyoBTEH9dC2i
hAD0LuQSZPVU1+tQImle5VAxR5nN//zaCg++A2wKGYaPWoyQe5QMOepAbdFOMg8J
lRhvE9+EYNWblDGHabjvznrqXGtxkA==
=qdFk
-----END PGP SIGNATURE-----

--Sig_/aG3Odpe9u=Wvas08u+AMVVI--

