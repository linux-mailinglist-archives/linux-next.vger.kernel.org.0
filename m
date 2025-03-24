Return-Path: <linux-next+bounces-5945-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CCA6D45D
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 07:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2529188F7AA
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 06:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356C62BAF7;
	Mon, 24 Mar 2025 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XjjSL/2e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD6736D;
	Mon, 24 Mar 2025 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798509; cv=none; b=Jab8qzp6m6SPK/PH0xQc34YIhkcphbM/IOiTSmpQlDYYhVoDPSDKOYSxqXC+k7ey4vEmE7LYo/2KCaLxUleHIvUA8O/Kyq6NcnAoGTU8nlyeXM3ZlVYhER3ns62pJ2zzVHTDa0Kw0gY1/gV4Xob2LXL1/+moAaaE9yN+UR71LgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798509; c=relaxed/simple;
	bh=CY+Gs4fjyukhd31x4QvUtrjpyzwlR57UJsnvil3ri2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qsmuzr6KkjQUaQG2f6uYZa6EkEg3xFcIF0jkR+3cq8LaQ/J0SXb07U2J164eI2U+YSx6uW9ARcnt+pY9tcD5x20H8k+PJVkeMv4Jm/6rPh1O3mrIYkm0oFZORPyaqLx4Kz1UOyc7qTpjcCSBH61Miv0TRQX6Kep8S/C30gMtkfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XjjSL/2e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742798503;
	bh=CY+Gs4fjyukhd31x4QvUtrjpyzwlR57UJsnvil3ri2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XjjSL/2eD0X8lwIq5GyXiiWu7DJa76juJP9HyX/U3bMsRvCTlYHdfkF90OBhF+0Cc
	 fd7Yx6amyXBLzFaeyVTTaHcPNSdOvrmBdZrGhE3MVmGRINL+mJNNZ8ZDGbVCL7lg+/
	 DdVg/AgvasAqXeGNEeXyRJTOykJ3FLNyTB6zeb6gTnqJQCA4pymsbdkzsPTW6VlnXh
	 wUe7x57WmfLiJPQmfJBVF7yPRNRnE1/czEKltTxc5f68Qw4v37yE2FY6BU6dPRAeNm
	 RvFVPP+hkvPhQbNY11ZPafkBDV+pivHU0O2KsI9GKRcsOeCFUvjPrXTwUIx4OuwgLz
	 TaQZQdZyGb5Wg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLk3p3pbfz4wcZ;
	Mon, 24 Mar 2025 17:41:42 +1100 (AEDT)
Date: Mon, 24 Mar 2025 17:41:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Tor
 Vic <torvic9@mailbox.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250324174141.7b3c4a70@canb.auug.org.au>
In-Reply-To: <6227FBC4-AF53-4992-9E29-C0D1DCAFA136@zytor.com>
References: <20250324172723.49fb0416@canb.auug.org.au>
	<6227FBC4-AF53-4992-9E29-C0D1DCAFA136@zytor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gQ2Qu3/A/QuHxE=KzOsxTk0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gQ2Qu3/A/QuHxE=KzOsxTk0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 23 Mar 2025 23:29:20 -0700 "H. Peter Anvin" <hpa@zytor.com> wrote:
>
> >$ x86_64-linux-gnu-gcc --version
> >x86_64-linux-gnu-gcc (Debian 14.2.0-12) 14.2.0
> >
> >cross build - ppc hosted
> > =20
>=20
> Cross compiling?

Yes (see above :-))

--=20
Cheers,
Stephen Rothwell

--Sig_/gQ2Qu3/A/QuHxE=KzOsxTk0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfg/qUACgkQAVBC80lX
0GxoZgf/XFGDXod+dFddhKdQHRt6RuLHT39wynZPpWpHti+WvMd/E4GVKM4B7EXM
NMKJJXIKWHTmvAA8ep6no4NJRC75UjAbVion7MOYOHgkRsgyEt6Ss+sFCCuXwyEF
qbP3anHvz9ALHqD0bqLf97r1HJsbfoXo+ivXLBFrz8ue8KYlTmetCK2Y8aM47RXU
D5G3bJaJ6hitk+++5yl3UJGsG1UGhLMeCzBcs4zxtPnl5RbkIiSvhNJODnaHBEzY
bO7tkbXypgr4177DznvnBt6AOvqju5S5KlhbLJYxzvpNhJjXz8Au/cVt8nF4jYz+
0LN0QjiC4W71UlHlPjdprw0iNkzFzg==
=6XqT
-----END PGP SIGNATURE-----

--Sig_/gQ2Qu3/A/QuHxE=KzOsxTk0--

