Return-Path: <linux-next+bounces-9398-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3ACBCC09
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 08:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C49C30088B9
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 07:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2698030C601;
	Mon, 15 Dec 2025 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L0xB8GpC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B037210F59;
	Mon, 15 Dec 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783282; cv=none; b=BIpk1AeIGIbHRRYX5U3bRMbM7k28AIrwTtypNjcgqb0rkmW4pfmLKyJXWQmfvXwub/F/wX96J4fMP919bjPEotKx141i/Zd2n1qqUv7o1VBTVjA+cdLhCLaWthm9Qush/60Jn6/Tpro61Ybzx/OjD0IZb6mO6h1o3a6uHb9hQFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783282; c=relaxed/simple;
	bh=kB2fGrLsdP/6UlF/6QBw5cOgj3BoRPoEIJ+EgKxap8U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3Mh13seSXuzLGko9sLbuNeleWQn0tR2X/a/J9MT4+/1z/7kKTfQ6+02lPPJkU5ShPjIVwHTFMbRDKaY4GqusIb7at5UT/7WKpBK4+5KSsrCvlazCezAYJGWTso4fFU1wQ6MJAsKEEDqocF5E9eJn2cPLypZ7W7tnkFU2hD+sTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L0xB8GpC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765783275;
	bh=xvsn4/0s96R8++Ps8zuONh1weNAySLWN+gAmfeNierE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L0xB8GpCJj5I5BkZPMgB4Tqr1AexPpJxtjhJR+TlBEZtDLRAtsCZ6rteeVcd4n+Oc
	 VGkBoy85Rnkg59+AejWI6eMDiGQVfK0JsDIQsNUisk8E/Ii5TwAXwDznJuLjIAYQOD
	 u8KzFkUHfTZRXI2tV+tOUo07ViqYxDiKDvflg4Wut2oTGWZwNTsNwz8MFYkmZWbYeB
	 1K82dJJ8Brs7bVTVZhK9Pgjw78fE+O67V0NLPKULYibo2l8RpL3yF22yHlMWwtzVNn
	 80vHZx/9vmuYdDsb2PUHziS/9zpk+GzWtgwszCwcsGoBdI23Xk1bSOTbZhYhx424Ru
	 eSCrpR3jzFXpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVBLg3TDGz4w1j;
	Mon, 15 Dec 2025 18:21:15 +1100 (AEDT)
Date: Mon, 15 Dec 2025 18:21:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: stats (was: Linux 6.19-rc1)
Message-ID: <20251215182114.5341e79c@canb.auug.org.au>
In-Reply-To: <CAHk-=wgizos80st3bL3EoEoh0+07u9zRjsw45M+RS-js-bcwag@mail.gmail.com>
References: <CAHk-=wgizos80st3bL3EoEoh0+07u9zRjsw45M+RS-js-bcwag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4IlHFYHBohn3Moovjb=oGtv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4IlHFYHBohn3Moovjb=oGtv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20251201 was the first linux-next after
the merge window opened.)

Commits in v6.19-rc1 (relative to v6.18):          12314
Commits in next-20251201:                          11826
Commits with the same SHA1:                        11260
Commits with the same patch_id:                      260 (1)
Commits with the same subject line:                   29 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20251201:     11549 93%

Some breakdown of the list of extra commits (relative to next-20251201)
in -rc1:

Top ten first word of commit summary:

    165 drm
     65 perf
     43 net
     23 smb
     20 dt-bindings
     19 alsa
     16 tracing
     16 asoc
     14 cifs
     13 rdma

Top ten authors:

     46 irogers@google.com
     29 harry.wentland@amd.com
     19 chenxiaosong@kylinos.cn
     19 alex.hung@amd.com
     15 vladimir.oltean@nxp.com
     15 namhyung@kernel.org
     13 mhi@mailbox.org
     12 dhowells@redhat.com
     10 timur.kristof@gmail.com
     10 david@ixit.cz

Top ten committers:

     64 namhyung@kernel.org
     56 kuba@kernel.org
     51 contact@emersion.fr
     37 stfrench@microsoft.com
     32 neil.armstrong@linaro.org
     32 alexander.deucher@amd.com
     31 axboe@kernel.dk
     29 alexandre.belloni@bootlin.com
     25 mingo@kernel.org
     21 broonie@kernel.org

There are also 277 commits in next-20251201 that didn't make it into
v6.19-rc1.

Top ten first word of commit summary:

     63 drm
     35 riscv
     30 bluetooth
     22 wifi
     17 dmaengine
     10 xfs
      6 extcon
      6 arm
      5 soc
      5 arm64

Top ten authors:

     28 matthew.d.roper@intel.com
     26 debug@rivosinc.com
     16 johan@kernel.org
     15 brauner@kernel.org
     10 hch@lst.de
      9 luiz.von.dentz@intel.com
      8 pav@iki.fi
      6 johannes.berg@intel.com
      6 ilan.peer@intel.com
      5 himal.prasad.ghimiray@intel.com

Top ten committers:

     38 pjw@kernel.org
     31 luiz.von.dentz@intel.com
     29 matthew.d.roper@intel.com
     22 miriam.rachel.korenblit@intel.com
     17 vkoul@kernel.org
     17 brauner@kernel.org
     10 cem@kernel.org
     10 akpm@linux-foundation.org
      7 cw00.choi@samsung.com
      6 andrew@codeconstruct.com.au

--=20
Cheers,
Stephen Rothwell

--Sig_/4IlHFYHBohn3Moovjb=oGtv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk/tuoACgkQAVBC80lX
0Gxdagf/Vory5yGQe4v1nhigLqiJIX/rGuLlzgwHucuG7BJ3LsR7wFntpyhZXel9
jrQGYTg6StyTRGEPm71wtDYZIRL1kEPHpqdLDbmgAFHrZW0R7ygImFMSY+ZNuyqz
48IiDQS7KmgpYxpMPIB1/BDivTiyQQg9nGWZpllztByZhMiKftf+s1d19O3romdj
eO1IHYyRn06aQ1FhbzDfh73/mVKlY7E2tQlQW8xvqF3aKn6z9GGPWkQLVDFWcQ0D
M/4wBSNV0Ptx9uRie8Sb2n67cp2W7IydiL8JV22Fj3e+1YjZxo5jAlCGyAFXKksl
R+bFdz/SriUqjraXmhKcEQ0qTRotzQ==
=e817
-----END PGP SIGNATURE-----

--Sig_/4IlHFYHBohn3Moovjb=oGtv--

