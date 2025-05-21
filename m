Return-Path: <linux-next+bounces-6876-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D91ABEC73
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 08:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ACA84E2DA6
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 06:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F4323496F;
	Wed, 21 May 2025 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FNtyNu/g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC222F169;
	Wed, 21 May 2025 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810104; cv=none; b=csUqr7PGJACJXrGSdTHMQaSo4NO58KjNYBZ/eUEkMp7GjETNS3GSrI5QWk+2EraAf9oEky6ZLKTi05ubChb1WPgvYrFx0t91Cl/tK9SF7grqDTICWi4xuiSOBm/0DqmTsq89WmKYp3OL96S8Zst4axGIYi5b0BBMhO+ecMfLAM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810104; c=relaxed/simple;
	bh=I6xLSaFBQIId3MObCRNMgHxI1jqvUum8SVBf6dSTczs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pb9Ld5rCHbODBBxkMBaPFeiYMHHsRcYS6U2Wt68IObRaedXkcX6TYP+VhieXMHgYrjBGnsvkfNGYWKB4VewUdliGCLVIVU7lh0QLLZPXIZPfiFIxusfyNvwfzygvLsYdJZd8SMpGSDSvwyLeWnCRNCImDOd6K8hjsBUgQUNhGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FNtyNu/g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747810096;
	bh=KcYnKHf3wC05iJ0U5CbH9mfNcFKPffOomDQHqODaKBA=;
	h=Date:From:To:Cc:Subject:From;
	b=FNtyNu/g18YjzqfAEBMCGPKSadTvWAhI/UQ+EElRAXPkM6vU7DSE/pAnpAunNjg2Y
	 GdnRHRl7e4NAINGZI+Tdf11R5N8n98dMRdxjeAHdg+Bbt5lAJTcxCnpHyXo3xk0YTw
	 uQI56v84jTeb11grhYJQp17cKLNwvnf0EgSIvOi+Jmuf0R6/GwkOWLJvGs0bRpajPk
	 SweOrGsavMBznW87rfUsOlOXpWwb8ev8xoA0AH9KzFBrz+IWUxfEXthC4LZZoG3Oyh
	 aGfrdhbdAJi9uEd0npn3M33yYzXmUE0/LyLAumH9EbDR9SXDYx9LoU8kfYlO2XYg4K
	 cvXi3uqQRTnPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2MSb6DcGz4xck;
	Wed, 21 May 2025 16:48:15 +1000 (AEST)
Date: Wed, 21 May 2025 16:48:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anup Patel <anup@brainfault.org>, Christoffer Dall
 <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Radim =?UTF-8?B?S3LEjW3DocWZ?=
 <rkrcmar@ventanamicro.com>
Subject: linux-next: manual merge of the kvm-riscv tree with the kvm-arm
 tree
Message-ID: <20250521164814.3fddb821@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oyjzgwhEdqI0nbDxuIbcnjE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oyjzgwhEdqI0nbDxuIbcnjE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-riscv tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  a7484c80e5ca ("KVM: arm64: Allow userspace to request KVM_ARM_VCPU_EL2*")

from the kvm-arm tree and commit:

  5b9db9c16f42 ("RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET")

from the kvm-riscv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/kvm.h
index e6ed559d9091,454b7d4a0448..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -931,8 -930,7 +931,9 @@@ struct kvm_enable_cap=20
  #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
  #define KVM_CAP_X86_GUEST_MODE 238
  #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
 -#define KVM_CAP_RISCV_MP_STATE_RESET 240
 +#define KVM_CAP_ARM_EL2 240
 +#define KVM_CAP_ARM_EL2_E2H0 241
++#define KVM_CAP_RISCV_MP_STATE_RESET 242
 =20
  struct kvm_irq_routing_irqchip {
  	__u32 irqchip;

--Sig_/oyjzgwhEdqI0nbDxuIbcnjE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtdy4ACgkQAVBC80lX
0GyoKAf+I862MD67KZ6UCXiVNKahuKuKJ5yyIV15ir1ssuB/0Z+tKxNltgJe65/0
8r+BL3AjEOCIREIWd9GnEmvd/Sr1xk6R70qNmMddFzxlElfrRN3I4JKE7NM8ooU1
aMMgqcgINBifx2VMsGKaQBpzMRSKkuMQe8SeAZ4ysQH0piS488vZlffRS/KcfXVq
9AaBiOlh2tLtUVbNLSomfs2l+Iq6LAt2tQOVFjeimopgVww9aTH5EvFgUD8E5fGH
If74AD1hC1OfYbEdqwgu4dPYq1i/cT35a+vNeohDxkWHKJ6WWHPudyOachRakVXa
RN3QvjLnysJapHzKy8WsV22Os6VufA==
=I7y7
-----END PGP SIGNATURE-----

--Sig_/oyjzgwhEdqI0nbDxuIbcnjE--

