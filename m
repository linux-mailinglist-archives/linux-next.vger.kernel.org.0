Return-Path: <linux-next+bounces-8310-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9867B5863E
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 22:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752FA4C0860
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 20:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9599D2882D4;
	Mon, 15 Sep 2025 20:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dllwHkai"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99872610;
	Mon, 15 Sep 2025 20:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757969897; cv=none; b=N1oGJV2iyZsrj6DuK7EsCM/sFw7ldUZNUw+xBHPdM5l2HJkd1dqNqQyhd/FoqjWFrR5hrZtCSXUh/Ad4CGdl0r+aDiBDMG5k/gFCUJO6bBNUTmtnhxx12Eiq+hpxou4o0bRZkFjILdmnxlqi3KbrYoq8xEHk823/AvyapCUZKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757969897; c=relaxed/simple;
	bh=x3/UkngNGKVY/w11MDmgCTH/JFX+ay+6u6MWV9Bgxtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hdrl7y+1U4GZQWKxWAVvw5AW3/n7kk8GjAphd3VwzdLWX+npUZHBT1aZ5L3X5kMCcGfpfclSjQWWLAhHv1Ldo6XMa/KzEA1NUdh9zho92GZ/cFvqsJLGEI4Brf3KPOHg/yrYTNRpIWK5WeQghOm/OwOenXD/55wltTghoU5n0X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dllwHkai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B8DC4CEF1;
	Mon, 15 Sep 2025 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757969897;
	bh=x3/UkngNGKVY/w11MDmgCTH/JFX+ay+6u6MWV9Bgxtc=;
	h=Date:From:To:Cc:Subject:From;
	b=dllwHkaiBIz/stxR1VjeFHgF/MDUe3PLmHfensPLWWT6wpAGLdbgZW/p0ewiQVQ67
	 rEJKclbQ98bd7wUd3G8D+6o/R0tyII83OINJmTgb1mjJeRuEzQDFG6mf4zVrAIX3fE
	 xGsS4UJ3dRPjmctApkydJxzqRh58tNotRkZWSRrtPkfT1m/E0PrJBJIEPqzp6bjnUw
	 5bCXslWXarr1DBInv7kfYlNpphd/SwZK63CUW+pU92UpwPWkPM3eWpaBLTFdqSV93N
	 XIg/5KEdomDuG9qsKg0PZQK9UuBImaDkZ+wbk8XABLIKtfZYOffsngofo9D2C8Q8XX
	 Cgeb1VjOH703w==
Date: Mon, 15 Sep 2025 21:58:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the i3c tree
Message-ID: <aMh95LzHnl-9-w5Y@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7fnVIbRNQ/HmTUuI"
Content-Disposition: inline


--7fnVIbRNQ/HmTUuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the i3c tree, today's linux-next build (x86 allmodconfig)
failed like this:

/tmp/next/build/drivers/i3c/master/adi-i3c-master.c:13:10: fatal error: linux/fpga/adi-axi-common.h: No such file or directory
   13 | #include <linux/fpga/adi-axi-common.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

Caused by commit

  63cae74bea7cc ("i3c: master: Add driver for Analog Devices I3C Controller IP")

I have used the version from next-20250912 instead.

--7fnVIbRNQ/HmTUuI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIfeQACgkQJNaLcl1U
h9BlFQf+JUxDbrhiPQ0nHOwb6b0KfMRY6zbVtD5F/pkKQnzDYuzpaWpotiP0ttBk
r/98h9qQkGN0RPJObC8Z6zC62I8UmwNqjmooMQcttPFTPxc414dM/LSgaLseQXSM
GRXqK8eIMqisZ4iChtvATD6CEO1Bd6EX9flaG/unIK/bXkMBkK50sdIy2jAfyCQy
m62kRgRntVvX0QjAgWu8DUsgZ4UHMRJ1bbwDgu092y7fOODFmssRjzKAqTpgpBW/
J7pQx153OxUa7J9jWmoL+76NazL4BjM5aO9Kz34eCDtb0tmsGJVqg3UT+aco7mqd
XnEfOZVk1sbVQ+4GexX8dvfM0hXKcw==
=Rwg2
-----END PGP SIGNATURE-----

--7fnVIbRNQ/HmTUuI--

