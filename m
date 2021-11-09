Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944B844AC4D
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 12:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239399AbhKILMm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 06:12:42 -0500
Received: from mga11.intel.com ([192.55.52.93]:1931 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhKILMm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Nov 2021 06:12:42 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229887611"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="229887611"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 03:09:44 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="503463235"
Received: from stkachen-mobl3.ger.corp.intel.com (HELO localhost) ([10.251.216.106])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 03:09:40 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <YYo8axRhW/zFQUgW@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211015202648.258445ef@canb.auug.org.au> <20211101194223.749197c5@canb.auug.org.au> <20211105171517.287de894@canb.auug.org.au> <874k8qampc.fsf@intel.com> <20211106133314.42e3e308@canb.auug.org.au> <87zgqd6alj.fsf@intel.com> <YYo8axRhW/zFQUgW@phenom.ffwll.local>
Date:   Tue, 09 Nov 2021 13:09:38 +0200
Message-ID: <87ilx160wd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 09 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Nov 09, 2021 at 09:40:08AM +0200, Jani Nikula wrote:
>> On Sat, 06 Nov 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Hi Jani,
>> >
>> > On Fri, 05 Nov 2021 13:03:43 +0200 Jani Nikula <jani.nikula@intel.com> wrote:
>> >>
>> >> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
>> >> __stack_depot_* name conflict") to drm-misc-next-fixes.
>> >
>> > Please do so as builds will start failing otherwise :-(
>> 
>> Thomas/Maxime/Maarten, okay to cherry-pick that to drm-misc-next-fixes?
>
> Yeah just do, for drm-misc this is considered in committer purview. I
> think we should add a section to the docs about "What if a patch is in the
> wrong branch" which tells you to just cherry-pick -x or whatever.

Done.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
