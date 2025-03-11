Return-Path: <linux-next+bounces-5730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C45AFA5BD0F
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 11:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46C73AE47E
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B168420B208;
	Tue, 11 Mar 2025 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IuIxAPvh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B4B22FE06;
	Tue, 11 Mar 2025 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687217; cv=none; b=oswb8XiziDywWTV22cRhjlKRMM5a3CfK/JBqTnHhrT6KXah5oFhZGIjbE46nO649aB/9mjYk1NDEwA3b4kYtJlfNGX8W55OXSf7U7sXXZP167p1GcfJUxjhLS423y3XowNIsh4Rw5/bzRYk855qUFsaUo1uyyM+3YuXvc+hdNYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687217; c=relaxed/simple;
	bh=Icw7d7CWXNiSHZD7IuvA/ABSL8G+50+g6+GEnsv3xLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qwdfUuynTj3NPZsVYZUJwLi9t+B5yE8azO2RakQBvLPoCNuccbMPgptKboXwLIquo1Tr3d+jWqdII/DpdU1GucAUbyR/k+0Xss/zEpEDBnkWQb8+1C5eBQ+FCr5U4EILabSvbWm9DA+YDuT6z4kV/IAxuxl2JlhTrQJqqFG1lZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IuIxAPvh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741687212;
	bh=7a/wC/Qp2ltlmIN9hTSEJZ5XPwuWZ4fbVoIgO94hJIw=;
	h=Date:From:To:Cc:Subject:From;
	b=IuIxAPvhjJiV0AWj6TnbtjkMjVDfm9QHH3s6cnA7yKTcEiLebNxXWxn2J4sKIAtxa
	 D1sSA6liQoCJqOq4IoHxbKxfjedS3I3UJABRFknj507hekGNrIMIciT+zm8Kv45Cw2
	 CnL7xC0sgthb+AD0NIaUMvvcCzNpB11NCMkKGAAV7bKOa0xFjJlyeJoDdEuzG0p+/w
	 qm+Kgt2tL0yuYGyCWxqrJRsMXSD8zLtkhq500Uwf2IsHykXHZ0HR3BQYSXIICmPfV/
	 DgfkrNOODAsUTbqqIYfiZkT9jmJYWqNMuP2cVM0hH4iuUaqU8qHZgEd6U2MjHIybRl
	 dXzngOLdd8Ajw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBq4r0Dt0z4x3p;
	Tue, 11 Mar 2025 21:00:12 +1100 (AEDT)
Date: Tue, 11 Mar 2025 21:00:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Stuart Yoder <stuart.yoder@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tpmdd tree
Message-ID: <20250311210011.18b7ab80@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D_mT90U0BpSUm/wCh_JjhLV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/D_mT90U0BpSUm/wCh_JjhLV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tpmdd tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/security/tpm/tpm_ffa_crb.rst: WARNING: document isn't include=
d in any toctree

Introduced by commit

  115be78c0bfe ("Documentation: tpm: add documentation for the CRB FF-A int=
erface")

--=20
Cheers,
Stephen Rothwell

--Sig_/D_mT90U0BpSUm/wCh_JjhLV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQCasACgkQAVBC80lX
0Gxn7Af/StVl4/bDguxrdHgziH4ZJ6/fyik4lrNsjgI8+iVdcci8zpsEsSNMcEQa
0PtTZE5dFldjAxUrVrvBzc0AohscCLhSg5f2oi1D8cMNu1Fz/BSLuFJqtDbC6N7Y
LbXe2AY1qZJ6RIo30B0RmsHvsgyACD3OM8Za+nspzf2GhpWWjKhnHl7BAL5d8bez
TZsZe9peERcoxbBXEgshAqXHGLdmDijs90DupO44tzKaFiX9JhcoqBSi0I178iy1
T4HCJDxkz1U7JpxLqjkYkVGC4YwMfJrDvtjdHygQO3e0Q2xAb8ieTDVQUa3NEioF
Nf7y5kxFRLPabi9CrkeYaucLvafN7g==
=mNxD
-----END PGP SIGNATURE-----

--Sig_/D_mT90U0BpSUm/wCh_JjhLV--

