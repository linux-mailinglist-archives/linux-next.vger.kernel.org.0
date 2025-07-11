Return-Path: <linux-next+bounces-7477-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61DB01548
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 09:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 711921C461BA
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 07:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70661F560D;
	Fri, 11 Jul 2025 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HXmoG1V7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110E1F150B;
	Fri, 11 Jul 2025 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752220758; cv=none; b=MoPYUcnmDz/uFDMhRPQK6hsNrzT3VFfuy03Hr91YFrTPg+w0nc1JocoSFv2WLBuBvWctqeumfCUi2KeK1uvIISLEGG5B9N+P3pXTNXo8cdXP51Ysjvl4ofBRsggOkF99aTef5vx+b8sHk+4UObGrJoufCzRE0mUu+1ueZ1zh4ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752220758; c=relaxed/simple;
	bh=hyMZSXeWCgPhpHYf3eNbwwvfSghc8yPqYcZuBTXw9FE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uPL989Hf+FsKv5YXPgPmdO/joAZ19ZYnY+gKJGBodxwwNlXnoyhmdcsJsfCeLi5zGNvKai1G8H1QzO52oWJeTF5Hcum/PdNmtmQMSZ6ZBLKX19WaBQy9ACVG3wFx/77WyvdH/ce/FUqwxV7fU3FofkrWUeB7QHEht0pP6pMXTbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HXmoG1V7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752220672;
	bh=gpaJwdvHmXJaBDG7T4M66cm47RVLqZpr44OJ3GiC2wU=;
	h=Date:From:To:Cc:Subject:From;
	b=HXmoG1V72BAHZQEiQJeC8BWa3yWHcHSolGq3+sORx9kRY3+K+wSTSCUilexSD6mYU
	 VHWj5fSzX10EDnNUlDuT4f27qI3LX47tkAv1PslVosk7oOu3F/Eu+Tvlk6IcMf5koQ
	 kzSBpqU3K9ufd3nl9oGMIY1JwB/R6PuVhRW0kU2N6A2k/zg+VkOCyDe7S62hYlVd9t
	 /c++apHJ2OPwbdv51TXXGQ4XzvgLRMX9Z7H9eIPtYjI6E+mQUatMswC/zAIvB2iziC
	 1Ty41ZKn9y4hecWkAt/E52EQXv0Qaf0tD1NtTKUeXTDJdji6klSjDNMzpoU+VUwka1
	 rHXXIBMCFVVaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdkbM4qNBz4w2Q;
	Fri, 11 Jul 2025 17:57:51 +1000 (AEST)
Date: Fri, 11 Jul 2025 17:59:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250711175909.75aed946@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eLUEl4uYpOkCaBh+vvRACth";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eLUEl4uYpOkCaBh+vvRACth
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/pci.rs

between commit:

  4231712c8e98 ("rust: pci: use generic device drvdata accessors")

from the driver-core tree and commit:

  fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")

from the rust tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/eLUEl4uYpOkCaBh+vvRACth
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwxE0ACgkQAVBC80lX
0GzfPAf/eoZFTx6QrcmxEZseB2KD/AVDlUgUhKCBYnt+sJhZD+iIJ+983u+lTMEt
DCZ7DN0qvtlCoZZHRa6pvo9sfUvEC8XgyM6l7/KuaXN2FcYffqzonp8FBZA21esi
35856V1UXrimJJe8WkgNbwltadoyMTv4e++1sXmyYJ20pFA2ny+e+WsFSoNE7z0T
YPj71VbtHlYnbw4iZQZ4Rcy4EP7DHfa09DurMHsOpJWwNUn4oAxWjBR9VHHtTc7k
f3YDHbev0KqJg1SR4ZNj87Ex53lnQsucOXS5urSuNGSEnJHvhWnSulybFcN8/Mn0
iFKC5h/IdBFRYvibMfURjJFiA3Vf8A==
=LihP
-----END PGP SIGNATURE-----

--Sig_/eLUEl4uYpOkCaBh+vvRACth--

