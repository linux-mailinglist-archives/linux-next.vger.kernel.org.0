Return-Path: <linux-next+bounces-5568-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF58A44EF0
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 22:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19603AF60B
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 21:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50AD2135DA;
	Tue, 25 Feb 2025 21:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gu11XbNM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C816210185;
	Tue, 25 Feb 2025 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519118; cv=none; b=N5J/O+Cu4xKbxPKG0IPjo2irkanDCPYzGAPV7qngH9fdkv5OC0Bzwx85CWwf6KzQ1Dg6H1ZRl3ADDrlvn9NK+ab7+JBSOd2w/jHF7s3zox2HDHoyARRql08mcJpxYsGN0YgHitV8MJgKf9DltixxopUpbkuJ3vyBl+73i8Ns4jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519118; c=relaxed/simple;
	bh=CkEtZzZ1aO63asz2NO8we0PvyLXANQ7tN1ik2Ygq0wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tJ/WVs46fJxOvQiFvvUQp6NTo0+dSLRNWxvrbAl6Ie+gqjpYhNsTVg6szFJ78CgX6ouLW9UvWCbpgqVsACbdV5SD8UMJ1co/wGylrW8HcA1Vcwuc+LamDGJHGqAxlRu6AgI8H+heHQCkeyM88SNjZUmE2fYv1AbFm/sx5if8OgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gu11XbNM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740519110;
	bh=dyXGZlQij6yZqfR5AYTIythLXO1ZuwD/59wrUfG2tl4=;
	h=Date:From:To:Cc:Subject:From;
	b=Gu11XbNMxzIdmh0K0PzMjvSaE/t25hBJ868LL/knUP+0KD6PXIFevQvZMBk9c8s7V
	 k4Qx47HM39vvUGYOJs2vbDWS9zbBuER9t1pMTCwXwoNgHK4h1n+8tbpHLNJA7/hFWw
	 U0+9G5UfkSxYGHuH87AbSnpg8NGkahK9K1MdBoRoHcUvcT5mnefEpAZP64RZznjQnE
	 QXfomebLZVRAlNUd9osAOaVD2Qpf5QVSxxh+nWKq0kSmwBHaax6OpHT/sfgsboE3+L
	 1+ad96k+0YlVHCV7h5JX4EuY4HJ0ijlJpNQkatLYe7hMeVdXhXRVSwOFNAx6qn0lrt
	 kobmniSD6Ff4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2W5L4G5pz4x04;
	Wed, 26 Feb 2025 08:31:50 +1100 (AEDT)
Date: Wed, 26 Feb 2025 08:31:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20250226083149.7a1142fe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UTg4SrTDafNnPqtszTgG8iR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UTg4SrTDafNnPqtszTgG8iR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a1addcf8499a ("drm/amd/display: fix an indent issue in DML21")

Fixes tag

  Fixes: 70839da6360 ("drm/amd/display: Add new DCN401 sources")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/UTg4SrTDafNnPqtszTgG8iR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+NsUACgkQAVBC80lX
0GxCrggAk/2O/Fdx1V0zz+Ueo3/5eIyBoUgxvI8Jp101ozU8yXChtllVidlTNZ+K
Hr58OQp1/F0llw+lX+1zKsX72fyzL8/LZhfP1xjNNGl5J82Quu+F4G1ihYYJX7py
k2D5EotGCTFDQaPD5UUwrrCdtsRYUHcbygW3GysimvBP6+vJ6v5hQ9dqA6u+LO+V
tW/MofJ4danaDr4Wt+MKCjhHcASSkvGDTetlU+HsOPc8G5RYE+oJSpJ9fo1eRVF5
2Y9y3W2uw/YUHh2E3b5pwtO4gCxh9UFX1/0zZYHGh8S/2ONzs+pR/ILgklEtLtjg
pIV1y2RCDlBJsuyA+8HgltKNEw3UIA==
=zEjJ
-----END PGP SIGNATURE-----

--Sig_/UTg4SrTDafNnPqtszTgG8iR--

