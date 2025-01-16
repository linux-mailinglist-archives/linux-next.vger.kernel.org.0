Return-Path: <linux-next+bounces-5233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA207A1396D
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 12:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F9B168F86
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 11:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837B41DC1A7;
	Thu, 16 Jan 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUF6RhYB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A61D1DE3C3;
	Thu, 16 Jan 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737028213; cv=none; b=fhIe9KOfP7jkpotqkODYhknCn0VNF3+KKbPKmWvdUg6ZHDW7hBl0tJj+ZSKjR32HGKzrnGpdbTvxOG59m/Wvo1QcL4QQHogmTgbyKHtU/ihyuIq0dnBnk6i2TnT7Kc/b5+foK+CE83mfGZSiAY5fHWJRMCm00En5wOepgITiHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737028213; c=relaxed/simple;
	bh=3urIvcjjKWnB2qJRr7oQPOXeUZvw36gw6qaU2DNqvRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZa2u0QsuVn/wDaOEMgRTNqxtHmuNNjbJXF9nOqlMGt8kgdCMv5vuA5oVlbtKY9W3m4w4wIH4FiRz1fzROvxl40XNrsIsYJKKzQbRusArPiGI34xy2r1fsJ+ufWW8/V4B3RDSK5EwSkI/pSWQxGupFg5cHR83re62QIiQIPHpck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUF6RhYB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B787C4CED6;
	Thu, 16 Jan 2025 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737028213;
	bh=3urIvcjjKWnB2qJRr7oQPOXeUZvw36gw6qaU2DNqvRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUF6RhYBJd+0hRDL1DgEvHe+FvsaO+v8bq4HS1x9MR74PmLYswK2RYhSde1yiuf8w
	 jzITDmyb37rVju1CR9IJd+kqtLrvmHFRhAL5ttua0kB8ITrLJXdLsrNYL7vgickQem
	 7Cnubso7LLqYZd/TiLNBAZdN1tDw8cGdYh2kxMQgDO3SRytauekolVfZGPGYA9/NPd
	 6oSCae7anL4lw0mDW1pN4GyJje529layBTlllhskxYEwsFo8dvqXyQ6OAnPIFHhCVD
	 QnAFlVJqBpnlUnpaBuosbLYO5CMh0A9xQWj9UNjwvO/P3nAVEd8OZgNZf4FTaTTGUK
	 hDc6DicvYdkVQ==
Date: Thu, 16 Jan 2025 12:50:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Dave Airlie <airlied@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250116-rampant-versatile-butterfly-f1166c@houat>
References: <20241220154208.720d990b@canb.auug.org.au>
 <20250114164149.6459996d@canb.auug.org.au>
 <beed4438-2416-4994-bb18-a7dfdbe3d9e8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xr74ivsemsid3src"
Content-Disposition: inline
In-Reply-To: <beed4438-2416-4994-bb18-a7dfdbe3d9e8@ideasonboard.com>


--xr74ivsemsid3src
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
MIME-Version: 1.0

On Thu, Jan 16, 2025 at 12:34:39PM +0200, Tomi Valkeinen wrote:
> Hi drm maintainers,
>=20
> On 14/01/2025 07:41, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Fri, 20 Dec 2024 15:42:08 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >=20
> > > After merging the drm-misc tree, today's linux-next build (htmldocs)
> > > produced these warnings:
> > >=20
> > > drivers/gpu/drm/xlnx/zynqmp_dpsub.h:86: warning: Function parameter o=
r struct member 'audio' not described in 'zynqmp_dpsub'
> > > drivers/gpu/drm/xlnx/zynqmp_dpsub.c:1: warning: no structured comment=
s found
> > >=20
> > > Introduced by commit
> > >=20
> > >    3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
> >=20
> > I am still seeing these warnings.  That commit is now in the drm tree.
>=20
> Can 96b5d2e807f667320c66f41ddc1c473023a73ab2 from drm-misc-next be picked=
 to
> a -fixes branch? It fixes 3ec5c1579305, which is in drm-misc-next and in
> drm-next.

Done, thanks

Maxime

--xr74ivsemsid3src
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4jycQAKCRAnX84Zoj2+
dv/VAYCyN7mP6B9dpcKCjMH+UsajZWr3P+rR5kULKVOnHzqVA+dd7URfeKTwrR20
ewOxPfgBfAuzoNGQOsm/lFOOyDpOcobmUuKV7TYzEMfXLQ5Qvq0MwP8cnH30CIFv
CInigMdcXw==
=eHBa
-----END PGP SIGNATURE-----

--xr74ivsemsid3src--

