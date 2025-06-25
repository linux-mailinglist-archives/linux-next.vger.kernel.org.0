Return-Path: <linux-next+bounces-7242-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE1AE74DA
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 04:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3453416C7D9
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 02:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C191B4231;
	Wed, 25 Jun 2025 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZjkjhPib"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84D2AC17;
	Wed, 25 Jun 2025 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818971; cv=none; b=M4mft9rJvGjVT5WhqVGE6+2UIjrdzwb3yq95c33gjthn49oWx1DqD94CmbSsYDI3jCYgTlYpgORljIM9KyCcOQ7aCTQGzDCsTjTMxvv3ThcVKkLQGqwsLoCd/USer9XXYbgLAWC68LFEZe1E8DuJRU7tkQfTbXhafikqM4jdDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818971; c=relaxed/simple;
	bh=D3LI/y22HPR+I4y1Xvnk9DS2gheD6v5BH9wUoUzQgb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XPaAXISQYqwlk3PP1BFqHekFAfdT0Xm3WFscZmXZym8u3LXCtfh0U752jQC7nrMiRk+KhlVpIVNN0kNkXWt8FWyogtwlB19D3jcZHNJFF2AnFOGuIkhsX5eUXCVg3E+GjeiyUqkCFbuRQ3HeI84LEQhHjF41zWeIIJAOdNl4izE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZjkjhPib; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750818961;
	bh=Ufvczur4hkzVwvbzrx8fjP8ukBEKxb06Iwykkly2bgA=;
	h=Date:From:To:Cc:Subject:From;
	b=ZjkjhPibbbx/dgg4qT+wpDULjqh6JVeAHcRy1CVq3CRxuY4JQy0GaPfkj9/buKfLg
	 bTEdaBhK1R5G2Vji5lWXMANq1rILz6ure72QWVSsMCWInfl6sJGqJ8SNLGmY6h4shB
	 FClNQj2exgg40Fd45uWC2tVvh5/hlGWPCL99ZMeKcwh34nW3VjnPT2bwQslmRrrQPi
	 d1RNwJx+R+yVPcOy0VKDFcz5gIyIu12RGzR1dM/vvSZ2awbMPcPZLmP12ZkvjG8GiT
	 Cv3jJnZyuzcw6czF/47MxWPY84wW1I2XJ0r1K4odfILlWWzrglc/7klQT7MnC2WeYE
	 Gmd6Fl9xcHM0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRmCN4zHXz4wj2;
	Wed, 25 Jun 2025 12:36:00 +1000 (AEST)
Date: Wed, 25 Jun 2025 12:35:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the selinux tree
Message-ID: <20250625123559.1c5f4fdd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JcKMA3bD1aJFwSUrf=o1yHb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JcKMA3bD1aJFwSUrf=o1yHb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs tree as a different commit
(but the same patch):

  ee79ba39b3d6 ("selinux: don't bother with selinuxfs_info_free() on failur=
es")

This is commit

  7e7cf464ce53 ("selinuxfs_fill_super(): don't bother with selinuxfs_info_f=
ree() on failures")

in the vfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JcKMA3bD1aJFwSUrf=o1yHb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhbYJAACgkQAVBC80lX
0Gxk1Qf/UDbOulblK3WE1DQ5oMhTnfyFfpOBedtxyob9sVyk3VmzIQa+9vyb7GXi
z7zrjQ5gr3roZGz+FIcy6TJaA/fIlDqCaILehNjrkfGVJygzaQsWbll84BAly3YB
gyu1SHMKxyeMHxqeOwqj0xP4rh+eE3d/DLNo3j7ykVc3c6DesxK8nA6ltkOejG1Q
emtC+xNRc1AUCTxkXmldxFG1RvmOhL2raMnCD2jzJtpUyOXOoInfTgj6RRoAkgbK
b9soVshZ+o32r0K43CJA9zpvAMzR8gJoqLznqsEvO8rm490aCOb9oi0d0UHm7RmL
38uDvmXF9qEFUWBThc1JmFzQPKnaOA==
=OERK
-----END PGP SIGNATURE-----

--Sig_/JcKMA3bD1aJFwSUrf=o1yHb--

