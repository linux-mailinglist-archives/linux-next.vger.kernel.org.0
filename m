Return-Path: <linux-next+bounces-5936-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C4A6D109
	for <lists+linux-next@lfdr.de>; Sun, 23 Mar 2025 21:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8396D3AD80B
	for <lists+linux-next@lfdr.de>; Sun, 23 Mar 2025 20:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ADC1662F1;
	Sun, 23 Mar 2025 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PAa0R6Z7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257EB3B7A8;
	Sun, 23 Mar 2025 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742761429; cv=none; b=h19DYLpM10tRVIhYZik9CRbZMOFLOdwj7/HzI9xx4cNNDaXeCJxKKfJA2x0TGjHP7+SN0OPZ9OmBdXo9upFzP7SPTOUIbe5mD1RODYJWLVEmgYv07ogsdr3bY0H+NTLVjIoXur1nTZBXikl9wh+WbMgBr80orxo3VSgcDm/qsTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742761429; c=relaxed/simple;
	bh=OJUMTTBkVUc2DlQDbl5Re5m52DrfECcJHH3h4T9vimc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tHEjTqRXbowjh96z6PzsVGpA/cTbh8AY4CHqNsKH7WfLoonwaRVndLQMC1S8EvbzN7uhdqJQUJqDI1f/GtxgEUCuGpbWZzwo/1GpOj1qGjMvt+H+S0/rwkqWjbh8COUfj1jVAoDHYPJG1x6edH3vkMRgalKhyocGKMmQ7gUtv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PAa0R6Z7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742761415;
	bh=yXetObvEXiv6CCkoG/ZOcLmoDavtpgBXlisgs8SqfUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PAa0R6Z7hzg8Ff+jfzZm1DslPFg3rgZG05BHny4M6EmZLzGNIxHoqDxeaQ0lwNjJY
	 wKm0bzaNW9mtjPekmOtHfS3+JKF33mWogT9UDo468YjuO9menIYmCgo7Nes7G16DM4
	 Nzpr/qpPQNDikxXkzkGumIJqZaqFdqDtYotX1Cq1mKoQFdAlzy2TJCsCt7pBURp5jU
	 AHCkxbjmGvVqV0S63NFY5SpteSPCOnDXOiDj2sMTeGbCQuASuenitwsE14XstscPYB
	 hdCja8b4KZ5NIgd4b13tZ6bUwUIWsMtAJOxKdEOdRClZ4w//ioF8us4P5gNmxttvGP
	 VRNi8IDhKLZrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLSLb3Hr9z4wb0;
	Mon, 24 Mar 2025 07:23:35 +1100 (AEDT)
Date: Mon, 24 Mar 2025 07:23:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20250324072334.064b83bb@canb.auug.org.au>
In-Reply-To: <6e024a8c-5d54-44dd-8ab9-cb1d269c288a@acm.org>
References: <20250321164700.477efe5c@canb.auug.org.au>
	<6e024a8c-5d54-44dd-8ab9-cb1d269c288a@acm.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/otqVrLDA+Gj=OWyxrsM47yR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/otqVrLDA+Gj=OWyxrsM47yR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Fri, 21 Mar 2025 09:29:20 -0700 Bart Van Assche <bvanassche@acm.org> wro=
te:
>
> Thank you for having resolved this conflict. While the conflict
> resolution looks good to me and should result in working code, it may
> be desirable to resolve it differently (init_completion() before the
> ufs_get_desired_pm_lvl_for_dev_link_state() calls). This way the
> spin_lock_init() and init_completion() calls stay close to each other.

I have fixed this up from today.  Thanks for checking.

--=20
Cheers,
Stephen Rothwell

--Sig_/otqVrLDA+Gj=OWyxrsM47yR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfgbcYACgkQAVBC80lX
0GwikAf+KJnVEh4eMCUL0KHd+U5Boosfe2+3zpk8sNUfiAhkb1YugReMy+Z8D2Kn
tqgRXOUPglKORKFWoSlbEElIfXG4D9jh01370dpyuxuYAr0zT/o6NtVmTrl4qpWw
oL2jOnVYTcnPY4Z1FYGI23wYv0ZSXax+RYD+Vm8+jPKwVoBRvhPT3Do+dFxMSngQ
MajqQyplJCMqmmPP3LouErAGaU9ByYAOuEcJu9FkRsYJ07BiQzepp2hEr5dzEl35
DK/B87IOXrWvy/+cVAx71xLsLBL/J2QF3/zQqK4lnocLdO4kMEF5Ax+dKK7Quxx2
mEKbmJ8ffFRmraXTNfN0vnRpdIEsLg==
=0SG0
-----END PGP SIGNATURE-----

--Sig_/otqVrLDA+Gj=OWyxrsM47yR--

