Return-Path: <linux-next+bounces-3282-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738E94E3D7
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 01:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5736BB2131A
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 23:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52F63D393;
	Sun, 11 Aug 2024 23:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TKUs28P+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC626287;
	Sun, 11 Aug 2024 23:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723419024; cv=none; b=FNVkz4Tn/Abfaed+J+eVWmjXuQIp4us5RViaie+zQqLre1ffktxik0LnldhOEegcmICfK0PvPvogBtfCrRuWOK1JDiDRQUsOcvK0M2dI+3J6CqwdJWb7NZG1f9CT+CrVW9moqgFrHGa3bN1i1+Cky2drH1MUP/z3o0Et1KSfbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723419024; c=relaxed/simple;
	bh=wm5ktlve6wgsgEwPPW3LGQhe3Ut07NARvGK41EApS2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ocPf8D6lpD6muL2CAJuxikCh3n1CxLJeQDFVFbI20gr3F8uLHQSTf0agWeRmDVyrBZzBjED0oJy7yfRMcgc9xx4wulLWSg7488mS9JutqRy3yFts8vM+tCbaXf3MqpMeEeGLwKT8l5kXjk/qhzENiuam/yToLGqcKESccqKuhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TKUs28P+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723419017;
	bh=eNSUCQPx866Pg64nr1Hw9XLv8/hOtNshdhzYQlDzNg8=;
	h=Date:From:To:Cc:Subject:From;
	b=TKUs28P+1wnbsi9oYp/C/afLCG/llEZmehKo44rUsT7ocTdW44Iyj7cTocucdXBP6
	 TTW7VD3M7nSKDDnestmsUnWmqC2dwdnfdApe8/VvNFfXTjKzvxLRz7MUHRY+aVC+Bo
	 MEzyzC33L+d1yLOyXnR+yyTZI8TccJ5M/edzK7Ir2FITWpd/JihabTiYXcf8AC2jzb
	 RF4HkY94Ri94obMRse+uJN9fuRPukTqUl58UEXGHdhH9zeazkNn8cL1n56qJIiDo1P
	 J6r0gML0bNiZ+P4SVNf5v00CLaUApPyphEraCpD6ufRSCkTGOkmwBiLj7EISsl7ri/
	 L9FUqhKfFmYTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Whv5P022qz4wx5;
	Mon, 12 Aug 2024 09:30:16 +1000 (AEST)
Date: Mon, 12 Aug 2024 09:30:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kaiyang Zhao <kaiyang2@cs.cmu.edu>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20240812093016.148a433c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P4EBZ2.lgsmOHcFdZGLC2S4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P4EBZ2.lgsmOHcFdZGLC2S4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/memory.c: In function 'numa_migrate_check':
mm/memory.c:5403:41: error: 'NUMA_HINT_FAULTS' undeclared (first use in thi=
s function)
 5403 |         count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
      |                                         ^~~~~~~~~~~~~~~~
mm/memory.c:5403:41: note: each undeclared identifier is reported only once=
 for each function it appears in

Caused by commit

  75747a26eec1 ("mm,memcg: provide per-cgroup counters for NUMA balancing o=
perations")

from the mm-unstable branch of the mm tree.

CONFIG_NUMA_BALANCING is not set for this build.  I note that the
preexisting calls to count_vm_numa_event() compile because it is
implemented as a macro ...

Not the best fix, but I applied the patch below.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 Aug 2024 09:09:52 +1000
Subject: [PATCH] fixup for "mm,memcg: provide per-cgroup counters for NUMA
 balancing operations"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/memory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 231c7b2297bd..13b679ad182c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5400,7 +5400,9 @@ int numa_migrate_check(struct folio *folio, struct vm=
_fault *vmf,
 	vma_set_access_pid_bit(vma);
=20
 	count_vm_numa_event(NUMA_HINT_FAULTS);
+#ifdef CONFIG_NUMA_BALANCING
 	count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
+#endif
 	if (folio_nid(folio) =3D=3D numa_node_id()) {
 		count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
 		*flags |=3D TNF_FAULT_LOCAL;
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/P4EBZ2.lgsmOHcFdZGLC2S4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5SYgACgkQAVBC80lX
0GxtvQf/ZQfd0sngpIh0Szbap2v0OeEdViqYFC6YXq1y4SRrLe6fzXZDppVOh5/u
ARILfYbfaM6yj7Z8QfhGW5LowrCBu0AMkzV95z0vJQSw7pWl5z2IZjUyzL+Gjg6v
ybeTzIqiG5FomUUx5oXPvafCGNHRokrd7sPiY+j2o68yZwqp9rPIfCb5yBVMfNps
oRwqimATTjHOUHZ0qDrt67DKYykvhHyVqFa4Cj5XzLJo0NjZJ1nEkC1PTSOniYKo
pATnHeES+f+5G9Qy6ne57X/+FwhlQPuqZA5xY6u2o/RBgXgjz1253LzlLY3Akj2Y
4XWIDg22RGycxtcfiRRIvlJU22YAdA==
=0Yk4
-----END PGP SIGNATURE-----

--Sig_/P4EBZ2.lgsmOHcFdZGLC2S4--

