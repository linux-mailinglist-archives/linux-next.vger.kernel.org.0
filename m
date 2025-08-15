Return-Path: <linux-next+bounces-7958-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB69B27A85
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 10:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C882566DCC
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 08:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9F61E3DFE;
	Fri, 15 Aug 2025 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3X4vDYo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C424E31986D;
	Fri, 15 Aug 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755245124; cv=none; b=BUbuPLUki8BzHRMDxoMdTiEcWEvL21ceU/PnzelZpWLypa8Q8QVVBmvo25NtL2DOqiUA58TpfHmpmoDTFqIcCJbq0ZG4wFRSvX/sC1o1qJ4MMnAVt2++U6e4E71HahfnXt7NNvNtvBzeUHYHcmGBUFxYGP9PNtGniBP4oGU2OGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755245124; c=relaxed/simple;
	bh=k8UfQnM243Ul2qoeoM+QQ1AelxJ/+h/5ILQQDuzk+T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nETq77MC6vJB9rLfjhr2yt0RjMtSVy6sdHfv7ILH1my48oKTVH7dCSnk2P/ahohkI7sFkh9/AUDFyVwtiBoFK1UjlF/ayYU27W8DHTFgprkIHh6gYArmIVmvwdeOak85gSEIPLIqL3X4bsYc2wuzp7aDQ7P6IEWBy+ZdU+Q2pak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3X4vDYo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2445827be70so19110085ad.3;
        Fri, 15 Aug 2025 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755245122; x=1755849922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5uSEDENSg9QG9Pb54qzC3cl1gyDu0kDSjPvwsd5ALPE=;
        b=V3X4vDYo4qySxlV8D6YwG4JMp0bQA/rIFnzEaekSUF8QdoB3yD9PrXoVEKfBsIxn94
         YahJ18gZNmbHWUlaru5prypRdxgF9sdGlwXsCP6dxYfjXoVVXlnjyepEKbng9dHoyzFt
         6B9acATMpma/nkolyWFkzGLWDhExBhtV0zu/SZIKxyVmnNqSS20Gk3PuSG4wAXjZeBH7
         H1ZJLX+2loiKU8bHrnN0M9Jcvz1iTX+Hsag5keBVHYRa3PXNsuBYi+MyCW2AlornGl1p
         SJqbOeBQmralnSm+WSo2px3yYByeBC60k+0t6uvGEnfFg4W+3amWYRBSdRJuUcjx7L0T
         Lngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755245122; x=1755849922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uSEDENSg9QG9Pb54qzC3cl1gyDu0kDSjPvwsd5ALPE=;
        b=DKs0tS8T/ZT5SLgAJvoLILscq2z3x0Tam1A0dj/Wpv4w2p1h+vTe2xM2voZlZyt/Ci
         ZqWTQk0kGe2VW6w6aCazyqZjITQoNapd2xKikVGqEQRG1GCkCFHx2hGZYRznsC+v6Pl4
         GzJUtfv6CVk1HOaw/4Jr2frq1PKsXf5k8+hbHI6TKawMDUmmfwQdmQ2bzx5Ct9UtJQOA
         d5Lq8ql3CDvVlVW6bzA/Tz1PQdt1y63Tf6JEvbo0c1joLzh9tVyfptR5hfJEsKMYK0RF
         WaXhzLZCSY+Ax9h9SPVZyEoP+4cENiInWyaIkNqqNi9UKX9DEFPGuFj9AHoNo51s7Kx6
         KaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoRY65fCAc9aLS13u4oaPmajeTTHVeaLkQqwRclCLRkqj3387PXS5sUH4MSRo3eAwSfHfMYdtdpwNbPQ==@vger.kernel.org, AJvYcCVta9ewrcDLhOTUoKAE4qyE+LiZJEcdF8qgNpZ4TeJaWJoiYPz94LhrNkRCjoxdCk8fgx7e0vfO/IQJHRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWSGrqzZCcWiIAc7BEIt6ROPj7g0HdqhOTMgLqBVxlACPdnWc/
	k512pLr5vhMipvYKzsp3uEbtZcpHKlmfKnmeNhwuKZDtK3yDjDfn7nPS
X-Gm-Gg: ASbGncvc2u/yjTqsj2Qv3AhVEFB8c7lIa4A/cqaBDKe9bTfGzs1BFY+7WAKnkDILQyz
	AIfaWDNHCb9K8qQ9cdz98p+gecGJUiT07gu4WIynDidlkvkaK5voqmRCnd2QkF1BlWHvetb3tEy
	pig8iYvGtzOnvAu4oQfRzIFWGb92uTIxenEG90mc8AlybeMW3e48/hN4BLpHOGh6b9aweArlspD
	sHKXXjlUvMfMn0AnyIG8KQpcRyGjuUd/bugy+xD0jNJjzkmWbVHl1BujOI6+iKDlFMj9pbp3sei
	HKBahRgJw+pVPIifkD1pZbPmkx93OnI7KeZ5+ERdrw9FlA+aycT0jsgVbhzlR/S6gRLU6o7UNsL
	sOBYWTJhLe5AT1Nz7yQX/+A==
X-Google-Smtp-Source: AGHT+IGF1W6TAYi19dF3hXjVFcA0nY90wtv1BV4tIOf5aireZl4vf2QM80NKyIbsBscU1We3mRGkfg==
X-Received: by 2002:a17:903:4b4c:b0:242:a0b0:3c30 with SMTP id d9443c01a7336-2446d8edf38mr15902705ad.43.1755245121883;
        Fri, 15 Aug 2025 01:05:21 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d737045sm644144a12.34.2025.08.15.01.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:05:20 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id AD29C4278709; Fri, 15 Aug 2025 15:05:18 +0700 (WIB)
Date: Fri, 15 Aug 2025 15:05:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Alasdair G Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>
Cc: Dongsheng Yang <dongsheng.yang@linux.dev>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Message-ID: <aJ7qPqOZuRLoLUnZ@archie.me>
References: <20250815130543.3112144e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yXNvtZisiw/8onxG"
Content-Disposition: inline
In-Reply-To: <20250815130543.3112144e@canb.auug.org.au>


--yXNvtZisiw/8onxG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 01:05:43PM +1000, Stephen Rothwell wrote:
> diff --git a/Documentation/admin-guide/device-mapper/dm-pcache.rst b/Docu=
mentation/admin-guide/device-mapper/dm-pcache.rst
> index e6433fab7bd6..550026219a6f 100644
> --- a/Documentation/admin-guide/device-mapper/dm-pcache.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-pcache.rst
> @@ -25,6 +25,7 @@ Quick feature summary
>  * *Log-structured write-back* that preserves backend crash-consistency
> =20
>  ------------------------------------------------------------------------=
-------
> +

I think these unnecessary line breaks can be trimmed instead ([1]).

Thanks.

[1]: https://lore.kernel.org/dm-devel/20250815075622.23953-3-bagasdotme@gma=
il.com/

--=20
An old man doll... just what I always wanted! - Clara

--yXNvtZisiw/8onxG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaJ7qPgAKCRD2uYlJVVFO
o+RHAP0R2sJzJUvRZH+t5hcCYIUqb7RnANTSE8QFWpMgzppmgQD/SFKX+g5fabNt
QiLANV+NSVp3UsiMbp2a3JSX3a0gxgc=
=7NtE
-----END PGP SIGNATURE-----

--yXNvtZisiw/8onxG--

