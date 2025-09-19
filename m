Return-Path: <linux-next+bounces-8391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B03B89BB7
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 15:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9821BC451E
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 13:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4597C1F3FEC;
	Fri, 19 Sep 2025 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eH80sZrB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCDC19D082;
	Fri, 19 Sep 2025 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758289851; cv=none; b=jH6Ce3D+dNsiMeqJhrQeM10N9bgko50oa3FvKjpGARnhfC1hHOZIJs5Na8KhPTvydyC9tw68GA4FuBr4ZuLoyXjZuIgxmZTyKXvel5QZ3vzPTTZ9TXa0ufnpKVxAOiS+kvWZlUNielagn37uKi6Nffe5due+fVo0E2p5p4lBlMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758289851; c=relaxed/simple;
	bh=APmglxlImg7snXtyYfD3PizdC1XK6EF0ZOmNsmlxANQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cjhl5TA5oFQZynvHozPf69ZGDetArcvXtcEp1irb1nd8BhVoXVDfLbawrokcgpvq9AifVQMuVJhLYIf/t5v0UOAfAbbhGL0E94/asaymG4UmM5wKrmF7xnsuxJeXHWhUHhjFkoe+RxrCpSUnEGI6k5t6J980d45WdCciTtn8QNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eH80sZrB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67989C4CEF0;
	Fri, 19 Sep 2025 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758289850;
	bh=APmglxlImg7snXtyYfD3PizdC1XK6EF0ZOmNsmlxANQ=;
	h=Date:From:To:Cc:Subject:From;
	b=eH80sZrBS6D+4aFhuTUhI0i1I7AhdoFBSKPyHE5AFAfP1hpGT72Cij/zSH+oniD3z
	 M3TLP6EanWsClMU910HeFkFUGyh4ooc7M9ssmFJ9Dqws9LqbYiqK9LeIYOaIXkNoHv
	 FxxSPsJfEoGrBbo4AZuR5yRYLyxZpdUEos0ziFmiTqaFskgr9rXv2LkGifZFZyMu9c
	 SJfs2cm1rJdSTnTY75PTKFpEzN4icCwPt669FgP66FXhMKVQcWkvWeOOZ15mZSPLnr
	 nTS5R35cPdW/vkcBv8U1PXr1oJJi1v+FehK2QWCO6PjKdDjAlie6q5xeoSaReJGB4f
	 4XRW66eQ82fXw==
Date: Fri, 19 Sep 2025 14:50:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mingwei Zhang <mizhang@google.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <aM1ftiUjafju0D6I@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8U0O9AGhR1myxKVD"
Content-Disposition: inline


--8U0O9AGhR1myxKVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/msr-index.h

between commit:

  0c5caea762de3 ("perf/x86: Add PERF_CAP_PEBS_TIMING_INFO flag")

=66rom the tip tree and commit:

  cdfed9370b96a ("KVM: x86/pmu: Move PMU_CAP_{FW_WRITES,LBR_FMT} into msr-i=
ndex.h header")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/include/asm/msr-index.h
index 718a55d82fe45,717baeba6db3c..0000000000000
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@@ -315,14 -315,15 +315,16 @@@
  #define PERF_CAP_PT_IDX			16
 =20
  #define MSR_PEBS_LD_LAT_THRESHOLD	0x000003f6
 -
+ #define PERF_CAP_LBR_FMT		0x3f
  #define PERF_CAP_PEBS_TRAP		BIT_ULL(6)
  #define PERF_CAP_ARCH_REG		BIT_ULL(7)
  #define PERF_CAP_PEBS_FORMAT		0xf00
+ #define PERF_CAP_FW_WRITES		BIT_ULL(13)
  #define PERF_CAP_PEBS_BASELINE		BIT_ULL(14)
 +#define PERF_CAP_PEBS_TIMING_INFO	BIT_ULL(17)
  #define PERF_CAP_PEBS_MASK		(PERF_CAP_PEBS_TRAP | PERF_CAP_ARCH_REG | \
 -					 PERF_CAP_PEBS_FORMAT | PERF_CAP_PEBS_BASELINE)
 +					 PERF_CAP_PEBS_FORMAT | PERF_CAP_PEBS_BASELINE | \
 +					 PERF_CAP_PEBS_TIMING_INFO)
 =20
  #define MSR_IA32_RTIT_CTL		0x00000570
  #define RTIT_CTL_TRACEEN		BIT(0)

--8U0O9AGhR1myxKVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNX7YACgkQJNaLcl1U
h9C2XAf+NFkZWgNowhB0zUL99Xtyrm+g6R3oSAhUh4zqQ/iSjznPlQcM4yEZKUzx
SWi4byobeu3KdKknL7fhnKM2W0Uu2dlQJZlf3+iyKJv2PVLIUi+3HzqUyYmqeqHa
t8oKQN5ywJ4OxVD2IqPX24jyJO5uQFgZru19z/bEvB34IDr8pKDI85pVEDa2b4ml
JQUalIqrkjD8rIg8hGipi6rlnY1WzLW5s6zgNlIAqzye85nCH1oj30RU/CI9U+Mq
fLAeQCavcN0QnlLoNLXJorZ2JBI68IH1b1ul3XHX+uMGBwkUViL49t2Z5Miarmt2
ywfhL/6K5HY84Hq/iIlWNI6C1zOfIA==
=Cd3F
-----END PGP SIGNATURE-----

--8U0O9AGhR1myxKVD--

