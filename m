Return-Path: <linux-next+bounces-6391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5BA9E4A6
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 23:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 039663BB7E9
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 21:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBAA1DE8A0;
	Sun, 27 Apr 2025 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CBr3xwLO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6E12B73;
	Sun, 27 Apr 2025 21:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745787942; cv=none; b=HniEAdtRu580JdqUltpa+tv2Hdlto4xnRfywtl6vJlXycoLxmwBBXMfT+gYGuXtdM9uzYyivmQ3LAX1mu5VQEI1ZQab50kbq5Dey9cRAy0oxOJks86KnLwe7WrbCWkGjlavho3uKD9YjXySS1aCMDT46mdBLGFDk+j01Ca3V3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745787942; c=relaxed/simple;
	bh=IkialqINIopO9N6iKyK3LN03RhJ1D8SZzPMxOKuOP/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QewVR4oezAdQkst70FJVFX4NyGsXWhH1SdPQUFVBEPRQlGZ2DJ5igXZsrNkQzPE6MerBzR3T3/hbkLit/BMxIazlj4VpgJEGTtv92zmtYMVxDbx3tdXAR+y9tDnCr3EIP3Rje7Ad+kH0829s8r3L4lBE5QwXfsQRQLhLWpOC4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CBr3xwLO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745787930;
	bh=BScq9Pq326oJWu3vnhxO9f+3ThH1j/O/P452yue43gI=;
	h=Date:From:To:Cc:Subject:From;
	b=CBr3xwLOBneQleirzimVOOn0Fr6GLY7EisQV24LBJdrKETQ24MgJP3Ae73Nrv76av
	 TyV8hMXxIwUAgih60H88R5dgeGI3PVM3AwCtOCEh850uW39hPL4RgtA3fL2uSQ8tAn
	 oTNyVbSrg+t5HPqlILKSt4IRTslztMPbodkXS13pgklK854NnRtVeR5o/ubIhtUqUp
	 IMEdaXrS/DGo5ewpLCOLl2KAXEKu1b7C26aSXeDGTrwtTIHfgTnGYfrFtw/DI7N4gU
	 zFF/6d0+dSwRWYqEaO+UQQ7YgPvrRvNXJDomsPd+eT/ovir5SZYhoB2+2zioMjGwz1
	 z495udUBhXScw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zlzcn4Rlzz4wyl;
	Mon, 28 Apr 2025 07:05:29 +1000 (AEST)
Date: Mon, 28 Apr 2025 07:05:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Peter Hutterer <peter.hutterer@who-t.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20250428070510.4a02143b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EHdvV2TkWeWKu/ZIDenzzHT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EHdvV2TkWeWKu/ZIDenzzHT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  55cd617566ef ("HID: bpf: fix BTN_STYLUS for the XP Pen ACK05 remote")

Fixes tag

  Fixes: 834da375 ("bpf: add a v6.11+ compatible BPF fixup for the XPPen AC=
K05 remote")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").
  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

So:

Fixes: 834da3756f49 ("HID: bpf: add a v6.11+ compatible BPF fixup for the X=
PPen ACK05 remote")

--=20
Cheers,
Stephen Rothwell

--Sig_/EHdvV2TkWeWKu/ZIDenzzHT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgOnAYACgkQAVBC80lX
0GyjTwgAjF7LZMmqSI5xWqPVR64eQf/+9XqoDUZM2rADbg6oKk+Z0I7WOBr8UG12
oDDG6UHE4K/rTq8zZvoWBAKjW6g0TpuiJzkiXgtW4vVtiWemL1eO15KZuHyLnhMV
qpfEPpVqbUBi2O4uJXGq6EWEoim+QW9yVOyCz2pBBfWGvL+t5K9Qu0GM/aMtXXiR
yg0Ue+D7/SEUW9orse2Gmn5cg0cctrRk2dcQxG17AZYNnVSqsnaFs/PUr/m3LydV
D1m3evAc5teY2nXQ162s51HKsZ5gj4Xxf2yWMOYcxpPkv/hKJ6ZSQIyXn4e1du2N
q3w1gOn6vRDH2yDTcvw2RLcQ7NnfiA==
=A1Ay
-----END PGP SIGNATURE-----

--Sig_/EHdvV2TkWeWKu/ZIDenzzHT--

