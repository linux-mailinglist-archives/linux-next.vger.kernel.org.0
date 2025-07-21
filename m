Return-Path: <linux-next+bounces-7648-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E531DB0BBC0
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 06:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9AF718969C6
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 04:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCE31D5CE8;
	Mon, 21 Jul 2025 04:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f+DKtsAm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583F8469D;
	Mon, 21 Jul 2025 04:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753071933; cv=none; b=HhPEkDQ4DTCx5Rf2m/gqIYGOYIdBR3po9T6eyvW7FJXW5jkP2i9qhM4/4fOFgKDMKO8yXaeFovsOHZp8Rp9QEVq66mWHIMrIGnd/x8KygOBcbzDs33JQvTW6MP330rmikI9ovo5cH6CqocC4XYPFCrXUPOET3EVrEmnzPsNm9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753071933; c=relaxed/simple;
	bh=YN8gbUKzKcVSB5wqdn8eoN9IaIsu832kei2YPAE09fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ruxRzZE+aQw4O2HiX+KNphEmIxrRsk69lOf7y+leYYO+uvcVrTUBNf7Dfn7WjW7ds4i+KmdcHmIS+kf53U3ugiQtRyTJZ2KkrFzGgUuxNzeD9ovtWL9NxPvXPCWKKr+ga1Ln0Ed6627tPoWbBcSDkwTwZWgWA077UpvK1HZQtfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f+DKtsAm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753071777;
	bh=GJVs/97Sy6ENZXG92ZO6nk/Eq50rCWJge5SIH1Im36k=;
	h=Date:From:To:Cc:Subject:From;
	b=f+DKtsAm5Q5iJlrUwjqwsHgExvin3mwM0TTLDYCeyScaKt8Fnnr7x2Hy5evTjTtak
	 AnMB4olNQRqtiq1EazqPeRX9+7Xp32zQH9brZEMPoTt8kJkYQxl5qJboRMDF9KqUJS
	 DbFR/LI6ayx/p5DTWQMuoMRDXk1jmX5yJS+IibwyUQ9MbRvCdv+qOj9KiUuu8TjCUy
	 9FAG6jusUna6G9zVpCSfkz4Aa04SXRGwo2vVyL5Tgsdb4cNHmOWB/pGNc6GT0R2nGN
	 r82LojdjRqpg/88bMIjzpsN5iT011vOyikAEfdfawFK3zMiZmHDrty4JwDNR9RZjXK
	 3Joz9PvwQywfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4blnLm5nYFz4wcd;
	Mon, 21 Jul 2025 14:22:56 +1000 (AEST)
Date: Mon, 21 Jul 2025 14:25:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Remo Senekowitsch
 <remo@buenzli.dev>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250721142526.2903169c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bv4inHX_NogRD57GhRSoKNs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bv4inHX_NogRD57GhRSoKNs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  drivers/cpufreq/rcpufreq_dt.rs

between commit:

  d3393e845038 ("rust: device: Move property_present() to FwNode")

from the driver-core tree and commit:

  f411b7eddde8 ("rust: kernel: remove `fmt!`, fix clippy::uninlined-format-=
args")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/cpufreq/rcpufreq_dt.rs
index 9ad85fe6fd05,4608d2286fa1..000000000000
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@@ -19,9 -18,8 +18,9 @@@ use kernel::
 =20
  /// Finds exact supply name from the OF node.
  fn find_supply_name_exact(dev: &Device, name: &str) -> Option<CString> {
-     let prop_name =3D CString::try_from_fmt(fmt!("{}-supply", name)).ok()=
?;
+     let prop_name =3D CString::try_from_fmt(fmt!("{name}-supply")).ok()?;
 -    dev.property_present(&prop_name)
 +    dev.fwnode()?
 +        .property_present(&prop_name)
          .then(|| CString::try_from_fmt(fmt!("{name}")).ok())
          .flatten()
  }

--Sig_/bv4inHX_NogRD57GhRSoKNs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9wTYACgkQAVBC80lX
0GykpAf/d33LqwNseMxQuT3txO+1OvL7D0dqy1bgx7F+HL98RDo8CtpRonKGzePC
ejYTJcKI8JgOVpE1jnG2WobUgueVdCYPXljUmv78xWN+Ywm24FnzP4M3WvSZ9EBL
/ZnY+SCXjDIABDs7RtTmfG2T/gT9XvCpupTa70AlsAnYLUmc3fuhTQwNUaZsR59T
91HCThXA6jYpjazIdJJBiJM0JaQDBW1lppdq82i0Gf4nKpUFpYp+/fEJ/jHRBmNg
N/LDaBSoHPqepS7h/+G5IGkFmKv0b5HoQmSbVt4vh8WAGqzypR+0ur456j4IiCkg
OKpWBcrtlju5PFTQTOgnUdiWUnr8Wg==
=Uj7w
-----END PGP SIGNATURE-----

--Sig_/bv4inHX_NogRD57GhRSoKNs--

