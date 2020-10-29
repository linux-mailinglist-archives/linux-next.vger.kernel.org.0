Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343DD29E5DF
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 09:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgJ2IKZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 04:10:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:15298 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727157AbgJ2IIL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Oct 2020 04:08:11 -0400
IronPort-SDR: x4KLtTgzdcjIoyJPlb5upHQmYyXCpPv2v26yBgsP1C/fioHqnRnb75xtU4bTyUBx1OzJW0jdNa
 b8Ar2uZ0vuzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="167614153"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="167614153"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 01:08:11 -0700
IronPort-SDR: 1ERdDjGrx/J7sOsH3QvG4gMY/zSofpPUx8j92Nia8y6n1gFb3aB4W/qKviNg/UNmNdF0iSZKFC
 J46fCuGFZ+kw==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="536574275"
Received: from rsexton-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.5.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 01:08:07 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>,
        DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-intel-fixes tree
In-Reply-To: <160392160276.31966.3847690661999837078@build.alporthouse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201029082823.5607849a@canb.auug.org.au> <160392160276.31966.3847690661999837078@build.alporthouse.com>
Date:   Thu, 29 Oct 2020 10:08:05 +0200
Message-ID: <87ft5xihei.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 28 Oct 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Stephen Rothwell (2020-10-28 21:28:23)
>> Hi all,
>> 
>> Commit
>> 
>>   d13208a88f41 ("lockdep: Fix nr_unused_locks")
>> 
>> is missing a Signed-off-by from its author.
>> 
>> Also, the author's email name is missing the leading 'P'.
>
> And it shouldn't be in the drm-intel-fixes tree.

It's temporarily on top of the fixes branch to allow our CI to test the
branch. We weren't getting results on anything -rc1 based because of
this.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
