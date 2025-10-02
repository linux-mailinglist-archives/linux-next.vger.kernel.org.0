Return-Path: <linux-next+bounces-8533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34222BB3B7C
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 13:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5813271ED
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 11:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D223930DD13;
	Thu,  2 Oct 2025 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agq1w+0d"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C73081D9;
	Thu,  2 Oct 2025 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759403319; cv=none; b=XjRv43F6WG1qYuB39iFZ4IxOr1vagK4wABHVgnwwsM+xwvyPXE1BQN2oOoDixC99NO0rXZ4+sHNuZY8z/MLJjtu2CiMHwMujkEhA5Ati3m5OSXQOecDT2WgnDOZwVOQk0B9fCOtBp/TLB5XqiE3I+/l4u3KDw2GEXJKY6Ap9hBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759403319; c=relaxed/simple;
	bh=itr6V9nhZjCQdJ+bfdY2TGFXyRDvluU7JGsl6RhXbSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzRiYS4mIZIjQb6fRc4fMjsKXEZ3JwIGnSUcDX/PcBF6YqDSXC9wHLGtnSGeiaUzYop7/mQkfN763eK1gtJrzlnX19fT2v5NrQFYV6BrH/jMsNiUt1mcoEOEMN4Sjzuqh7XdZsLp9uBPMh06ZdnszUUWzDUp4S3JPwF3wYUQ5ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agq1w+0d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49991C4CEF4;
	Thu,  2 Oct 2025 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759403319;
	bh=itr6V9nhZjCQdJ+bfdY2TGFXyRDvluU7JGsl6RhXbSI=;
	h=Date:From:To:Cc:Subject:From;
	b=agq1w+0dW0cR9yXNYFx/0Ob6wziSJKpwZIPgCg5nxwrdeBvRe+SrCmrswv22Q5KGq
	 511b8JbCIocsC4G/By8gtU3u0r1ezLImhS/gxMJNl4QMCqWTIEcOZ1RUHdTm5MSPYq
	 KoWFALKJlo01g24Y4PaGaivPoJVyH9PglK0khEn6cM9eXy/hgk4m0MtXcIu9/UBcs/
	 325BLrggFbNAQNmwQuoPdO4sIDlhD5+z2c/twNqE/l6A1GXe/wO4EGYdWGBRr2L7Sr
	 /l4Bg91PuIz2nDy0laHRNNhZZ800al5SIK76WToAHA+mEc4TAi6wOLqN5haJ0sLZUc
	 to3fu3KrrLkFQ==
Date: Thu, 2 Oct 2025 12:08:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Anna Schumaker <anna.schumaker@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Snitzer <snitzer@kernel.org>
Subject: linux-next: manual merge of the nfsd tree with the nfs-anna tree
Message-ID: <aN5dMYUPfFly6eUO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TZ/4XHkpefzJNvcD"
Content-Disposition: inline


--TZ/4XHkpefzJNvcD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfsd tree got a conflict in:

  fs/nfsd/vfs.h

between commit:

  d11f6cd1bb4a4 ("NFSD: filecache: add STATX_DIOALIGN and STATX_DIO_READ_AL=
IGN support")

=66rom the nfs-anna tree and commits:

  c926f0298d3cd ("NFSD: Relocate the fh_want_write() and fh_drop_write() he=
lpers")
  c1f203e46c55a ("NFSD: Move the fh_getattr() helper")

=66rom the nfsd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
index 3edccc38db42e..e70bc699e9a51 100644
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -697,6 +697,10 @@ __be32 fh_getattr(const struct svc_fh *fhp, struct kst=
at *stat)
 		.dentry		=3D fhp->fh_dentry,
 	};
 	u32 request_mask =3D STATX_BASIC_STATS;
+	struct inode *inode =3D d_inode(p.dentry);
+
+	if (S_ISREG(inode->i_mode))
+		request_mask |=3D (STATX_DIOALIGN | STATX_DIO_READ_ALIGN);
=20
 	if (fhp->fh_maxsize =3D=3D NFS4_FHSIZE)
 		request_mask |=3D (STATX_BTIME | STATX_CHANGE_COOKIE);

--TZ/4XHkpefzJNvcD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeXTAACgkQJNaLcl1U
h9BprwgAha5g+Mq360IMTO7XheD1+P1Xk1JITrsia3puUVsQ0VhJ22Dx5duIHPF7
inWJ+SsNKJW3VwNcscNJU1M/0bO+fsxfaMjFw76iP9AkDVj6TKwWokX4bTqZ0rB2
C+q93aH3Zeu9+gyulpcq+afpOJcf/5yK+oU/D+JQ9eYQ11pKUrxbZKVcBB1+88gq
3cLrkJ6Ydbv9a+vs/uw2F6bpKFm8ybGm/rd45iUoC1U/tV5U0iUOew09EgP6UW2J
UKH9GD2czDJGzdURYRpWITdcoKmCSjdmQ13/giHngZPFdJMLR9QwfMd4QZzhFBmk
BLt54B/3LC9ITbIcYNWbRrr5z0tc2Q==
=KkEB
-----END PGP SIGNATURE-----

--TZ/4XHkpefzJNvcD--

