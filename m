Return-Path: <linux-next+bounces-5938-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB90A6D315
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 03:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 157D916D466
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 02:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16971273FD;
	Mon, 24 Mar 2025 02:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="stwLUf4R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E98B667;
	Mon, 24 Mar 2025 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742783741; cv=none; b=XhqSPYaIPnIIyKJeSZXFQEX0UbykS8tu2wcKwpDrjih/rg5hrVNrbNP/EA4zV0XD+ytPJX1HlJAdQwdddKS7SBMPy/KN9wvtKBr/YZfHGctuKcVcnhr+vyu8/ZB9C1usWNPi+BVXbUIBGvc4hVjLmAWrcW3NcG5nIaXBq8K9Y64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742783741; c=relaxed/simple;
	bh=cd2bpQ6rijtiBRYe6NFanE/4aq7Kj7bh8XMG5u6H9H4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gaNYN+0LBUhB2d+g5AnMFB/fbE4W3hV1CMEF6l8A65uAmA1Op+DJgmJAnrR13V5EtbWO+AxuZ9e8gaODFM+M8Y1Y1GIK2NkziZfCM0toz7jvVhSr3sxDPBXAtTmFATyJge0xhKr5GIX9rbPLadgp1ejLOSrZE90KLhjl6ng6ijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=stwLUf4R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742783734;
	bh=2Mx2/2FC58YVJr9d818o0qZgffvByW3aFvXCysFxuco=;
	h=Date:From:To:Cc:Subject:From;
	b=stwLUf4RwSkOQRNZFRINFVtu0r0WidAzJgfQQT5OsMnw3rUWJv/L5mVeu9kywBDw1
	 q47Ii4NwdefT6vja1hZL6VkFUJcTD3XMBzQRPBCWnOBxBMB/+pK7ZaGEdYe4uga0RN
	 Orcwi0ZNOf+lPtdbCBDg90mctWV1fq+WGBTHdF5FuYY1P2866WCZitASVLdBBwWl4w
	 KrPsNB5rnBh0FgaHOoq8Q2AYSbF53A6qozU37/kGazoMV3JSVv4fY0we4p5DrePXni
	 ApORiMHNm0ZWIp9JlCJrC0XkAavmaR0PuB3s0zLLPcBPZfOceGE9p6PTL8sD0V81XV
	 +cCJT7aqeolZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLcbp5w8wz4wbW;
	Mon, 24 Mar 2025 13:35:34 +1100 (AEDT)
Date: Mon, 24 Mar 2025 13:35:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20250324133533.19b88cbf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XnVrQ7/KDNCcgIV/_F4DLZf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XnVrQ7/KDNCcgIV/_F4DLZf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6d5934331009 ("tracing: Do not use PERF enums when perf is not defined")

Fixes tag

  Fixes: a1e3ad43115e ("tracing: Ensure module defining synth event cannot =
be unloaded while tracing")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

Did you mean

Fixes: a1e3ad43115e ("tracing: Fix synth event printk format for str fields=
")

or

Fixes: 21581dd4e7ff ("tracing: Ensure module defining synth event cannot be=
 unloaded while tracing")

--=20
Cheers,
Stephen Rothwell

--Sig_/XnVrQ7/KDNCcgIV/_F4DLZf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfgxPUACgkQAVBC80lX
0GzgDQf/Xtidb5z/KBSP6T52Ire/VospzP+5Rof9XcCsvK4MQktJeQUhyry8/rFy
N/xZg+J0N8b9S0/+keqlnOAtGu2lRxAnyjXoZIpAlOad0bVi+2eAjhyMOV29E+Z3
i2eOTIp4ipVVV+MSFEXISzmkmrPVRHtg8hghyeSb0PeLXkrahAVLlGJcsgj0HBPA
1Ao7FA0+3QuHjqRObCDnsHGVFyhtQFpHXu967pXdbQc/juFdTkau2NSpe9Ww2bIn
4XeH5y6hcK7Xg51NTxP6CFtZOyMt+zJlnu4hWTroAQtRXchKfVC26IMs7g2ar958
wFM3O39yg8hDYWtbi3Yc9sQgEI8HJQ==
=Edl9
-----END PGP SIGNATURE-----

--Sig_/XnVrQ7/KDNCcgIV/_F4DLZf--

