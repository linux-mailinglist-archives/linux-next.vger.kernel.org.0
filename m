Return-Path: <linux-next+bounces-4426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4409AF593
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 00:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47671282D8D
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 22:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB6218D70;
	Thu, 24 Oct 2024 22:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z3Nl2Y4Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DEC22B66B;
	Thu, 24 Oct 2024 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810107; cv=none; b=Eiz9GV8XlkrXPIGU4j5ju54R8nTA4lZY0EqWUMAQD4jAz9NwVkovyaARzF8t9/KVuUSxhyQ6zxQjMp02sMw4ma7Dnqf9A/PIWcSbz38kUVXvQm0lCVrvhdC7mUi7Fpsf4hHm8X3hQAgb42I9bjkSuV50zlRxIZbRegAaaQ3Wl2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810107; c=relaxed/simple;
	bh=enxjdZe0umOFwncJZa6+eQy5jJUZtHbx7dmCFtzyilU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fECmCvc9Oi8QVMIPMsFl7e4P8pcp4Mo19B16MkVxIcIpIUhPiTrnM3jcrvtm2LMIjgR3qKtGOjLIy0pM9x36w+i9sPfMuAC1XjCZPWxRVLLeXuXKjVeLkKQ2GTQADjmeSn3wSNkMpplGfQ01MgECT4ljQ3eXG+oJ5H2gPcT2bbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z3Nl2Y4Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729810099;
	bh=HWr5SCVBIf4R5+RprhnU59I43s+DX7W75KTaTlRRdhM=;
	h=Date:From:To:Cc:Subject:From;
	b=Z3Nl2Y4ZZLKSffHL0HyWk13dEEQBTLpIY0sIYvCQG0gDLAxt781gQ88bavCSXHDHW
	 ChP8YW2pvSAgZqINb5ym7TRFWp67xb4ZrN0dpfBOMGo0mHeZmqYkTICcHdnPQMnjoI
	 q+jWNkLvXAMZCKwCAtZL8xDERsqMXo8XdCfe41KySFMxGbjNJdQePEAXHfBeQ5U5PP
	 Dy9kVCEXte5Lutbz6bFuPvOuWRnlIEWOhaWT5CSR2FQlt9wusiCbT7CB2VxpYl2xfl
	 nWwWIH4jDCya1UJXm6rsvcNNfAIgHr+9IoGu9MbRLUcqKm/oqA2DzzWeVzrtL/+lVE
	 o9jKcpv4y3wLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZLfq1l1xz4wyk;
	Fri, 25 Oct 2024 09:48:19 +1100 (AEDT)
Date: Fri, 25 Oct 2024 09:48:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the riscv-soc-fixes tree
Message-ID: <20241025094819.5e01ddc5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uqYoEldrLnlpg3qqcPxXAmR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uqYoEldrLnlpg3qqcPxXAmR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the riscv-dt-fixes tree as a different
commit (but the same patch):

  384f2024e1a1 ("MAINTAINERS: invert Misc RISC-V SoC Support's pattern")

This is commit

  7d9d88890f04 ("MAINTAINERS: invert Misc RISC-V SoC Support's pattern")

in the riscv-dt-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uqYoEldrLnlpg3qqcPxXAmR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcazrMACgkQAVBC80lX
0Gw23Af+Kdw5tLQXH2DdtEWcd6yyN3Kjy7HPSKR6ZWmj3af+SGg6MuxoYc/1Ro2+
IAXBi4zY3QbSw5Sn0x7fvRTpW3KMTzT5KIMHEFbQ1PggjwzCSzQHzxrayLxD3RrG
69wbfZMTv4RyNr/Z+AzMCo0TCiJWS4B3JGs6s3gXSuIueAXZlFLVxCKzS3qjWIiL
y8nnu/V8ufRJF7rsGNaSokQf0UXlFkc/QfqxL902eD8RBVPEn4kT743q5HxCMn//
EoRPDqBerrSKQ38j6WQWRy/hjvHgyWhZHxy2AAGILRPGA4OfqC113s7pFaKsQHx8
dT2rV8+tzIlOEFCvy1E9PzX9UFd9YA==
=2lbl
-----END PGP SIGNATURE-----

--Sig_/uqYoEldrLnlpg3qqcPxXAmR--

