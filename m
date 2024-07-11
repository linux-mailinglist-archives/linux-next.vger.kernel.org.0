Return-Path: <linux-next+bounces-2946-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F992F226
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 00:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6C2EB20C9B
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 22:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5042416D4E8;
	Thu, 11 Jul 2024 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vHJnRjKR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18415098E;
	Thu, 11 Jul 2024 22:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737652; cv=none; b=kcQz5eu56BZcu88iycxqXFElbmQJjKuXqt1qfsyzJdd0P30EycIiUXRKgrJGznT7Ibv2ZE04wNiJgIemjKEXKQ02q9p4okLw6hSvaXAXm0JRshHcSmHOlhK8E/NrS7o/9VYrT83uG+VSZRMiSpSW5aee+2tBI7ga74IN6IW5qHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737652; c=relaxed/simple;
	bh=hch1hVyncmSj7D/5Bx7h0CmAiQeGL5v30lm8t05ZU2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CMHeWP/zQPaaVhMtIRxlV99hnqDzNIEKDfiIGZMLWZg9nfKxe2GzUU/lSbUftW12kTQdSff6eEQcg3R0pEc7TmDxURJqMQOKtVfVa3g8H7W29QwcTm3K+yuNZXnXrnND0x5kXQQYKG0gwHvRlF9+HyFeoeP4eGI8fOblRH7b7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vHJnRjKR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720737648;
	bh=RC9arhDT8QyOQ67j3vBwckbx+FMSk5SG6l8EWiKCtGE=;
	h=Date:From:To:Cc:Subject:From;
	b=vHJnRjKRxUGfUtioUcrTIXtUXoXch9ziGS5Q7236P/p42S1Fsxh1WrURtbI7UBeBe
	 +7DVnz4dUCngBnvKtjJ7iS9Eo4eeYENJYj6NFHfYI3VHRACKik6NSCSgMiRr50JycZ
	 cxzrtcRBzCyAkgR8JBzsLGBc3rhDV4oM/NwS8S4pfikRkU59rgXEl4MiwogQ2zbXYK
	 euyaWSMh5UBPkZr3WhvIQj/DL2bhcYf2HKiSOq2S3f446APl+OyGLd5mWK1ozoHt/k
	 +JJcCh0h8/Q0Q3hKnmV6p+ykrRqSYTQxLGBwu9y65kjLXHJ+F1qU6yvjJsD1SXaw+u
	 JsT5d/1hmyK8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKqSc4s14z4x12;
	Fri, 12 Jul 2024 08:40:48 +1000 (AEST)
Date: Fri, 12 Jul 2024 08:40:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the workqueues tree
Message-ID: <20240712084047.7121fa76@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0jmE83kj3VSvD=uE.o/0eDX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0jmE83kj3VSvD=uE.o/0eDX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  aacff6ebea30 ("workqueue: Rename wq_update_pod() to unbound_wq_update_pwq=
()")
  09827e6f1295 ("workqueue: Remove the arguments @hotplug_cpu and @online f=
rom wq_update_pod()")
  bc8d14a48a35 ("workqueue: Remove the argument @cpu_going_down from wq_cal=
c_pod_cpumask()")
  cbea25234674 ("workqueue: Remove the unneeded cpumask empty check in wq_c=
alc_pod_cpumask()")
  49d94fbe1f8c ("workqueue: Remove cpus_read_lock() from apply_wqattrs_lock=
()")
  e5265846a49b ("workqueue: Simplify wq_calc_pod_cpumask() with wq_online_c=
pumask")
  1b366099b179 ("workqueue: Add wq_online_cpumask")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/0jmE83kj3VSvD=uE.o/0eDX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQX28ACgkQAVBC80lX
0Gy7rwf/SDaPEE5fcrmJGfLdIuhv78C3IjuFn6YMLWclHgP+naZ9gPgKi8GS7d6U
ZOkDEekM+6hpcWFy0Rswok2dSihbvtxCPbPVNxB4pPBQXBNjuvBUBc/56p5+zRWt
ISdmmVAjCNbJNLkG1Df9clWCzB3Joz8iEHKQ++l3Inoz5R5Fb0kY/Wksj9/uhX04
tYKlQE5GkoIBuL8eGaG/RDPlF4iiZxESg5kIDoVSfKYi7wNGjnnOTZwkmoVvMt+D
pbw7FuVOAsP+GqPBPPxTw0D409RaNxg1HU4v/7i2rWPOB6BIAsKMNCqTT/yViCfB
tQuyBCiou6TLnmbpzJDURO+FPLpe7Q==
=tscm
-----END PGP SIGNATURE-----

--Sig_/0jmE83kj3VSvD=uE.o/0eDX--

