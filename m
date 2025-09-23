Return-Path: <linux-next+bounces-8453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 843AEB96DE2
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 18:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483A92E7179
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 16:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706E932859B;
	Tue, 23 Sep 2025 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnjKekBs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C12620D2;
	Tue, 23 Sep 2025 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645898; cv=none; b=uWrkanMZA4AkKf17YFJK+29d3F2oPXOF5qArcPG0S6H8JHuZRvswpOh+LxG+Cui4tzW0EHVYOVvcbbdKKjU8mAdlMsQEhEHhF8tRQ3/Z/nhX+KnWs9hugZxsHe1AsizvF5+mlVGXmZKDJXcjx2jj4coR0DkASOXQiFA0756haDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645898; c=relaxed/simple;
	bh=3XO3yH5QmqA4LLs++ItSyWPZoNja/iDbo2Loa5JKPW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XuBqqO/AEqxhxqZIIxuuOS+tTPtI79CDeqEgsNdLlrNf1MJYnUrJjD7CHMgETHy7j8GvimsWBR10tns1WQnX4cT8UlvVome5RCm2+lyiS3LEXDXz8L0L1eyCUZRIP3moMjFe7p5j8l9bBJaVpjnIZxFxcWfL+Z4DgwI1G1PoOms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnjKekBs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F727C4CEF5;
	Tue, 23 Sep 2025 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758645897;
	bh=3XO3yH5QmqA4LLs++ItSyWPZoNja/iDbo2Loa5JKPW4=;
	h=Date:From:To:Cc:Subject:From;
	b=SnjKekBsyeN/Vi9W51bnwli2auZRd7uu0AlPSXifnUQc8SIokPCtXvw2BY8NwsRH6
	 Q8Ulubwax3TRL6RvnXF1Mq6mqoyexHdBbR4rqGTuSnhMj5ia+/XVfuU9Co5puMIig/
	 t1+yNRagJdtxQk+CKeMPS1SlX4p5eYtrp7nFSeDSBrEjSX6YbP8Rc57aveavYPK11i
	 ldmJ5IEHhywESDo4ptPavIQOZwEJhUjnHsmwgeS5LK8QmHV01JCoYEMNyKS5Fwbl8/
	 6NXT01A/MhoVdFe3I3p5EFmhvXlNG//Zw/T/wX/ZOBYVz/3oFizwhLiGXdatV78gIb
	 yN7NZ5MDxiLDA==
Date: Tue, 23 Sep 2025 18:44:53 +0200
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <aNLOhQyd0YmJnPco@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j9SD9HJWL+yWAjW9"
Content-Disposition: inline


--j9SD9HJWL+yWAjW9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/lib.rs

between commit:

  842aedc3907de ("rust: Add cpu_relax() helper")

=66rom the driver-core tree and commit:

  ea60cea07d8c6 ("rust: add `Alignment` type")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/lib.rs
index fa083aa44cd6f,f910a5ab80ba5..0000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -17,8 -17,8 +17,9 @@@
  // the unstable features in use.
  //
  // Stable since Rust 1.79.0.
+ #![feature(generic_nonzero)]
  #![feature(inline_const)]
 +#![feature(pointer_is_aligned)]
  //
  // Stable since Rust 1.81.0.
  #![feature(lint_reasons)]
@@@ -115,7 -112,7 +117,8 @@@ pub mod pid_namespace
  pub mod platform;
  pub mod prelude;
  pub mod print;
 +pub mod processor;
+ pub mod ptr;
  pub mod rbtree;
  pub mod regulator;
  pub mod revocable;

--j9SD9HJWL+yWAjW9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSzoUACgkQJNaLcl1U
h9Dzwwf+MD6Oh6d/Gua3HoutZBkpMpPXEtM9sNN+R15EaozuzqaFn68B8UtJI52j
4MSeVVDATv5Rq6onYyi7YLpF8fPDTc7xh8OowrONG1ULFZPN0QvJhr4qO9OF4iwj
SE/Jkltpepf/RyqXEGKKablC6Oibind7U78xD0h2QGlrGaS/J6z953IoWh8tAu8Y
CAZO5aLjJMgG37F1ON7UJDnCp5VmpB1mCtl9KKPhKtCa613/b21tw2pcp/rWpF8r
+UCTQ3k1pBV8TSRB/H2dyoQ6gKJrmr1WqZiUGMeHTVq70V3iDZzj+OGOPey3s2Sj
4G6jiTf/SaMl5+AkqQj9bODjavrUDQ==
=gSiq
-----END PGP SIGNATURE-----

--j9SD9HJWL+yWAjW9--

