Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91503280229
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 17:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732339AbgJAPI2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 11:08:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:3056 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732213AbgJAPI2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 11:08:28 -0400
IronPort-SDR: 2/bjamm5NXgcRVfi6LE3LpT/AjcVtk3DftdkGBPv7i39vEr3OHaSeuQzPOBr/XGQ5hFjL1QCrA
 UqymGpyqRRUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="226872520"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="226872520"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 08:08:21 -0700
IronPort-SDR: O74dZO2eJgRDJLthE9jBgpEVhqwkllD59i4GnCHCxutJccngda6LcTYLp6JKVj8dIEg/+jV4fu
 l6hOT1x/4JaQ==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="504034506"
Received: from lraichel-mobl.ger.corp.intel.com (HELO localhost) ([10.249.36.225])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 08:08:17 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the drm-intel tree
In-Reply-To: <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201001203917.43d46a3d@canb.auug.org.au> <20201001135350.GA14869@lst.de> <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com>
Date:   Thu, 01 Oct 2020 18:08:36 +0300
Message-ID: <87h7rem1aj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 01 Oct 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Thu, Oct 1, 2020 at 3:53 PM Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > Today's linux-next merge of the akpm tree got a conflict in:
>> >
>> >   drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> >
>> > between commit:
>> >
>> >   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
>> >   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")
>
> Uh these patches shouldn't be in linux-next because they're for 5.11,
> not the 5.10 merge window that will open soon. Joonas?

I don't know anything else, but both are tagged Cc: stable.

BR,
Jani.

>
>> > from the drm-intel tree and patch:
>> >
>> >   "drm/i915: use vmap in i915_gem_object_map"
>> >
>> > from the akpm tree.
>> >
>> > I fixed it up (I just dropped the changes in the former commits) and
>>
>> Sigh.  The solution is a bit more complicated, but I just redid my
>> patches to not depend on the above ones.  I can revert back to the old
>> version, though.  Andrew, let me know what works for you.
>
> Imo ignore, rebasing onto linux-next without those intel patches was
> the right thing for the 5.10 merge window.
> -Daniel

-- 
Jani Nikula, Intel Open Source Graphics Center
