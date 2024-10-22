Return-Path: <linux-next+bounces-4369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8429AA127
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 13:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493101C21802
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 11:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E0319AD7D;
	Tue, 22 Oct 2024 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="knh1Tm8R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F4E6F066;
	Tue, 22 Oct 2024 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729596589; cv=none; b=BQgOGt7/n+58FV4AwjJ8CIzlsyY6M1Tjr27Z4jHrVahy9zvwQW6Jc/G3C9Rh56aLlHBS53fpHPkDUg7i66fJDbgnIYrn1V30QnIsTNKASI2gq9vyRZIR7x75RnhYrbXCNGh+m4Uq1/mZlcJb7saG4u1o9AP696MwO7QUMmiaxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729596589; c=relaxed/simple;
	bh=AvRcr1OuM53X9PR/zID+/yywEkwEKsNy6ow7SbV2GUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l8EONi64pc2vE8V203fhV+ygZ8HYaeOfMSv51+lI13p2BaYQ06+sjArfddC2xoL02G3nLHWq/7IrqB7NbSHqxXrD5boz3mIJgyyifhMD+6wyihhje8Q64u/M4ZN+HQ2P8bpVytEVh637uDT0ZMrXIm9g0OwKYCFR/+8nRxJZwM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=knh1Tm8R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729596579;
	bh=yRSI65zZHzYMUTqH1Kk9yL4lXnKknG8Nhg42hp0r/u4=;
	h=Date:From:To:Cc:Subject:From;
	b=knh1Tm8RWeVxL5bwB7JDHoRjMMZZ6PzVDzOIyCrPMcM8phDlif4wUM9e5nPsWNBfk
	 sEpfE+ppcM4snwvfxRdd60DfVPT9H5lt/mfNeDmrLZsVfv27YJdkgUTaN47faqL/05
	 Hp3yS0uiCkSpmf2iWnqlQEQS8OH+izdIA2Sa22BEfBVeFd/s1UK5xKbUkZG0eu5XDl
	 Ox5a/eiA2tKFtOMmYvcOhoa+4C+5qZUlUHtBnVL7Hd9K9FPp7sOo7S63bcdqV1Vqt9
	 Q1qlrMnhpcTcyzHMYOgR3aAubwe2sIaF1V3wBfWvt55RwiWhTNFwQvzDi7KnKcLF9C
	 z2VRJRG1ebXMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXqhf698wz4w2F;
	Tue, 22 Oct 2024 22:29:38 +1100 (AEDT)
Date: Tue, 22 Oct 2024 22:29:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, "kernelci.org bot"
 <bot@kernelci.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sched-ext tree
Message-ID: <20241022222938.46a90386@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QLcGEWY/wM9vZfUU_WKxlNO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QLcGEWY/wM9vZfUU_WKxlNO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sched-ext tree, today's linux-next build (i386
i386_defconfig+kselftest) failed like this:

kernel/sched/ext.c:6788:45: error: =E2=80=98fmt=E2=80=99 undeclared (first =
use in this function)
kernel/sched/ext.c:6809:45: error: =E2=80=98fmt=E2=80=99 undeclared (first =
use in this function)
kernel/sched/ext.c:6841:61: error: =E2=80=98fmt=E2=80=99 undeclared (first =
use in this function)

Caused by commit

  3e99aee7ce48 ("sched-ext: Use correct annotation for strings in kfuncs")

=46rom the kernel-ci.

--=20
Cheers,
Stephen Rothwell

--Sig_/QLcGEWY/wM9vZfUU_WKxlNO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcXjKIACgkQAVBC80lX
0Gz7ggf/WzLKi+/W6FBy/PwqhoyFr0t6hqWVJ8NSZnCOU9/qfUyNkmNZdw5C4VFG
RaA8XwpbfiV2TMOLIr+X9CXYSSBoZ3bJnTsBXphEnVqPG14A5n7WiAWSoVIpuqGW
yXzg+0hhY546FDP/MEQ0aQ0p8monF/CRw8wu8Ekus21qdS5BNV8PrSzd6vb9CjD9
hKW8sVFmFd6iwfftS4FK/agnOJAeawF8xheNfmh/oPNTMiMRfm3iKfCRbB+t/bNa
TYBc0BfXbeIPxWOtZQf/Er3bFOKmXfMsZCAjlLHCdMYAHQy5B8kWz2RE7zkRWnBs
lVJBzg0ZWw0Y3RKorXJHFzbl7QmIgQ==
=1Ezn
-----END PGP SIGNATURE-----

--Sig_/QLcGEWY/wM9vZfUU_WKxlNO--

