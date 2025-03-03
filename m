Return-Path: <linux-next+bounces-5636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A5CA4E203
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 15:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4984C7A983D
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 14:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E38209689;
	Tue,  4 Mar 2025 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eFnYccCO"
X-Original-To: linux-next@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739A25DCFB
	for <linux-next@vger.kernel.org>; Tue,  4 Mar 2025 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100093; cv=pass; b=SymL6Kwxd7t2cbt1ex3M9aanDRnvNv9wNHIRtSzqLmfg3DQ0KQSKDMv56NPxvkrxR4BKg+6f5k5SHQ+AsepwkqLTednddN/vzBt1LfMLT0PbThSxlDbA6RXLISvoCnSvBzTHWHqnhBCILH5I1Zu1gNS3mAr3SuJUZ7a4GpSfDi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100093; c=relaxed/simple;
	bh=EoEz1sVPNLIdzQ3hYSNoXZm9t9D20YKTd0JlTlLNOK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I6LWxOkMTyYrymHmpszGsLfo1oVYhMzZC004yejvNTunZHyFTPoId+s9a54pvdSdgm8ho+min2AsnVURhkEZz5xFgj4OLKQC7SWTUsrjC6HM28mSC3QQ+ysbTiMjMxYjGBjinqbW5rU2gClgrkzChy6TDwl0nlVzKdZyiYO6Tl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eFnYccCO; arc=none smtp.client-ip=150.107.74.76; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id A743640D4DF3
	for <linux-next@vger.kernel.org>; Tue,  4 Mar 2025 17:54:49 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=eFnYccCO
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dvS2jhQzFxrj
	for <linux-next@vger.kernel.org>; Tue,  4 Mar 2025 17:52:36 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 3299E4272E; Tue,  4 Mar 2025 17:52:32 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eFnYccCO
X-Envelope-From: <linux-kernel+bounces-541091-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eFnYccCO
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 3B93A424ED
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:27:06 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 147562DCE5
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:27:06 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E081891812
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258F91EB1B3;
	Mon,  3 Mar 2025 07:26:50 +0000 (UTC)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9531EA7E0;
	Mon,  3 Mar 2025 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986807; cv=none; b=I8FEG/f8MGQpckYgF9084b6A70tIKRF+UC9hSTkH2yhnGIUmSVkYLpwNB8WUiOIzryYK0PzD+0xQTsU0p096N5Egp1WpmfQMXZ/GvN0oHEMoW8pP4QAWHayYLqnYI46KoG3h6kMexMuQ8KsXJy7kGPByAMv4J4AIMdNNjYobW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986807; c=relaxed/simple;
	bh=EoEz1sVPNLIdzQ3hYSNoXZm9t9D20YKTd0JlTlLNOK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O5qDswy1b4/M0f+4IZi5cQKXv/dHMKl4TguzKySK7gCum+G6uXfI/tHw9sOBmDc0IwzWbdwXnNuBO54hsgEcuVnITGf2r+beA7xqAZLZ3Jhaud3ka3qHXOCrFb2zMPdgRHpcajZ5bxsyhQ0k5hEXtdDQUdZWDU/vR5sRuObNkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eFnYccCO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740986801;
	bh=JYtmQK7z3nhSyi0RYaAxJIUtW1aTo8IqbYRNufPPnFM=;
	h=Date:From:To:Cc:Subject:From;
	b=eFnYccCO7sP4FAvmvadwYkJhNVDQ0y0CDZ/ntq0mSKZhLsOSUDnrziTjyzwRjEmu+
	 MGX5fEWaQN0qj4XykMm1r5G6/LoV6Op1a6f295F+bZl2iuGpj5rSH+Bn2EQ16k4Mk/
	 gKlvBY8aVFwc4yMYxmBZL5Gn3qVp0i/+YcWcLI1VTLOSHJA48AnJW9BFZqMstae6xl
	 gIRO2/Eg6NvPt2L2ubdpO0HsA6L4y/0wZV+jBMtVCC3h8wv1YR+h7y93+T4Ac03znK
	 TV4mD+XfkF4s8oldCLfGHA4DhXE7WZUCSAHidBzBf3kNRsnLx2dDfjA3cZeWScRA97
	 5AIJ6kvzcN+cQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5r3P1lGKz4wcm;
	Mon,  3 Mar 2025 18:26:41 +1100 (AEDT)
Date: Mon, 3 Mar 2025 18:26:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>, Shradha
 Todi <shradha.t@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20250303182639.5e920622@canb.auug.org.au>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kV2jVTek5sdVoFJKnR6Yt71";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dvS2jhQzFxrj
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741704767.47198@uPo/gCo68dqbfuhG/S3fQA
X-ITU-MailScanner-SpamCheck: not spam

--Sig_/kV2jVTek5sdVoFJKnR6Yt71
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/debugfs-dwc-pcie:15: WARNING: Block quote ends wi=
thout a blank line; unexpected unindent. [docutils]

Introduced by commit

  8562ae832769 ("PCI: dwc: Add debugfs based Error Injection support for DW=
C")

--=20
Cheers,
Stephen Rothwell

--Sig_/kV2jVTek5sdVoFJKnR6Yt71
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFWa8ACgkQAVBC80lX
0Gyvxwf+IUgj1fFhKvX4Y94ZR3BUXvqn0nfmHRRT5lY8Nq6wnjhFwsrSK0GQ0E1R
S9M210O2YP1AiEmhU79ye0i5hmfuRWa3CVfss5JCwugis7/4Fztdlr+aI65Ta6Ru
0b7C497h5KXP60Zrxtp07wSQV9Px9eVnTuZYoS3xWDovD7GDk2Raz5eCYFw7aqcX
RRwoYiF0tm7TKy/+5FVX0DnhKAzgcuEg7ePKhAkWq6D4qY5RSsAGKbTyxcSwQ5fH
oKMywYYPJgkloXFhtlwBbYhso/qNxhKKBdSbhTN7YuJN0enRBBUTJwSZG0svOgIi
NSXHrSzu2h64LqzG5I78HtMoUozoww==
=s/dP
-----END PGP SIGNATURE-----

--Sig_/kV2jVTek5sdVoFJKnR6Yt71--


