Return-Path: <linux-next+bounces-6435-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B9AA06BC
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 11:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C374160FBC
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 09:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340A329DB99;
	Tue, 29 Apr 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="drkHza+a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74527B4E3;
	Tue, 29 Apr 2025 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918031; cv=none; b=KYk/KMBjU9B//PMC5zs2UEV5takPkkzfhEmMj/Q87Hm5ypOdKmOiQJFZDDGhiThJHMpezxjJEBSHyz1SkM4eBmyo8WzBzPKejZ9zC3uCR9UZGyJ2h6qEEqhk7bDjhNK/WafFGd5EC6o41LrupPE77DeBOLNSnx2hqambseqEEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918031; c=relaxed/simple;
	bh=5p3qEb/ybhkFw2CwEPCg2C54zVmZViW95eK/iKZg5Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ErjTVQHOSieEHS3Cj29jW4DeIqIpL670g+1G0SiB577ETXpojQmsRDoaKCllzfscTI995BWTPQfiCHWHLckeDwwz6EKt6Kix1JpF7hakZ+p/P6v08dtrjoQltugCxlvWblh1vLyMdohs0OFmZV6UvcZ9LsW42eObCWyuzj4oh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=drkHza+a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745918025;
	bh=DDgBDQI4GrTOTDHvczy7eKvqksRP3PBcLTl0DqrYnnU=;
	h=Date:From:To:Cc:Subject:From;
	b=drkHza+al0v9TFR6xx5PB0t6BxmVS1pgGW6qjincwkH1rxxOQZzm5Dcpq56c29i4V
	 S3Y168gk/NLrBPGVRPv54PQ/YM97qB1nqLo/6eenyQNHXB8Pb4rWHDuS0e/FzUiAsC
	 Y2y8RRQhJsDrfKeURDMoRD0ki6YTLJ/l2blBWNCemX9H17qocSmaSM9paRxmo/M9Iw
	 WsNlG0Snhm7ipag8YLEJzw2Vy364MdWOa7qbyYWvYxn2Wncbgt8fCzTNacwYxBzb6V
	 JHPJkVYpPc969MLGuXgmrmVnLf0sbxplT/Kmyz8/2jBSKuMzW5IDDuAgw/i4ynEN/M
	 i1CKNzRvLPqUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zmvkd0fTFz4wcd;
	Tue, 29 Apr 2025 19:13:44 +1000 (AEST)
Date: Tue, 29 Apr 2025 19:13:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20250429191343.2d3d44f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gT=_TWWKMVRmlQO3sv1.uzD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gT=_TWWKMVRmlQO3sv1.uzD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  93ddd3942493 ("do_move_mount(): don't leak MNTNS_PROPAGATING on failures")

Fixes tag

  Fixes: 064fe6e233e8 "mount: handle mount propagation for detached mount t=
rees" v6.15+

has these problem(s):

  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

So:

Fixes: 064fe6e233e8 ("mount: handle mount propagation for detached mount tr=
ees")

--=20
Cheers,
Stephen Rothwell

--Sig_/gT=_TWWKMVRmlQO3sv1.uzD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQmEcACgkQAVBC80lX
0Gz3xAf/T8f64uBJnGk/icxCJy/rX80VPhOnpipBBlLduGXKwZcDVKwDWtP3Kjp/
YP8TEzjhAwIfEWoDPjZYKosOhI+cjMlMDIbc3/8ruBhIn21tD3vv4imye9Aa+M+2
hVZIL77tj2jsSuSMoiRAFJrfXYzljS9UQcVEO6+3CwCjxWL3jQzDOCgoqJKXEHSd
NfEyRKkRO8I7NOExi+iWoU/l6iuqtHBm9LKPf8lxSkI9q0aR5uYqE51XrJPcSCss
U0+aW5emW9TNcKj1sOsfqadkrAbW1uNx0hkJ1VG36r9bqhL6fNX3kG46TNfMECUn
we7a39mQAejrVF5ex8bmJzKqiVnybQ==
=pJ6c
-----END PGP SIGNATURE-----

--Sig_/gT=_TWWKMVRmlQO3sv1.uzD--

