Return-Path: <linux-next+bounces-6029-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E95A726FE
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 00:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06DF1174B30
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 23:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E821AF0D6;
	Wed, 26 Mar 2025 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tzeh5V+j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD581B0437;
	Wed, 26 Mar 2025 23:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743031360; cv=none; b=Y7QbtSAHtitzVThRxX7J7eFP95LW1WrAzHgANur5ZCVzz3yLFfQG935Br4vM3nTdCQxkLXdCs40nPaahcmfablRCO+4lMTREW4O8O5z8ZjtnSjHWhMSJdl+GtxCkEWfZxf49iCGCqTtw6y5kZLNo8oYm4Cda7BCACt9lNy+8R0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743031360; c=relaxed/simple;
	bh=XS7+c8UtiRMdZz1xddlexoL+0n47XhIDOlWihEZFjnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SdgC62suhmHY5PIwINyADLcXXjnx/L0378mD4y0b8wStUtZwp8lprlCTmd6rFozYKPkixkVKqEp+68UMQ9TRQLw999SAHIweAZtU4F1faBlTIY7P7X7pqvfJ4OvxTHf/NzO4JoaWcmsR8q3VN9S0olihE3qXAnmTOR2v+kYbUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tzeh5V+j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743031355;
	bh=623NT4V8LL93L+XWImqcoWYej63BqTtXIKQ2+5mTa5Q=;
	h=Date:From:To:Cc:Subject:From;
	b=tzeh5V+jUvteT4PDC23/ae+yOybGEtovZjqLM/51vDo3Thod7JaYE7fIMin8CjWZI
	 PvpUSSHl+C39JsFr6mhxxI1mvNAcc55xaM2DueBAR5sijrSDnO7bxvQjjHYn0p7iPd
	 k4D51Od5y/0ThQipakR0S2sk3KitSmjfpKGCZ20NKa94cDy9ElFdNBzwFWn28gxILL
	 RccOUo7sVzZOsYAMw4X2wWpgPAJjwkLxV4d9NIwwKpUPt1tH2/YN73pg+MhedNAXFo
	 ib8ksJm2iKgfIByquUbOKbuz8y5YcsXMOIPIRe4U9DH/wP7Vmh4W1WNPLmS3OyxKzT
	 fulPBQ9ze/DlA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNN9l4HRwz4wby;
	Thu, 27 Mar 2025 10:22:35 +1100 (AEDT)
Date: Thu, 27 Mar 2025 10:22:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the perf tree
Message-ID: <20250327102234.50ad6e84@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WYmdV=njmiBNvK2cLfax2=y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WYmdV=njmiBNvK2cLfax2=y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the perf tree, today's linux-next build (native ppc perf)
failed like this:

perf/util/bpf-filter-flex.c:2245:1: error: unterminated comment
 2245 | /** Pushes the new state onto the stack. The new state becomes
      | ^
perf/util/bpf-filter-flex.c:20:31: error: 'perf_bpf_filter_ensure_buffer_st=
ack' used but never defined [-Werror]
   20 | #define yyensure_buffer_stack perf_bpf_filter_ensure_buffer_stack
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:550:13: note: in expansion of macro 'yyensure_b=
uffer_stack'
  550 | static void yyensure_buffer_stack ( void );
      |             ^~~~~~~~~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:606:24: error: 'yy_fatal_error' used but never =
defined [-Werror]
  606 | static void yynoreturn yy_fatal_error ( const char* msg  );
      |                        ^~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:510:15: error: 'yy_buffer_stack_max' defined bu=
t not used [-Werror=3Dunused-variable]
  510 | static size_t yy_buffer_stack_max =3D 0; /**< capacity of stack. */
      |               ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

I don't know what caused this, but simply rebuilding worked.  So maybe
some dependency is missing in the make files?

--=20
Cheers,
Stephen Rothwell

--Sig_/WYmdV=njmiBNvK2cLfax2=y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfkjDoACgkQAVBC80lX
0GxveAf9FBiKp6ym9rWBdiBzsUmzUTIH11zcxmV3fAOloRxrvCq32pm4WUPAdNPb
ReOSr9v9Sa2DLA7DMePsdiT0q4O4RsDua4X6UhquVYC9ewKJxAeNMQCIEvV/Trqy
2ZUqrOsOPd7AeRdFkCfhLqAtYPAXPVXDE+iRBzYWdKdbreXBtsX1fFv62uplhZ0V
tyqReS9kWSIspf4aeuGem+BI0MxTY4+7zliBKzpdChKFq/Ae9jogt671BbsNZEFm
VClaKoTa9UqIoWAzOrLuXPM+iodw7FLc3y+jKZm/r7QqY9OOfYf3DLyl23eDD+CD
Vlo1qWoKOtSXIJrVeQeYjqgq3zQzlw==
=4Lx2
-----END PGP SIGNATURE-----

--Sig_/WYmdV=njmiBNvK2cLfax2=y--

