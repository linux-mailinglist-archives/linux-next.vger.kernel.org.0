Return-Path: <linux-next+bounces-5940-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C963A6D38F
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 05:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B78B3B122A
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 04:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58018B03;
	Mon, 24 Mar 2025 04:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o3aYJ2ZB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617842E3383;
	Mon, 24 Mar 2025 04:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742791041; cv=none; b=qF0e4NPXS9jBEkEcvWORP5EV39BTV9sSdw/agBI8Q73CiMsbTCjvmvETor/v5wL0OGNzVAf99Uzcs7krb1gtUsNzOUsr2UytCHZ9+3MloUcYl9FwV04mcd1aXttvEUHdUDghaxuEQ8tsfI1WRTT1fcY6KKhZZqDnI2TsagEru/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742791041; c=relaxed/simple;
	bh=fggBk4XxrkKKYlWFVtskALGh/abGCavWLxQiPl9syOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t/bVCrudWu4Yg0ux8N3qKUyepMTV+vZm8y74MfqgxZ/hSHMFkML3J60QZ/YbscfKFJi0gBlihxpeMxQOsPX699+UdTrrdrY6xjlgPzic71tg8rxeyWtOt9pPTCsfKAKwOoWqHilBXtDs5Dz3tLIcSjIQIWGdl0JQwCsIduxybxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o3aYJ2ZB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742791034;
	bh=oTscpH4djTLQPl9PzPMEVPDXJUvfjeXgqJhMtetg+R4=;
	h=Date:From:To:Cc:Subject:From;
	b=o3aYJ2ZBgmUXE4YIBW2yFkHxr8icWLTXgdkQy5RemFUNTsBbaOR6soX34oy+0s/4m
	 hkKjWJgvYBPkZ9ejUFE9/vQ8qyfe+xgiTm42TwwhqoVmE8WY32tVfvJco6Q29ZOIpu
	 khNr559dIggftOU9lw3FysHScVLOwxJ76bVfSw2O/gS+alhf4Fz8Ji/pg7HHdJggdd
	 e130v8SrHsp21fB9AMnns9hqbi9uWT5QzaJHdgdSOziyxqHOsaJqTALrMDuXY9834K
	 xnCobm0BNAHitD3Jh54hlgpARh1ZT59Mt/EsacfKmiB87bIBJxgKL592Wvh0ct83r0
	 2WT0CyduXqx5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLgJ93vfqz4wcZ;
	Mon, 24 Mar 2025 15:37:13 +1100 (AEDT)
Date: Mon, 24 Mar 2025 15:37:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>
Cc: Luo Gengkun <luogengkun@huaweicloud.com>, Ingo Molnar
 <mingo@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ravi Bangoria
 <ravi.bangoria@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the security tree
Message-ID: <20250324153712.6a2b2a5c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SQO_sz4ZsQqxbJaMZTZyPSj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SQO_sz4ZsQqxbJaMZTZyPSj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the security tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/events/amd/ibs.c: In function 'perf_ibs_handle_irq':
arch/x86/events/amd/ibs.c:1207:13: error: too many arguments to function 'p=
erf_allow_kernel'
 1207 |             perf_allow_kernel(&event->attr)) {
      |             ^~~~~~~~~~~~~~~~~
In file included from arch/x86/events/amd/ibs.c:9:
include/linux/perf_event.h:1675:5: note: declared here
 1675 | int perf_allow_kernel(void);
      |     ^~~~~~~~~~~~~~~~~

Caused by commit

  9ec84f79c5a7 ("perf: Remove unnecessary parameter of security check")

interacting with commit

  50a53b60e141 ("perf/amd/ibs: Prevent leaking sensitive data to userspace")

=46rom Linus' tree.

I have applied the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Mar 2025 15:25:18 +1100
Subject: [PATCH] fix up for "perf: Remove unnecessary parameter of security=
 check"

interacting with commit

  50a53b60e141 ("perf/amd/ibs: Prevent leaking sensitive data to userspace")

=46rom Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/events/amd/ibs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index e36c9c63c97c..30157ab98cea 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1204,7 +1204,7 @@ static int perf_ibs_handle_irq(struct perf_ibs *perf_=
ibs, struct pt_regs *iregs)
 	 * unprivileged users.
 	 */
 	if ((event->attr.sample_type & PERF_SAMPLE_RAW) &&
-	    perf_allow_kernel(&event->attr)) {
+	    perf_allow_kernel()) {
 		perf_ibs_phyaddr_clear(perf_ibs, &ibs_data);
 	}
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/SQO_sz4ZsQqxbJaMZTZyPSj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfg4XgACgkQAVBC80lX
0GxCoAf/bkjXdjn49ey9ErEFeWe7xhSBdWZSq1LYbtcGPpvApio0Y3A8aiOvHvjy
R4sKn9/L/m8jFXIDj53D5to9Tw+XMdn/Tsh3vJR1OR1xX1iPn0ST5baBZr8gWau/
B6aZHBD3AHq+n1zz2/XW3PTTT9eAV/5KHTp802nFc2RarQgobzjrnIDxwhG0K3nX
A0D/wh2jVg9UQjmK7RAC8oaQfmpF9rOFYMA3HUO5loiTVFF9ucWXLTj22rlR5Wba
eeEG28OCiFvds7AyzqVczngdDLMrrPXh0kkqDIYYXae5VtulZNXJnuKy1utv37uY
3ZwPMk8IvZm1gD1d7Ny25iM43hPn8Q==
=+1Nm
-----END PGP SIGNATURE-----

--Sig_/SQO_sz4ZsQqxbJaMZTZyPSj--

