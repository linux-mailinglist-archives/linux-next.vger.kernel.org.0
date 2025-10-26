Return-Path: <linux-next+bounces-8709-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0627C0B3F9
	for <lists+linux-next@lfdr.de>; Sun, 26 Oct 2025 22:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 806124E578D
	for <lists+linux-next@lfdr.de>; Sun, 26 Oct 2025 21:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C80627F724;
	Sun, 26 Oct 2025 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OtCP7jcZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36146261B83;
	Sun, 26 Oct 2025 21:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761513206; cv=none; b=e9BT0zl0WastlPBHG8RCzQntadmBxe5azSHp3BQ03s3yYVNsLBFspA9/7BpwVpKRvd6lj/2Sou4RockrRXrK9z0Uyaoxp4i9lOxWROpi97ZQ6sPfdcwVA4hlr/4waGgeRigNnCrqI6XlNq2vVm7LVJH3winoBybWnrLvxRgIrg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761513206; c=relaxed/simple;
	bh=XNUmEyEjYNJbztjYHazp1a5vNR0QS5QuGE0neRMeeqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nfcyjbfUbszbtIWBNtDe57u4++DN/gKaMpBd4vakCWmosskcbQ8+7AcsgTN2fhYvhG5XVDTtWK/Dn8hMFgGIemqMCs7D3CtbzbfgoKxGNs+zExc58StwFGpXENo9uM0C45S5DKctM3RWvVRjRHOz2YhZxmmERIgk+9O2lfLuuZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OtCP7jcZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761513202;
	bh=usWgm2xdzOJjPYc7ki/pzDghMd56UQyVke8bpuC9R/w=;
	h=Date:From:To:Cc:Subject:From;
	b=OtCP7jcZdpz2SSVQM3l+VWsqjA9BaAOzvVmIjgKNOjIDIo+KVyLYYu+kB9z+4u+Xi
	 lXfW8gJPEpcGZ9bOCbkJ9Rqr5HQmR5rdFnUR8ss9EAFoNkbh747KMrcE5RyGmw1GM4
	 FPr3t+tw1Du17TCFnCa6+Ek9hdjDvZEv3Q6aIWV966v7FPz2Cjr/gT2F2zuqy8l3Tu
	 hBW0pO3+GdsCPALMB5YwMJMJ2FgfOb9JZ8lhdeZbMuCfD8e0xYlIw3StZCCPIgndrM
	 w8PScfMalA2vAElbdGZWtA/nnjSo+kQNQsVhVjPQNrS5CdDxQFbNYmGTYq2dFeVgy1
	 tJAsYsVbWzysw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cvq9s5GVmz4wBj;
	Mon, 27 Oct 2025 08:13:21 +1100 (AEDT)
Date: Mon, 27 Oct 2025 08:13:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20251027081321.73ff1c2f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aUuPWHmTA72JA9ZmHB2n51l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aUuPWHmTA72JA9ZmHB2n51l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  f63037a3f252 ("dt-bindings: net: Convert Marvell 8897/8997 bindings to DT=
 schema")
  a91f1b634866 ("Bluetooth: hci_event: validate skb length for unknown CC o=
pcode")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/aUuPWHmTA72JA9ZmHB2n51l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj+jvEACgkQAVBC80lX
0Gzs3wgAniaSM6VLdNP+qS0bWg7YFoIUMm/lxUJaCcIxOx1yiPed7UEUNIiX1Eh0
zzV9YGGZIi/5GHBDfDSU56PduOIf/GJq9ePlc0ZYUDYtbXkYgKRlFsixhFv7bSbI
U5jc51kZO4OpgKZMXYyIMEnMuBeJbiJdkl8lDA2t6WoYbKqfGq3URUWqtK5bNrIH
0VWNluca2lhzlWHscAvQNptpI2UqKoOugy73tHLGpOOgF8ID/HdT9bqbamgr9pDM
Hjcmjm00BhJv9MHIwDgd2gyvyVr9h61VBav2BtawuQBaJKZFNah7kY4lnvqqUboH
yq6JJRXN76xjIAdhvXDkr6k97BvK8Q==
=tGQg
-----END PGP SIGNATURE-----

--Sig_/aUuPWHmTA72JA9ZmHB2n51l--

