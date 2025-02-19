Return-Path: <linux-next+bounces-5488-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE634A3AD18
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 01:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 893F23AAD75
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 00:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45681286297;
	Wed, 19 Feb 2025 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KL9T01+5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C14A0C;
	Wed, 19 Feb 2025 00:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739925144; cv=none; b=YB0otPjs0BVz0EzfRyz8vWVkWIYY8SSXyFNz4Lidy41xkJ2AkKZ4RRC8rYKmDSVD5drpmHBJ+XGBWE3oGVcVAPXuP4AP/Ee/hESEMWtgiSlxY8qLo9eTbaDCa3zSj2BRyniGi3uaS2TY0eH0vfu5f3pYPQcvhovjKSptuAyMHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739925144; c=relaxed/simple;
	bh=yHu/+6P3JpjUiFUyoHLN2s4Om4/6h5T7P1sY62HZFrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ud43k4IsjKDPGErSttCUH5xdQIHK/QinUIBzVlnWK04jsAHXEvRWDZGzJMPwKL/Ai+Qq1XFB1XO83tnekndyqkUSaXYWAFn+zXjx1mcR6+ybJL6se934H3SWkCgr3/xzYtbQdvQCtXaUk5LgMAzx6IBxcKJxTwGBG00Lc52WbEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KL9T01+5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739925136;
	bh=zIJGrPLpHAm3DMtBM30z1cYI3ofCZooCEVbGnpSBC0I=;
	h=Date:From:To:Cc:Subject:From;
	b=KL9T01+5PghcgZLHhFJly5L5fQiyBvRrMAx32RA/G7E8rro5tRVhQvvYBZpD8WjA1
	 RnN4wavuELEGNiu13MYf9Pi1xEUu9K8jM3kRDa7hSZ4L6v1R7dh5aGmkagokbB3YCM
	 2YSSUdFLKhTUcNPSKq0Ewn/Sz/rZ4ihFCkTsdPq3PoeVEQqo6czikzEXehHxHagznn
	 sMF1keo9aamH/gAtXFwOTRoK+r0ayjYhBh6uBCcNwv+qI1RZOu9eMZAXfpbJtgKCww
	 OqHe8bVnvgT5VUtfeIVqXg7sRySRoHNZJeeQNCLP5VSdiJ2Ezh/avHIXCndSnPiDHe
	 p2j5f4hy1xW7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyHQm3GqFz4wyw;
	Wed, 19 Feb 2025 11:32:16 +1100 (AEDT)
Date: Wed, 19 Feb 2025 11:32:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the jc_docs tree
Message-ID: <20250219113215.2f27a202@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P.ORKs6xZlLPnp1OTAyjui5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P.ORKs6xZlLPnp1OTAyjui5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  364469e533b8 ("Documentation/core-api: min_heap: update for variable type=
s change")

This is commit

  73c3105c0932 ("Documentation/core-api: min_heap: update for variable type=
s change")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/P.ORKs6xZlLPnp1OTAyjui5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme1Jo8ACgkQAVBC80lX
0GzPQAf/bAzbIdb1TmTTT+qiEBLFxmZ7TW3sTHCi4O8XMKWXBI6VjlSlTqj1/Cxc
JUqLo+5760PxdZ4N+q0svjyLSCUWhJWr37g5BEBa1wTeLA2PQALf/829o7NZ1siS
FZbeoVaE0/5RT60adFI8TYkzAxG1iR5m9WXx4+AsmyO1xwvrbVoea22nkipFtDzA
Opqpb55s4QwUb+1pFVLEkopKUa3r0uz60H/w37YxnQS5hMolrGx6QUcIHoyakRi3
LGw7ePnPwoccW/LkPCMpSoUJHrdYoPRDk8s3XPi0fz/gB6EhkBO/QPyJ+2SsDys5
xsb4Rnoz3NyJPxjbdX6VfRHxXPU0IQ==
=v40R
-----END PGP SIGNATURE-----

--Sig_/P.ORKs6xZlLPnp1OTAyjui5--

