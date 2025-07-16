Return-Path: <linux-next+bounces-7590-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7FEB07FAF
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 23:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F4D1C42D96
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 21:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E8D2EBDDB;
	Wed, 16 Jul 2025 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bwdp/vGc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D142EBBB8;
	Wed, 16 Jul 2025 21:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752701547; cv=none; b=ts6SEuu98eLQR8oF3Mt5//7D3uDiFOaKLR16ytPOLNq7FEQ8aA+0L7ksd2BqWI/MHoA1gaV3iifK+PwxbdTfoZBySxBTJAuLzMImbiNi2xg1sPX0p/fEj12vBdI/PvhqGcWeCHyRWSakeSYRiCN5yYiSg5bxwRMECCQPa4G0OQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752701547; c=relaxed/simple;
	bh=bLS9FBu/c7skYJqzY0x6pwzs/M+nGNC/6F5Se1nMpT0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPkXCcYcLBA+H1soOjETfQs/LTtbgBF+4M7gDJW6w/3xX8UfL0cOS9Jpc4HreSl8Tm5xAuuK2nhmKCmQgG2kLWxGjBBOormMqsiqMvd6yqZ0z2nmUoQATqHzS4jAsQJRD56403QItt2bc66vfKWCL0BMjr7Gkm/SQiC9vBssU9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Bwdp/vGc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752701416;
	bh=BNiY3rYtZ94JFaO6DjYPH5FmoIwDx4Pnjjz+/ZLqKII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bwdp/vGcoCWRNaWB+g8ovzQKlEgAmluYjfqtPLWF0NQMt2lTqQu1IloQflhU3XBUo
	 SRzZUh5ZoDsYzbUEEysOp/ADoBusq3oUrLqfl+8TV0gNdwUodND2HZq+uavzBTStdr
	 5v+Q8CGiEJzSvwFi2TFhADrCOcOwQ/eVApEDv25bAps4HnvPTyydDEJqo6Qz7LwiAw
	 lp9rGbRvwawB0QoVALiBYcoOsGiu0A2gXNl4QaKeEvPIYlSyQziqZcARC/kPcl7VWq
	 Ux8hSexmKor03gwJlmEy67LU1IUN4zSE27kaeZCc20+c7IHGeV0jXWV4E/g8Fv76/x
	 ISWVAT5yohn8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bj8NS0Hr5z4x43;
	Thu, 17 Jul 2025 07:30:12 +1000 (AEST)
Date: Thu, 17 Jul 2025 07:32:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jens Axboe <axboe@kernel.dk>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the jc_docs
 tree
Message-ID: <20250717073209.3228adea@canb.auug.org.au>
In-Reply-To: <87ecugdzyq.fsf@trenco.lwn.net>
References: <20250716150234.52ec0d5f@canb.auug.org.au>
	<87ecugdzyq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D+_Qet95//7UdFbeHecVB.9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/D+_Qet95//7UdFbeHecVB.9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Wed, 16 Jul 2025 07:31:25 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> That seems like an awful lot of fallout given that the block side, in
> its entirety, just removes a single line.  I guess the resolution is
> correct - thanks - but I don't quite understand why the conflict is so
> widespread.

Its just the "git diff" context, I guess.

--=20
Cheers,
Stephen Rothwell

--Sig_/D+_Qet95//7UdFbeHecVB.9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4GlkACgkQAVBC80lX
0Gx1ogf+PkFQSaUKBmS9Ni5AtlA/AMbNaZLjRSIAD4siscGEqzEXMCFIrs0ChAtd
97769Qfn/xWO8P5lAxNDRM85bIUF+Ika1raCfFJTexjlqv1Oj6CkXlvbK7TAD9me
cOSyeyBHzxBp+ezNuAwFo2YuZea3lOVxJwd0cbtzKuAlwfIgwGJgm3jPsFX0HVRD
UrDhbTWlupDr0TSO6DOawdSZYZYMuEot1KUjGt4TuSmx3KF7tYcX/5K57m1Wg+vQ
iln/w5djIouqtQeycd0Cj6ofsiI3EsZwsiOPrc1/c3IyLXXvw5lUh+NRhOqsQnH9
eCALjCF2aTNYsGE8ewa3qhvy4pJtCg==
=CZgg
-----END PGP SIGNATURE-----

--Sig_/D+_Qet95//7UdFbeHecVB.9--

