Return-Path: <linux-next+bounces-5382-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19069A2A5C8
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 11:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AED918887BB
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 10:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9565C227581;
	Thu,  6 Feb 2025 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPK2bkKS"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4022756A;
	Thu,  6 Feb 2025 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738837648; cv=none; b=XFr1orihEEpQQ+b/Uhtnmn1KZm0VHkL4sXEXNaWcOGFSeiND7p853wWHQDGAFbhTF+IMoVenh6mzhx4/dpUFGJGFIOvmgUlAAc5ldEOEf2nwkQjM7LztQ6BiFN/rw4nwIMHVdyWUML9OAjc3kekK8W5nbjyqTfxO5rTS04L7sFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738837648; c=relaxed/simple;
	bh=jYnY+PAbF/WN3ltzf1lZC2RXNGS9Qd9KAU85uNCx1FM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JXpw2LEIYcwZmNQynEyPn2OlEPq+LnOfTlqHoWmEkCu2VmmDU44CECBM8XnQc+fcyEJ1x5XyCs9nVBY44FsgiyJZtXas463qkysaK5kvUM9iVXdktaImO193nshmvvFeA3p3PiqmZBXW2wGjDqoYF6qY7egi91vo+Jo3rDnc8rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPK2bkKS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738837646; x=1770373646;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jYnY+PAbF/WN3ltzf1lZC2RXNGS9Qd9KAU85uNCx1FM=;
  b=PPK2bkKSHXfsTiYvIRwaozmuXRo+kpg6lHf7pXLkF0/6B5gsA9z1ApKf
   h9o6QawchFSGRHZwPAMFxtDbXZbOgs1Hb8CpgAYhfZ/ZrIiXw5fCHwJBr
   ZIjTmzSI9J24pjwM/VGUxqbCgxJ6lsKZtztmHw4aPUa1gp0Ny6ep17ley
   4Ka2hCr5UBlwEf8zzyYrx16JybzQH/tgwStMfxRgVFmt6wisb9+LLGwtS
   hJAM2PlUOHplVpQtSHCpSDR9d7wwXiJlgJoToAOjDvaARHiu+Rojt3OxB
   hwIpxbpu38l2B/IOxuVUiKFyXaZpViB8zGSJInPLny/hQHeooeizlWpq1
   g==;
X-CSE-ConnectionGUID: S5LJmuFITLG+msb7EpVKww==
X-CSE-MsgGUID: +s9rN1FrT6u4O5LT0D+TFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39590329"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39590329"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:27:26 -0800
X-CSE-ConnectionGUID: fqpyoR3eQFaADrXPEAeHfg==
X-CSE-MsgGUID: lrzwzj51Qx+4JmKGj2eZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148378342"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:27:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 6 Feb 2025 12:27:19 +0200 (EET)
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
    Joshua Grisham <josh@joshuagrisham.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
In-Reply-To: <20250206133652.71bbf1d3@canb.auug.org.au>
Message-ID: <3603e5e3-b8f9-54eb-c181-03cf2679cb7f@linux.intel.com>
References: <20250206133652.71bbf1d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build
> (x86_64_allmodconfig) failed like this:
> 
> In file included from include/linux/kobject.h:20,
>                  from include/linux/energy_model.h:7,
>                  from include/linux/device.h:16,
>                  from include/linux/acpi.h:14,
>                  from drivers/platform/x86/samsung-galaxybook.c:14:
> drivers/platform/x86/samsung-galaxybook.c: In function 'galaxybook_fw_attr_init':
> drivers/platform/x86/samsung-galaxybook.c:1014:33: error: 'fw_attr' is a pointer; did you mean to use '->'?
>  1014 |         sysfs_attr_init(&fw_attr.display_name);
>       |                                 ^
> include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_init'
>    55 |         (attr)->key = &__key;                           \
>       |          ^~~~
> drivers/platform/x86/samsung-galaxybook.c:1020:33: error: 'fw_attr' is a pointer; did you mean to use '->'?
>  1020 |         sysfs_attr_init(&fw_attr.current_value);
>       |                                 ^
> include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_init'
>    55 |         (attr)->key = &__key;                           \
>       |          ^~~~
> 
> Caused by commit
> 
>   f97634611408 ("platform/x86: samsung-galaxybook: Add samsung-galaxybook driver")
> 
> I guess this was never built with CONFIG_DEBUG_LOCK_ALLOC set.
> 
> I have used the drivers-x86 tree from next-20250205 for today.

Apparently it wasn't.

However, I've an LKP success report for f97634611408 (prior to pushing it 
to for-next, I always wait for LKP).

Why LKP didn't catch it despite claiming it built with x86_64_allyesconfig 
(successfully)?? Did LKP not build the tree??

I've pulled the commit from for-next until the problem is resolved to not 
keep breaking builds. Joshua, could you please take a look at it.

-- 
 i.


