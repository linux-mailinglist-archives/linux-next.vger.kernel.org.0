Return-Path: <linux-next+bounces-3279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 324BD94E363
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 23:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34DD7B20C89
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 21:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAAC157467;
	Sun, 11 Aug 2024 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gCGomVzd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9B22615;
	Sun, 11 Aug 2024 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723412061; cv=none; b=XevGsZ1EZnBSCsZQeorDMa9CoJCfSEiwbNq2YgFqFHY7tqfgvyDVo7DJmvJwhXUeO6gq/3Q6NET7hNSyl3GxEFKiqlXpJyl1u6F80+jDl000gQzBnJ3hsltJch/YjQOBOrmZo5SDHTxn7YPm6RN4CGkVE6pu3I5MtLWd3Ko2AHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723412061; c=relaxed/simple;
	bh=0YmTg7T1Z/W31dEleUK8+p5agD6pdI601eJhEumO8iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oVFxNs/nx1lCGzAepMBwa419xFjFTNebG7csNm5VkAcFovtCSehuHsp5HbdL6XzAbM4r39em/7PBeGkvlzNDzpYe247HYl/XDGS5+89z5MdpNGOJhpxnt6Jbc8BrvZq+Y2l9K3nUYBcMBdFMlcXrVCvMGcKPKtNLWZPCc3T7X28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gCGomVzd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723412056;
	bh=zQxIDLs//oBeXIAqQ8Gmm7lxfns5hc7vYyt2kEUEgow=;
	h=Date:From:To:Cc:Subject:From;
	b=gCGomVzd7JWTf+kYDOazRb2yPOAhkr5v7XgVMmJGo1aYDpoGX045QsnzcC1fXrGmC
	 XmnBtYTuOi2csebMeJ/bGc1I65Pm2VTkOTl86f3VyNsiftGLbBKXTk7umUdt55dyyI
	 Y0C9/M2Ts4ANHGWEdP2PAl8ZV9+/iJi/ytB+ZG/kjFTrehJAcyUKAiv4mfp9H7sxyh
	 TQkxD1VDmmtFcwKWm63SRrUMWi8fBw3llCjfjjkCV+xz4O5Y12QJBS25T62J8F4N5b
	 aPZCuGJ/ihSEmdQ4orrZVG9XHXXGWHv+UMqW8ceXgK2KXrCtZgs23Au95tNktTvzmS
	 ZUGiQIIn0fGbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WhrWX4Nrqz4x3J;
	Mon, 12 Aug 2024 07:34:16 +1000 (AEST)
Date: Mon, 12 Aug 2024 07:34:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the spmi tree
Message-ID: <20240812073415.59ed7f5b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QGfF/hqSjIcOEKDrhIpLw9t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QGfF/hqSjIcOEKDrhIpLw9t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  5d3e63577df0 ("spmi: pmic-arb: Pass the correct of_node to irq_domain_add=
_tree")
  a8f4aa75f885 ("spmi: pmic-arb: add missing newline in dev_err format stri=
ngs")

--=20
Cheers,
Stephen Rothwell

--Sig_/QGfF/hqSjIcOEKDrhIpLw9t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5LlcACgkQAVBC80lX
0GwJCgf9Fq8dIoesoheQjPzy1OecwXxPzQRLcaiPVINYujHVbHwdq5SuC/bFCKjn
VKDkJ6my1rXE2spwOolhRoTnn9lJLLA/f8LpWLPe+wb4D+LHc2m2I+TzQxjzendD
yXmzK1n+5judj3SVbSRFwV4UznGcyAmyEM5Q1MjxP/V79paojK270GsocTx0aNIm
rfiJsYf0vrkNdKO9730z32v+Am2g6caAS8hvOjqd2sgeQO3urrOtJgyrcLsV2JBK
VUqoucBpm0EynTnY0AgBpCmvn61xNY0hR0aqnhnqdsiw2nUZppekeXOA0/UqUNEU
ALNFZ3J3IzH6LXGAw87Yk68BwIHuuA==
=oF2k
-----END PGP SIGNATURE-----

--Sig_/QGfF/hqSjIcOEKDrhIpLw9t--

