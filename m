Return-Path: <linux-next+bounces-8148-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A25B3D606
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 01:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2070D178471
	for <lists+linux-next@lfdr.de>; Sun, 31 Aug 2025 23:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C1725487A;
	Sun, 31 Aug 2025 23:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fYjFTuwg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F84247289;
	Sun, 31 Aug 2025 23:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756683277; cv=none; b=WN66aZFe8mnd+JLI+Zn3ImY6tjC3OB/6G8OoFDa1WzUjgdE8Lb+mP91F3o5LRSUE1q62wxZAd+WSWZk42Jns6iTvL99Xzc6V7jk/Yzrlgfp7UwhvEQCdF0mP40iKATAJ9byz1U2puTj9EG/mf6kyWkDHLoUU8pByDZlmiSgefEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756683277; c=relaxed/simple;
	bh=ymrzeNIShIv6xkhQhUvQsWdeocVzVpL0bHSK6qmoGA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FHz0A5E6QPGNXepu8BBPpDdogD2flxNvAbMYueJODemtC72PCxILL8rGVJv3LTejxGT8PU6uaBzaTjeiqq0szk/XSkKoDRRjq/D5z3u6gVdGnsH1iyhjuq4HJ5yOz2noamip3IdVvKHW/Ezxyp1oQJHdtlHsTGWatK6dAiv/pn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fYjFTuwg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756683263;
	bh=Jt2gLyAJ3+wL/1niynWX13ulsMxmFCVtbbJt9nPvhLM=;
	h=Date:From:To:Cc:Subject:From;
	b=fYjFTuwgubZPcIK/e1TuFZerhz9Gtl82cBoLqzQ03MWS4pSZFm1k5+SBEPhTseo9T
	 oCm641NMnIyyJaftbc6RRa/XOkAxFNzcrsElihQ+bGjbs1NefMqfWMaVVbKfVgkIXc
	 gzRP+BUj8SPtqQ4XBoXBhez5w2TQoOVxZPfuUDA65O9Gep5JA09DUWdx1ordK7R77q
	 NbzgiqgFBIf3zkaSiAFghb6qvg+UQA/vRSZ0utNh+pC/wNC9gZvJ2uPyrNgX6qJIkw
	 tijKFEoXBAxdYPgKLylclD7O6AauvlmzYoyhQHlcz6Qgo4otZ9hAnawg4d+yS5+MGM
	 5PPA7RYQDC1Mg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cFSyR2CvCz4w1h;
	Mon,  1 Sep 2025 09:34:23 +1000 (AEST)
Date: Mon, 1 Sep 2025 09:34:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250901093422.63c8ec04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/awC/Jjb3li9gS/idcrcVssT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/awC/Jjb3li9gS/idcrcVssT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0425]: cannot find function `to_result` in this scope
   --> rust/kernel/fs/file.rs:402:9
    |
402 |         to_result(fd)?;
    |         ^^^^^^^^^ not found in this scope
    |
help: consider importing this function
    |
10  + use crate::error::to_result;
    |

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0425`.

Caused by commit

  bcd0b5f0199b ("rust: file: use to_result for error handling")

I have used te vfs-brauner tree from next-20250829 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/awC/Jjb3li9gS/idcrcVssT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi02/4ACgkQAVBC80lX
0GztLAf8C25ounOc5Nm/F2aGbwk7DhKyZ8N/cU54aKHiAGe6e5ofhJFzbnPiCi6P
cMh0l+0+fK3fYZ/aVlWDs1AyBWJ1yAtQtKfxckQH8fabkiTh1BpP2o3VSmeSsMXN
A2yeyNFCdHICNUvyeg2pEyruhcl/pcXhIiY0hLhRjfxFTNVTU7qEmF0BoVCwMjX3
Q1SIQ2YedM/R07jVf7lzyAmSvZhjZPHeMwbvCt96PdEHULOY6uSerC7MfysJi0DB
Nnw0JhOAIjCM/lXGaPHv/UAagDKjdR9xAQjPa2+1fIJpZq2YjVY0I5b0iIKw8VKy
FOZlXqXLSV9h0cOjieA/YQ56w07zwg==
=SlFI
-----END PGP SIGNATURE-----

--Sig_/awC/Jjb3li9gS/idcrcVssT--

