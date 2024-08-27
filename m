Return-Path: <linux-next+bounces-3463-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082A961AAC
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 01:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DBC528288F
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 23:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EB61D417F;
	Tue, 27 Aug 2024 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rMfA+WBo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D655D1442E8;
	Tue, 27 Aug 2024 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724801774; cv=none; b=DvCqpDJDQC140JlhSfehd9PGrN7Z/j21TSZxRdsIDYvr7FSxEi47MoS96BEhajmr+qpRkSyYPVFJ+hP+6UL1xqhsTEl316K2x6ix6BNrQm5LWpfPE8mb/lYRJhiNZ4jbD0hxJWryiVS6OxhUJdnyCW10U+rsaT8m10Ii+zDYDsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724801774; c=relaxed/simple;
	bh=qOALTF57Cc3BYIbN0N5+zwdS9ic3L7sQ2P/e6aNADo8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJGFf/hsN2YblXVh7DZQwkad7hsSJl9TkzOIoXUZMNRClMmFA/J8yva5iFa7h5OE7klWT0Tc/sCz523dVyPwGNT8sNVog4oTw/QYcL7qrq1JFJUtTYOkrnD2qeSlKGb/+MpQbt+l3TvgsZaRMLsA7tAFRHN7DIOkmmbgBHmR/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rMfA+WBo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724801764;
	bh=+HC/rC5SNmTrs+6H5oTU/XtGzav0M+9azHuK/Gzrez8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rMfA+WBoYZMECmFaV95epdfHysoc2J4znMPhsWBaV0FlIhO4yW/bUDmi6Ln7driqF
	 MET7HjDwgyjuEMQ5dLFoyYNYnhxwE7V2KZPgUhl9FgzKQTar8uPzmVHlSxFKgX9I7J
	 AAGcAlKkDDXzsjrzLdIE0bzi2wwH9Hd74vi9zq3nWp6+S8QvlUs9aM4i6B6Pr4SJAn
	 3ta2Q2TiZWNth48IMvdeBZ4WDqSFqt9ghEVBB6wk9kUbeK9OaCDkYZbS8Cubi242UB
	 cnBDuQW/pA3z4WU8+rSTXtDFgtjy3A8Vhr8LL5ls8BOu11217lkq5IMmJH+nYDNp8l
	 xNzf9+TZIwB0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtkSg5wvlz4wnt;
	Wed, 28 Aug 2024 09:36:03 +1000 (AEST)
Date: Wed, 28 Aug 2024 09:36:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zhiguo Jiang <justinjiang@vivo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot warning after merge of the mm tree
Message-ID: <20240828093602.1c08632f@canb.auug.org.au>
In-Reply-To: <20240826194648.407fdf58@canb.auug.org.au>
References: <20240826194648.407fdf58@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EghZR7.qgz1=uFaO8E.E.Sm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EghZR7.qgz1=uFaO8E.E.Sm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 Aug 2024 19:46:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the mm tree, today's linux-next boot test (powerpc
> pseries_le_defconfig) produced many warnings like this:
>=20
> Run /init as init process
> mount (55) used greatest stack depth: 28240 bytes left
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at mm/rmap.c:443 unlink_anon_vmas+0x23c/0x358
> Modules linked in:
> CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 6.11.0-rc5-06732-g133a683d26f=
d #14
> Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected) 0x4d02=
00 0xf000004 of:SLOF,HEAD pSeries
> NIP:  c0000000004d0208 LR: c0000000004d0158 CTR: c00000000121d230
> REGS: c0000000049bf550 TRAP: 0700   Not tainted  (6.11.0-rc5-06732-g133a6=
83d26fd)
> MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44004222  X=
ER: 20000000
> CFAR: c0000000004d019c IRQMASK: 0=20
> GPR00: c0000000004d0158 c0000000049bf7f0 c00000000167b100 c000000008b5e2b=
0=20
> GPR04: c000000008b5e300 0000000000000006 c00000000445a108 000000000000000=
0=20
> GPR08: 0000000000000000 0000000000000001 ffffffffffffffff c0000000013550d=
8=20
> GPR12: 0000000000000000 c000000002b90000 0000000000000000 000000000000000=
0=20
> GPR16: 0000000000000000 c000000006cea000 c00000000405e3c0 c00000000655650=
0=20
> GPR20: c000000006ce5000 c000000002a30308 0000000000000000 c000000008ba839=
8=20
> GPR24: c000000008ba8388 c000000008b60310 c000000002acb790 5deadbeef000010=
0=20
> GPR28: c000000008ba8398 5deadbeef0000122 c000000008ba8388 c000000008b6030=
0=20
> NIP [c0000000004d0208] unlink_anon_vmas+0x23c/0x358
> LR [c0000000004d0158] unlink_anon_vmas+0x18c/0x358
> Call Trace:
> [c0000000049bf7f0] [c0000000004d00f0] unlink_anon_vmas+0x124/0x358 (unrel=
iable)
> [c0000000049bf860] [c0000000004a7eec] free_pgtables+0x1d0/0x368
> [c0000000049bf930] [c0000000004bce20] exit_mmap+0x1c0/0x578
> [c0000000049bfa70] [c000000000151f80] __mmput+0x60/0x1e0
> [c0000000049bfaa0] [c0000000005a6980] begin_new_exec+0x6e0/0xed0
> [c0000000049bfb20] [c0000000006405a8] load_elf_binary+0x460/0x1b68
> [c0000000049bfc70] [c0000000005a4088] bprm_execve+0x2ac/0x754
> [c0000000049bfd40] [c0000000005a5de0] do_execveat_common+0x188/0x250
> [c0000000049bfde0] [c0000000005a71c4] sys_execve+0x54/0x6c
> [c0000000049bfe10] [c000000000030980] system_call_exception+0x120/0x310
> [c0000000049bfe50] [c00000000000d6a0] system_call_common+0x160/0x2c4
> --- interrupt: c00 at 0x7fff98ea1638
> NIP:  00007fff98ea1638 LR: 000000001004a12c CTR: 0000000000000000
> REGS: c0000000049bfe80 TRAP: 0c00   Not tainted  (6.11.0-rc5-06732-g133a6=
83d26fd)
> MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22002824=
  XER: 00000000
