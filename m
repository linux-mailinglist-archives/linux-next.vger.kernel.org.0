Return-Path: <linux-next+bounces-5448-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74786A357AE
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 08:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C2EE16CA59
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 07:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA0F2066D8;
	Fri, 14 Feb 2025 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sLuszH+g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11115205AA5;
	Fri, 14 Feb 2025 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739517251; cv=none; b=ALwihTF2fKCrX44LFnFzgjGK5Sy2fpZEigtDdmC4ptyx9XacgLWCQIQu/nJms1hhwHo6U8YhyQRGIST0s05iY0nSgDhJFIpY5+qpM43Yh0yP9gEW4/45fJwK1vDRri5+UvMKphFTmbSvRr8ASqptLC1G3XseXE9ZKij3bq8CKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739517251; c=relaxed/simple;
	bh=sAVjeczpwPYkF99dtcnEkeQKq1wRZz4Vc5w1TE1+rZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o20nnE8XRpYCa3r65YZftDbdzY5vI3lN5P1TS+KjR50EWPrQuWAZvQmCkn86NfWxTZX/IP2GSv3xW4qKii4JsHcrxHzwluNTijvCbbh9gyqw9GurHoiMeBkt4G1RYhQPNRa/oa3TjcahP3nsrMZEiOp71j96hNF7cUMfKllxUZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sLuszH+g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739517242;
	bh=dXrNCko6/jItUMwTB4sP5FErM0aO6+kYup7T6XTr6Gg=;
	h=Date:From:To:Cc:Subject:From;
	b=sLuszH+gUH8qHp4ic55PhLMPUX+vwQQKF7cqVDRv6tqb5dbdfNPYu2N3eArODaObi
	 EhL/I8prduI4RkAeqXkXW1ViWMbU9x3dSI8kfP+2/THqGixRQSGXSgUy7ZlOa74vNq
	 4xFUbb+rRREH0YjaFix+nQA4EBKKErYm4g/Q2k19+B8kMII5R49rs5IFahVOIIYV+Z
	 7aKEOFNPoyR3xcYJemqo7QZiqACk8/cIs6gYrcetDG5uZVOfFhz9GncJdLZDzmtUiI
	 5gokaPq764k7VSazmXB28gamiRoAIovFamfz18nHhXLlEmgtOPG0blA7vFjgUaDtsd
	 Cyx2lRbj826hA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YvNZf4bL6z4wvg;
	Fri, 14 Feb 2025 18:14:02 +1100 (AEDT)
Date: Fri, 14 Feb 2025 18:14:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kvm-x86 tree
Message-ID: <20250214181401.4e7dd91d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fyK_ZkP78+zZ7kKQPDbT1+T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fyK_ZkP78+zZ7kKQPDbT1+T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-x86 tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

virt/kvm/Kconfig:103:warning: config symbol defined without type

Introduced by commit

  5eec660014bf ("KVM: Allow lockless walk of SPTEs when handing aging mmu_n=
otifier event")

--=20
Cheers,
Stephen Rothwell

--Sig_/fyK_ZkP78+zZ7kKQPDbT1+T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeu7TkACgkQAVBC80lX
0GyAxAf/Vm5lX8pvKjQr6XGE6Gd1uBpPB0Ojw6f3kRWK0jWfmGR0GqliEb8TZ7/z
kljHhphUNspjJLet34BA3GH0y3TYy6eSQNcLF0hnPv/cRVWBzgyGEaeoxPFC0SnK
0IyP5/AayZs9v53tVqGtPCxwzLpnP2Ww9Q4dvtAzJl4GuRZfch37xppDZWSiAki5
QPGEDhMilhv+Tbm2+cl4z4tpTx7kEj8ZVJrRxWDk52PJZepErlwkQwJqSfu14EjZ
ATTPHlv/5hBP1ITkFtM4IiZdRe04UkZzZAi0d5ycvL/w9/V0/gaY2R7QIGtdQEXj
lm2/DfHL62M49He8DYSI7nvuyosdoA==
=Cw5J
-----END PGP SIGNATURE-----

--Sig_/fyK_ZkP78+zZ7kKQPDbT1+T--

