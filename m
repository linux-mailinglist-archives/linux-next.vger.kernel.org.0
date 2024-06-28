Return-Path: <linux-next+bounces-2701-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B20B591BFEC
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 15:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3ED21C21A7B
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 13:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CF71BE85C;
	Fri, 28 Jun 2024 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cP8fNepE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604341BE852;
	Fri, 28 Jun 2024 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719582490; cv=none; b=DhNcYmIfeMwC+zdL1L63L0no2fhApxupxc3paRUHzhd0QLhY7ltOMkdlUtrtcMCTJ81CNCsvnbeAUddirTPa6CZXvSKwo8wI26ZSFBRWEeaRaM4GCYETfFMeszGvuYY/EJsqjToX6HnT46XQ9ZTSNphmx6PtpWNtgoi3TU+ivYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719582490; c=relaxed/simple;
	bh=51p8tLOllbBPP6+2ZYdUf1YIHJ3vRaAuOQq31kR6V+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xg2aUujoT8lwJkr6UFM4EIMTpDhWn96TPSn+xEqLltXycmPZPzIE8QILu/tt1zVloYao8+eR67hhwtLVm03jr17tYlbPM3Uos9z1QnvKWZyC4Dj3FCRoe1zf4u+RMreQCroHdhVg0VjXg/10uAarCLwuUcbBhX1ktlh9GZEa5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cP8fNepE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF6DC2BBFC;
	Fri, 28 Jun 2024 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719582489;
	bh=51p8tLOllbBPP6+2ZYdUf1YIHJ3vRaAuOQq31kR6V+o=;
	h=Date:From:To:Cc:Subject:From;
	b=cP8fNepExjgTBPXi3I35TKygQl32c/NmA20DiQEymrpHVmncNobAcDU1SUpmx87cU
	 983+ypDG8wb5grlrMkgtnSfO8dT91pxdgKVl3E7ZHl+7kvOlFUcqV42EW/p5aUocca
	 jKr2CC/Ojb/Ladt9/UqtyRmSPX0GNZay5H0j7BRLB/xFPPythoqlxYk6rxydunKmYb
	 12FwwgwxKUxRdK82UqRUXV5zuY9ow9IpALAXsyYCDikhJMe+kJ4jHTB2hF7T7yA6Yd
	 L+/GwzSGAvrq1M4YFz4Yw/GNEZLlNyYepvqmVLQNFs7HjXG8SrohFES/sxROS7kgdP
	 R+tu9jUHTnfrw==
Date: Fri, 28 Jun 2024 14:48:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: linux-next: manual merge of the risc-v tree with the risc-v-fixes
 tree
Message-ID: <Zn6_EyxJmwD82JX1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XM8fDG3yiU/xHRk7"
Content-Disposition: inline


--XM8fDG3yiU/xHRk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/kernel/patch.c

between commit:

  edf2d546bfd6f ("riscv: patch: Flush the icache right after patching to av=
oid illegal insns")

=66rom the risc-v-fixes tree and commit:

  47742484ee162 ("riscv: Remove extra variable in patch_text_nosync()")

=66rom the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/kernel/patch.c
index ab03732d06c46,5b3f6406e8c44..0000000000000
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@@ -200,10 -186,11 +202,9 @@@ NOKPROBE_SYMBOL(patch_insn_set)
 =20
  int patch_text_set_nosync(void *addr, u8 c, size_t len)
  {
- 	u32 *tp =3D addr;
  	int ret;
 =20
- 	ret =3D patch_insn_set(tp, c, len);
+ 	ret =3D patch_insn_set(addr, c, len);
 -	if (!ret)
 -		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
 =20
  	return ret;
  }
@@@ -232,10 -222,11 +236,9 @@@ NOKPROBE_SYMBOL(patch_insn_write)
 =20
  int patch_text_nosync(void *addr, const void *insns, size_t len)
  {
- 	u32 *tp =3D addr;
  	int ret;
 =20
- 	ret =3D patch_insn_write(tp, insns, len);
+ 	ret =3D patch_insn_write(addr, insns, len);
 -	if (!ret)
 -		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
 =20
  	return ret;
  }

--XM8fDG3yiU/xHRk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+vxIACgkQJNaLcl1U
h9AQkwf9E6WgE4VKrfVrS84zknqc76iNM+/7fR+9Ce1xVlv8Fa0H4k7r4/aMQAfS
r8HHC1IXV078WwNb8eaAdrtQqnwoox1hYJVCDhZxv1h+NBQizwUFU3y8Mheel9/t
rnv4xTJzl7dQZlEIyd+VQIlxkge9PE/4w8KNYzSzLo0/8FX4K3fEtyt2x/o0b+bB
E9Pp9ZhF/0HJSW/+JB1nO6pFa4AdOONfBNrWXL9yRUERLVHqFczbliUOJIQLq1Yx
gTLGSkso+n4usB8acAMs3QfvnpwbUEbZTi8011lVm4CcRM/AkshvZSlXqWPqqlBu
Gy6WMebWhp7Q0ys8+cq7+6iwvEE9eg==
=r/BA
-----END PGP SIGNATURE-----

--XM8fDG3yiU/xHRk7--

