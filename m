Return-Path: <linux-next+bounces-4995-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76769F7337
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 04:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A8F16D17A
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 03:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010A350285;
	Thu, 19 Dec 2024 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A7LGMmpq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AB54C6C;
	Thu, 19 Dec 2024 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734577578; cv=none; b=JRQB/iSkz3AlMqKnYtnZAL8eE4X5cIHGvg3DFX9GcBVsl9XLrJ/WsEr96Bg2+v/v6VVzm0aCTsCr2fLmBr0OtsBOWUuBlw2WeU+9mI8s6LBfbqblCZIRxZL8ZCFvoFdSvK7wpDnpgZ2/r2AsujgL2Z8ZoSpf/VoBB4couU5FFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734577578; c=relaxed/simple;
	bh=8W4H0daXvCPRLftjeyi8IBZInWJ8LwZ88dgD+jGl93c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BlxpMYNwmYUUVTlixAsEeTdFzIC/4IDue0mptoZWhbAk2jgRIIlN+CedGmDCL8na66D8rZuL3/zcsj17+q4sX1cAcXKLFx3Lbbe1NjbF1kaODWgKaF8Yoo0C8DbC/HJKq4tXglw4YfRu3FHhioz5mRdXPujZoAmy5LKyCeJQIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A7LGMmpq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734577563;
	bh=kWcqgR29lcC6pnk75D0FQLmtSNe5EZLoviONQpWrdBo=;
	h=Date:From:To:Cc:Subject:From;
	b=A7LGMmpqQuafvIgp3Z0mZPgz2QZvgdA1dpJsvoIzZnYPV284wG2FBeGjtxHtxD/Bl
	 9wkQ6zlRie95PHykqcVnKMJHh4uAX0wdgeXryD7sT4rj8NzAnIy2DDmsKOMXig8cMP
	 MSlneFznRBtSgXz+zaDVNUOl3lNwmI+vf3I5Q4cCwDcnIVLxoUlh3p9RlLCFOOTnPc
	 ajnXN6Bxrb9J/ZvBmJnKsfUjZhALgfOCoC64D883qZnrLh8ZWZwhBSySNABxHvMadF
	 LlgXk9WmfP13A23rR0QP+Nwrkp55f66hO93ECTYwFRgXujCL6CNuzLt7/fA7H/Uquh
	 YTaxu7I7GlsSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDFmm6F20z4xfW;
	Thu, 19 Dec 2024 14:06:00 +1100 (AEDT)
Date: Thu, 19 Dec 2024 14:06:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Subject: linux-next: manual merge of the edac tree with the tip tree
Message-ID: <20241219140604.3a67bf32@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0gpu66G1pcE38k8faEwHgnc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0gpu66G1pcE38k8faEwHgnc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the edac tree got a conflict in:

  drivers/edac/i10nm_base.c

between commit:

  85b08180df07 ("x86/cpu: Expose only stepping min/max interface")

from the tip tree and commit:

  2e55bb9b71e1 ("EDAC/i10nm: Add Intel Clearwater Forest server support")

from the edac tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/edac/i10nm_base.c
index 09bf5a3f06bf,70dff342c1b9..000000000000
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@@ -938,17 -938,17 +938,18 @@@ static struct res_config gnr_cfg =3D=20
  };
 =20
  static const struct x86_cpu_id i10nm_cpuids[] =3D {
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ATOM_TREMONT_D,	X86_STEPPINGS(0x0, 0x3), &=
i10nm_cfg0),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ATOM_TREMONT_D,	X86_STEPPINGS(0x4, 0xf), &=
i10nm_cfg1),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ICELAKE_X,	X86_STEPPINGS(0x0, 0x3), &i10nm=
_cfg0),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ICELAKE_X,	X86_STEPPINGS(0x4, 0xf), &i10nm=
_cfg1),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ICELAKE_D,	X86_STEPPINGS(0x0, 0xf), &i10nm=
_cfg1),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_SAPPHIRERAPIDS_X,	X86_STEPPINGS(0x0, 0xf),=
 &spr_cfg),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_EMERALDRAPIDS_X,	X86_STEPPINGS(0x0, 0xf), =
&spr_cfg),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_GRANITERAPIDS_X,	X86_STEPPINGS(0x0, 0xf), =
&gnr_cfg),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ATOM_CRESTMONT_X,	X86_STEPPINGS(0x0, 0xf),=
 &gnr_cfg),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ATOM_CRESTMONT,	X86_STEPPINGS(0x0, 0xf), &=
gnr_cfg),
 -	X86_MATCH_VFM_STEPPINGS(INTEL_ATOM_DARKMONT_X,	X86_STEPPINGS(0x0, 0xf), =
&gnr_cfg),
 +	X86_MATCH_VFM_STEPS(INTEL_ATOM_TREMONT_D, X86_STEP_MIN,		 0x3, &i10nm_cf=
g0),
 +	X86_MATCH_VFM_STEPS(INTEL_ATOM_TREMONT_D,	   0x4,	X86_STEP_MAX, &i10nm_c=
fg1),
 +	X86_MATCH_VFM_STEPS(INTEL_ICELAKE_X,	  X86_STEP_MIN,		 0x3, &i10nm_cfg0),
 +	X86_MATCH_VFM_STEPS(INTEL_ICELAKE_X,		   0x4, X86_STEP_MAX, &i10nm_cfg1),
 +	X86_MATCH_VFM(	    INTEL_ICELAKE_D,				      &i10nm_cfg1),
 +
 +	X86_MATCH_VFM(INTEL_SAPPHIRERAPIDS_X, &spr_cfg),
 +	X86_MATCH_VFM(INTEL_EMERALDRAPIDS_X,  &spr_cfg),
 +	X86_MATCH_VFM(INTEL_GRANITERAPIDS_X,  &gnr_cfg),
 +	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT_X, &gnr_cfg),
 +	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT,   &gnr_cfg),
++	X86_MATCH_VFM(INTEL_ATOM_DARKMONT_X,  &gnr_cfg),
  	{}
  };
  MODULE_DEVICE_TABLE(x86cpu, i10nm_cpuids);

--Sig_/0gpu66G1pcE38k8faEwHgnc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdjjZwACgkQAVBC80lX
0GzHQwgApNQ9tT8Ps8xyynIvvkPQOY9/RxXi4rUTQZb1JM4vam3ArxEpl/Vp5Wao
vV8fAJxN6GNUvIv9oEyY1Ymthl6ijIIWO3rzsiHk2X7J/W8YR2hpkufFiTSrwbl+
TGLUyOzXUAQMi7bKq6hNHtfkqL/oQT4Pt51kGnSXPL+J543dJ/ijRCVS4q+PGGz9
I2C2T3XsvTLI3dViJzUGCBeGugYxkS3OvvtI+68DHO7cPozUQusJ0dOq/6R+1zQx
ytIXXLEYVADeXYN1WG3k7FA4dDYDLYZKPUUTOvIHR1iun7g4m0Oo88URMRMsKg2x
zLr94FucoZa/Yb7vGjS78tOzzsqzXA==
=l9BS
-----END PGP SIGNATURE-----

--Sig_/0gpu66G1pcE38k8faEwHgnc--

