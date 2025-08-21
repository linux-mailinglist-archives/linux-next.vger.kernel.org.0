Return-Path: <linux-next+bounces-8053-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF8B2EC58
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 05:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52BAB5E629D
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 03:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D25A2E093A;
	Thu, 21 Aug 2025 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciWGmbjg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1C2E091C;
	Thu, 21 Aug 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748224; cv=none; b=XvqBQfZoTWuz1qOrHXXNrdorVaVp1gI8oGK1+Tj/hUXWM+KpY/GcrPUWy8d+XBoT1h3jhHDn/1R7GZ3qpwQaCPNbe2W73xB0P42xDr6qN82IoftI90SAQU0eawGi8GFnNioEitL1nJwGbuWNmt4Agoibsv1726DF2g+ROMemh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748224; c=relaxed/simple;
	bh=qvOdk0AP5U47eysIi+b3LD+8lXXJgu36NwM+OWoufEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPZ9BfWGptu65UqfNX8izqfOuPGPdpGQjj568J8o8eA73CfzNTMznshmOSban8P1AXBWLaiulUmEJWqHkw8yHaDUoqVWXnaXinUhqD+/2zAetccxEYXB+rc1WcS9GNGSbp1LpiZkWAkJ0+Qqmm08oeG6vB2fIfDnnBk5S+HgzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciWGmbjg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-244580523a0so5002515ad.1;
        Wed, 20 Aug 2025 20:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755748222; x=1756353022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvOdk0AP5U47eysIi+b3LD+8lXXJgu36NwM+OWoufEU=;
        b=ciWGmbjgnOs2KoZOXUen0vk2kMiFP2xv3vroAIwOMzKU6gTEJrURdFFGTD0EerIZu8
         SGKJRpcDzFPpfD/Gj2OMtGjjALtCcWnyVV53LX6m7d4lGGFFJm+t5CINEmywVoT8DQ7S
         v28i9jjMfFxVp/ZIDNLp4FSzARrEF9iSmIfhLJzbokFWFzPROP7knl0h6wMh9VVPML90
         l1MskQrd617xEDXCtjSprQcCJJP8TUmryCdjAtLqaBTDngDQzwcci3MIoBt1TsXh2dFO
         m3dCKhUqDYcw1FQmDnyxneXDKElj7+Cle9m4YKzVqHeXFbkAgvAdCaqL3tBeYIEgXa1Q
         cyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755748222; x=1756353022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvOdk0AP5U47eysIi+b3LD+8lXXJgu36NwM+OWoufEU=;
        b=U0q7vj5YB/SDsmx0M6VidgvPAmh3DBnYx/8NDXcijsvFwjpDE1ywCnbjRTP//gFD9l
         4pzxX2Wlm33gNCsHlSOgNqfdoTxUGOWFZ4f45IR+IZzX/v/5JtUVSENBM5YuKQnjDnTn
         zCshPzcJur+fq7g3jjyRjfNL5iRWzlKYLdRpLsKZ+IIy/yvYK9U5SQEzKGY6P3Fu2+dp
         JhiQ4eMbG9AhEp89lh0ykaggkdR8QL39nNC9otHfOqhhFBEI5JPIJpznF/qxiMMRXG0J
         SxItR/xp0UdpVaLGksCcZNt9KBm6BT8wb9/Ry9k6iEVQiUyMmgbbmRBsF76EKRe1Ajky
         l0eA==
X-Forwarded-Encrypted: i=1; AJvYcCVr0P3iyjevqjN2SdmlII5TQzIfP4tx4pZZu8+Z1pSatQAzFJnMgii458+JPr84qXxqZrfK2ZF9hLUsd/c=@vger.kernel.org, AJvYcCW6JFNf4+NQ/04rrCLXNnq9deGShbldP3jvLORMsmEFM8h8OIweBcGmw/tyjmL0CPz53V88bvwYbzftqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz03Wf53J2vCxa6TGI9J7CeLiXWP5k/aYBGNrpSqrYY4Jp586r6
	ZpSpuZfT10Z/E6eCy7ZWgvp2FvpW204lqFBlLUP7gsoER+IYBzNLdXJu
