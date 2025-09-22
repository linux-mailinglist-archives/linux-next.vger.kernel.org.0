Return-Path: <linux-next+bounces-8414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C12B8FBD9
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BBD417F706
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 09:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A277E283FDB;
	Mon, 22 Sep 2025 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Frn2GiqH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1F71F936;
	Mon, 22 Sep 2025 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758533013; cv=none; b=capWtAo+9fBSY9LjLOvyf1e72Ax3l5OvIS/jBR2Iw0e3dnkBImCMCOXqMXomzmwlZKOJNahGLOR6E6cQvqr6f0DJElMlH9b8422cIxvKsJmGBdCD4gMcFRzDqAFswP+WdCxfTOIqrqDJ5wPnewthe9lzsbFst0MlElVMxJbcids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758533013; c=relaxed/simple;
	bh=j05wZavGFXWNtjbPPzOS8CI3Pw0Pv0DRZuYuLreKJOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qObSEgWsp6cOMKGZt7XFumgWy9twvXLUy05Y2Oe2UFhG0vdCHMbpRX1uPRbbmbsjOycLfNU2v2GJ33yNAgEE+lkuI5ruBEjjrAqNB/pNy9l+uKgx0sbUpWOmmzmaR83fnK5EHKKPeEPKXy8we84+a7rx8myng2V8nb0sMVKWuRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Frn2GiqH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A25C4CEF0;
	Mon, 22 Sep 2025 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758533013;
	bh=j05wZavGFXWNtjbPPzOS8CI3Pw0Pv0DRZuYuLreKJOU=;
	h=Date:From:To:Cc:Subject:From;
	b=Frn2GiqHH5J4JzW33sO5dqSKbojQJIaVB7J4VrqEwaSPVosvhzeo9VFSbPQrTlcy9
	 jNLbX7boCJau8j6yr9HSWXoH9zeKsnuiF5E492x2jP/kiz+Q32li4kprjZ3kS+FXdJ
	 DFkuMytk95NIGtDxJ6gzX94m8wCsFHYV+MNtHHMi2HLzc2+LYhKXYrriA3l8rewOjc
	 JfMTun89en5LciiTSNM05AIYGwZYuW8I9+bu6vUZ2qSoAEBTKiu+Tc62fzApTNyS4t
	 cZgx+Aedz5FzbNiAB20GRNjCQw2XggvDHGj4MyGkYGP3NyB+0jebndNjGmAqn19UPa
	 n4VUFRX2XVIFA==
Date: Mon, 22 Sep 2025 10:23:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pavel Shpakovskiy <pashpakovskii@salutedevices.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <aNEVjp5GxJHjdfbN@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RNHb58DXMRibB7kk"
Content-Disposition: inline


--RNHb58DXMRibB7kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/mgmt.c

between commit:

  6bbd0d3f0c23f ("Bluetooth: hci_sync: fix set_local_name race condition")

=66rom the origin tree and commit:

  3b3eb857d5ab6 ("Bluetooth: MGMT: Fix possible UAFs")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/bluetooth/mgmt.c
index 50634ef5c8b70,ee7068fb9fb59..0000000000000
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c

--RNHb58DXMRibB7kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRFY0ACgkQJNaLcl1U
h9D+jwf/WkUVAhSgCsCYb0FUOOCjsU1TuY9qPcwawUA8E1pxCGmcqTkKxEZrWRKm
CMCXA+aTU+nUHEqrdtGt5P9i5VLyzyAn0B90hH55E8xV0GT6Sux/1275u7OWvgcH
8FUSVKDVzX6EKl00yVR4tx2JMo12pjwFifPtdzwDfrlDA4bstyoQVrMyFTWvYLc6
tsoVhpYDMk4Yqs4J1OoPGSTfnmGMR3r+kB9jm1UtorUYOSU84D/GTLjlxp3sX8d8
CLTItGidQY3giPG6MP9S/WV8HV95L7kfyT7jAVnFzZHgKhDv+hWtFSMM1aeot4sD
I6Qdhy6iEARDJvx5Rfxn+8um3UgbAw==
=EkR4
-----END PGP SIGNATURE-----

--RNHb58DXMRibB7kk--

