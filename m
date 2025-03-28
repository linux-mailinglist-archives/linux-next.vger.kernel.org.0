Return-Path: <linux-next+bounces-6057-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A705DA74432
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 07:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5469F177209
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 06:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246E21149C;
	Fri, 28 Mar 2025 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D+uOyMHm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AFEC2C8;
	Fri, 28 Mar 2025 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743145072; cv=none; b=OndCNCQHNihDxYX32o2o4py32gRPZdTRoDszpmGX7mhibOVDfQbTqblLlYYAyWV7rtnMd1X5Ho9/4C8wyClGOPE+z1etx/NsJdjQ/jBMZcReN8nL3ugJDwqiqEUn9d7XNJKZ5tJjTkp9koplp8wImaZOHuMOBrOFQiGVIaNUj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743145072; c=relaxed/simple;
	bh=fqn1sNdp7XTxAsfS81siDrBYMb7spo0YQWmWiuH7buA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bkjin0LDW+YaZPm5sJbHhApWYKXkLRT7hnmporHJzcBt+SWu7Lj2RhcnyTqoAyu5Iq/TK/SFH/kYyU3M7ivAXE/hZYPoOzKu8RjdHKHJIMBvIQlUW/GXjz1o/SYnAI/DNQwgU69iSHmx/NO2m24Ar3dtbp2xY3kV+Gj09DgJH9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D+uOyMHm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743145066;
	bh=gtrmpLFu9NFyCseORhGab0BfgU5yV+aysRBcn9FP0i4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D+uOyMHmcAjwHmFTrJsJwFubUL+qwAjXnjlhHs+RjBwCXjDU4x7QvZM6lzO+/dKU6
	 EnsgFNlE4mGHP904u8B/S+lxAQBnvwW6F/OgwIlvtBTdlUG5pxwjE7kx4/GXTcoXLZ
	 AsBh/I9V5G+f/ASsKNSDRVnohE8EFxQnqmglvUUrHUSUbikvrhnACeaplQD6rNc24q
	 5AhgOzKhNXtI2AbmoJEVkkKlaDvILO+f0CQkOBAWbmpRRByk+1cLGY6X1LVg5+2LlT
	 uIvP+lR1vr/MQm4Q+wvjnlK6G+gZEuuJKWtlFA/2+L6EX5xJV5L8bq3jORZPFrnwmr
	 K+XhLKexPco5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZPBDV5BmTz4wcn;
	Fri, 28 Mar 2025 17:57:46 +1100 (AEDT)
Date: Fri, 28 Mar 2025 17:57:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250328175745.7ecfee87@canb.auug.org.au>
In-Reply-To: <20250318213359.5dc56fd1@canb.auug.org.au>
References: <20250318213359.5dc56fd1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oCqlxps/yWr+Efk63b+z.1l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oCqlxps/yWr+Efk63b+z.1l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 18 Mar 2025 21:33:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the iommufd tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/userspace-api/iommufd:323: include/uapi/linux/iommufd.h:103=
3: CRITICAL: Unexpected section title or transition.
>=20
> -------------------------------------------------------------------------=
 [docutils]
> WARNING: kernel-doc 'scripts/kernel-doc -rst -enable-lineno include/uapi/=
linux/iommufd.h' processing failed with: Documentation/userspace-api/iommuf=
d:323: include/uapi/linux/iommufd.h:1033: (SEVERE/4) Unexpected section tit=
le or transition.
>=20
> -------------------------------------------------------------------------
>=20
> Introduced by commit
>=20
>   50c842dd6cd3 ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ=
_ALLOC")

Any progress on this?

--=20
Cheers,
Stephen Rothwell

--Sig_/oCqlxps/yWr+Efk63b+z.1l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfmSGkACgkQAVBC80lX
0GzVgQf9F7nfcBkbujW4wDZ4D2AvEXRZXNzyE1bczzn7VcxBNJs6HGM17w27WZ8l
oNHTA+qOfMn1sGdTuYHcnfgVrhTOF5GYEF1J1XN2oDG0DMQOxmf8iuh6lXoqSGMp
B6AQZsru/XvrjZ6x1dWRYwG8BEVztA1+R7QR0/8AQGoLPZSpVVOb3SztUS9z5GXY
QdDLIpfc3LsyxYUnWphsLrs4RwMnrN3/krVbyd4gU/cNleOQocjIaal1iYQ0zfS/
6mZ3Uuzbh5YI9mZbZYe9yrTQ4xTS00BpcbSqUXCvqX3Ra9osC6ysachXAH7id97n
favvT+DaNqk9dT75RDYjZbkzmABsmw==
=zwO2
-----END PGP SIGNATURE-----

--Sig_/oCqlxps/yWr+Efk63b+z.1l--