X-Gm-Gg: ASbGnctZaHvvjkiWw4KBp0BL41BS0YAW8s4s5Vb/GvF6WobLfSvaqUzLd+w3YV8uODc
	HdM0idNBwkZ1E6e+gb+nmxc2Cwd7x4zt3dTU7Ft2fBbSyOASRES4xFlBFdltQ/bJ3L1CG0ne7AG
	Dz+0uRUzNemwjrnXGfpo7x/p2OQIUmelD4tNiY/WH5iucyXEU92ttvB7oauwXCQhn0MOlo83ZwN
	EI4J0ADgA92Knnf4nsiXJkkFkx3Pf4+EqjGyQiFw46QzonLiKdmaxFP+8Gf4SbV60FEkblAkNU6
	euckwqR2JQuMHMO7SgEasiZ7BxvY7o9DesmMzkE2xZW9PACn9OVIAN890Sis5ulXIPUUYSMV0+P
	hN8K3j1I7fqHYzKjAFL//aQ==
X-Google-Smtp-Source: AGHT+IESyXP60yojJSwB/BTpNaC7x3d6j2ALNBEcDquONeqhjsdAMoP+f17OWzW21YE6xh8IIHlfag==
X-Received: by 2002:a17:902:f68f:b0:234:cf24:3be8 with SMTP id d9443c01a7336-245fed88b5cmr14749475ad.28.1755748221986;
        Wed, 20 Aug 2025 20:50:21 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33cac4sm41437255ad.16.2025.08.20.20.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:50:20 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C404C419B2AB; Thu, 21 Aug 2025 10:50:15 +0700 (WIB)
Date: Thu, 21 Aug 2025 10:50:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: dakr@kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, rampxxxx@gmail.com, robdclark@gmail.com,
	robin.clark@oss.qualcomm.com, seanpaul@chromium.org,
	sfr@canb.auug.org.au, simona.vetter@ffwll.ch
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
Message-ID: <aKaXd-du1Zp9soSZ@archie.me>
References: <aKLAc27XGAadB8n5@archie.me>
 <20250820183507.84200-1-reddybalavignesh9979@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oywEq8yWt8FUYt59"
Content-Disposition: inline
In-Reply-To: <20250820183507.84200-1-reddybalavignesh9979@gmail.com>


--oywEq8yWt8FUYt59
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 12:05:07AM +0530, Bala-Vignesh-Reddy wrote:
> Hi all,
>=20
> Those htmldocs warnings come from missing Sphinx markup in=20
> `drm_gpuvm_sm_map_exec_lock()`.
>=20
> This is already addressed by my patch:
>=20
> [PATCH] drm/gpuvm: Fix kernel-doc formatting and typo in
> drm_gpuvm_sm_map_exec_lock
>=20
> Link: https://lore.kernel.org/lkml/20250803092622.27532-1-reddybalavignes=
h9979@gmail.com/
>=20
> The patch inserts the required directive and corrects the return-value ty=
po.
> I have verified this.
>=20
> Could anyone please pick this up or keep it queued, so=20
> warnings disappear from -next.

I think this has been already addressed by Javier's patch and mine (see the
full thread). However, one of them must be in mainline.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--oywEq8yWt8FUYt59
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKaXcwAKCRD2uYlJVVFO
o8CxAP9wSOuncLRV/qBS+79W+TL5XvHSvJ06ibw5ZB9BjExK/gD/bnV4q4ziawpc
ZpEYmZuxaK8G92zSF6t57XAlVVlY+w4=
=HLyE
-----END PGP SIGNATURE-----

--oywEq8yWt8FUYt59--

