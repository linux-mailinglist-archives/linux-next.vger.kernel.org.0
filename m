Return-Path: <linux-next+bounces-7505-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E919BB03205
	for <lists+linux-next@lfdr.de>; Sun, 13 Jul 2025 18:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC8A189AC46
	for <lists+linux-next@lfdr.de>; Sun, 13 Jul 2025 16:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B127027877D;
	Sun, 13 Jul 2025 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAAjpevl"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E916126AD9;
	Sun, 13 Jul 2025 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752422817; cv=none; b=Ng4Y2StNoRYqJgXnzDvdjil90beIy6b9jU9FT+Fyo3XqW9ToIqucQkS8A0e6RVMtHzwH709tGlz5ZxutnGbeNqaGFIghVKZiQOSgPgR686DjDW+wjTpv8+p0QhRmPhjktfFPo0ab+kIO0xO2QtHRwhQpVfpdF4fEZ6wMdL/lOso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752422817; c=relaxed/simple;
	bh=6e3rXw+090QQiTK4zhhKERZxqwOSORb4uFTDKMPxgYE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dbKlopqZPvQo/MU7Ch2QFNW6Bxusm/s1fuZgaXVv+pFhKYvSaRgSwUMM/rtcOrju2IhM7R3pUxPLxfi2jKGZBiORFkUnhd9VR34CqWBPAZMRuGcnQixpi+VbBksCYvMvQWjVG62kGEHe2PWMnnmb6EvWrpoP42UjtcJYPr4b3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAAjpevl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752422816; x=1783958816;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6e3rXw+090QQiTK4zhhKERZxqwOSORb4uFTDKMPxgYE=;
  b=mAAjpevl3eTXAsui0KWNcYH5RzNWTFj4Sa2+bijv5XceSKlxa+EB09Tl
   IrTtjfNhJD4vDB/za9CEjEyiCjONILo8xM+iFaHzS1NyA4rXiX/ugOfW/
   MJC71Uebc4YgxrvdTmxVUIDcKF4w1XidvqLeK/AC8wnVkvxgqAHSZZ7jJ
   s8kqkJ91JLRGzGwgIMDH/JRcx/UaA4W68AoAL85u7oWv81zk8fwhsn9vb
   VxsPZPaMpXLreK86QiwcfD/D25F7Dn0rcz7ZKxgAfN7H3obTH8aYGDL7n
   1q5j6mDt/903kyGYuuEbMe+JFNKroket4v1kqLd2h4a/Bfb89flItKJf3
   g==;
X-CSE-ConnectionGUID: Xl9vlZvaQMqlKENXcjWjyA==
X-CSE-MsgGUID: qYjJCYyqRBuZLq6Q0mk8IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54344248"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54344248"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:06:55 -0700
X-CSE-ConnectionGUID: CmhFcxuoQR+P28Gujabs3g==
X-CSE-MsgGUID: EMacz0kHTRuZS9iOOXF0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="160765257"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.175])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:06:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 13 Jul 2025 19:06:48 +0300 (EEST)
To: Randy Dunlap <rdunlap@infradead.org>
cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: Re: linux-next: Tree for Jul 11
 (drivers/platform/x86/lenovo/wmi-gamezone.o)
In-Reply-To: <a1745a9b-d0a6-4c72-9096-6f9d15274b9a@infradead.org>
Message-ID: <183b1932-b65d-c3e2-deb2-850e0887e8d6@linux.intel.com>
References: <20250711191014.12a64210@canb.auug.org.au> <a1745a9b-d0a6-4c72-9096-6f9d15274b9a@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Jul 2025, Randy Dunlap wrote:
> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20250710:
> > 
> 
> on i386, when
> CONFIG_LENOVO_WMI_EVENTS=y
> CONFIG_LENOVO_WMI_HELPERS=y
> CONFIG_LENOVO_WMI_GAMEZONE=y
> # CONFIG_LENOVO_WMI_TUNING is not set
> 
> ld: drivers/platform/x86/lenovo/wmi-gamezone.o: in function `lwmi_gz_probe':
> wmi-gamezone.c:(.text+0x63c): undefined reference to `devm_lwmi_om_register_notifier'
> 
> Adding
> +	select LENOVO_WMI_TUNING
> for config LENOVO_WMI_GAMEZONE fixes the build error.
> Is that the right fix?
> If so, please go ahead with it.

AFAIK, this is already fixed by the commit 6e38b9fcbfa3 ("platform/x86: 
lenovo: gamezone needs "other mode"") which does what you described above.

-- 
 i.


