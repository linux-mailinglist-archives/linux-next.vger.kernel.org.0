Return-Path: <linux-next+bounces-3915-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AC97C1DF
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 00:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57056283B4F
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 22:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990DD1BBBEA;
	Wed, 18 Sep 2024 22:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vBjv8JFl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082B135417;
	Wed, 18 Sep 2024 22:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726698087; cv=none; b=GEwQljWLCaObjWB5FY8rLXd8oTIkNlu2lbYlQaq4daQi1SKQb3oxZes0nO3RvpOj7nEz2c0gUJPfqb1OdDPTEUA4BkCiOgIVQYmnfNFtAFiosQpn68Id0tiNGL1kJs644ASaQ2yJ6Rwf86dG1gb5M+h/+4PS/Bw/9SPw30sLUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726698087; c=relaxed/simple;
	bh=7xxtcRpF4R66w2NfdU0SK8nXAs9BUflMxIdh+H7lVVo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCGh7CMvqE296xjIJWlrwYIvMZK+BZ7nsKAAM/0F3RU2LbKUE4/V7Bdsn2W1i+Gk3ULwnNhlSJYhasY9EQQQw1/GwZZJtEVe/CQ5WI7bs3Aagxqg9sw4uHs4UzzlHh8u5d6Llif908wUMR7v1vkCZeKYY5zmWving4BjuyO/qcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vBjv8JFl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726698081;
	bh=5lCtcuCkhi/lgem1awfWyx6ufZyO7pMFNsOkMnt053M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vBjv8JFl4iSqVemH+1y4+q5TQZbw3A4jcbylrzAOH74uHY5cVEOdOecL8DrUXu6yG
	 /trV8qEevzOJbERt6tkhrNCZu7vjI6Ad8oNuaOQDyj9s0bTo5vyVykdBAzMCDxhVIO
	 1Z8xvVGGx0sDSUWGB4QISjjzywEpJwSrLb1MTBZSdXbA1lfPAhAYSBewYZijWzZQs1
	 BUh8NMjzI4wcuw8otN2VWHD0KvoygBKcdFfneJekjA/ftI7otWquadDZb4HEQ3yors
	 7qjSn2Ol2GPupCJd0SO4awoOtJpGD52opkAeAqGOtD7tNod0zOF3C2sahSzg+zk8sg
	 Cf/lYTPsBnwrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8CmJ4MYrz4xZg;
	Thu, 19 Sep 2024 08:21:20 +1000 (AEST)
Date: Thu, 19 Sep 2024 08:21:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Kan Liang <kan.liang@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20240919082119.62324e11@canb.auug.org.au>
In-Reply-To: <20240911153854.240bbc1f@canb.auug.org.au>
References: <20240911153854.240bbc1f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BTQau+RYdUMM3KU93.YKo1p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BTQau+RYdUMM3KU93.YKo1p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Sep 2024 15:38:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> kernel/events/core.c: In function 'perf_event_setup_cpumask':
> kernel/events/core.c:14012:13: warning: the comparison will always evalua=
te as 'true' for the address of 'thread_sibling' will never be NULL [-Waddr=
ess]
> 14012 |         if (!topology_sibling_cpumask(cpu)) {
>       |             ^
> In file included from include/linux/topology.h:30,
>                  from include/linux/gfp.h:8,
>                  from include/linux/xarray.h:16,
>                  from include/linux/list_lru.h:14,
>                  from include/linux/fs.h:13,
>                  from kernel/events/core.c:11:
> include/linux/arch_topology.h:78:19: note: 'thread_sibling' declared here
>    78 |         cpumask_t thread_sibling;
>       |                   ^~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")

This commit is now in Linus' tree and the warning is till there :-(  In
fact this is a build failure for some configurations.   A fix was
posted on Sep 13 (12?), please get it to Linus as soon as possible.

--=20
Cheers,
Stephen Rothwell

--Sig_/BTQau+RYdUMM3KU93.YKo1p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrUl8ACgkQAVBC80lX
0Gz9eAgAiVtKDkXJ3YcxqLgPevwMe62P9hQRkfaJcx5tsNYWS6s6dLTO4HbOq5dF
E9o0ZqWf4y1nDAmP5k/6LRNgm2/k22w2P93brMMoGq3SxMfdBlcxD1ctZkyvyRVf
I260FjxYlES10JInZnTQP+lRjEELdiIzHvAnrGyIEK7qowo+zrePnIWgjdzQJ7fp
flSxUA2Ayqfl8uJVmt33nXaG6kwrdfH505MQYKEHDpZhUr421YjKEWuzhI48PvKv
E9R7K2PdKAQDEIak66wQp3L7X8triuf84Lb3YKyzlP1cgglLizFLBNGaax0PF1dV
4fvuxlE5O0LPAVRAl4JXr6vPeS1wGw==
=VLe8
-----END PGP SIGNATURE-----

--Sig_/BTQau+RYdUMM3KU93.YKo1p--

