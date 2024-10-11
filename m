Return-Path: <linux-next+bounces-4230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF501999AC9
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 04:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62D242859DC
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 02:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5560D1F12FF;
	Fri, 11 Oct 2024 02:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mrUbj1hB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82452B9C6;
	Fri, 11 Oct 2024 02:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728615331; cv=none; b=keOzPXsQysFWumFYZg5RDOkwy/TxoNegVj0WpjgB+V5eOs8+TbdKOrTKN5kp1tRZdV4oHLfYMmM5f1Wli6axWmx+cc5WRtkR9z5fS35wcgrC/XHODgMVTxzC2VNr4aSy2enOBEpYkERv93xPKhbo7Y/Qg4MfLhTrLKJRZHv02KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728615331; c=relaxed/simple;
	bh=pR0bSQUSHzKgEK16jcUOf+QnnW+FG1fppHPZexo+5bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sF33eJZSk0qhBvvDVMTW8+lEwOQkoYV4FIMIKDi6T8uX6vVcnQ6cwKB4ncKgaYTJEd6ILjVTEA5WJmTEHv1hc9f2Dzn49Gos7cLz2VPI5rGpGPNUHB9t04WvsdMiql55SiaxEbtRVwryFafzBwUD3Xu9jmPnBfMc1oQJ4PcB3oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mrUbj1hB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728615317;
	bh=8fjxfxZB0kg4kDJ0e22Gxzo1z0u2taZFW+KkgrvGI0s=;
	h=Date:From:To:Cc:Subject:From;
	b=mrUbj1hBimUiIfbzSxiAXKtbjtRdhEQOdYpArCEho+e05isI+3nnojjMh3Vds9agr
	 PKkUgodM5T3C9cutdT7dAwCKGKViYRsxCuB46AUpAU0jvsonLqzjBxk6SqMgrfW4F5
	 qoLA5t1TPGLaGOXTPN3xw2zjul9DSD+cdQgGcOk/1UQz+UR6TFSuCCt81XOzgfRjun
	 nHF3VdLciglumKfR6AYMlWVVn1vBcaGR9l7hEweK5d5c879LcyT7eDAwCRmb5sXvBQ
	 L+TfEhdpvaHEtTEu9J+VBlBYL5TI5/kZSWH+dhDmyVVPUUA4R6n3tMycPMvtznW+6a
	 84Koq9/NRMZaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPrpC5rbLz4wd0;
	Fri, 11 Oct 2024 13:55:15 +1100 (AEDT)
Date: Fri, 11 Oct 2024 13:55:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20241011135515.75317b03@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5+sIg1pVYcVoOaiKYYg90DG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5+sIg1pVYcVoOaiKYYg90DG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

kernel/time/clocksource.c:1258:13: warning: '__clocksource_change_rating' d=
efined but not used [-Wunused-function]
 1258 | static void __clocksource_change_rating(struct clocksource *cs, int=
 rating)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  5ce9bb4d5af2 ("clocksource: Remove unused clocksource_change_rating")

CONFIG_CLOCKSOURCE_WATCHDOG is not set for his build.

--=20
Cheers,
Stephen Rothwell

--Sig_/5+sIg1pVYcVoOaiKYYg90DG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIk5MACgkQAVBC80lX
0Gy3Egf+L6Dbx9VdgmirU21m4xcgSgMpihh39mwCwRCVJRMisuoE34DscXPX5fHl
hJml2966LGdpsVW8mgN3LsuBLHSrZ23OPzgcHNXkaQT9+tRDqngKjJVlRWBqJ+OM
qSCHnzh2teWcMlyR7rtve/OuVxWPrtfYXsd5yplmG+subuwtNLm+x5DVbqdhIEXG
BgXC8OW7ce+cdeosNkg8XDjb4OUMN4TH/l4+D1yHgcceDx6L7rm6Rtm719//JQpu
jbFuSUCqVlMzDm9QoICS+jrsgXgUZURvYr7N71Guz71TkFNCRpk8mWUy587qgw1u
Nv60A5nuoJj4NQdFeyDweokthkhK2Q==
=huCO
-----END PGP SIGNATURE-----

--Sig_/5+sIg1pVYcVoOaiKYYg90DG--

