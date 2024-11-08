Return-Path: <linux-next+bounces-4701-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D79C1562
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 05:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE74F1F23E4D
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 04:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDB51CBE92;
	Fri,  8 Nov 2024 04:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tYFPsCb0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF17194A60;
	Fri,  8 Nov 2024 04:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039717; cv=none; b=Czd3TAW2ecrV2TVKrmDqTvpetjcywtgxNo6oi/jmePtmXk/EF1RRgLFUFrgh4MeKuDDc2LllqclvtnnjSEc3ToEp5V04qmlYbq4qFsz+lyBPmEPyJTJACkYFBZ1ew9EsVVc0W/fCHFH1v1nBgb25AmUa4zRa3SzzV+sAghH+2o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039717; c=relaxed/simple;
	bh=WLAYAQuM6g3eUxoZL7++yop/ovFVrHcp3kxdSG+HlFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ny24Qt0WPT5gphpGwPWtJVt93CiD7fJQdMwAG5V0/sZA6i+rVA0rPVL7P863cS5MtGqigA8bQmPONY/cezpHLuzOXpkil0+nVKs8r2QTLx12PSNhRXjpo97uVkQuSdMbM87XnmA7GMwie2oaiXQh22ATyD6mR+eqVMswx3Hv99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tYFPsCb0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731039708;
	bh=BV7yEOVmPoEKWjC4VxAa/JB2VNxwxkUnuKXMNJfGEFM=;
	h=Date:From:To:Cc:Subject:From;
	b=tYFPsCb0N1/7JGisoJBPTPucxHyDl0z9JBVdLg2Iaj5fSodMjq1G0/toFIQoUxaiW
	 ZAfq8f3ESuwCEcJ+yvrRWsgGvTMnN3h2QcJCm4YSzEv/ZdGsTkwrqtdfXjQZ0G+Xvj
	 4qaAnkS9Crh9UoBt86OQZKvWNkz+PdBcZgdnlmzvxQmZTiloxmZmF836Vjw+P8RTJq
	 6FMH1354r311+NE80yK+W6BvURFECrIufEGANPMaoNd1OJTnnOO3lMRWXYnzyFYWQs
	 /fV2ZFMMEQuhtdFF2mxOdUDOHQWUkgpUzNYjIr7qsDpSc7bOU1I7IWgL0HbektsxMa
	 pkZkPyapHYolA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xl5P84CYqz4wj2;
	Fri,  8 Nov 2024 15:21:48 +1100 (AEDT)
Date: Fri, 8 Nov 2024 15:21:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241108152149.28459a72@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FlwKDpLYPmJWWG31Wgqa=w.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FlwKDpLYPmJWWG31Wgqa=w.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in samples/rust/rust_print_events.o
ERROR: modpost: "__tracepoint_rust_sample_loaded" [samples/rust/rust_print.=
ko] undefined!
ERROR: modpost: "rust_do_trace_rust_sample_loaded" [samples/rust/rust_print=
.ko] undefined!

Caused by commit

  91d39024e1b0 ("rust: samples: add tracepoint to Rust sample")

I have used the ftrace tree from next-20241107 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/FlwKDpLYPmJWWG31Wgqa=w.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmctkd0ACgkQAVBC80lX
0GzBEwf+PLcqWwRRvVaVUk5Zp5k5SPurtRvc8KGCYGE9BnyekIJS4a7g1y8Ehvms
8VQjEKtfUfVr2vIuLt9JuqgvudFPCgb5NdNRfKVa8yZpJPjqWzinFk6mtEZ0mGly
HNMnqu58OrMTztr7GdNpnWkU+oP4WgsV2RD0RtorHwxGILCz2ZC2af4b/LRnQRDD
LhZVzhDKNRLA3PpTJtKxV3hpTDsonZoe290eKvqBqEKoOpboaLPAkWTelku1gJ+Z
aoZ4sWct0IRXYV5K/m67AJmdizbLpHxcV3njUhqqo3D21PHJFq7bexBupCo3povB
ijHcrwUsWgxiWqK8qLyg4DzHTvqbPQ==
=gWzj
-----END PGP SIGNATURE-----

--Sig_/FlwKDpLYPmJWWG31Wgqa=w.--

