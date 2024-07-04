Return-Path: <linux-next+bounces-2831-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47A92702D
	for <lists+linux-next@lfdr.de>; Thu,  4 Jul 2024 09:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D8B2B23C5C
	for <lists+linux-next@lfdr.de>; Thu,  4 Jul 2024 07:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5671E1A01DE;
	Thu,  4 Jul 2024 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NT1XRMFH"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508613E024;
	Thu,  4 Jul 2024 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720076548; cv=none; b=Ihk8awMGpkin+XVP8gVvhMCQw97dxKd5+DVOjcbUyEwhnLlHN73suC+j+tqsLmV6Ig+aPuZ6krDjpMfJAYs8PUBggMsoxb1/LKIHJtIfaHxTpG2Zogd2aj01B/oBn8fJb5+x9NCmr3Vd7foNdvHVmX5bvAfleMQOFTxRvN22N4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720076548; c=relaxed/simple;
	bh=HTB1sePIud3c4rcPIx03gGOAyz7Lyhr/bfLJjJkcDk8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XOWDjr6t5Ku5atnDuHZ4XsccIVCKMqGOs+pODX7dRfqW5vuD2oh79n+tzyWeXuI+2wWw+3Gh0TaAKrNSiA7RxkyqBfFf7H/40yg3YzhgyHiFfIzDHXRWV/LDSvlY9ojmwownR+2LDj7sDvmNgbwQk28m+mxO4FdREWpNjeQ/dA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NT1XRMFH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720076546; x=1751612546;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=HTB1sePIud3c4rcPIx03gGOAyz7Lyhr/bfLJjJkcDk8=;
  b=NT1XRMFHxJSJj1NM83HIbuPPsU4XyfcVuLD0l5BRhfFmcN9/taMuuSJu
   xQmvqYcDgJDtx8kdcoI1GYb/se+rZp53IFyZFJQGdrnawDRKfTgG/NmpY
   Mu9nQfsImFAzT2wzZqje+/8xDW9Y9WUmuarIHbyQbl1Mrfd+x2rcWWRW+
   QgoqSw6+3Omk2FSb5Shgq/3m/SuQnRdfeV8Y1A5e8L4iLh3LbG1MrU/AP
   znZm5fiUBjs2SVxgXHzm1u+0rmOvuBKuji0WE/eXxHtbCbnq6clovZhr1
   D7zqx2INdpk20DFtnyY4939oz68UM/C1PHP/czlSlI4sxJfR+Osl4UYB0
   g==;
X-CSE-ConnectionGUID: 54n5I2dLSeChtKtZl4U9oQ==
X-CSE-MsgGUID: ogsdIr4jSwu1ehTWkgAEQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20241796"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="20241796"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 00:02:26 -0700
X-CSE-ConnectionGUID: bq0nrWTxSw60uPvQdaXmhw==
X-CSE-MsgGUID: Ym0juRbYSuOgUTjJN9j4VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46518039"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.56]) ([10.245.245.56])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 00:02:23 -0700
Message-ID: <8de22d252014aa52e631eb1bcf8e85d50e96c29e.camel@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Stephen Rothwell
	 <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>, Rodrigo Vivi
	 <rodrigo.vivi@intel.com>
Cc: Mark Brown <broonie@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
	Piotr =?ISO-8859-1?Q?Pi=F3rkowski?=
	 <piotr.piorkowski@intel.com>, 
	buildfailureaftermergeofthedrmtree@sirena.org.uk, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Thu, 04 Jul 2024 09:02:21 +0200
In-Reply-To: <10c3d9b8-bf5b-42c1-9c87-36828f5c995c@intel.com>
References: <Zn7s611xnutUFxR0@sirena.org.uk>
	 <20240703123643.5b4dc83f@canb.auug.org.au>
	 <10c3d9b8-bf5b-42c1-9c87-36828f5c995c@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi

On Wed, 2024-07-03 at 13:46 +0200, Michal Wajdeczko wrote:
> + Rodrigo for help
>=20
> On 03.07.2024 04:36, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Fri, 28 Jun 2024 18:03:39 +0100 Mark Brown <broonie@kernel.org>
> > wrote:
> > >=20
> > > After merging the drm tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >=20
> > > /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In
> > > function 'pf_get_threshold':
> > > /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:2
> > > 7: error: unused variable 'xe' [-Werror=3Dunused-variable]
> > > =C2=A01788 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct x=
e_device *xe =3D gt_to_xe(gt);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
> > > cc1: all warnings being treated as errors
> > >=20
> > > Caused by commit
> > >=20
> > > =C2=A0 629df234bfe73d ("drm/xe/pf: Introduce functions to configure V=
F
> > > thresholds")
> > >=20
> > > I have used the tree from 20240627 instead.
> >=20
> > I am still seeing that build failure.
> >=20

I see that git for an unknown reason introduces this line as an
automatic resolve merging drm-next into the drm-tip build. Later there
was a manual fixup for this after merging another branch into drm-tip
but that's too late.

So I've added a manual fixup to drm-rerere to remove this line just
after the merge that somehow introduces it.

/Thomas


