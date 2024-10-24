Return-Path: <linux-next+bounces-4419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC87B9AF40C
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 22:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B01286ABD
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 20:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACE0216A19;
	Thu, 24 Oct 2024 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MVbigCY8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB83139D04;
	Thu, 24 Oct 2024 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729802890; cv=none; b=gQOZIuJSFETyW/2Hpqkhy2d2BuKY8OKcIP98fJ84+RlK7SKIx2qcumnx3tRc9gadcMb/uHtMKoD5udo72IK1gCHQPKaTfMMtCy94aiwgnQ+lrpCYQvIw2c/DvJMhl2e5llv4PKjXKnS5gHJgQHcSoNvCU0fbVDiRO5IEaCWqcvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729802890; c=relaxed/simple;
	bh=9rlM9/fnGIMwuO7n4fkLBoCegp5a986r3CmpLmiGbb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LqFDy+XDs9svBUOTplnXixCmGgm+SrbqKSqGdl7stBsnEATWjNw+5buQoxECTA5BZQ+y6UIkrXlhsmfuUtc9I/kweCaa6gf9Fujv8mr+qs8NMV6WgNz3MOVEHtQKze/7YKg15rgN5XB/YLxklrmHPKZUzHrxEp1ovRPdIM2F+ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MVbigCY8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729802883;
	bh=9rlM9/fnGIMwuO7n4fkLBoCegp5a986r3CmpLmiGbb4=;
	h=Date:From:To:Cc:Subject:From;
	b=MVbigCY8UH9RSSeHC/7nST6zRniXGXj9HSB3FmxNBnuzU51soOk8pl8g61F+NIQN6
	 nEgRid1AERUEDCxe/YPVud7osujM5L/97JwE59K/x1denZwZ89KYvOt4fYp8f3f6Kh
	 KsKd4kBmmtAJvJa0pxeS9GAK9zcbWhDSfqVeLYMh9n+nxL3t9gcJVqsn21zR6G7MRv
	 Ncb/Sv13C5P2exPOhSVC6SNWDsggoEY36ghXSegoy6Azne+ouuVOQk54s9wWCWSY5m
	 ki6jY5azWnXezG9ILR1jwk+nSHwZw1f96gOjWAV65uZa8Gkj3Rr4Rk5FaS3t7ukzd4
	 uSoazfTZG9TRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZJ034v2Zz4x11;
	Fri, 25 Oct 2024 07:48:03 +1100 (AEDT)
Date: Fri, 25 Oct 2024 07:48:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error while fetching the v9fs-fixes tree
Message-ID: <20241025074804.27287c63@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/54MlUWiyxIZjh.tRjFDIFV=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/54MlUWiyxIZjh.tRjFDIFV=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the v9fs-fixes tree produces this error:

fatal: remote error: access denied or repository not exported: /pub/scm/lin=
ux/kernel/git//ericvh/v9fs.git

--=20
Cheers,
Stephen Rothwell

--Sig_/54MlUWiyxIZjh.tRjFDIFV=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcasoQACgkQAVBC80lX
0Gwy9gf9Hd+Cs2OCD96kVUFOrRQzo+Oaj1Rcvp53wxR36yiL4sbx0UL/lz3N5Zim
z4vjbjnZz0ugIiR4bIrallHWVK1tmYLvdVz4zcZi0c7YHif3sqevoq2Qp3AO8uPF
7M+LfuiaY96SpN76OqF6F8flQyTgxfg1mmXBaqrRjSFnRFf37vjw7O5WhbOVEai+
QyoyhsgCoCroWCHUiLNcZOCUk2lNEwx8h3x5piJ+tNrtjfKN/Ng7m8JzbzIq0Fcz
lmRCwI5aq5sArSW3CbIFRQK7CsWa4mCPUWoKAMHkDpjuhaRoKUzWnd0DtJ1icax4
P/NMjgLDJ7HYWjxlqm/nfdwzKnkL0w==
=+pOx
-----END PGP SIGNATURE-----

--Sig_/54MlUWiyxIZjh.tRjFDIFV=--

