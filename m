Return-Path: <linux-next+bounces-7265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088B0AEB095
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 09:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3E316F63A
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4E02264CA;
	Fri, 27 Jun 2025 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bX3RFILs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429802264C9;
	Fri, 27 Jun 2025 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010717; cv=none; b=FBvYnBDvkyImhnA6joxXVlu4aqr4ylqtv3VomlUErf95BNf79RqG6g4myp1zV3znk1PT7LVR2CrgsNxZ1Ci1xZ4zifzQretWvuL/95LEJr6LOUeDRuC5E3HQ/IAG4SBRAHWMGQQDeVx69l8EC89bI7r1uVjokOzVvzvb3ku1dy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010717; c=relaxed/simple;
	bh=ixSyEauioVu1pqSb+FZw2CFjEqM0+5U/Py+Nk6B7j7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxDW9K67O3e46tvLZNJHc6KVbFROHmpdvdRy6j+ESfdXZUDT1SO8KdJLwmVdxapTD2d2VHVRL0Yx9RFOvLZB4LgWB0AGnNlE05DmYp13glbQUeamQPQ6FgG6gqGzHSpOUOmj/skqJ6JfJHKhb0cY01WMU98z1AfiZ4xe+bMLYm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bX3RFILs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751010713;
	bh=nJXZKSqjt6CJlnARd+VvGXhn3OSXKLUU2yS6mA/AdeA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bX3RFILsIqpbQYa0OAXs3aS6C2rRvzir8A9iufgFm34jITtzr7WJ5TVzEuZsjJmTh
	 tvdVALg7xtYm27EX8hEBa3bpskfZI6xRhNvIdf5yAVCSvCZ7RkDWo5P6HE0P5gRTp9
	 1bJlXgq7EPBCXZa1HQSYnDjF85FJ4hNEpuoQAp2WApjgfBk5VBGN3A2uQ7mvbmPO9R
	 KCS6BHaoaeSvKhvIEuTN0ctacsCyVNbW6q8T3yOa3s1Fk3jKWx96SgoPGF8pr9lkCJ
	 86THjlKMKzBQHH8wBL97Z3xLr4dITUYvi6E0JPEgeVygZtNr61QwFShPSXVnOftwRv
	 loutODzfA9+3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bT76x2l6yz4wcn;
	Fri, 27 Jun 2025 17:51:53 +1000 (AEST)
Date: Fri, 27 Jun 2025 17:51:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kvm-x86 tree
Message-ID: <20250627175152.1f66c39b@canb.auug.org.au>
In-Reply-To: <aF1ty7P9MnQK7UPr@google.com>
References: <20250626171004.7a1a024b@canb.auug.org.au>
	<aF1ty7P9MnQK7UPr@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2B3/_nXBVNB6lI18roNtIX=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2B3/_nXBVNB6lI18roNtIX=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Thu, 26 Jun 2025 08:56:59 -0700 Sean Christopherson <seanjc@google.com> =
wrote:
>
> On Thu, Jun 26, 2025, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the kvm-x86 tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/virt/kvm/x86/intel-tdx.rst:232: WARNING: Title underline =
too short.
> >=20
> > KVM_TDX_TERMINATE_VM
> > ------------------- [docutils]
> >=20
> > Introduced by commit
> >=20
> >   111a7311a016 ("KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM") =20
>=20
> Fixed (assuming I didn't botch the fixup).  Thanks Stephen!

Looks good, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/2B3/_nXBVNB6lI18roNtIX=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmheTZkACgkQAVBC80lX
0Gze+Qf9FZHlXSdk9i9BuHzlk0D30ijx5M1JywxfZFFeYT1zxyAu18K2M+Hunsvr
0QhXPNCU81O6+RE614nROfClWwu4/jjNQ4uuhwhRiP9CBxL5bpn9vYjapxQ+H9iI
dIgeP3z3Ga/SKHoFg9/AhaTds8MimiRKGuif8Q62e9o2jyNAMFkHjWbknwh9MwX5
GqQqaT7QIiNpU08oDH8fZvFZgn7PlUQU4qYJDibQLn5uVpw4UBhygCDPSgbwK9V8
NJVqe2YwQz+zRw1G6rulnkyG5Pjxm3Pgok0vWUrAi128YtmBOjI3TCHFU7pekSfn
Y0VN3xfStWAApuv6Ga8ojkFu86DUog==
=epj8
-----END PGP SIGNATURE-----

--Sig_/2B3/_nXBVNB6lI18roNtIX=--

