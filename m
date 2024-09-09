Return-Path: <linux-next+bounces-3665-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AA1970B97
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 03:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 290882821FE
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 01:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6324F18C31;
	Mon,  9 Sep 2024 01:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PY+IyflN"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019D1862A;
	Mon,  9 Sep 2024 01:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725847056; cv=none; b=nWRSKxMBt0dQ+mg8TgaVZqC1Wd/uFKXFhASMHw7XoR9wh2UzOj8yN7MY5Y/A46TlXQEiu4lIkSJSnhUjyASuw/AiIe7SUcCd6LqHVZewkZXc8Z2N0r5HJWlcLFwEt1UfhFJ53i7+iP2LbjOxUXiuxd2jDC+ybDaHgm/6clg5xNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725847056; c=relaxed/simple;
	bh=4z/JGb26gAFsABTHxjzGPpN6+ZoAGK8zsDPYw4EPmUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XoFO8i9e2EOsYkXNdSJXXfEgnKFr1S6uRmCq+i4cJZ82qJhCxs6kSw9tlr3BLAAnYEvnJGUK+NUuZQuh5Ehg9ZjRujNkRsXudNADAqT0Q4ticXE05BHzDfR8/bs2n56oebuEylVmKLSWVhkfvCDfe2RWTrELy+eKOpHZPvYE/EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PY+IyflN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725847054; x=1757383054;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=4z/JGb26gAFsABTHxjzGPpN6+ZoAGK8zsDPYw4EPmUM=;
  b=PY+IyflNKo8rnxNU/+ERX26IVSMIev9tc16zRyUdAvdv+6LsBrdBI/VQ
   wY+nGRVGsSw/z7GAtHDVsl+MmpW09Xv13JKIDTkLxexkqh3jfYJwvCYgc
   9OQNwGaT/4P1TyFjgkicX5itR21TqIYNdM/e+KaHW7yH+ee8KW4m5wqCl
   brIzJCJXipwXnEfp5cWCRzZZEWzP3b+NgBFvpSGja69n3xNpcOAPn/IP1
   lE0vjhGU8T6ISWJKmPqYByA1x40zcsIkeCb/6fGlA97WCbc99k9W0rxjW
   RyrBNIvAujJgmDoYR6JsA9rJIdARsKd8NwfG2h2bJ0ht4km/KBMRVqZOd
   w==;
X-CSE-ConnectionGUID: JPZ8XVo2TgKx/BMrSlrkkQ==
X-CSE-MsgGUID: a1eChZNpTC6nOzAwMz00Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="47043991"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="47043991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 18:57:34 -0700
X-CSE-ConnectionGUID: qCDsMIRWTIWzC7S4AJI8iQ==
X-CSE-MsgGUID: k39BLQAqTP+PIMekHoumgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66548920"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 18:57:32 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>,  Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
In-Reply-To: <20240909100043.60668995@canb.auug.org.au> (Stephen Rothwell's
	message of "Mon, 9 Sep 2024 10:00:43 +1000")
References: <20240909100043.60668995@canb.auug.org.au>
Date: Mon, 09 Sep 2024 09:53:59 +0800
Message-ID: <87cyld1tjc.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the mm tree got a conflict in:
>
>   kernel/resource.c
>
> between commit:
>
>   ea72ce5da228 ("x86/kaslr: Expose and use the end of the physical memory address space")
>
> from Linus' tree and commit:
>
>   e2941fe697c8 ("resource, kunit: add test case for region_intersects()")
>
> from the mm-unstable branch of the mm tree.
>
> I fixed it up (I just used the former - and see below) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

The fix looks good to me.  Thanks for your help!

--
Best Regards,
Huang, Ying

