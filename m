Return-Path: <linux-next+bounces-7322-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09679AF6B1F
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 09:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A094E45F7
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 07:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F96295528;
	Thu,  3 Jul 2025 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sfptmzrc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5BA6AA7;
	Thu,  3 Jul 2025 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526632; cv=none; b=IVg++JTrLTOwlFtrUcz6SeRmBQ7Q11DgJGo9Ll45z+nucJ28M2ZvpM6nRc6jfeCkcqxF6AOE205Olurg1PzGcKDQLmvP+YUZZ7raZNHIOmV7u6F5as7Ln8/i6ZL5Lkdf3QdsRtB4jRhyXLQJGMwddhHZe9716kmYchiNFbYmH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526632; c=relaxed/simple;
	bh=wEvSWZ7JzGMu8CHv0gVajuf+bhWIc4Vi10R59vRcnxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s7TPDzIMM8nHG5BCYTEEzG+QUkSIKto5jnkm+QfoVE0EbyTxJhyH7yp+Z/Jtg8DTIUNxw+uOArmzQCygCiIGHF0IGkPkYaBDPKSrBPkq3BTC4oLOHz22NMlSVnf0BjUSyT7JmPOb9Ghi3xpU87d6fFXqFGEmhXPuBBinkmtTlnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sfptmzrc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751526603;
	bh=29BaWEnnxhvgKvXxEIkvRDdXYqd3nlHanBa1Fx/1ZvU=;
	h=Date:From:To:Cc:Subject:From;
	b=sfptmzrcLb0gBs9vqlcts8HbtkxdAz9qLPwiKNnfIXp0eINwMwNDjGO4bGRACp3qh
	 PAnFu0b+Du5mvr+YxK3odsEZAP2OytnWUE18QiEXNXs0IdvZmw1U9RjsZ2gbR+p8og
	 CV1rlagcgVlrDJCINKkm4cziw0xgSQH1vQg6QP20NHLd3ZRbaAjSXM4UkysNKGak7s
	 FBd80m2a4h1gWH0cxIob5lhqWuunyvsWJtSC0mgWkkScDmm0yhXjhiSbtdiWL5ulaF
	 m094xNtiVv+QyIIRTMx9Mcaq91z4Sta0DBCtqCVM4o/9GQ6FacBXUNnC+YCHmHfdBs
	 oQQk5smeOmjvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXnvr3gP0z4wbX;
	Thu,  3 Jul 2025 17:10:00 +1000 (AEST)
Date: Thu, 3 Jul 2025 17:10:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lizhi Xu
 <lizhi.xu@windriver.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <20250703171021.0aee1482@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/71H9A/CjLxqDomEHXUxuwYG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/71H9A/CjLxqDomEHXUxuwYG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/string.h:392,
                 from include/linux/bitmap.h:13,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/paravirt.h:21,
                 from arch/x86/include/asm/irqflags.h:102,
                 from include/linux/irqflags.h:18,
                 from include/linux/spinlock.h:59,
                 from include/linux/wait.h:9,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:7,
                 from include/linux/highmem.h:5,
                 from drivers/misc/vmw_vmci/vmci_context.c:10:
In function 'fortify_memset_chk',
    inlined from 'ctx_fire_notification.isra' at drivers/misc/vmw_vmci/vmci=
_context.c:254:3:
include/linux/fortify-string.h:480:25: error: call to '__write_overflow_fie=
ld' declared with attribute warning: detected write beyond size of field (1=
st parameter); maybe use struct_group()? [-Werror=3Dattribute-warning]
  480 |                         __write_overflow_field(p_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  bfb4cf9fb97e ("vmci: Prevent the dispatching of uninitialized payloads")

I have used the char-misc tree from next-20250702 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/71H9A/CjLxqDomEHXUxuwYG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhmLN0ACgkQAVBC80lX
0GwgZwgAh5gmEHbXMtRGa6eihN9LHWxtJBnX197tnv3XNC2CEO9cYCXEOZZvTS9F
beaA2EERoYWGhzNzjiUf6lDoIwydkVdGv1+8UuBp/zS3lAnx5d/w8UoGdcb4geiu
WPqKVcdTOlnmOtapajRsBbWSf+J3vPpVR7nmkLX96XHH7u5vQqvLX9/2uCwYyi+k
3tdT8FptKtSWXv/Z44fDfQR9b0ekjz/QnmhvuXttJFk9YopEqBitzPoTvTAu2/cS
Fzc5biZQGMxUSlinBg8QsdbHwdbMUCUm5BPOSwwArWBB8/6xENVamV61KRgpGPY8
Jyobo25gRs2KNAE+5fUMxWQFzSk2nw==
=bKPw
-----END PGP SIGNATURE-----

--Sig_/71H9A/CjLxqDomEHXUxuwYG--

