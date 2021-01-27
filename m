Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B59306586
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 22:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbhA0U5g convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 27 Jan 2021 15:57:36 -0500
Received: from mail.fireflyinternet.com ([77.68.26.236]:50888 "EHLO
        fireflyinternet.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233718AbhA0U4v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 15:56:51 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 23719012-1500050 
        for multiple; Wed, 27 Jan 2021 20:55:38 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1f5cc867-27a4-946c-8f53-916f677cafe9@infradead.org>
References: <20210128014419.55ea9ae4@canb.auug.org.au> <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org> <669b3538-9edb-cb32-6746-10615d0500b0@infradead.org> <1f5cc867-27a4-946c-8f53-916f677cafe9@infradead.org>
Subject: Re: [Intel-gfx] linux-next: Tree for Jan 27 (drm/i915)
From:   Chris Wilson <chris@chris-wilson.co.uk>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed, 27 Jan 2021 20:55:40 +0000
Message-ID: <161178094079.2943.18414218362462908962@build.alporthouse.com>
User-Agent: alot/0.9
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Randy Dunlap (2021-01-27 20:28:05)
> On 1/27/21 11:30 AM, Randy Dunlap wrote:
> > On 1/27/21 11:08 AM, Randy Dunlap wrote:
> >> On 1/27/21 6:44 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Note: the patch file has failed to upload :-(
> >>>
> >>> Changes since 20210125:
> >>>
> >>
> >> on x86_64:
> >>
> >> ../drivers/gpu/drm/i915/i915_gem.c: In function ‘i915_gem_freeze_late’:
> >> ../drivers/gpu/drm/i915/i915_gem.c:1182:2: error: implicit declaration of function ‘wbinvd_on_all_cpus’; did you mean ‘wrmsr_on_cpus’? [-Werror=implicit-function-declaration]
> >>   wbinvd_on_all_cpus();
> >>
> > 
> > My apologies: this was in Andrew's mmotm 2021-01-25.
> > Sorry about that.
> 
> 
> and now I see that it also happens in today's linux-next.

The fix is in the tree that should be feeding into linux-next, so I
trust it will resolve itself shortly. Along with the WERROR depends
snafu.
-Chris
