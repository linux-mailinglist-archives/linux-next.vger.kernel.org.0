Return-Path: <linux-next+bounces-6814-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E596BAB9989
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 11:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 526527B536E
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23BF233727;
	Fri, 16 May 2025 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vkudkfw+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CBA231837;
	Fri, 16 May 2025 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389292; cv=none; b=LkMGWC4P6O4nfxXJJK3mYM8jAq8Rw/Y/z91pdVVcau2+f/NRG1qLZ0tAZfbF6epGBnPmRXIwAw3PcQxcv+DAPYgFzOLPQRnzEDw/LwsMsfYh7oLVNbOlhi8pXTqHDQaM0vr1MoGJNs2YvXBH3b0AhZDLeeIoDDE2EthJCJy7Qrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389292; c=relaxed/simple;
	bh=c0iIl7dJXWna8S1DBQZPoPO7ke8+5gOze/1BvGwFB/s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZjcpHIIUUShdeJiD7Ty9uFYKYEtw1rjRWdGW0VqWsNEPOMVZ3mA4Dy3WkddNezkVUE+aIrMdhxF7l9Dt1OH3LIK/CiRC/dLzo7yln16WND5XHtN7hsSwaAm8vRaYoZJDfOT2RufK76WKfpz7P4hiOPxYU34XKAs2Xv+lXBhru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vkudkfw+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747389287;
	bh=jDeYi4hO2+10znc75difMvtZmuJ188y5tW3/0jbzEGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vkudkfw+ldEnbtby5RDZRxhpw76cbq6ti2Rx10gvpcwcWcRM3xZnbUrhZXyR/jr3g
	 5AWcKZt5S1I8A38xpWS8Uw8EJCOH+UINRoy6es3WCh/3xAba/5hUrCO1+KJ5Q4420W
	 oeT7bdswOTv0ugFHZO/GVNygCYlwkQnAj/C3glPjYWT6OQNA+IJxIarbWaKQnHAwDi
	 SU8lWcjNLMGjZmqpQSvU1c5/BNnDpbb3cp2hDcjQC/zNMGfrbPfcM5EWKT97BBHOs1
	 njAfgNciLW0UAu6KBmyOjET0y52mfEjozShlHbBgVTOniouuk3DYj8DsPPniORixFR
	 AnAHc2TN+mr4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzMr65b6Nz4wcd;
	Fri, 16 May 2025 19:54:46 +1000 (AEST)
Date: Fri, 16 May 2025 19:54:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, "Ahmed S. Darwish" <darwi@linutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250516195446.1331ac06@canb.auug.org.au>
In-Reply-To: <aCbvO5Q0B3yYxji4@gmail.com>
References: <20250516161541.0cff29b8@canb.auug.org.au>
	<aCbvO5Q0B3yYxji4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_wVQ2Q4E=Z6=pvU9HE0DJkb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_wVQ2Q4E=Z6=pvU9HE0DJkb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 16 May 2025 09:54:35 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
> So I don't think the <asm/cpuid.h> change is needed - the header still=20
> fully exists:
>=20
>   starship:~/tip> ls -lh arch/x86/include/asm/cpuid/api.h arch/x86/includ=
e/asm/cpuid.h =20
>   -rw-rw-r-- 1 mingo mingo 6.1K May 16 09:34 arch/x86/include/asm/cpuid/a=
pi.h
>   -rw-rw-r-- 1 mingo mingo  149 May 16 09:34 arch/x86/include/asm/cpuid.h

That change is in the tip tree and involved in the conflict, so I just
used it as it was in the tip tree.  This is normal conflict resolution.

> And the <linux/sysfs.h> addition is probably a build fix for the PM=20
> tree? The <asm/cpuid.h> header's indirect header dependencies did not=20
> change. Should probably not be carried in -next, as this masks a build=20
> failure that will then trigger in Linus's tree?

Well, it did not fail building yesterday (without the include) and
looks like the commit is adding the first sysfs use in this file ..

Mind you, if the sysfs.h include had been added a line or 2 higher up -
or even if there was a blank line between the linux/ and asm/ includes,
there may have been no conflict reported and git would have produced
the resulting file with both changes all by itself.
--=20
Cheers,
Stephen Rothwell

--Sig_/_wVQ2Q4E=Z6=pvU9HE0DJkb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgnC2YACgkQAVBC80lX
0Gwe7gf9E6XyrZUQ/x29fidSris5oEq8H+8IHMlQnVg69w5cmDnpAci+tXVbG7uH
wjlxT1dNmtELA9s9KxPEqMTWtZvs0E/UwxxYkf5Q/leKR+tDS4DOz7bnBm0gml4z
+hEQam9ryMYYARwWdYWWsKcJt5UB9AcdS+jDUgwZRap3BxaX6AEiHcrhoyJzDy/r
KunDG0l9//VQ5gtl2R2PPl1C0TixtGPUK81q/SFTeEa+wL8VeXSjsQmmsG10S/eu
0hYp/ERPHIQT4efXz5VynC49SIjnbaIk7nZ/m7Otg8w3COJ/KQurqsVGULHT2MUU
pTVC9kzUshus5R5BEP+mioGWbYIhgg==
=sDmX
-----END PGP SIGNATURE-----

--Sig_/_wVQ2Q4E=Z6=pvU9HE0DJkb--

