Return-Path: <linux-next+bounces-3419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E095EDA0
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 11:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49811C2154D
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 09:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC07145A01;
	Mon, 26 Aug 2024 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ciBCQ1Pi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49629A2;
	Mon, 26 Aug 2024 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665619; cv=none; b=Y65irh3oDHirxGYirmkQinskOgcrvxpOyYA90E5h4s6YIZXR3UNS08tZesjx4WxiXsPbcEQZpc9seVLmswbwQ0uD0d8InR+g/FOeQMT9DfPdMmDHQZi4LS1L/7w+b7dLrG5cjMkJ4FZ9fUtEmCvC9F8npn7+rxSWf6UamG/OPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665619; c=relaxed/simple;
	bh=mCXIn7qsNRE20+tOnqqQbOI6naJ2PK9DJLRExbHkxXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IK9xXOKWFEYZTeP68DSdWekqJcJmGR1Mus0f3gm19CoWa8rhv7XYwrzrNxd4sPBhvkg2FSndYySEXXAwjPdL/TZ/aygl3nofYh+m/tFoXcwBrWwTOuhORSaAAa7pAvD/90NHzOmRWc38Ili+GkUul/LyhIs91TDediKqVzb6Dm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ciBCQ1Pi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724665610;
	bh=I/OcPAIhAo/+/MJKv9T9G17d+Q2/Hwz2KsPesi4T8nU=;
	h=Date:From:To:Cc:Subject:From;
	b=ciBCQ1Pil0X+TE2iSscNdfQ14CCuqyHfPDujxvumWvJGRWJghMyRZDNrn3fkJOQzo
	 DnMedAgY5qoH8giM98Frag/wDP4Xmo5qzhE5OWaWPvteTQiGSwoqXzdTdbFtDmkKiw
	 4lsffe0tzQMm/TCVOIIzcw2mwlRuwpJ2BwcZsylgZWcXKpnP5vDPYx4GkG2dtR40Vw
	 91wNtb21/oK1W1IQRlUoXDIP2ue9ofr0+JUWCD7g57OWF2kz2RHDxxdKxNuWWB+/QH
	 urj93rPDjDnXqBaJzISQZrRogBz2R+6VrNfbJbLw3oqTOUoz3ZCJVkXGhjaNINQWRe
	 Ym9tbFsY3dVRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wsm6L47L6z4wbr;
	Mon, 26 Aug 2024 19:46:50 +1000 (AEST)
Date: Mon, 26 Aug 2024 19:46:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zhiguo Jiang <justinjiang@vivo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: boot warning after merge of the mm tree
Message-ID: <20240826194648.407fdf58@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/679xP.HeWYbJhl=NG=mSkoa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/679xP.HeWYbJhl=NG=mSkoa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next boot test (powerpc
pseries_le_defconfig) produced many warnings like this:

Run /init as init process
mount (55) used greatest stack depth: 28240 bytes left
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at mm/rmap.c:443 unlink_anon_vmas+0x23c/0x358
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 6.11.0-rc5-06732-g133a683d26fd =
#14
Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected) 0x4d0200=
 0xf000004 of:SLOF,HEAD pSeries
