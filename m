Return-Path: <linux-next+bounces-6678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26541AB2E84
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 06:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB37416E8D4
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 04:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF4F253344;
	Mon, 12 May 2025 04:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fyELNxIP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049C2576;
	Mon, 12 May 2025 04:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747025727; cv=none; b=A2Qwu0v5g/Sp3xlmR2HwArw+mSDrKXloKn0JKxgvNj/Vv6Yddu0ZjfW0FVZPpaAtqY8HAH+bh4Sg8LtRLP4XaqeSD4ejECLcDdPkq0wfDWQlfc3ehpX2i5t8VR0bWx0Ndd/vKt9Q1d3F4zEjSnl0iq0ECdhAYLvlgebQJAwyXrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747025727; c=relaxed/simple;
	bh=aWvgqyTC8MhHf2LqWcH7hQ6q+Mzcz9kpTWIwdqKNqGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nt2ZyWqfhcMsX/r55O5x7jP7glFR8ryUSUOJ2jN0Heb/bsOam93SrWZlJ09X2CtPn47vEBeIDwl3hsgVrn9rtbQyMEIALgr0COi8LFfIR/l7xzZQQ/Kks/tzzYsorblbH27Bs3eq/AiRTgIWJeGfP62Ah1gOJa2ugBUx3il1pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fyELNxIP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747025720;
	bh=KHNM5tuWH1IMFWNPTSt9SaxzCvgGT7Fvi7521vVDN/E=;
	h=Date:From:To:Cc:Subject:From;
	b=fyELNxIPyXoQtOMPrZvcAZ99udgWVH/dDoWXJlci6/nJu99xGYcoKrs60x35t66ok
	 navm/yNKCbUVct3jgObOZl6OUx+Je48Vh1LwnttQ54mvQF/ilqunOXruo5DwvUMZR1
	 uju+5orSzPYp4DbeFdJPMnqdsBnUh+OgfoH48/KwEje11rRK/2u3ghOUIDZN4W0fiv
	 9uLT5r32m7vhyR0JytFQk6tAo/cxeEbcJwGk5WdBOMzQVEoIasIYKxrXF/2CSJPoGu
	 o60WjO1ElR37zD7kafD6pSGP+qHlx8vn1HnU+RbyNrouD01vIUOmxNJMIIaf9Kv++Z
	 tLrIojwN8+vIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwnNR4Dydz4wbY;
	Mon, 12 May 2025 14:55:18 +1000 (AEST)
Date: Mon, 12 May 2025 14:55:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250512145517.6e0666e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kp3oECkJ7=G9nQOS1=v7s45";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kp3oECkJ7=G9nQOS1=v7s45
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/cpufreq/amd-pstate.c

between commit:

  608a76b65288 ("cpufreq/amd-pstate: Add support for the "Requested CPU Min=
 frequency" BIOS option")

from the pm tree and commit:

  d7484babd2c4 ("x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'")

from the tip tree.

I fixed it up (the former removed a line updated by the latter) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/kp3oECkJ7=G9nQOS1=v7s45
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghfzUACgkQAVBC80lX
0GwbpAf/btTTeKTge1jMTuIsJRb7Wv8+nXP0JiM4O7rpJ0Wbbh0cSaGTaKzWaFmk
Vc/4CJNy8fNG3F7aE0M/LqJvPIJHZ2Kuq/Puvgud+ZSIWRDXtKOzH6mJkij43Ru2
oLb1S66pN3ZyIq6EJCWYxaQoxeYW2q5tily+HIXRk34A6Fisml3nJL2J0swe6TNu
jB8etizHORzgjViwKXZb+60FNnUHuovK/dUO0MLW4T7M7fKwFQ1YzAIWplIjlWY6
3uZVgVt0PHunKaea7ci9n/0jTfCOfTj3DssbpdeSf85pcuMfAmSUzCuPQ6staL8N
+uFeUA9sAyndy9E0whyo+PNaYpTs2g==
=39v9
-----END PGP SIGNATURE-----

--Sig_/kp3oECkJ7=G9nQOS1=v7s45--

