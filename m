Return-Path: <linux-next+bounces-9129-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DFEC77273
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 434AD35FEB1
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 03:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A962E9729;
	Fri, 21 Nov 2025 03:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Uc6DP64X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439ED2F068E;
	Fri, 21 Nov 2025 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763695255; cv=none; b=YwYq4qmVOHNYZoDJoZWgsjCLwhiErkfIXQOJ398SU1fYKttWjjQHGu9EN61H6xmBYpl+ntZXBVsn9njDSeJcQR+BWvNKVldpWy125Y8b/r9vyeOho6GpT3Y/scU7tox3hJMXeFhZ23LGQsIr9mO03y7YcUFIPRp9SyKgEI3EL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763695255; c=relaxed/simple;
	bh=dDqwLqWLcAz18QZwNl+JfnybJQAz7pAakzzzu24YGKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LhL42kmD5ae73zvxTWhuX7Ed2utAuUrrrc1L4rzgEQIiW3y3Nk3SSmkCsMCwPqB/FMA4TUqJZVzk5YB7QjRnmggAHFJ6NxmTAU8oEnISENStkFHXL6AeB1o75QYv+n7gx37xQrFrtDtbV8VIktY7fkoOBio1uVCQ3ewr06kqCPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Uc6DP64X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763695250;
	bh=GuG6fhcj9wkFf3ws97RLgU2JZBnFC0R3bNuB8+QJFCs=;
	h=Date:From:To:Cc:Subject:From;
	b=Uc6DP64Xq5gRP8zCpxD8faQ8SKWumvs1rI1YokgwtN6uxo8+XiAqlJpQuSOYJ9mxD
	 HjnCVBVFkmeDzUtZURJKe5FPxcNLwpZDwApCPI0T+uCMH87tm6LQ43ZBn2Ko21mhOO
	 QlQfWOSOcCrTqJ9xBwIQGPKcPsd/7oZrFcgYgmuPNJ5aRQk61rGeToVpHh43wxG5wK
	 k6++TecEKZevqaG/C8p5Frp0wARilAmxSFgaU1cwvWf9bcHv00Wa41RK29jki80Q5n
	 DbFILTAjXWX39FgGJ+OU1tGKaoIhFHVLI4Gh9HxdbJ7gimLx6YqF6vmgb0fTD9bvcT
	 eUxRJ6S1TRWIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCL8K2hFTz4w0H;
	Fri, 21 Nov 2025 14:20:49 +1100 (AEDT)
Date: Fri, 21 Nov 2025 14:20:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Christoffer Dall <cdall@cs.columbia.edu>, Marc
 Zyngier <maz@kernel.org>
Cc: Jiaqi Yan <jiaqiyan@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Oliver
 Upton <oupton@kernel.org>
Subject: linux-next: manual merge of the kvms390 tree with the kvm-arm tree
Message-ID: <20251121142048.0078c44c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/inzozAAwQsNzUpzWPqPp.Tq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/inzozAAwQsNzUpzWPqPp.Tq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  ad9c62bd8946 ("KVM: arm64: VM exit to userspace to handle SEA")

from the kvm-arm tree and commit:

  cd18223397ec ("KVM: s390: Add capability that forwards operation exceptio=
ns")

from the kvms390 tree.

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
index 1e541193e98d,8ab07396ce3b..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -972,7 -963,7 +972,8 @@@ struct kvm_enable_cap=20
  #define KVM_CAP_RISCV_MP_STATE_RESET 242
  #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
 -#define KVM_CAP_S390_USER_OPEREXEC 245
 +#define KVM_CAP_ARM_SEA_TO_USER 245
++#define KVM_CAP_S390_USER_OPEREXEC 246
 =20
  struct kvm_irq_routing_irqchip {
  	__u32 irqchip;

--Sig_/inzozAAwQsNzUpzWPqPp.Tq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkf2pAACgkQAVBC80lX
0GzeHgf/QRm58ejmDmHZU9jPn2HIO28PpjIeNwR4NlWdWhLtleacpqBanCi+x1xJ
4HteNyJRr1UEKCjPE1lDz21pip36MB0wHM+v4mA7jFRnq+XY3jSzDxy7/zoYNLf1
5at8wTbpikwmNu/UjQQCiSqGUxHZ3VY3UHfB9xA5KNA9f3Qu5S9BGxBp3Jhi/qv3
RC2U7y9WIGPnPwMKJedD3n60FzyIWHmvip68B9hHMqCe9b6gHfwDdDYdURTb7zXc
ltRnmEmGl1kn5KyU9Sqt/PEC6zxqg3WXZCjCGUSod32xL2DGiBhPA62MfKAoAybS
b6yRIC+Utms5MesUtT4L1Qs3GWt1UQ==
=i21G
-----END PGP SIGNATURE-----

--Sig_/inzozAAwQsNzUpzWPqPp.Tq--

