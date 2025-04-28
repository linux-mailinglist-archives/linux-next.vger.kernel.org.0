Return-Path: <linux-next+bounces-6399-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEACA9E5FF
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 03:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 947AE16DF7E
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 01:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6397D14AD2B;
	Mon, 28 Apr 2025 01:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zb3cxNj/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063E3232;
	Mon, 28 Apr 2025 01:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745805434; cv=none; b=el97nkBzXyPvqNe2dgoWz7zs4N/xT9MvAv2NzBWG1wAi+uaDQtPjNIsrw+4L4a4A4TM6RCuStIA3JNk8aLwEihC3Q9rHZoGpoXrxongjetoVGsuqY93IrxPvp5K9I5fwcnzgEGecomhKrw4pXDCuzizQJntTuMxpkwiH0j/IMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745805434; c=relaxed/simple;
	bh=VeHo1+aFAnjzYXeatcFmvX7+OzhzSDeo7ETstgLJBzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mVoQyMjZ0+mOarXr44HcVyM/A2Xlyn5jZVD6desqigRtPIkMbCPMvCVBfBv2ncVCkgABoYPl9Hm1cdQN3QmjJvcekzWRstvl97d9bcNETL5vb1gaanyAge2qmVsn7SjWj7x6XAgB9n4kDm93QyWewLtq0lb2zndM3LSWTmqAwJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zb3cxNj/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745805425;
	bh=VBdhPLJItsSVgBV86GnCXyb1fY8WlT9bHY+yhqApIAA=;
	h=Date:From:To:Cc:Subject:From;
	b=Zb3cxNj/ZyP8PWUbKUJ/aBCf0dO6e+AiPQXINPFE/BSlL52+jNHu9TjJ72gSPEp6z
	 +oTV9ZF02KU+/wfRh+nfzLyO+D3DA/WsCi4Ke6KJqBFbAL589FMjhaTwDIhVSzwlVJ
	 J01pWPsGtXoNH8l6Qc27IiLvJ0xC5TK5jlSDger9KCni0jrWF81l/gWTMy3Oh1ehYV
	 S2MtCdrF2waR/i4iPg28ONFfgAdyF/hQeUH0MxqgA79vumjRjGm6hMIoGMDgHuwBbC
	 6Kr8w0gwjXK4L0zFiDySGWZTxyRF5xmklQ6hxGZd37xLtdwFOwclCyMMPU18gzsctm
	 F1WUQCou39rqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm65F5mr4z4wy6;
	Mon, 28 Apr 2025 11:57:05 +1000 (AEST)
Date: Mon, 28 Apr 2025 11:57:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cpufreq-arm tree
Message-ID: <20250428115704.46e31d9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pEz_Gj.tOQyyylCL7SZcaYO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pEz_Gj.tOQyyylCL7SZcaYO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cpufreq-arm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0308]: mismatched types
   --> rust/kernel/cpufreq.rs:950:18
    |
950 |             Some(Self::update_limits_callback)
    |             ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, fo=
und fn item
    |             |
    |             arguments to this enum variant are incorrect
    |
    =3D note: expected fn pointer `unsafe extern "C" fn(*mut bindings::cpuf=
req_policy)`
                  found fn item `extern "C" fn(u32) {cpufreq::Registration:=
:<T>::update_limits_callback}`
help: the type constructed contains `extern "C" fn(u32) {cpufreq::Registrat=
ion::<T>::update_limits_callback}` due to the type of the argument passed
   --> rust/kernel/cpufreq.rs:950:13
    |
950 |             Some(Self::update_limits_callback)
    |             ^^^^^----------------------------^
    |                  |
    |                  this argument influences the type of `Some`
note: tuple variant defined here
   --> /usr/lib/rustlib/src/rust/library/core/src/option.rs:580:5
    |
580 |     Some(#[stable(feature =3D "rust1", since =3D "1.0.0")] T),
    |     ^^^^

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.

Caused by commit

  c490d1f07bec ("rust: cpufreq: Extend abstractions for driver registration=
")

I have used the cpufreq-arm tree from next-20250424 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/pEz_Gj.tOQyyylCL7SZcaYO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgO4HAACgkQAVBC80lX
0GzAVwf+Nk4oM8nAQ0jVM3LEg6XnJ15tWk92Kg9lsQROSYAkoCoMkF+gHYItBdAr
PGivqwZN7vrV0Tj2nUzIryf/mXmtK0/4ibHU/8JcArY9o6jE+7ucXeeGHgtDbXdp
nll6Uxx7HPSUg9v1vmBwq/PJeMm/uKaFlIv6OTohfb0sg53WP5fAnXaCZlOvyOD8
A0Q6FwJCNviJ494iERXBD1cRwd1k2a69c8a2/uG+T4ETS+ORqP5qoHdnk2QQrvsk
3YOHWEMxJRSyRa2zStsUpVgGAitpwo2SayW5T+aQEX6BG0THJeew+5CUvTtdvxmJ
TE/6A9MOxiXIhTw5wdA4Zt8v0s6fqw==
=Xe77
-----END PGP SIGNATURE-----

--Sig_/pEz_Gj.tOQyyylCL7SZcaYO--

