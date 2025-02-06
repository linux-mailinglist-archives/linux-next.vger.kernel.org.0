Return-Path: <linux-next+bounces-5386-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F23A2B225
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 20:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553723AAF4A
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 19:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34391A265E;
	Thu,  6 Feb 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkDBjTMs"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D8F23959B;
	Thu,  6 Feb 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869728; cv=none; b=FA52W7PcIm4EO456TqQKDpS/B7hRi7y2vf8T/y6VSJFIfj82trJk4hqLXT9fAz3BuSjdZsQDz2oPO4k+kRYwScRIWttwEcCvOhFT7bWNff0AM2HzHBMiQNXztMFnL9iMaTJO9hpr6G4iT0muvgK7Kk02u9vzvigvUZUJxDTaMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869728; c=relaxed/simple;
	bh=ancX9lQlL/W6fW5Eb650QX3pEF4pVrkA46LQBCtXkRI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VBRufr8CQXyQIHL16ropneYw5p4TzOOG/rGA9+wdypfIIrUpyySRDybJb6aGZMATZRgf1F8rIpUJhQuEVavkgQGzB9FyMM27frIpjIsUU4V5ZPjrOCKGHxHNjswlaLsmQtvUDTbUUPoAvgH4F1yMLGWkUdqLFb0rtXDXS7O80yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkDBjTMs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738869727; x=1770405727;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ancX9lQlL/W6fW5Eb650QX3pEF4pVrkA46LQBCtXkRI=;
  b=QkDBjTMsSpG3D7dFHamxcH81FY8RC/hox079bvF+bxADABufko4fNtjo
   5Zjf7TX8IWCjR1HfHKde8I9j0YogfBDdkOeSs+wE41+6NqvOdI/6XeQSi
   bvVUh/fAD4OSBgvI10oTjDtjRJ2xOYNNaL0xEWSzRa9Wg7LjI3ya6fsmw
   2XGguwpBim0ZM/8FgP9Ezuj7alqPecDqGcFehIOOlg0O+zVi4hszh6NLe
   5v3rI3ozUKWF9msX1KN+eyM9oBg5VW8lQbOtW2oivm79Z80RPAD6LuaVn
   uBc03rRzmizcuTLXoIWex+mtY7tY9BRtaWieXwGKQ0uv6OoXe7Lp5z1ta
   w==;
X-CSE-ConnectionGUID: IOhob7xURieni274pMJAmg==
X-CSE-MsgGUID: rtdEgJ9PRu2l8rvczkva8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39608720"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39608720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:22:06 -0800
X-CSE-ConnectionGUID: gTpTUo9ZQXyzYRxYdODHNQ==
X-CSE-MsgGUID: 9Fii5jmZSimwLYhxas+YWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134547283"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.165])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:22:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 6 Feb 2025 21:22:02 +0200 (EET)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
    Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
In-Reply-To: <CAMF+Kea=zTSRAN6kmnp0u=Pxyt+gupeiBYXNa9qkWp0d8RssLg@mail.gmail.com>
Message-ID: <3919fefb-13dc-699f-2355-fdbfb31dab8a@linux.intel.com>
References: <20250206133652.71bbf1d3@canb.auug.org.au> <3603e5e3-b8f9-54eb-c181-03cf2679cb7f@linux.intel.com> <CAMF+Kea=zTSRAN6kmnp0u=Pxyt+gupeiBYXNa9qkWp0d8RssLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-335955539-1738869722=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-335955539-1738869722=:931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 6 Feb 2025, Joshua Grisham wrote:

> Den tors 6 feb. 2025 kl 11:27 skrev Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com>:
> >
> > On Thu, 6 Feb 2025, Stephen Rothwell wrote:
> >
> > > Hi all,
> > >
> > > After merging the drivers-x86 tree, today's linux-next build
> > > (x86_64_allmodconfig) failed like this:
> > >
> > > In file included from include/linux/kobject.h:20,
> > >                  from include/linux/energy_model.h:7,
> > >                  from include/linux/device.h:16,
> > >                  from include/linux/acpi.h:14,
> > >                  from drivers/platform/x86/samsung-galaxybook.c:14:
> > > drivers/platform/x86/samsung-galaxybook.c: In function 'galaxybook_fw=
_attr_init':
> > > drivers/platform/x86/samsung-galaxybook.c:1014:33: error: 'fw_attr' i=
s a pointer; did you mean to use '->'?
> > >  1014 |         sysfs_attr_init(&fw_attr.display_name);
> > >       |                                 ^
> > > include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr=
_init'
> > >    55 |         (attr)->key =3D &__key;                           \
> > >       |          ^~~~
> > > drivers/platform/x86/samsung-galaxybook.c:1020:33: error: 'fw_attr' i=
s a pointer; did you mean to use '->'?
> > >  1020 |         sysfs_attr_init(&fw_attr.current_value);
> > >       |                                 ^
> > > include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr=
_init'
> > >    55 |         (attr)->key =3D &__key;                           \
> > >       |          ^~~~
> > >
> > > Caused by commit
> > >
> > >   f97634611408 ("platform/x86: samsung-galaxybook: Add samsung-galaxy=
book driver")
> > >
> > > I guess this was never built with CONFIG_DEBUG_LOCK_ALLOC set.
> > >
> > > I have used the drivers-x86 tree from next-20250205 for today.
> >
> > Apparently it wasn't.
> >
> > However, I've an LKP success report for f97634611408 (prior to pushing =
it
> > to for-next, I always wait for LKP).
> >
> > Why LKP didn't catch it despite claiming it built with x86_64_allyescon=
fig
> > (successfully)?? Did LKP not build the tree??
> >
> > I've pulled the commit from for-next until the problem is resolved to n=
ot
> > keep breaking builds. Joshua, could you please take a look at it.
> >
> > --
> >  i.
> >
>=20
> Hi Ilpo and all,
> Yes, great that there are tests in place :) Sorry this was one of the
> later changes and I can't remember now when exactly I did the full
> testing vs not as per the kernel documentation (as there were several
> iterations to the patch for this driver) but I believe I have
> identified what should be fixed and can send it shortly.
>=20
> Ilpo would you prefer a patch on top of the existing patch (i.e. just
> a diff of these 2 lines) or would you rather that I create a v11 of
> the original patch and send the whole thing again?
>=20
> Thanks again!

I've kept the change in review-ilpo-next branch. An incremental patch is=20
fine (it's easier to see its correctness on a glance too).=20

--=20
 i.

--8323328-335955539-1738869722=:931--

