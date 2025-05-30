Return-Path: <linux-next+bounces-6985-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD4AC892C
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 09:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40F3C16E57F
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 07:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295041FE455;
	Fri, 30 May 2025 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoE6WR0G"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A11A0728;
	Fri, 30 May 2025 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590885; cv=none; b=cZYUdr7qSrRE8vgy+dd2VXlfB3EwPYZzukfjCFurVKdHqjHq42mIhJs0bXh7zTHq2t4LULknuSpibJlCKCotzZgwIhQKsYboQoQWG55YmdBl07dGAKqLEWyZGJmlXPKeO2KsDlsSG5FIOoCO0U5Uhu3h7YmWO5UPgMP9gg7UOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590885; c=relaxed/simple;
	bh=pBNA3dsaR/o0CK40JmO+2Oes1H+6BGMvYXHe9DWPr5g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Re/8LFklNgTGDf4ESizXpAm4e/7uiKIvMr9l0E30gjgqJtnmaQk57Dv+gHU1d91UqZXEcPXkQiOQyiaqO4lSdpjdxRfJBVqIDx1RZOk9duNpD4Fn2soKHTiSenGig6rce6j0a/zApOMBf/yfjJyhJhqHkX6bbt+76Wh44MM8+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoE6WR0G; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748590884; x=1780126884;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pBNA3dsaR/o0CK40JmO+2Oes1H+6BGMvYXHe9DWPr5g=;
  b=XoE6WR0GdBnmKlvSdpBeAfWerdh/qADW8cxyIfJYluVW1gKIdLeHOSjv
   BjUDrnw66psYGEXkwPPMovO2d+3Ec1g2fIJu5dU29+H+yJurnClEuD+8e
   ieUx+xzSQVd0o424+DG1ukIPWBExReBt78gZXCN8q38RvWQpcXWuJmJUK
   9MvkeE9/QFuhwzWNlFkJfk9SQIJye8ukTpRXF3T8gXPgfs47jQGbkpcO7
   PZILyGHPNtPlTpLhwCWPyIGTFwDXXRHp/cOAfSUnVtUnDJEE8nsGzQBIv
   jOXXMA/jaFROrYUw8SKmRhcVlL6HE5QM5SWzMIUEyINYBhu7wucdwp3qP
   w==;
X-CSE-ConnectionGUID: CALPcmILQfm+sxKkmIljLA==
X-CSE-MsgGUID: vt2tkzdgRNCgUJKsNFhGDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68100086"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="68100086"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 00:41:23 -0700
X-CSE-ConnectionGUID: vVg2EkLTSeyOMHIgeWZguA==
X-CSE-MsgGUID: MZBgCgs2RCGMowl8TS3eWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="174689548"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 00:41:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 May 2025 10:41:15 +0300 (EEST)
To: "Nirujogi, Pratap" <pnirujog@amd.com>, Hans de Goede <hansg@kernel.org>
cc: Randy Dunlap <rdunlap@infradead.org>, 
    Stephen Rothwell <sfr@canb.auug.org.au>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>, 
    Pratap Nirujogi <pratap.nirujogi@amd.com>, 
    Benjamin Chan <benjamin.chan@amd.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: linux-next: Tree for May 27
 (drivers/platform/x86/amd/amd_isp4.c)
In-Reply-To: <b712a69d-e899-4286-b5f6-06d87d732ed8@amd.com>
Message-ID: <e079d753-554e-7a42-11c6-a08cc095eb91@linux.intel.com>
References: <20250527203231.3c6c0b9d@canb.auug.org.au> <04577a46-9add-420c-b181-29bad582026d@infradead.org> <d2ac901b-f7d2-46e6-b977-0ad90faa46f2@kernel.org> <b712a69d-e899-4286-b5f6-06d87d732ed8@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 May 2025, Nirujogi, Pratap wrote:
> On 5/27/2025 3:43 PM, Hans de Goede wrote:
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> > 
> > 
> > Hi,
> > 
> > On 27-May-25 8:56 PM, Randy Dunlap wrote:
> > > 
> > > 
> > > On 5/27/25 3:32 AM, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Changes since 20250526:
> > > > 
> > > 
> > > on x86_64, when
> > > # CONFIG_MODULES is not set
> > > 
> > > ../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
> > > ../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of
> > > undefined type 'struct module'
> > >    154 |         return !strcmp(adap->owner->name,
> > > "i2c_designware_amdisp");
> > >        |                                   ^~
> > 
> > Hmm, this should not check the owner->name at all.
> > 
> > Instead the i2c_designware_amdisp should set adap->name to something
> > unique and then this should check adap->name.
> > 
> I noticed the unique name set to "adap->name" in i2c_designware_amdisp is
> getting overwritten to the generic "Synopsys DesignWare I2C adapter" name in
> i2c_dw_probe_master().
> 
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-designware-master.c#L1046
> 
> Inorder to use unique name to detect the specific adapter without making
> changes in i2c-designware-master.c, I used adap->owner->name.
> 
> Since it is causing build issues when CONFIG_MODULES is not set, can I make a
> change in i2c-designware-master.c to initialize the generic "Synopsys
> DesignWare I2C adapter" name only when adap->name is NULL. This way I should
> be able to pass the unique name from i2c_designware_amdisp module.

How can you check that, it's char name[48]; not a pointer???

> Please suggest if this approach is okay?


-- 
 i.


