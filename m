Return-Path: <linux-next+bounces-2959-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B192F5A6
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 08:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC9ABB20EB7
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 06:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936D213D520;
	Fri, 12 Jul 2024 06:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b3j1xGkq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8F339AB;
	Fri, 12 Jul 2024 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720766641; cv=none; b=Dic2gmOpSlscivYWq8ztaQ3ZJMLtxyfzxRwM4bkqsx9fWCttsYIZvWWCiFeCH1JSp9zoVPHgibIjtEodx78fmqpNLkK1ddDrPpwq2/EiL3Sg9aUhviQamBRV2BhHjfkjYykSqjXW+wdPv/bcZwkpnU/A2MsYNrCjT0cBu1WyWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720766641; c=relaxed/simple;
	bh=sjO2zR1sARW3qaRzUw3BJVWpTRtHcuCdfx0jVM3jOM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YavFgF20iLdnXj0bn7ZLVaINqB+jqjVOiCYGCWqeEj+NQbDa42vbCYAsR8Uly6pCX4wPPapXHuTtjPn2oHZLJkSm4a/lbnXFmncKFDWfVHfzLXj6Tf3Vnhc3EXKA8/POFnF16+LTxpdnvwvsMBPWeBh9Yi8IDCQmhWXDf1ij9Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b3j1xGkq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720766636;
	bh=DkpQcD8KqW6VzkolOtblVBkpGn+rBLbx0Cx7ikepTaE=;
	h=Date:From:To:Cc:Subject:From;
	b=b3j1xGkqsxHlU1PJAK4HxT94HuXWrQUtEB3AWHSZO6XN7cxepQcc+iX5ZyVU3+rnx
	 5N8qTTbV/a3troVvXHwnFHD/hiFwJVJwwz19eetzGa6gZ+xHazVPeIR9kMn6fCQLXT
	 NK+TitCQDfLqPty7VmG/vsd8Kb+ElkwGn0cLR+IJYYrhd/x6bU3Nc1XbZ0YAonK0Ye
	 ECMAVOdkgT5+/Q2pO+LoxSLjFwayp1dwNSm4VNJO/PtUk/B3juSd8Cb7YaZCl8DijZ
	 nEYRrGnSw11EJoB+GqTG5/GVS3caiDy/bWx9QbKKYsPH/AYlMiFSMpYXh3jIQEFzs1
	 R41kG7DLaHp8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL2B40LcCz4wZx;
	Fri, 12 Jul 2024 16:43:54 +1000 (AEST)
Date: Fri, 12 Jul 2024 16:43:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Tejun Heo <tj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cgroup tree
Message-ID: <20240712164354.65cb32bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E.IBjcoRjRRa7SRu71RsIsk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E.IBjcoRjRRa7SRu71RsIsk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cgroup tree, today's linux-next build (htmldocs)
failed like this:

Sphinx parallel build error:
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xfd in position 558: i=
nvalid start byte

Caused by commit

  704f684e15ad ("cgroup: Add Michal Koutn=C3=BD as a maintainer")

I tracked this down using

  git diff stable.. | cat -v | grep -F 'M-}'

and finding the commit that added the line that was output.
I tested it by building with the commit temporarily reverted.  I have
left that commit in today's linux-next.

Clearly (I think) there is nothing wrong with the commit, but the Sphinx
utf-8 decoder also clearly does not think it is valid UTF-8 :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/E.IBjcoRjRRa7SRu71RsIsk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQ0KoACgkQAVBC80lX
0GwmkAf+Ldn784aksxZtzY2wP1cgyK+W6oRUh175s9+nybqVgS87L2cjnk8nsh3b
KPx2oMP+FWHkWwp0M5ZrnUIPN7vrkPBx+FIMJsf/1pJEF67aKCSpTycvflJsw6+4
OzBbgDmra05GpxBfmAauHG59gaJ0y7UgTOfzhMiY5im5vuJZd0CgmFzwkeyZtbqp
xdV8vW4uw/XWJ4dKt1/a2P7dziYdmXxMBUN6CnxSBzR65mE7Nk/eKl/dRNh0LFQv
rvHrcz3GU6UprRswF+ZTD4MyUieQMRtVbXPmxJsbU9ISHZXNfqsZpa3CTzjQo5IJ
7hMcughCyYSo4b1XnqT6hwOa8Fw5qg==
=U9Tg
-----END PGP SIGNATURE-----

--Sig_/E.IBjcoRjRRa7SRu71RsIsk--

