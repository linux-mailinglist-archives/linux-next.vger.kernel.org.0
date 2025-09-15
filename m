Return-Path: <linux-next+bounces-8304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56AB583ED
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 19:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1138A1AA6304
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 17:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2953F2D0626;
	Mon, 15 Sep 2025 17:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itEM3nm8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C082C3756;
	Mon, 15 Sep 2025 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757958382; cv=none; b=p6tcjODwmX8Xdj26VaJytRXIaQijSUY9DZDk/TiUZsOwfX/QnUPZZ8Ge6rtTRi32i69KC9NB4RWly++jC9apE/Omby6rw66kzVJPAy32+gug9IDBD8kjjlTNz2ACnzZJgy/EStgGzQt0ZluBi946tq1zAGP4NTsOIaPcG49ekag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757958382; c=relaxed/simple;
	bh=43p4hmwIZmZLhKtA9YVOxJxdxXdlkShzPX7Sy+37atw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAA6j08xNODEws3JbSAS3NPXDx5FRdffd0ciMVEg3B7UcPPy1sz0+bdRHq81GDwEsT78rs8KgkD6q/4kdwGk/5mfOVy7arxky4F7kRnVX2g1e3JH7s3admgIJsRLYvGTEzkkSN8Te7Bew4iFR36IuSQ/FxwiZKG0w54G44IQ7rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itEM3nm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE8AC4CEFA;
	Mon, 15 Sep 2025 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958380;
	bh=43p4hmwIZmZLhKtA9YVOxJxdxXdlkShzPX7Sy+37atw=;
	h=Date:From:Cc:Subject:From;
	b=itEM3nm8wehwfAeVftHglrkkVF1nt7dbjkgIj16nLtTdYAQGYDo+02T2OM8ZnfAF2
	 3Mt7rI+kbMUPM/1coO7korV7eRAH6NUlU5EHjO8FSylfbJf5jVdcBd/761WAmb0YSQ
	 O2F6c40gXiFVAVncDYkkQdbtrvOG58cU8FhhwnP2T+O6cmrADd3vwtaV/pPUawS83K
	 DlS5xeqHzF8ijNIJHl/meTstbE/4te1Y50/wnkvMZONFLkiCcgdrYNgL5NtzHpGBtM
	 ETwWhZOEgr3qqIUBXoHyy7GurY4sEcg45GJbau6BkHz0EtljJPxMGE7zi911hqWH0t
	 AsjoDqEWWCkCg==
Date: Mon, 15 Sep 2025 18:46:16 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: linux-next: manual merge of the fs-next tree with the mm-unstable
 tree
Message-ID: <aMhQ6Po0hAIyB0dM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yDEG01lgW0oL6jlV"
Content-Disposition: inline


--yDEG01lgW0oL6jlV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  cf411621eeaa2 ("doc: update porting, vfs documentation for mmap_prepare a=
ctions")

=66rom the mm-unstable tree and commit:

  b28f9eba12a49 ("change the calling conventions for vfs_parse_fs_string()")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/filesystems/porting.rst
index 6743ed0b91126,85702e6fa1f21..0000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1286,7 -1286,14 +1286,19 @@@ The vm_area_desc provides the minimum r
  to initialise state upon memory mapping of a file-backed region, and outp=
ut
  parameters for the file system to set this state.
 =20
 +In nearly all cases, this is all that is required for a filesystem. Howev=
er, if
 +a filesystem needs to perform an operation such a pre-population of page =
tables,
 +then that action can be specified in the vm_area_desc->action field, whic=
h can
 +be configured using the mmap_action_*() helpers.
++
+ ---
+=20
+ **mandatory**
+=20
+ Calling conventions for vfs_parse_fs_string() have changed; it does *not*
+ take length anymore (value ? strlen(value) : 0 is used).  If you want
+ a different length, use
+=20
+ 	vfs_parse_fs_qstr(fc, key, &QSTR_LEN(value, len))
+=20
+ instead.

--yDEG01lgW0oL6jlV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIUOcACgkQJNaLcl1U
h9AO7wf+Lf0ih3kYGwQoOkjm1+Y1nNLIP5bsSkc6p6M7H2bWR/eEM71v/w+Azzl3
ieg6Bb0UiIcfG02w0llxd2PuRyLGn2aP5TqjYFJNdeDLC48benezu9oG7bAl3nAT
6vT9uNZJGnjjUqu/PV2Y7jcFXdbytnc2m6XS2j0ODOhECImPVWMefE38dfyaAvfD
n3VHsf1NgzfAkNaKXu/XDGE/YEvdb0UwfkKTlb5uhfsPsBGBvpTyMepzxaIn4PIn
VEc+y0+srHEUqrweOYPUKIY21VF9e/JsQCigvPTK2IWyUG/BevwsmwCrAXY98Fih
dqFoYhqHHCsKVyzDrPrtRrYn0bAkzw==
=+2wd
-----END PGP SIGNATURE-----

--yDEG01lgW0oL6jlV--

