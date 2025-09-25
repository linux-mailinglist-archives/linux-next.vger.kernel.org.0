Return-Path: <linux-next+bounces-8490-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95365B9FDC4
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 16:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27541C2549F
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83D928C2BF;
	Thu, 25 Sep 2025 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfvq3jlm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8050128C5AA;
	Thu, 25 Sep 2025 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809164; cv=none; b=kFIBtvMLYAggS2w/8lcisThGNHannxDUqT9SJPbuWG1T4TaD8DVR4LwfZ1AJNGniq7aCMB87L2gRXJZCgj/3Q7FF7419b0YX4TZe85Otao3YfMUYYYWTZvT54epzF08/ZXxC82SzEEzM4AO+VsmXfy7YiuF03tlzlEdCMCFbba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809164; c=relaxed/simple;
	bh=qwOjyCwOolTaR7EQcx24KznBowYJ5bSUlzg8zcIWqRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dP0wQgwj5dsaRDtvhSfTtDtrukIkiBQMnWftHCuoYn9Sia5GCyF5HLq5wnj8NNDocKCAqfZ02JWxDUYUaP84wu65N1RiqxoiBbux07hX28LFbCjgCxG9twYXvgyLGIfK7PAkPZqTaEIJxcWmw0uhvJht878zC8Og8LbjmA/oxbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cfvq3jlm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9E6C113D0;
	Thu, 25 Sep 2025 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809164;
	bh=qwOjyCwOolTaR7EQcx24KznBowYJ5bSUlzg8zcIWqRA=;
	h=Date:From:To:Cc:Subject:From;
	b=Cfvq3jlm5e+UZMh8wPmiquqDrNqEbxS8utvnrArCLQUcVJT7kxD79D26OijzUKSNV
	 mqhl/Tzz21zSIsHRENfpvyEac/B0Q/ovzxTymWi82kjXQ703hasJM7EbwgULEXv4Vo
	 nfta7z6QiqxR0HzmOMkO7NkNGi1k9RuyKB77ZiKsV8Re7riS1iPDbzvXcRPzEVnXw7
	 hw8M5P2qk4Q7l4TtlPnWiIKNnPamKhwQ3P61Av1MMm6c9c7gGrGlb5IbnlOLvMydT0
	 EIUMUwGJMH0GC6a3ShRbiIXmytVOs6pmdYxcI+aANtbeDazR3Ds0ZsedtxjFh2YVWK
	 DSXnqoJjwfRDw==
Date: Thu, 25 Sep 2025 15:05:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the bpf-next tree
Message-ID: <aNVMR5rjA2geHNLn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5LAhVdHCP2VDM+na"
Content-Disposition: inline


--5LAhVdHCP2VDM+na
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/events/uprobes.c

between commit:

  4363264111e12 ("uprobe: Do not emulate/sstep original instruction when ip=
 is changed")

=66rom the bpf-next tree and commit:

  ba2bfc97b4629 ("uprobes/x86: Add support to optimize uprobes")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/events/uprobes.c
index c2ff256dd6419,996a81080d563..0000000000000
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@@ -2741,13 -2765,9 +2765,16 @@@ static void handle_swbp(struct pt_regs=20
 =20
  	handler_chain(uprobe, regs);
 =20
 +	/*
 +	 * If user decided to take execution elsewhere, it makes little sense
 +	 * to execute the original instruction, so let's skip it.
 +	 */
 +	if (instruction_pointer(regs) !=3D bp_vaddr)
 +		goto out;
 +
+ 	/* Try to optimize after first hit. */
+ 	arch_uprobe_optimize(&uprobe->arch, bp_vaddr);
+=20
  	if (arch_uprobe_skip_sstep(&uprobe->arch, regs))
  		goto out;
 =20

--5LAhVdHCP2VDM+na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVTEYACgkQJNaLcl1U
h9AWmwf/YB690biEQ07FUoa3KLaQrXJTZruYuUwKmf8CRoxxjfKjozPZcgIE6ah8
H18vF/wTtFPWIa5p63xsn27T2qp+O733k8hPEG3/78oUZnN1AE5G04FKvTp1Z1K9
siCQIXz9RmwFT4g6FUHbyri+e8f3ydtdgYFA3MXQPJPk1gH76WdOvtiXzn9eGat1
LuoM0sW0W06Qfa7eyHIBOObhzWXGdPszAyQZh6ozbDp7dFqqnoiaYoVBGPuUUopX
3JnTjliiXenSVutfh2zFPCd6P2Dm4ArVhYop5bXZnetownHP3HKUZHxwVGiv72tm
nmtl0xjNXo0hEPGZXwChzKewy6T48g==
=CP6V
-----END PGP SIGNATURE-----

--5LAhVdHCP2VDM+na--

