Return-Path: <linux-next+bounces-5369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A68E5A28648
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 10:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 424E3160CC2
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 09:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806BF22A4E4;
	Wed,  5 Feb 2025 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZeVRaGs4"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5622A4E1;
	Wed,  5 Feb 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738746877; cv=none; b=HJNy9BX+gwyCL5gQBmz32qZAnm79KgbVlV127Ex9CaSBmrGoGZmkJMu6CYP2z/LR122/yaYXOOKqCpLLbR2CUNv4rIesUMDCQtiA19R90+MK8CLnW+RT6JtaWh3YF2z6Sial3UKwSzyv8se4wKxJ3f1sMZPKvip1/stYZZe3mjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738746877; c=relaxed/simple;
	bh=7Fd/ktYgs+VN6W6ON+omAnkDBbnkRTbJd0bDOrSqCE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrXDpvq4c9eFZuz8LizlmDcbxbW34/y0FgxS9o86F8nkhJDoVjo0z0BMFWt7oKJd+WiZXGyBFXvK5S13vcHajUCiWyOtrjTQ9P2bPi8yHvZE17ZAhS3EhcgPDcU/7k1YAhmoEPji1Fj9tL+Wewzh4ouE5PVBw9bKnqUGZli43ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZeVRaGs4; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gSYBRslTCVnWBoHK/aqOtRXDAUtCUdvwNR/hxpXAIc4=; b=ZeVRaGs4ZgH/nGGESIexy1plJa
	h65QYfLJYhs2jwl6TI0qkwAehx41dtiQJcMUU2OMWCgEGOZptonwVRcrhqIX2LM4ZwURqM427SwqF
	n/Xe3/sbnCOCRqg0DfabeUha55tUnWWeeN5UUWl+UT5VNjMbIFlLRHlxwLJQ+vITygzeUDnbNrI1s
	7eO5maMDRH/NqLNIj15U9ZCFxPjDrmfnbFYtCEJxb95Lpf/fen1+pHaTJn5ThuNANG4+ft3V531Wn
	vTbwl3MWlqxwAN7o9kXW9fqsKrc8QGOdj7QHSFsCapGhdxhUpYx0xHxvow9GFf0s1QPW08WAEyreY
	kvOgF/fA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbUK-00000004Atj-1Euq;
	Wed, 05 Feb 2025 09:14:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2BC573006C0; Wed,  5 Feb 2025 10:14:27 +0100 (CET)
Date: Wed, 5 Feb 2025 10:14:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Liao Chang <liaochang1@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20250205091427.GZ7145@noisy.programming.kicks-ass.net>
References: <20250205080053.30dbe654@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lKpNcEHplkQbB6JV"
Content-Disposition: inline
In-Reply-To: <20250205080053.30dbe654@canb.auug.org.au>


--lKpNcEHplkQbB6JV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 08:00:53AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   a66396c911bd ("uprobes: Remove the spinlock within handle_singlestep()")
>=20
> is missing a Signed-off-by from its author.

Bah.

> Looking at the original patch, it seems that some process has cut the
> commit message off at the '----------' line ...  the divider is
> traditionally '---' or '-- '.

Yeah, except akpm uses/used a much longer one IIRC.

I'll go fix up and rebase I suppose. Thanks!


--lKpNcEHplkQbB6JV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmejK+0ACgkQdkfhpEvA
5Lpt+RAAjNvTt9Pm1JLPfqDG1iuWwpFMoV1qUqRSIypNeIvCoNN1u/1FciNIKVxT
+wuUJWefrLQyavobQ6RkPdL47xB6GVL0GTHOtXz3jz7881cs2fkibx6TYaQ64ILE
l0P/qAZ8gezqSnTpSMUPFcV43MhZ4d9f33K3GMWlI/KpPxZv1NEN4vHOlnvacCeo
UAsLRZcWIMcU7vgXvSV7zp8iVikSsJ/oGU+XfmIL+ZV5w5braeyJ1dzoNNVGRzAa
L2M5EiuDlncx8Bc2vYxlEEe4ShdJR8GPUP6mBJHTkyvCTbTJOWqWzP6p2OESht5r
8iX9SKsemnQnpJgVddogIAyKzmszj/fjG2P1n9HqQk+eVAZNFQ8W8mnXFZM2A4JJ
yPvwgTcg7RVwCNapeXugS1a7FBApxTLc9H5em431UYEdukq4LjULhKsx5wdTxiXR
XjI7d//wHo4kUdQo7X+r7jHTJlriqJ4AL2VJzWOVZhPznrP3Tg3wHmI4/KfyjVGb
FIoxFDkBtwWN8uQu08Wa5Lb5J9MQb2AQ2/gPUyi7mn1vWZaJPAHzfjb88ymiuZyh
5mjdBGOHaYq8LquhqxyQvuvNUjCcp3WAigTxK3qqOQrnMfpfuke7w+6W0Mu+jos4
xNqCDNHYU95BY6XXB8VL6LzUNVTJ7hOEEWibmjJenosPo1loiFM=
=WD1d
-----END PGP SIGNATURE-----

--lKpNcEHplkQbB6JV--

