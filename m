Return-Path: <linux-next+bounces-9456-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3BACCA40C
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 05:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F032300B939
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 04:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602FA13B7AE;
	Thu, 18 Dec 2025 04:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ryFntvmv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890BC1E4BE;
	Thu, 18 Dec 2025 04:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766032269; cv=none; b=YRqnqc8BuLVt4ScC8tW1soSLNwx/u7q8DLOBKd+OZse7Na+pgQ0/X0zcL+Xedriuxr6fgM7RsLb9eopvTvFKjRd+Xynp8COTah22DVIlJpFk1c4tH7irwL9SQFYAdAaJcpLHV8OO/g1b/2atnhWUCxYt0QmThxZPM3Ez8edq+Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766032269; c=relaxed/simple;
	bh=6FTfXxgU1YlhG1zePbAXNVHq3mfoZ27mqEQ3+vMhWNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LTt7A+jf1P7p9YriRSH1/MLtuPcdo0pTfFYpidT99eilIhSQ2zK0km0CgiC5D3jq+l25gLSc/hCyWYhvh7SuKfHWmhFCgsPd4ufz/cPOxkayqJ0slsFHEy0hQcwcYc1RwYmxpSltqpQM8bSe8vukqZDKM66xfe7/Nn6sfmfjcOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ryFntvmv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766032253;
	bh=qRAn1Mm3Dk8902ZCQdpAq/dFJNkxKidGdQ/HijMv5VQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ryFntvmvdtvkGzaEVmOUCqKJes0HoYByBHO6AM7RHLnm+iqxDrcIuiGFHXnY+qJaB
	 yxk8HjrGINcxfEw80uim/LvPxrwUeQpNYyyGxw0OYGMLJX1FAUffskLnuHcGPO1qVU
	 dWHHH1+eZ7GetWLp9APf4wHRQUc2xITY3ZkFszldFzahxxY1FTL3gWBoE7ydA1bFKi
	 Yw9GerBsmoDIAXjqm6VzoZZRYmuxAn/R5Dc89GIxg7rTLuuW3h/x+ebKDK6yH0sNSH
	 iUQuPHRKwKFD35O0ee6xmp+5RscE8nTm+6+pWmN2po150tWQbZxq1X0ckbRbCeQMyi
	 BGShf22hL1kUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWyQg5JTGz4w0L;
	Thu, 18 Dec 2025 15:30:51 +1100 (AEDT)
Date: Thu, 18 Dec 2025 15:30:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Peter Zijlstra
 <peterz@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <20251218153050.44da4a78@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+fWEd.nMN3H3DrOkJtdbCwD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+fWEd.nMN3H3DrOkJtdbCwD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

x86_64-linux-gnu-ld: error: unplaced orphan section `__bug_table' from `arc=
h/x86/boot/compressed/sev-handle-vc.o'

Caused by commit

  e7980cd46155 ("atomic: add alignment check to instrumented atomic operati=
ons")

I have reverted that commit and the following one for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+fWEd.nMN3H3DrOkJtdbCwD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDg3oACgkQAVBC80lX
0GyDZQf8C1+j7IhCvgL6N+1cva1pe/+I9VzaA76E5IZmOUJIeyWyEB3ZeOwdyXUF
zEAMxBAikeJxo5I9zoiR/uLlQKU9GFd0mAGoXA5GfGaZFHvqQ7kUZD8F/wIVRPsg
dZ3ZdjLHbuXZsFChQocLK8ewLk+Kr7L+oyZQU6NeqvOtKm8BIWnqisfrFBN9a530
KWpqHGKB6WigWUci/0Zikl5QbiLhxtcYp8OG4A39rYuy3JOIuA85uxcKOMdxJcqG
KAoIIY2wgDln9UcxTL54twjMwwJQy/dcDCh520rNjvDVynvDmThpEvJi6VOHUGe8
HEFWh2r+HuqEI/hMRn+HeVwp0Tl/Fw==
=ezZE
-----END PGP SIGNATURE-----

--Sig_/+fWEd.nMN3H3DrOkJtdbCwD--

