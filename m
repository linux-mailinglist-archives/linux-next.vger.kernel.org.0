Return-Path: <linux-next+bounces-5120-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B5A082EB
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 23:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A25E4167C77
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 22:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D991FCCF3;
	Thu,  9 Jan 2025 22:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bh5qEQ9G"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128154A1A;
	Thu,  9 Jan 2025 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736462770; cv=none; b=p2qfaA/p0dxuzghJDoDqfP8vHb7bzzb9QJaAIvFx+yuA/i9aLqcOaQElLGBENbpNbOJtAhRo/wgDKfb0eO9D1B40B++iWKKzN+ELO1oUBN7UX0EBxG9uOndsjeQhDABcD0S9c1bcKMIlqyqBpoDYlHtaSDStq8K/BBJnHske0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736462770; c=relaxed/simple;
	bh=RR8LSERwlmxpoAVfvyq85jxpWab0sOxJI4NESbT+/DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FyD1thNoGzS7j2zo3ltlZOCOqGTwFZmG9PKHBq2lihuQoCkCHeVFbBc4M2/3svDE3lf/iIgsTDif9IvDm0hY4afozEg2X0Y53EvaOmae5XFzt/MLg+qo4/PCZiB0bUuBWZ2E6xB2/JHW1wK5+R1t2HuAEba6M9qtXXMcQXl+OnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Bh5qEQ9G; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736462751;
	bh=in+zflLZ2gHjH2YWIua1u2fH2iB3yzeApyIUy2AMqnc=;
	h=Date:From:To:Cc:Subject:From;
	b=Bh5qEQ9GNxqgWoMpupqykC/Ue5tpJCgnfiR1r5JYu35gsXZ2rcHid+jgUWPZ6wJaW
	 QZ0p7TxXD87jwcAUsfmT2Zqga7KWiDrbfIzTR5/F2ALMBrx0kTUw41ycjhzKaIJmmC
	 XbcOCV/74MlW6Jy2q/yXMDVSE+LTXYzIhoY9G5lhfZzF+0odGKAoVeOHgC1BiVHujv
	 1JCPIJFJfSYuzPdmzH90zjU3Yi/WVdvKiwIjpTTbFpfs6yseQ8rUF9ePReV/By9q0o
	 I5OPOx/3YpLvD91Cq6nYT5U5phY0Q6uS+ax4RRr5SmOWBvaLh9luOd4183KTSIjiP6
	 y3vlvCiKhfVAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTfyR2KCLz4wbr;
	Fri, 10 Jan 2025 09:45:51 +1100 (AEDT)
Date: Fri, 10 Jan 2025 09:45:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Liu <wei.liu@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hyperv tree
Message-ID: <20250110094557.11bb1f11@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VbltEzWVZHZmfv0g1rdbjc9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VbltEzWVZHZmfv0g1rdbjc9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e2228efbfd70 ("xxx")

is missing a Signed-off-by from its author and committer.

Honestly, it really doesn't look like it belongs in linux-next at all ...

--=20
Cheers,
Stephen Rothwell

--Sig_/VbltEzWVZHZmfv0g1rdbjc9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAUaUACgkQAVBC80lX
0GxP6Af+P1fNmIZ+PYTa489P+Bm//w87qge7hVhmYe381sRFPaV1zq9nioVhUYcK
EKJSCYOHSiSzSYPyjUwG66eHhNNufept2PkC/jL4sVSUjsxCZR1nH1m++bQvn99T
tM0iqqmpXQDWSea+HBRaHNV+krTzg7Kr1IpXyImFrEoBs3nxMVZl4JT8n97JIxiL
V8x//ZiPEdBxmfxUv1o1TGb4xSacf0rTGeV9xTdG0GIegTYnHD9Msd3TD7O36x45
D4/k6Qr1fKTWOqSPMqlzYr/lFNAxur5qhYo5PsnMr02cAiE0k+/NxwyEJeWYPMyP
/zfmEKKdiLnm5pqDA6jTI95GqGy7wA==
=NBJ9
-----END PGP SIGNATURE-----

--Sig_/VbltEzWVZHZmfv0g1rdbjc9--

