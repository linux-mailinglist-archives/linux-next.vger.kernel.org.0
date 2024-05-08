Return-Path: <linux-next+bounces-2235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD28C0748
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 00:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9F98B2221E
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 22:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCC738DF2;
	Wed,  8 May 2024 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aoez9rd0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD827130E4B;
	Wed,  8 May 2024 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715206804; cv=none; b=tSHKLzxCXVDwUMvVzQFDejaAYAyMMf3BxuMNeC9znmPRAVSs8m2jVX3aZ6yBKL7LbqaRdEkp3//B4NveyPq2SghuzDj6qyq2QbPn10GGutv17cxgl5zlSRPD7p8ehjb002ndLU1Kyxxnyi99D4nKr9OAkuowRRU3jsnhnPe/Hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715206804; c=relaxed/simple;
	bh=JdTaISAdlLUwTCFGK7NMyu6Kkaf5NAQKKxknfXMoZyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nvgDH6M7ppsMAzk62JwmjfXHW2c/UutCRPSGQsfMm7yFL5VuaNXLFZxXB3oryOAhNIJ9+FXZuowM3Eqh4x0LU9mMUs2A54OZVKbeo0cGWelxqGa4CD+O67xwmt3jgpzNf8qvRrHSsmjjtJpfG/LDCvDkGkRFNKWTjWv0XheugeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aoez9rd0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715206799;
	bh=OYvvNzD4AMO9vQtXqPK0263V+0o9TizhuFL2zZld7eo=;
	h=Date:From:To:Cc:Subject:From;
	b=aoez9rd0mK/fCUks9ub9N5GDK4DKqs6mop6WuUnhvix8Wej6zFXdsvBEORw4KKNUu
	 FkQXA+OLfjkl2B9TOqyJxm9dMeRIQ63624NN6Q3YmuDvFSzdM5bqZ7bhGb3dm7mRtv
	 1DxhbQGpo+8xdk0gDYADdZbuz2pap7earwVAhgvuilZikAOag3gYaH7dzgkbiF/gii
	 E+UTk2IjQ2G5WPYRV9u4BOn/FUIa6ecLBqZKZnS284d1pNVuWgHHpnTfWLCaQzaiOQ
	 Pi+PZprK1f3REdbpEEBbXbaI5R9N8Nc56sc1ALE14qOYXVNNj20Cf50w1tzgXidkZN
	 BNcfgrz1pF+0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZV274WXPz4wny;
	Thu,  9 May 2024 08:19:59 +1000 (AEST)
Date: Thu, 9 May 2024 08:19:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240509081957.0668da75@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SABXY4tji472zQAoK==7k=O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SABXY4tji472zQAoK==7k=O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  21965b764cec ("afs: Fix fileserver rotation getting stuck")

is missing a Signed-off-by from its author.

Everything below the first "---" was dropped ...

--=20
Cheers,
Stephen Rothwell

--Sig_/SABXY4tji472zQAoK==7k=O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY7+o0ACgkQAVBC80lX
0GxbXgf+LrK8mvQ1lDHrcDZnB1IhPXWquRMZ8YhwGEHg0CHvYcZ6kF0zvafZMLGQ
g23CZlZeHAJ8liIf9TQU2ehd/DFwapcowC8BTpDYx6j+4S2m7Y5QcKyid96tRK6m
CCkUj9aXQeDX/C4Wyz+DXhZ3nzsMpg6qWBa5T//e5A4NoMKe/P7hq907NVZ736fM
UDXsC0CBtPL/Fc0wBCZckXRxyxjIYvn1vAxr/2O+vKcpRyAUTE+RPcf3fnbfnbXH
Lx8+FHBqEZHDGWdwCLnEFQeSvKCuL5PdYS/vYyWicExFw0P+1yzrxs5pexT2u1+4
OwdQ76XSEpMb1BtlBlzIoJ8mjNlmZw==
=j+WB
-----END PGP SIGNATURE-----

--Sig_/SABXY4tji472zQAoK==7k=O--