NIP:  c0000000004d0208 LR: c0000000004d0158 CTR: c00000000121d230
REGS: c0000000049bf550 TRAP: 0700   Not tainted  (6.11.0-rc5-06732-g133a683=
d26fd)
MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44004222  XER=
: 20000000
CFAR: c0000000004d019c IRQMASK: 0=20
GPR00: c0000000004d0158 c0000000049bf7f0 c00000000167b100 c000000008b5e2b0=
=20
GPR04: c000000008b5e300 0000000000000006 c00000000445a108 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000001 ffffffffffffffff c0000000013550d8=
=20
GPR12: 0000000000000000 c000000002b90000 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 c000000006cea000 c00000000405e3c0 c000000006556500=
=20
GPR20: c000000006ce5000 c000000002a30308 0000000000000000 c000000008ba8398=
=20
GPR24: c000000008ba8388 c000000008b60310 c000000002acb790 5deadbeef0000100=
=20
GPR28: c000000008ba8398 5deadbeef0000122 c000000008ba8388 c000000008b60300=
=20
NIP [c0000000004d0208] unlink_anon_vmas+0x23c/0x358
LR [c0000000004d0158] unlink_anon_vmas+0x18c/0x358
Call Trace:
[c0000000049bf7f0] [c0000000004d00f0] unlink_anon_vmas+0x124/0x358 (unrelia=
ble)
[c0000000049bf860] [c0000000004a7eec] free_pgtables+0x1d0/0x368
[c0000000049bf930] [c0000000004bce20] exit_mmap+0x1c0/0x578
[c0000000049bfa70] [c000000000151f80] __mmput+0x60/0x1e0
[c0000000049bfaa0] [c0000000005a6980] begin_new_exec+0x6e0/0xed0
[c0000000049bfb20] [c0000000006405a8] load_elf_binary+0x460/0x1b68
[c0000000049bfc70] [c0000000005a4088] bprm_execve+0x2ac/0x754
[c0000000049bfd40] [c0000000005a5de0] do_execveat_common+0x188/0x250
[c0000000049bfde0] [c0000000005a71c4] sys_execve+0x54/0x6c
[c0000000049bfe10] [c000000000030980] system_call_exception+0x120/0x310
[c0000000049bfe50] [c00000000000d6a0] system_call_common+0x160/0x2c4
--- interrupt: c00 at 0x7fff98ea1638
NIP:  00007fff98ea1638 LR: 000000001004a12c CTR: 0000000000000000
REGS: c0000000049bfe80 TRAP: 0c00   Not tainted  (6.11.0-rc5-06732-g133a683=
d26fd)
MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22002824  =
XER: 00000000
IRQMASK: 0=20
GPR00: 000000000000000b 00007fffcec19410 00007fff98f79900 000001001dc20410=
=20
GPR04: 000001001dc20440 000001001dc20450 0000000000000000 0000000000000000=
=20
GPR08: 000001001dc20410 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00007fff98ffa9a0 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100b8fd0=
=20
GPR20: 00000000100d03a2 00000000100b8f90 0000000000000000 0000000000000000=
=20
GPR24: 0000000000000000 00000000100e77b8 00000000100b8700 00000000100d03e6=
=20
GPR28: 000001001dc20450 00000000100d03e6 000001001dc20410 000001001dc20440=
=20
NIP [00007fff98ea1638] 0x7fff98ea1638
LR [000000001004a12c] 0x1004a12c
--- interrupt: c00
Code: fbbf0018 7fdff378 48033221 60000000 ebd90000 7c39e040 3bdefff0 418200=
a8 e87f0008 e9430038 312affff 7d295110 <0b090000> e9430040 312affff 7d29511=
0=20
---[ end trace 0000000000000000 ]---
mkdir (59) used greatest stack depth: 28176 bytes left

Bisected to commit

  1cd7eb306a54 ("vma remove the unneeded avc bound with non-CoWed folio")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/679xP.HeWYbJhl=NG=mSkoa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbMTwgACgkQAVBC80lX
0Gz7Hgf/SkPRykVm+r9mUMVwXAytiICg8PYztU5H3Pth1yvSI/EHdAgD2GkYIgj7
fsOOVkSuEQvmyZ17HY0hmD8jQQmvf5BfWc7hA2VX/kPdwv2OtQp9VXYog5anMxz3
Rw/PEcnSNyHEfsPSFG95AFj36FjWq06rR+g30BxDRjPu36DWNKCXuTLmQ7iq84dM
KoXoWYOFZEnLFY02G69lLhrH355qlrWaPCzFdRSQL3MQ+PIG8QVQPSTZTvolBAq+
gCGcZAuE9dpLspZzL8VtleK/QM4vH2eishGzXMQBtB9RCOW7QC8WO4PZm6VJLU6I
emvcjTW0eUxJ3esgEp6CRTZ8FYFGvw==
=BD+p
-----END PGP SIGNATURE-----

--Sig_/679xP.HeWYbJhl=NG=mSkoa--

