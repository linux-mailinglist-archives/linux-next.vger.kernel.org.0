Return-Path: <linux-next+bounces-7022-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7EACC10F
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 09:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68EB73A15E7
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 07:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C62D25D533;
	Tue,  3 Jun 2025 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLDSLihf"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8108C19066D;
	Tue,  3 Jun 2025 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934938; cv=none; b=SRyNCYAjqbvcYGvBTqC+1GCrubtg6+zsWC/kTdyvLsGIWSrtCzoNd8KzdeS9tXJPrcnJktUDO++unDKj24ZQ+8fGgC6/WHgo96550zN6A18f1EjbL7AqS8H9eorleYpCraZtRLQnxNuuQWG8GRTuQG2OSp/Mnq1arHxbzLVe4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934938; c=relaxed/simple;
	bh=jDd3QvQuWTmL2NmEb97MFdHzIrR7Xg3QOh5tScjxGy8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WOcXGiMrlCFTh+OPgeaP1Iv2bRbVxUKahMT2pHBWFrwBlVPKF5sirzDLUWmbhAAvQdyoYQF+OaJZKLF6hN6ZIrN84USWYmm2TVMdZzeTX3gtrcQ1aJK4tUE1cKLe7K+0Jr4puibGuxIGoMX94Wgf9UzoqVMifFeh29zN/uI9SBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLDSLihf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748934937; x=1780470937;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jDd3QvQuWTmL2NmEb97MFdHzIrR7Xg3QOh5tScjxGy8=;
  b=OLDSLihfeReYTZVzdGt8RQWCVOQVYBUtB7Ly8vaBheSkkOmiDuxJrv6X
   AsgLL2PyhgmLoM/8AJiJEiz6MfYId1JQQmMPcKi+zDtjSa2GRin6BaFdi
   gi3eCuyAwnggHV4QWBCxyb7l9XfSjy9RoHD3B4qHle9Zh/IKHLu8sXeny
   lW2DzqRIFMIZOmFcJ6atjWQu586GWVWylQLMCkSuYL1A6mWuTBfHr16PX
   MX2de1CHcdF2/alyT5VHdWD0X7PM7v88nk0/SW6+uM7TvUsbHrrkBFtA0
   IAKsQVOGDBOW/oE544oLe5kWLF/jM3LxAj0OMht4EnOCPMiD0AE2YzEEa
   Q==;
X-CSE-ConnectionGUID: ADw6vsPwQb217rTLURoAZQ==
X-CSE-MsgGUID: jKzJIgD+SBWg6Q176ToCiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51105781"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="51105781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:15:35 -0700
X-CSE-ConnectionGUID: l5wWC2AXTTiNzh17LUnqgw==
X-CSE-MsgGUID: OMtkYM7CS66r7s1xSM+PkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="145102315"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.141])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:15:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 3 Jun 2025 10:15:26 +0300 (EEST)
To: "Nirujogi, Pratap" <pnirujog@amd.com>
cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, rdunlap@infradead.org, 
    Hans de Goede <hdegoede@redhat.com>, sfr@canb.auug.org.au, 
    linux-next@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH 3/3] platform/x86: Use i2c adapter name to fix build
 errors
In-Reply-To: <46a1ad3e-3419-4f03-b5ce-a36d2480037c@amd.com>
Message-ID: <56698b89-756a-ec89-787c-d08351abf7f0@linux.intel.com>
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com> <20250530200234.1539571-4-pratap.nirujogi@amd.com> <ea615c2e-d306-06b2-10b0-2423ab59a8e9@linux.intel.com> <46a1ad3e-3419-4f03-b5ce-a36d2480037c@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-629452075-1748934926=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-629452075-1748934926=:937
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 2 Jun 2025, Nirujogi, Pratap wrote:

> Hi Ilpo,
>=20
> On 5/31/2025 1:11 AM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Fri, 30 May 2025, Pratap Nirujogi wrote:
> >=20
> > > Use 'adapater->name' inplace of 'adapter->owner->name' to fix build i=
ssues
> > > when CONFIG_MODULES is not defined.
> > >=20
> > > Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for
> > > OV05C10")
> >=20
> > This is the which should have this Fixes tag, the other commits should =
not
> > have it as they're not really the fix (but this change just depends on
> > them, but since stable is not in picture yet for this driver we don't
> > need to indicate even those deps).
> >=20
> Thank you, I will take care of keeping the Fixes tag only in the x86/plat=
form
> driver patch and will remove in the other two i2c driver patches.
>=20
> Sorry I think I'm not completely clear on this statement "we don't need t=
o
> indicate even those deps" - Am I good if I submit the same patch series
> removing the Fixes tag from the two i2c driver patches? Or Is it about
> submitting the i2c patches independently from x86/platform, instead of ke=
eping
> all the 3 patches in a single series. Can you please help to clarify?

Just remove the other fixes tags. Those changes don't really "fix" the=20
problem but lay groundwork for the last patch.

(If this would be going to stable, which it isn't because the driver is=20
not yet in any stable kernels, you'd have to add Cc: <stable@vger.kernel.or=
g>
to all dependencies within the series and the fix and the Fixes tag=20
would still be in the last change only.)


The series should be applied as whole, either by me or the i2c=20
maintainers once it's ready.

--=20
 i.

> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > Link:
> > > https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infr=
adead.org
> > > Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > ---
> > >   drivers/platform/x86/amd/amd_isp4.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/amd_isp4.c
> > > b/drivers/platform/x86/amd/amd_isp4.c
> > > index 0cc01441bcbb..80b57b58621a 100644
> > > --- a/drivers/platform/x86/amd/amd_isp4.c
> > > +++ b/drivers/platform/x86/amd/amd_isp4.c
> > > @@ -151,7 +151,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> > >=20
> > >   static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> > >   {
> > > -     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> > > +     return !strcmp(adap->name, "AMDISP DesignWare I2C adapter");
> >=20
> > Since both are in-kernel code, share that name through a define in some
> > header.
> >=20
> sure, I will find the header file that can be used to add the adap->name
> definition.
>=20
> Thanks,
> Pratap
>=20
> > --
> >   i.
> >=20
>=20
--8323328-629452075-1748934926=:937--

