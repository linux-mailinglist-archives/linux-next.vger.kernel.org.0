Return-Path: <linux-next+bounces-5134-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF62FA0888F
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 07:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6AAE188B44D
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 06:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B381CEAB2;
	Fri, 10 Jan 2025 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="POgirCsi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B021E507;
	Fri, 10 Jan 2025 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736491939; cv=none; b=fGz3opKkivk5f6DmVnHCFOT/Z6y6d9iNhrh/t4D99Zmm5O3WADFjr2/QLEHQ4GtERTGDtTcBJT2esk7ZPGLNGNYGHbt/HorFeKLw9LEHq5Bx7s2Lqc7AgZXZpZETijH6MpQIB0OCt2WP0HSCTfzrupNu7aLrWhCsYx6/TGZhW+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736491939; c=relaxed/simple;
	bh=bE0/S7m50XpxLogVYivqB5AKLdtW6hfDVaW9ZmFlKRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IXvsLaZFx/DulkusbGMl0Pq42KPIm8ubN71bFjOG/tXJB8uSNr7q3znOkqrJHvpQ+wlIwfp8/r4tpkWOMIyJwcHtO00ooZ4R1dIo1bC25O1V0L3xK+6HEWY8q5SMwywNfu2wungLeLr7fQRcqatcb+VZpj0zXRFLfRwMKvdERlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=POgirCsi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736491925;
	bh=JoWJ6Dcf3uCYfz76kUj9Rkk+rnT88qT+YEvLfSnEyPA=;
	h=Date:From:To:Cc:Subject:From;
	b=POgirCsiFCg9+ZkOHduECSqNY5EALBITDiV0qY/gcYTrlzkWqlT9+ZBYsr6UYAZMZ
	 IWeEuYSYdw25chgiIsfIq+C9lzYf7BmfgrGjAY+O7M8bV+JZRpG19xP+yAKS0qjBZD
	 w7nKu4McAXT+pD5QhN1l1rJaDRwhEuSOnn5IoZt4HRarahCUYfEOm9i/yFZFLqYcnm
	 uiIgtiauQgOHSR4PuXRIqvLItsuhhTji21UoZIEsoK8uazOB9GqUHayQGbbWIyMfPb
	 bF7d0Uc9F2ZPPrLI/kO0QOoxJNOWW5zgNjQvlR/0QnYYfFbeuo15ogosIUT8czCX+5
	 NgW23j/jIH/dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTslT4DTQz4wc4;
	Fri, 10 Jan 2025 17:52:05 +1100 (AEDT)
Date: Fri, 10 Jan 2025 17:52:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Jiri Kosina <jkosina@suse.com>, Vishnu Sankar <vishnuocv@gmail.com>,
 Vishnu Sankar <vsankar@lenovo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <20250110175211.485c52d6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hV_=wMkLnNrufWvqA4nCmPh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hV_=wMkLnNrufWvqA4nCmPh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: warning: discarding dynamic section .glink
ld: warning: discarding dynamic section .plt
ld: linkage table error against `platform_profile_cycle'
ld: stubs don't match calculated size
ld: can not build stubs: bad value
ld: drivers/hid/hid-lenovo.o: in function `lenovo_raw_event':
hid-lenovo.c:(.text+0x8cc): undefined reference to `platform_profile_cycle'

Caused by commit

  84c9d2a968c8 ("HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys")

I have reverted that commit for today.

platform_profile_cycle() is not built unless CONFIG_ACPI_PLATFORM_PROFILE
is defined.

--=20
Cheers,
Stephen Rothwell

--Sig_/hV_=wMkLnNrufWvqA4nCmPh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAw5sACgkQAVBC80lX
0GxxOgf/TucHL4bgHzey7SGpHF66EGHMqw9HuALbQez5OupMInXs3xNbY+p5I3ql
Npac5PEPC2WV4/tKzgo5HhQgFsb/quX4ddiJlOEFg7HfhOIPnh4yoGkFB7qy7ZF1
99ei5rbfAbbTTjtqdU1zYeZIDHnQj0usf/W8EnD1FEolBuUuDfkZ4OlYGYe0Hfzy
hdUbv5zl0jE3lvrxJ8WxDguNpDqRA3vUtATLUrt9imitAO7XdDA0zi16q0RjirFC
qFu4uiW9LVRggoQqrJMsDDDnb7kMhPbVZIWi+fq7kcHfb/3ppCuv1XsBuky5qFe+
seUP6K3mXXaA3ZYrbeS98dhBqB2nNg==
=n9sf
-----END PGP SIGNATURE-----

--Sig_/hV_=wMkLnNrufWvqA4nCmPh--

