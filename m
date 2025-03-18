Return-Path: <linux-next+bounces-5855-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1EA671B1
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 11:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D7D41727D1
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 10:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658342080C9;
	Tue, 18 Mar 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IceG14jc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291FEAC6;
	Tue, 18 Mar 2025 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294742; cv=none; b=oy+HhNenahwSHfDn9xDQ9jPZ1HpcyAmwV7nZTDZceitHXagN1nIgtKSHFJnwgUY/OH1ZLTIH3O0VV5H8fAVrvK8OaAcJjev5phFIFS905kvq52mbtyrxAX7iawUdIe42gO4OLFq/uDXyc0pNI5VQqukGpwivjsWv7yvr3pNUXn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294742; c=relaxed/simple;
	bh=a5K4VbEWLRvhsHbHvR0ovzUxmd4G3NqwbJYfvGFJ6eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FoFATXy4yXGUT2iSr4tEbmLf1n6oTBkdZgOuhE4bVzpYxqyLLbk2SpeMWL76JhnXJBUh8is/VsSvcZv1xrZLacFeaZivy1tJfJqNYXfok7GsaEGobXLrjtXgTobCQ7jUYTsGNz5r2Q9KecAJDSZF4yqm1LqLMcCvIEIsAYMjXus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IceG14jc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742294734;
	bh=t6VI9Q4RIWe+jasiqrBTjLC7ubPFgrKnP6xf0VJ74do=;
	h=Date:From:To:Cc:Subject:From;
	b=IceG14jciio76zPHN/bIFTBWeu0jdKvd5wlZVw8wfXggEu4ibiv8Tpv8cKUX8QUw1
	 zvZh1RZGzqfyGz20XAIB722c89BFPpE/dWoV9kcocPwVtJ9QfC2dherD0W7IDowQhu
	 y/MJDfykuR9Sn8TRJQm+Jm6k8gtCZa91RfUb3JJFAuWBeuw1kI8g+O/FhzmXBlP+02
	 01gqkctnbP0c0ApjZPBlPKbmRIucgx+CcZMdrIy84UHt2Zmax1njOIqyRXjzyEFZuz
	 Uei4mA5+C620mgOro9dmcHZHqw6e6MOi4nkLQJmjDsCLppwW2rWVvlkFSQdW5cqeTi
	 snUOH+EW58YGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH7ly61wSz4x2c;
	Tue, 18 Mar 2025 21:45:34 +1100 (AEDT)
Date: Tue, 18 Mar 2025 21:45:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the iommufd tree
Message-ID: <20250318214534.5476f9ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AI=OY//dl_SkWu4vr23Vu/C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AI=OY//dl_SkWu4vr23Vu/C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (htmldocs)
produced these warnings:

include/uapi/linux/iommufd.h:1024: warning: Enum value 'IOMMU_VEVENTQ_FLAG_=
LOST_EVENTS' not described in enum 'iommu_veventq_flag'
include/uapi/linux/iommufd.h:1024: warning: Excess enum value 'IOMMU_VEVENT=
Q_FLAG_OVERFLOW' description in 'iommu_veventq_flag'
include/uapi/linux/iommufd.h:1120: warning: Function parameter or struct me=
mber 'viommu_id' not described in 'iommu_veventq_alloc'
include/uapi/linux/iommufd.h:1120: warning: Excess struct member 'viommu' d=
escription in 'iommu_veventq_alloc'

Introduced by commit

  50c842dd6cd3 ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_A=
LLOC")

--=20
Cheers,
Stephen Rothwell

--Sig_/AI=OY//dl_SkWu4vr23Vu/C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZTs4ACgkQAVBC80lX
0GxgUAf+N5ypqv0UT1EF6Xu5SBSvRPEgxVhUkn7Zp+WQT+kBLj3C91jcAqaZxFhu
Qi0hJrxGFSrIVBsoAwmS8EyMom9de5i7Yrzf61ieY11KVGlcIOSXVKWnegEkPG3D
HsaBhfT1bXYlmTa6dXRStZ7ox/TqvaFCWpiBc165Ie5302jjXIgrKx0p32Jla4sk
HEyNg8BzFV0TjI8oElPz/G0GVmVnGxZB8ETF5xZ8bTGVMRWVEpQwG1QF+wKwneUy
7lrsh83pdvYE2IoFSawZbHr7Qqo1uvBedUVZpr0dXE4s4HHvqkxgzZtKawGO6zP4
XFrOXFAEn8DeHJrkLla5rJ7BqjBIVg==
=IPGw
-----END PGP SIGNATURE-----

--Sig_/AI=OY//dl_SkWu4vr23Vu/C--

