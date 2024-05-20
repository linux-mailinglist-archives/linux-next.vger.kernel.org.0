Return-Path: <linux-next+bounces-2355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF268C987B
	for <lists+linux-next@lfdr.de>; Mon, 20 May 2024 05:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F31051F2228C
	for <lists+linux-next@lfdr.de>; Mon, 20 May 2024 03:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED16DDAB;
	Mon, 20 May 2024 03:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qvV3gHuk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE610788;
	Mon, 20 May 2024 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716176394; cv=none; b=UjCewboIerFzZNhqJWqyGK4aW1l4uQ6w3l9MJb7L5vwURG4fwMityg0g4Q+XgvZOVudzwimNuIs6bbGUvVwxjrtwBvC94SFJw/2h0L6OXGexv8qEMglxmH5MWvf8794iwpnAaH7CkxOu/w5PEEZPYkTnfJxpc+F1raRCzE3MdCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716176394; c=relaxed/simple;
	bh=FT2gLk21He+kjK1B+lsixnwW77uo8UK7noJFQdeTJf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IbgEmz0GmnhSojMJfvIGr8rRGQ8vwlYSwK9Sg/26evqEZz0O/h50MZeU4ap5ZjXkZAf/4GWlmwxdewTShY6qN3upDV/US8cwq9a4EBuJmB8+CKZSRO0vJcBh9wpQGceXIvXIAiHzDd97we0d23Cj9GRuT0H27SUhtI9sKyBDEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qvV3gHuk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716176387;
	bh=MGkzW9NoPmN42DwQIk2t1736pIXyXWImp31D7PdaIhU=;
	h=Date:From:To:Cc:Subject:From;
	b=qvV3gHukrVZ4xt/MSC1SE11ngpbKF7wZ39QIknVfcZ0QF0yJyufXxbEGTvKDKhzYF
	 rxI81nu2mHaaqeHRmGHK4fthB/ewtST79XOAJy+KPES/T1ZkiheZnT+QJxwijybjyD
	 rz0LST202C/mDIKLF2NZVhCzlOC9cUd4Pc/YKLDmZRn8w0sVQUr6+OlWQzTqSjoZar
	 ndsIdNfrXbwS7vOJXAUbFY3Pw5KCNGa9TzvA3fxZdII1FEmqoVUjixVt3wK8RKW9Mg
	 Gash6bPx3S9kX1SuxsmabqL7t19I5GCfa6XzmUcKEiaRviGZAkLVnGHOn94b2n+n9t
	 I2dYUEbFKmtIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjNc26LJ6z4wc3;
	Mon, 20 May 2024 13:39:46 +1000 (AEST)
Date: Mon, 20 May 2024 13:39:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20240520133946.57e4caa3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sQs2TPQacZ_C4iPbHl8jkNt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sQs2TPQacZ_C4iPbHl8jkNt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3017: warning: Excess function param=
eter 'abo' description in 'amdgpu_vm_is_bo_always_valid'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3017: warning: Function parameter or=
 struct member 'bo' not described in 'amdgpu_vm_is_bo_always_valid'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3017: warning: Excess function param=
eter 'abo' description in 'amdgpu_vm_is_bo_always_valid'

Introduced by commit

  26e20235ce00 ("drm/amdgpu: Add amdgpu_bo_is_vm_bo helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/sQs2TPQacZ_C4iPbHl8jkNt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZKxgIACgkQAVBC80lX
0Gyc0wf8CPMUxeae6ZpkNe+780B2G03gpbrrVzxM/rZzCnsrGrCJ8lq5X0HgYnYR
Q0DZK7SoRo0hlbNkLuSkjGHBTa0Asr9YkMfnnaJcFijLR+G84lHdGiRSm0TmMxIj
7o6UCvQXV88LTtKYtwIhC42jiYYr2vsKm10LUpFeXrWp2GgXdjK4pnCRKDBh4uj5
oqGDqDOgvDulo+LP+u/QVDRY4gnQ8rcZCPeUCgMmWT18Tv6DdCdcTMrMlqT/WN7O
wR1oFP/084iVNGq9iOs55aKaE3gzLLCy6sqW9eZiNQUb0JRRtj1dQoC0rmfsq6VJ
VCkdpn45adIM/CMYB/BFWTLM/1GD7Q==
=GGum
-----END PGP SIGNATURE-----

--Sig_/sQs2TPQacZ_C4iPbHl8jkNt--

