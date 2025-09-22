Return-Path: <linux-next+bounces-8410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F36B8F92B
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 10:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5E693A4195
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 08:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D36126F0A;
	Mon, 22 Sep 2025 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCxNDdfe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B4C9463;
	Mon, 22 Sep 2025 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758530261; cv=none; b=nALafZWdrAFBTETYEYse5agLKFB69vn3EmQBmsd6aPI03XycdjozhQfyc6UPjJVQJVfU4LBtGfvBf4f5tGb9c46the7icaaNkBy9//qvYMYFqCPMAno8CTr8nHYmoeqMh6nSjQCBvo7X7R/7eh89Qe+Zg+fVonI7vsEYsyCAwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758530261; c=relaxed/simple;
	bh=1XJPEbEK99ng2tj2CWAYmRrIXNRNQO41Y4BR4AURxe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezVQiozwhfbAID9UpF4n1lBoNilyk+eaOcOl2B78xl276HVmFv3NfGoBHav1PaeTlWKkW9yoG3MzMQM4aSW8J9AkHHn0LgQ4bltQ0bO82Ok95ZTBTrxMLBRvOMG/PboSlldjlqko0Wkx4oEhrtyzkU8UqQvaYEEA5CKSGAay8JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCxNDdfe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB54C4CEF0;
	Mon, 22 Sep 2025 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758530260;
	bh=1XJPEbEK99ng2tj2CWAYmRrIXNRNQO41Y4BR4AURxe4=;
	h=Date:From:To:Cc:Subject:From;
	b=iCxNDdfeVNPP28KBkvYwS1l1zxaksxZ84+CTOtRQfNHz7863diYKL3C8MAP47zFYl
	 MGXWs09WNEhICokN2t0pOxO1tIVMO2FP+gz7IeHs6MH/XSS8JK9vQWYV4jDmG/TTUe
	 TaKjAjOoelxjVLDw8yomRKuMLx/C4UlDWk8dq5xD8hxe5+Pnl9rkeCW9pLEUtwLlwu
	 WilwO5nADW+wQceHJLsVRx296nfhKV11cAxO907nxpWUObHQLngTmPBZ47/KYfPevJ
	 P1J51bovYFV1za/4QMGypY/VVXPGma3ZDVTV3D+bSTEQ3H4jtXr7jyaB2CY0w+0PeI
	 iebBV5xboGL3A==
Date: Mon, 22 Sep 2025 09:37:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Shashank A P <shashank.ap@samsung.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext3 tree
Message-ID: <aNEKzrMMxLAVHGIn@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ec+thO8EBfriwWYK"
Content-Disposition: inline


--ec+thO8EBfriwWYK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/quota/dquot.c

between commit:

  72b7ceca857f3 ("fs: quota: create dedicated workqueue for quota_release_w=
ork")

=66rom the ext3 tree and commit:

  08621f25a2687 ("fs: replace use of system_unbound_wq with system_dfl_wq")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/quota/dquot.c
index 6c4a6ee1fa2b6,afa15a2145382..0000000000000
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c

(ext3 version)

--ec+thO8EBfriwWYK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRCs0ACgkQJNaLcl1U
h9BQiwf/WWwySO+Y/qSWTwPI+12nFaFXTXLsjzdKgYuSp1VPsyabNcKTFLFTSdG7
UKwvDCVn7r1VPUrCxaTjlFFPDTSmEKrA9OKh+yf1Fcms5HKSRyolqDUMH1jOSm/y
G0hNiT53UppKrfy/Uhhoo1ws1jY5Cc/tnLKkgqEjpkwCicZ0d22eUMrVOx4XizH/
Gpbn1IY/1rp08TJxQCR0dUTZWoxuhzzyfReZl7dd/3rL0f9CoKNRioPsk+NGSSNf
k9qDjC4hzRcrs1aF0KjDvq4TYMIb5F5AaogfLLpWz0B9ztydkFeKR3Hv/DJsdon5
ryt0caM7ymleRPrEbHvMQg7QOedCoA==
=7HlN
-----END PGP SIGNATURE-----

--ec+thO8EBfriwWYK--

