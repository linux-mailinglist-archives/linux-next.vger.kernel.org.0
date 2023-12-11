Return-Path: <linux-next+bounces-331-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEB480CB3E
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 14:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5331F21085
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 13:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883C73D97E;
	Mon, 11 Dec 2023 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjVIoz37"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A996A0;
	Mon, 11 Dec 2023 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702302007; x=1733838007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vuC7ZITZzligVn1bk8ajCJPfZPXcsVP+xbTUWgFEVHs=;
  b=LjVIoz37gZgHdxDwl+MclTjOaMif+tEfvCe0XQQV6OcpOdccuoW+j63p
   trhV82Le+SwX5OXFLe62grylc5Up3Ue8W/5vHh5cekfF87gEWTlxmR1/B
   J6UTjDl7Lg9vO3OTSFWRj+gvKpQc2WPwaE6dizBAvNPOILos9gWkLI0jQ
   NqzAy78fwCisjid2pz++Ssswd5JNJaMBwIoBMsv61aF9h2xOZD25sL/E/
   D3k5IYvH5o76MP5VL8M7/i6yiFnxse8dFXzMZKSK16i/ZWAubJwrhRHSf
   xUBHpYhLr9JmVm4dB/NFuSy/4/z9sHeggCsKy5Es9tDSF7zE1GDWbj3VT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379642776"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379642776"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 05:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="839043212"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="839043212"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 05:40:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rCgVt-00000004n9v-49D1;
	Mon, 11 Dec 2023 15:40:01 +0200
Date: Mon, 11 Dec 2023 15:40:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pinctrl-intel tree with the
 gpio-brgl tree
Message-ID: <ZXcRMTFitYohcFfS@smile.fi.intel.com>
References: <20231211145056.23fbfd7d@canb.auug.org.au>
 <CACMJSetGz1fCnqS_HPTLyV8dOWOUtO07-bZKKXu3=3Lk2PGdyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSetGz1fCnqS_HPTLyV8dOWOUtO07-bZKKXu3=3Lk2PGdyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Linus W.

On Mon, Dec 11, 2023 at 09:15:30AM +0100, Bartosz Golaszewski wrote:
> On Mon, 11 Dec 2023 at 04:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Today's linux-next merge of the pinctrl-intel tree got a conflict in:
> >
> >   drivers/pinctrl/intel/pinctrl-baytrail.c
> >
> > between commit:
> >
> >   c73505c8a001 ("pinctrl: baytrail: use gpiochip_dup_line_label()")
> >
> > from the gpio-brgl tree and commit:
> >
> >   6191e49de389 ("pinctrl: baytrail: Simplify code with cleanup helpers")
> >
> > from the pinctrl-intel tree.

...

> Andy, please pull the following into your baytrail tree:
> https://lore.kernel.org/lkml/20231208083650.25015-1-brgl@bgdev.pl/

I can do it, but why?

Conflicts is a normal practice during kernel development. And I believe this
particular one will be solved by Linus W.

Stephen, resolution looks correct to me, thank you.

-- 
With Best Regards,
Andy Shevchenko



