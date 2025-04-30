Return-Path: <linux-next+bounces-6465-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 388A9AA4946
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BAE11BA20CA
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23096231834;
	Wed, 30 Apr 2025 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sjk4gehv"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645392185B1;
	Wed, 30 Apr 2025 10:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010568; cv=none; b=LiotZURN2v0oNmZhlDqraP9Y+CgzryU30zvv3OfBU4H2Yc+rFcY3jA4PpMUZv/tJn451KxjfaCJcb3OFnhfyiyfnsUkBCvVMjTiK4r+LbNVUSrWIWfBfLFvKlGjuXQ9fw26i/U6UpjLWqfAIWCTY4SykjSioUgqS6QiCvAtDyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010568; c=relaxed/simple;
	bh=YhU8ITjtqvz4gOOX59v9QcgSsCYGPhJlhzkYVF0DTmY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YM5NyDEeOV6Ntxn1wNfZLLHEIUQS2lLprSlWKzUg106Uhe5excSoP8tfZqjI12wVhTpYIBQ3RaCQ2vziq+LPlZU3X83iQEJePzhh/TYGoXKTCvY1G2mhWmDWO9OcHEOoOWrNGwQEZ/JqRn33Jfo4IkqfAQopi100pOLfIQAU+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sjk4gehv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746010566; x=1777546566;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YhU8ITjtqvz4gOOX59v9QcgSsCYGPhJlhzkYVF0DTmY=;
  b=Sjk4gehvTmGe+Vk48pRn2NwHJS9FTnVpbCoe/2Pe7u4Uw5NTCRqi9svY
   zDUzwdBvNUUW9BgHQpkrftEmvYmAlCApxueSqbs573mCYI9/bqB9DGibf
   kR/WugLNw2FmVaafLElTo7TAyDkrY/JlrnHsELjNSmBXELQIuaVdPR6R0
   1TLc/pTFX7lUMft23njY7LTKdV6M0L3GNNxhc7dPC6M48LcjmIjnRyF+0
   ac/wfHbVvrAd5aoq+9hT2GsmdaTvUp6oxrT9AHGbe3JXtYwWw/pOi4l4j
   spsoaSeVsOaC6vLKmsoTdEFB6xGRVk+4B/oJ+mMtBixavEvBju3SXWzYe
   A==;
X-CSE-ConnectionGUID: mrNaTELNSLq29vZBFv/UiQ==
X-CSE-MsgGUID: K7Bf0PRQS9yT4emINTNB3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47382951"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47382951"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 03:56:06 -0700
X-CSE-ConnectionGUID: 7P7akFhUQxKhG2nAQ/QNHg==
X-CSE-MsgGUID: 8jv723jPSCCANg/wYF/DeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="135029668"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 03:56:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Apr 2025 13:55:59 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
    Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
In-Reply-To: <CAGwozwEd3B3H4iKjn5YrLOzHpXajqsPVEVVmzHc=wEAz23AR4g@mail.gmail.com>
Message-ID: <b423debe-95a4-2e9a-bb80-d5086576200f@linux.intel.com>
References: <20250430204517.75d88615@canb.auug.org.au> <CAGwozwEd3B3H4iKjn5YrLOzHpXajqsPVEVVmzHc=wEAz23AR4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, Antheas Kapenekakis wrote:

> On Wed, 30 Apr 2025 at 12:45, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to nonexisting document 'hwmon/oxpec' [toc.not_readable]
> >
> > Introduced by commit
> >
> >   fe812896e55d ("platform/x86: oxpec: Move hwmon/oxp-sensors to platform/x86")
> 
> Hm,
> after removing the documentation I might have left an erroneous oxcec
> entry in the documentation file.
> 
> In some previous versions of the series the hwmon doc file was renamed
> but in the final one it is removed. So this file should not be introduced.
> 
> Should I do a fixup commit?

Yes please. I'll fold that into the original commit if it is easy enough 
to do which is what I expect to be case here.

-- 
 i.