> IRQMASK: 0=20
> GPR00: 000000000000000b 00007fffcec19410 00007fff98f79900 000001001dc2041=
0=20
> GPR04: 000001001dc20440 000001001dc20450 0000000000000000 000000000000000=
0=20
> GPR08: 000001001dc20410 0000000000000000 0000000000000000 000000000000000=
0=20
> GPR12: 0000000000000000 00007fff98ffa9a0 0000000000000000 000000000000000=
0=20
> GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100b8fd=
0=20
> GPR20: 00000000100d03a2 00000000100b8f90 0000000000000000 000000000000000=
0=20
> GPR24: 0000000000000000 00000000100e77b8 00000000100b8700 00000000100d03e=
6=20
> GPR28: 000001001dc20450 00000000100d03e6 000001001dc20410 000001001dc2044=
0=20
> NIP [00007fff98ea1638] 0x7fff98ea1638
> LR [000000001004a12c] 0x1004a12c
> --- interrupt: c00
> Code: fbbf0018 7fdff378 48033221 60000000 ebd90000 7c39e040 3bdefff0 4182=
00a8 e87f0008 e9430038 312affff 7d295110 <0b090000> e9430040 312affff 7d295=
110=20
> ---[ end trace 0000000000000000 ]---
> mkdir (59) used greatest stack depth: 28176 bytes left
>=20
> Bisected to commit
>=20
>   1cd7eb306a54 ("vma remove the unneeded avc bound with non-CoWed folio")
>=20
> I have reverted that commit for today.

I am still reverting that commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/EghZR7.qgz1=uFaO8E.E.Sm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbOYuMACgkQAVBC80lX
0Gzwagf+Ob/x/WgJ23WG5A2KaUNrj55FTc8+5BCCMdmPG40bSRKWDG5C5HIhkNEB
5pux7qDgCFz7UTS1YKYaWgcewoiwe2828RcTzpW/+3l1+B5kFeNEDd18CuYxFEsC
zCcot17PmPPxZo7bjxW/oCzwrY/vs7/puZNd9d9ddCiI909Zko4Z3/OBQ1xPY1eS
HmdFxwyQfNEB180e5SAyIW9R19mG+ce23tZIpukiX2388O7i161Y3jasQwIWfdNs
wnMqgkThCEWNYb/LNCZ3h7gGPGWJDoPUrfQY96+VHC3fkbpFBuTqrkFUVAlFe+P9
IoYBf9auScZ7kZF0tfx//lnZTHi9fQ==
=dAak
-----END PGP SIGNATURE-----

--Sig_/EghZR7.qgz1=uFaO8E.E.Sm--

