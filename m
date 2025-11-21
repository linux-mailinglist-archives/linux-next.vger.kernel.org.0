Return-Path: <linux-next+bounces-9136-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E3C774EF
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 06:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2F6D3542AD
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 05:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C1623EA82;
	Fri, 21 Nov 2025 05:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NS9h1v9N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C586347;
	Fri, 21 Nov 2025 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763701313; cv=none; b=MBtlnq891Ek3j89wab7unUXFADzL0/kKvzQmDFneuzyq2Dy5E1xr31HJvPSUpNpPUYQdXDzL1YkbnnjtFS5ZSvbR+p+jRSf4/0P0CAzSGDSQm43VPdyrPkJDaPrDzY34jS3rK+hrW6moxetb6cl8UT3ZA1unIvDdpJ0joO6q7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763701313; c=relaxed/simple;
	bh=lBJaPaHPEm7gh4q51dNBdXg4ycDaTuPDGBbxUahq3bU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OBPPGrYPXQpwTi1RTRJGzdXtmjbRf9ADL5CM3AekWQX6oAx9obN6WcfWOtPIAExw6wWKpqKrkRuBCV25aaQBbdvw7EgRtLpT9NVEdW0amFuk0bwIDymVOrdQF/5V225sHOOQC1g78q6dx2+CswfcBNvKfyC2QW6yEnf1hONNFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NS9h1v9N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763701305;
	bh=GnheFerAdIolGb2OslFF2tMXwNzFVpMf2I1K/gmZm3E=;
	h=Date:From:To:Cc:Subject:From;
	b=NS9h1v9NTgV46lEUDyId383x85CJCdyMIw/eDAetwccYMEz7utqzlEYhvuKSDrJdI
	 f/UDvqBEWUKbWNov1B3mDoqVWYlWC9M+azrelQXwfEGONNN340i/92G0FFB4E9QHgE
	 KcuAruTYrQsGy8Xe31otXWK540acct61KW6xBuV/+L0F3xl8HQusfvVcQx6MV9yIoU
	 nH1rwlJvhCGGvZCSiQiMKOrEQ/h/we7TXjUbl9z1LsxpaNkKep5MSX884scsLosz40
	 oeli+cgPuxXhKAnUHfVzRDw6CbcXhDIIk0+1AqduCw3dcGLDy/AWdFj6xzJqv4i3ex
	 7mYYOvAGPvptQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCNNm6cRcz4wGl;
	Fri, 21 Nov 2025 16:01:44 +1100 (AEDT)
Date: Fri, 21 Nov 2025 16:01:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kvms390 tree
Message-ID: <20251121160144.02cb92b3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=/Gvhw4/R6LmtVxF=sKfIe0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=/Gvhw4/R6LmtVxF=sKfIe0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvms390 tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/virt/kvm/api.rst:8754: WARNING: Title underline too short.

7.46 KVM_CAP_S390_USER_OPEREXEC
---------------------------- [docutils]

Introduced by commit

  cd18223397ec ("KVM: s390: Add capability that forwards operation exceptio=
ns")

--=20
Cheers,
Stephen Rothwell

--Sig_/=/Gvhw4/R6LmtVxF=sKfIe0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkf8jgACgkQAVBC80lX
0Gxa5Qf/U3VH8XPGrIJMhUm/cfVQeJk6TxQ3ltwcONQyZ/0FUn9UtzFtPANraQ6d
/DT80lBGVMcC+AE3evLZx7+M85ycwTPiS6tYlwOHZUSsBo9l+TwyFqBldTmZzZl+
bQCm9cyq1+JnAsR4KMyZT2RcE0mVM6hBAYKJupJhYyRHCOJ94JNo3EOGEE2VQiQ9
HtErXlsdFAyMIae5cdAYQa9FuvdnHi7tEIZeQ/qEzgj7yn9SHMzrr40a/w7vFoaR
imwB6cMwB25ZEizum8eJHlRdkaGlMYIZfgUBJ5hO82ZiPBZHncyeN3RO+cu7Zg9J
xdUDhWTWP5TWDFbtqSzrurexVNXxxA==
=wK9c
-----END PGP SIGNATURE-----

--Sig_/=/Gvhw4/R6LmtVxF=sKfIe0--

