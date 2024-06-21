Return-Path: <linux-next+bounces-2628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1C6912C60
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 19:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1487A283318
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 17:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2661D1607A1;
	Fri, 21 Jun 2024 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UC0EotE8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F193015D1;
	Fri, 21 Jun 2024 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718990485; cv=none; b=CTdWkeHxd/J9pPFCuw/bMO0DxVoIrK3wwNm+0UqayxA17vBVqK1gIoETihcct9Bp8L0qXiyXDdQito+zOHI8pm/OK37wLvzkbDJCPQaRRA9ol4Pla5oUMfJpwM9PVLwBK27eZFT0i+ZkXMVOKEQBEq6kgipPzxzuaQxmj+7raJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718990485; c=relaxed/simple;
	bh=gHG1QdUJNeFc3vcLi2Zi9Sh5x+SNXv0tH2HEkixWrnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBn4BnYbIQvZhysYLDDvZgoysej+fxEPB+3OkKo3RU6+3yYbe9KSRdK0pryUpICv/UV/M7CXxX4VGdarFU4qE5b/40/6pVt52THuzmWYn5y3ZLU2xn4w7j5NeYfbu61Ra+Xxlp3f581hAGpiVMEhSEwaa9AK/Ob2FEFMsMfWoRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UC0EotE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED23C2BBFC;
	Fri, 21 Jun 2024 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718990484;
	bh=gHG1QdUJNeFc3vcLi2Zi9Sh5x+SNXv0tH2HEkixWrnE=;
	h=Date:From:To:Cc:Subject:From;
	b=UC0EotE8rvPIrAnMCcOPUjj0whhdYdm+vevKBQRs0tTY/ABRKQ0LN9vk+z86nR3a/
	 YJuO0hYKrQsftcYluyN3ZSpm1oNbfNni1r/r/qr7hpVBBTPS6zMBtp+4s+fjP1a/rM
	 C1qBXmF/ejq9PsPS8pdBJcdU7qjRghMHm9cGLGMR3sexDnxgcrpheV9onayAF/fmFM
	 PK4nEvFqRNXw7E6EYRynkFRxZ3zNLkvov6ckw0KLXJXuiGshMp0wYu0YqYvkiyy7an
	 HXm5ADtSmbKfPUVuyouiI2HHClcsJtyjocRUzNzV/M+Ff+xV1IoeaH4oKeeT1a4w33
	 Qu+vewO9OV6kg==
Date: Fri, 21 Jun 2024 18:21:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wei Wang <wei.w.wang@intel.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the origin tree
Message-ID: <ZnW2kD1V0EoViS7i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i8rhaj9TblMjFHzw"
Content-Disposition: inline


--i8rhaj9TblMjFHzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/kvm/x86.c

between commit:

  f3ced000a2df5 ("KVM: x86: Always sync PIR to IRR prior to scanning I/O AP=
IC routes")

=66rom the origin tree and commit:

  aebed32e4985a ("KVM: x86: Introduce kvm_x86_call() to simplify static cal=
ls of kvm_x86_ops")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/kvm/x86.c
index ba0ad76f53bcc,c13bae3e8dfbc..0000000000000
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c

--i8rhaj9TblMjFHzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1to8ACgkQJNaLcl1U
h9Ak0Qf/dCGp2SGgmtyZpWIjgTQsHgHTDABWmflXw5r/HspNpxXS5s8wMfx6D6vH
P8OeR5CxKciLKLVsOihSBgCIt2CPDM1q84x0gjWIZ2JL4VYitisCTJpZ3BoWQKwV
E/y3rw7wNxTjs184Z5RsLK45+5CgENmkCV8do18Ss5tB5fHkrUEP8tLZkwME8ap8
TPJkJly8mIl/Uf9zSUm1X5XYjW+A9XQIYbyRvYnkEeaIJshRX10zg5GaSvcRh2wo
8Qtv24p7NNg43j8qKYVDKQ3/An4ZAtecJCWIUgSBhNhYoLsNTEVZoKzZOaJYM4Mt
2ZQzVR2JZ5h4VaLdY6ti2uHR9vsqjw==
=G2in
-----END PGP SIGNATURE-----

--i8rhaj9TblMjFHzw--

