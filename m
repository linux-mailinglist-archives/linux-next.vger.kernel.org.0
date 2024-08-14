Return-Path: <linux-next+bounces-3312-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A447B95136E
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 06:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 357E6B22177
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 04:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CB64CB37;
	Wed, 14 Aug 2024 04:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kr0yiJpp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62453E479;
	Wed, 14 Aug 2024 04:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723609111; cv=none; b=utsn2MCxceQZaIfpY7GdmnkrUUWNreXf4q7hV7/Uwc9Y4nZs19ufIjRj8QmB/widDoPMlE2FExtOCkKjw+VoY3sC3IW4s44ofmCPZzt0zaW9KC1LuzhJ9o3jiuAAGwkgkj3/EPS7DLecxZjZYJj51ixqHt0M9GqL4Sbva1rVvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723609111; c=relaxed/simple;
	bh=acS8aXvR8guPGCV9PD86eexpzej/CUksEPKdwXxbEyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GJnPJVptLx0mA4toSLz1sFFwNEDE46t6UjbJ7YHOCtmktYqs1EYDrmcaG5gnGJEfX++weTfyLc2nUOdmrUQY2NM2ks7o0haPKxRNqo6BcfxhTI/iL0bNdimz1IU9vMWpU0j2hHDuVtaWT07+a0gJHrbf/a2fvwJvSQtXULRs9s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Kr0yiJpp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723609102;
	bh=4pwM2xSMFIGS1kNeUqG1JAW9zCtuYISm8zDFJU8hCvQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Kr0yiJppIVdCthzBRm3M1N/er03h3mZU4SeA4XRpWsEvcranesmFIUvz8l8i8d5QJ
	 2DWSAZM0MxrorFgZGQwyEYm8/YS/B912fTr9QsF+ctP95+/ugphWiFzzWQyyJh9lhk
	 7LUieTWQllT3z/dUk3CP2xRitsA4HCTx07A1mX1ek7bS9OkSnbJdFDoUdYye6MkEgy
	 neKdGNlFJ08a104V7CHZ9gkXbschJgiKbvIfCgcnyOsLUgtkGEzoNpqbFjTv9cSoQu
	 pV0h4agAGxURCPQxQRg/eE5qGUFNmIFQhb1RVCp4tB/mghklRKNyiEvo3JqeBg+NfZ
	 hhOMZZZ7aFarg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WkFNt3RtGz4x0t;
	Wed, 14 Aug 2024 14:18:22 +1000 (AEST)
Date: Wed, 14 Aug 2024 14:18:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the workqueues tree
Message-ID: <20240814141821.6911d655@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4A_bfvxnFyYrqIYeoFLV_j=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4A_bfvxnFyYrqIYeoFLV_j=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the workqueues tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/workqueue.h:549: warning: Excess function parameter 'args' de=
scription in 'alloc_ordered_workqueue_lockdep_map'

Introduced by commit

  ec0a7d44b358 ("workqueue: Add interface for user-defined workqueue lockde=
p map")

--=20
Cheers,
Stephen Rothwell

--Sig_/4A_bfvxnFyYrqIYeoFLV_j=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma8MA0ACgkQAVBC80lX
0GzwzAf/bO8TZJEk1qNZ9c+V/4YlGWeiM0rvcbtX13/zvopTbuPsCuidyvI8w5b0
CrNWwlwB8FdeoLHflCtXV5crLqWRyuTc7JBGf/m7ArixNCbV8w6QFIaRi07TphP/
tsh16vT37deiPi90KXF0BTbJkHXcXH4k4hLJsmJR3I28U3+/e82Um9aWld7kvYny
cbLAE6CyPSH0qqqcTDDLF+Ta5aLBcusOXhAuB31Lyhsm7am9uQnThkziUuP9RXda
O+2fWck3/BBXOvnECgLocBauk9FxpIQW2+55vjSZwiMsb5k8+RHIK7I1T291c9lX
nnNiF1NZaMDwaa2YU2IElovG2tJ9Qw==
=pggF
-----END PGP SIGNATURE-----

--Sig_/4A_bfvxnFyYrqIYeoFLV_j=--

