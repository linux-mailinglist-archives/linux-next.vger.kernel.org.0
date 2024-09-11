Return-Path: <linux-next+bounces-3742-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5969749B6
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 07:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0581B23CBF
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 05:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893914AEF7;
	Wed, 11 Sep 2024 05:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qBcGZ8pJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792BB2D613;
	Wed, 11 Sep 2024 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726032255; cv=none; b=rqgl+DpRoY74bikW6k4DixspPRIcw9lZ4cxN/doaPhvFLwx8xoGSfHBxtjg1YexsRu/qe5fiqKHhVxSXAqEWbeWXOczPTM2jFcQ3A5/codzU5hM1JxdTq5RZCJyKQcRzA+6r4oQa1Ql377X4vzjAdHM44+kCzzeIDDjh3/b/HS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726032255; c=relaxed/simple;
	bh=QeYROk/6UZdQMkIUybm89m35C72ngg2bE2/tMof+WRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZTLO0TzU1Bc2oB3BHHaeTr8nRc290G825+kCEo2LwUcI9Mabrkhqh53mcSkDvfiDidkAxyYKfd816+le3oap/BXMF+naGJzpduRz7DvR1d3KfoD8O4QJRzy1wMesCy7atkos3A9B0ZBaBtRs6lUwRziZOzVbLnWwbPpLyVE5K5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qBcGZ8pJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726032250;
	bh=pXVv9cAoMmxui1kN+5CStaylIIl2n3HPxxgb4ajLAEM=;
	h=Date:From:To:Cc:Subject:From;
	b=qBcGZ8pJs/sov7EUAFqgnBzHF6y4SHdf3GcmxZDvosOc2KRbaLMCpRwYviSgnjiC/
	 Fhx1Wo0KI7ieLp51O5M08TFYoQEkP1oGaBHFPKZN3Ihq2Z/P+jmd+iTMmVkv5JXBoa
	 uvH+Ns3fVSZFa2zm7RNPUpjQYNxuS17aZrXv4t5RASeWBT1Bfu0ZYM46xRKKg+oRtY
	 FGrNm5fEbA/rT6iMoPdekFWq0KqcFBkf9rFjA1s6AEPmwyFvc1P+ErPYLQbZLuyZY9
	 IetUEwhoZj70F2WPSf0dgg2XffEwqmlbyeYZ3KQRANaUvP9897wB/tCBhCAubQJbjM
	 VysYE/Pw0rX+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3TWt47xRz4wc2;
	Wed, 11 Sep 2024 15:24:10 +1000 (AEST)
Date: Wed, 11 Sep 2024 15:24:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20240911152409.5c084a42@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_La6rcGoM6dBIq/=DAbDMcU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_La6rcGoM6dBIq/=DAbDMcU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  6b9ccbc033cf ("kthread: Fix task state in kthread worker if being frozen")

This is commit

  e16c7b07784f ("kthread: fix task state in kthread worker if being frozen")

in the mm-nonmm-stable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_La6rcGoM6dBIq/=DAbDMcU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhKXoACgkQAVBC80lX
0Gw+LAf/YtXDWnbWcL1CwnyJsh16tOOF+iuCzcKR4M2oPdryuky5+OAjq51WYG3E
Z28ZUJBqtXToTp9HiwYEzLI/fe03Ab6li/tFvXVBgtIdNrINPv9BI1PT3LRp8gUW
TlAgE1yvx1rEmgOjHCXs9gbb14g1eu9j0t11fs+G9P+V1+wmgoKpIcmyKGFoys8p
KQOM5kgTa9uQ89xrstMFAVZL0K1rgnaBvq9hnxfUrS8ha3DkfrQIGqrlcOelsviL
2mYoCWUR+jInXGc5qU9SEwczmKFx8W460bTkzvcZgarL1gQV1KVAqpVRTuBVyz2E
sVyBrsASfH6q+bX6qqm1+6d7/53ohw==
=eQN2
-----END PGP SIGNATURE-----

--Sig_/_La6rcGoM6dBIq/=DAbDMcU--

