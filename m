Return-Path: <linux-next+bounces-9464-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE662CCB0B6
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 10:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BCAC302BBAD
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 09:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDAC2FA0DF;
	Thu, 18 Dec 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cGTE191/"
X-Original-To: linux-next@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F722E9730;
	Thu, 18 Dec 2025 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048442; cv=none; b=FWr6Nu/Iy0LtsjZUt3kUnHjl744Kk0QBJCk7UlBdOHX0Dme9Lk44gb83x2LqJEh3o04H4UE3mk/gmxSQLJFWAF1XwuvE+bQLZuvdovU5Z/Fh7ttRaNFyEzIrhqFqekeymVzuAfBdGIjJAOoODhu4zJVQfxxOhCkSzBd27sXUTss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048442; c=relaxed/simple;
	bh=p+4jk4VeC6vYAIhSV6qXueu98DjcNpRIykW6HJziL+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWnJELirVa0T/k1fSWUHaqjHI/ow+vQTdH3gn8nmXr963hW/8bPnWVJAlcbCH98yRer/Y8e9ez6DABNCnwBF+ffb1i4LKYD7uqX2fugSp6DRqtKAz6XuxbZxHtBXe/Iqu4b7a94YOe1J95LjnkzDTcEgWQzxC27ZoCuf6qsrQE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cGTE191/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766048438;
	bh=p+4jk4VeC6vYAIhSV6qXueu98DjcNpRIykW6HJziL+U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cGTE191/SiV6nwOP0O2Yd03YiGfVShfdBZuvUwGqIsf7yO8Dsk5hOVmVPXiv2fDNv
	 bSmE/7lh7+LSVjeX1yd7MB/0nI1FEHwnGwom1rNNfWkfYJQdsHdfdCv3oTwftGqYf7
	 wMF4RaW5ywzZocIiet2kdETFTIpoNXD0gjIT8Bq7nActr6raHV7UvOhoZxHAy7a/re
	 hv07X57EevnehSrb9HAopgue+GiGCJqqBwk+2zdRNlHtWL/NNScEauWKkbOFSWV0PE
	 IN/ypwE+1Qp3xZBbkVV4iq24cf53HSC0MpF0wCZYnz1M0Fj3ZuDLfv3TgzbXrpCkMd
	 nCrBtr6hGcMbg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71B4F17E1149;
	Thu, 18 Dec 2025 10:00:37 +0100 (CET)
Date: Thu, 18 Dec 2025 10:00:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, DRI Devel Mailing List
 <dri-devel@lists.freedesktop.org>, Intel Graphics Mailing List
 <intel-gfx@lists.freedesktop.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Collabora Kernel Mailing List
 <kernel@collabora.com>
Subject: Re: [PATCH] drm/gem: Fix kerneldoc warnings
Message-ID: <20251218100033.5a4447ac@fedora>
In-Reply-To: <20251217172404.31216-1-loic.molinari@collabora.com>
References: <20251217172404.31216-1-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Dec 2025 18:24:04 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Fix incorrect parameters in drm_gem_shmem_init() and missing " *" on
> empty lines in drm_gem_get_huge_mnt().
>=20

Fixes: 6e0b1b82017b ("drm/gem: Add huge tmpfs mountpoint helpers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/dri-devel/20251216115605.4babbce0@canb.auug=
.org.au/

> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++--
>  include/drm/drm_gem.h                  | 4 ++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 29174ab58ff3..fbd1164174b0 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -94,9 +94,12 @@ static int __drm_gem_shmem_init(struct drm_device *dev=
, struct drm_gem_shmem_obj
>  }
> =20
>  /**
> - * drm_gem_shmem_init - Initialize an allocated object.
> + * drm_gem_shmem_init - Initialize an allocated object of the given size
>   * @dev: DRM device
> - * @obj: The allocated shmem GEM object.
> + * @shmem: shmem GEM object to initialize
> + * @size: Size of the object to initialize
> + *
> + * This function initializes an allocated shmem GEM object.
>   *
>   * Returns:
>   * 0 on success, or a negative error code on failure.
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index f4da8ed0d630..86f5846154f7 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -508,11 +508,11 @@ static inline int drm_gem_huge_mnt_create(struct dr=
m_device *dev,
>  /**
>   * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM de=
vice
>   * @dev: DRM device
> -
> + *
>   * This function gets the huge tmpfs mountpoint used by DRM device @dev.=
 A huge
>   * tmpfs mountpoint is used instead of `shm_mnt` after a successful call=
 to
>   * drm_gem_huge_mnt_create() when CONFIG_TRANSPARENT_HUGEPAGE is enabled.
> -
> + *
>   * Returns:
>   * The huge tmpfs mountpoint in use, NULL otherwise.
>   */


