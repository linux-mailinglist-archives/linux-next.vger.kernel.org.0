Return-Path: <linux-next+bounces-2257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 226A28C1E9C
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 09:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75FF1F22B94
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 07:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A033115B147;
	Fri, 10 May 2024 07:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KqtvNMlq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995CA14F9DB;
	Fri, 10 May 2024 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324595; cv=none; b=jNDCSGJEepGT1JXomiz1Pj47Z+Ym4H7Fba562Rc/VJMtZsLNlX7I7k1mMG5JX3aSK9JBh5mX7L51FnRM0rbw9+8s6kv+vmxitQIgSycsDWKiUcV1HiTxMYKUVsNK+8TzpxeXlL8oRSY8Xr1jZapdH9Qxi0n5S/X0w+/BpE3L1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324595; c=relaxed/simple;
	bh=fpiRgv+q0BCS/Rkr2TvadjpPkvPzVdibVwZ2R9BU+vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OZbUHLJZ7kCxNn+/SkOWB39VI5qDH+i69NE6UlcE/7zmVzImJTNY484OKo3b0rRS3OZ9voYUpY5BZbMUno3iDYh0D12QnruSG41WOauhSHUFm1eMf/rhMy+u+DTMtSLeEY8YVek8WmdF+LfqA1671+4klzehZZQoCr7fPF8ESTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KqtvNMlq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715324587;
	bh=khTCdzIwr3mZnJlScdJiKIBBkUVtbCweZSp17fi6sHc=;
	h=Date:From:To:Cc:Subject:From;
	b=KqtvNMlqMOtNKDUWBeW+xzBKefWMvbMDsvd8JfVhmYvRuJVzphXuntluy3UFOCZdA
	 kcIld6WFrGjth5A728SUO4icS7sGsx4SaddxncX6Cbk9tAW+jIu/DzLc/wfjqnC+fL
	 RRCPX4Tvhf9shGVXbj6YgO5TiSCmrNuTeQiDhGB41EZW/sFksXmqA81lMY7PObQaie
	 ejGbYfjbGZjzyrY0xVrDqt6LZE0Or+4bT9gSNALAukgaPUhkdEIveziQ8opk7mkOrN
	 fqr5UfTN55qGGND8YQRXHjdFrQPs7qNEoifgD9hmKqQW4MRdgEfAxQEGHE7nMo1F/h
	 ElDjSwZb5mONw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbKbH2v9kz4wc7;
	Fri, 10 May 2024 17:03:07 +1000 (AEST)
Date: Fri, 10 May 2024 17:03:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20240510170305.03b67d9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/phaN6En8VyuvkREbJ+fNkXm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/phaN6En8VyuvkREbJ+fNkXm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: warning: discarding dynamic section .glink
ld: warning: discarding dynamic section .plt
ld: linkage table error against `acp_dsp_stream_config'
ld: stubs don't match calculated size
ld: can not build stubs: bad value
ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_shutdown':
acp-probes.c:(.text.acp_probes_compr_shutdown+0x8c): undefined reference to=
 `acp_dsp_stream_put'
ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_startup':
acp-probes.c:(.text.acp_probes_compr_startup+0x84): undefined reference to =
`acp_dsp_stream_get'
ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_set_param=
s':
acp-probes.c:(.text.acp_probes_compr_set_params+0x108): undefined reference=
 to `acp_dsp_stream_config'
ld: acp-probes.c:(.text.acp_probes_compr_set_params+0x140): undefined refer=
ence to `acp_dsp_stream_put'
ld: sound/soc/sof/amd/renoir.o:(.toc+0x0): undefined reference to `sof_acp_=
common_ops'
ld: sound/soc/sof/amd/rembrandt.o:(.toc+0x0): undefined reference to `sof_a=
cp_common_ops'
ld: sound/soc/sof/amd/vangogh.o:(.toc+0x0): undefined reference to `sof_acp=
_common_ops'
ld: sound/soc/sof/amd/acp63.o:(.toc+0x0): undefined reference to `sof_acp_c=
ommon_ops'

Caused by commit

  9c2f5b6eb8b7 ("ASoC: SOF: Use *-y instead of *-objs in Makefile")

I am not sure why, but reverting that commit fixed the build, so I have
done that for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/phaN6En8VyuvkREbJ+fNkXm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY9xqkACgkQAVBC80lX
0Gzycwf7B9CD+9R/kHdWOZtlcpMly+NFwaJydfgRtU0Ao17agvrMSMSWtXuyAbIl
6tx1++38evnVQPciOnb9EnoG3TQw9um5RqcdTAcZoFO4hGbekCfVtALbKWMglIrh
nCXUppw/33cqeMMkbQFswopgsuK8Lzi3maf+0YxYW/8OjMI2NHK0SlceNklQ/dio
vFuV3glysPkLQiDrBcQQPJ8/6VSvxlKWk+PelJyEZr4W7GKyf7imxDFguMLj1d29
VJyH5oIXFVXI1YMT5UcqBIum+DJKzNRW3LAHgaJ0G7Fx+rOTt9EroJbGldko4inc
RulAsfoiTRmZwfO26DurjotbfHG5jQ==
=Tfhq
-----END PGP SIGNATURE-----

--Sig_/phaN6En8VyuvkREbJ+fNkXm--

