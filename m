Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD64C10419B
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 17:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfKTQ4s convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 20 Nov 2019 11:56:48 -0500
Received: from mail.fireflyinternet.com ([109.228.58.192]:56012 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727674AbfKTQ4s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2019 11:56:48 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 19274758-1500050 
        for multiple; Wed, 20 Nov 2019 16:56:40 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87k17uwmlv.fsf@intel.com>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20191119194658.39af50d0@canb.auug.org.au>
 <1d30acd4-9947-d228-967f-c4e76ebca832@infradead.org>
 <87k17uwmlv.fsf@intel.com>
Message-ID: <157426899658.13839.6346197595846229766@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] linux-next: Tree for Nov 19 (i915)
Date:   Wed, 20 Nov 2019 16:56:36 +0000
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Jani Nikula (2019-11-20 16:15:08)
> On Tue, 19 Nov 2019, Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 11/19/19 12:46 AM, Stephen Rothwell wrote:
> >> Hi all,
> >> 
> >> Changes since 20191118:
> >
> >
> > on x86_64:
> >
> > ERROR: "pm_suspend_target_state" [drivers/gpu/drm/i915/i915.ko] undefined!
> >
> > # CONFIG_SUSPEND is not set
> 
> a70a9e998e8e ("drm/i915: Defer rc6 shutdown to suspend_late")

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 060ee0f44c70..982040ecbd01 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -275,7 +275,7 @@ void intel_gt_suspend_prepare(struct intel_gt *gt)

 static suspend_state_t pm_suspend_target(void)
 {
-#if IS_ENABLED(CONFIG_PM_SLEEP)
+#if IS_ENABLED(CONFIG_SUSPEND) && IS_ENABLED(CONFIG_PM_SLEEP)

Declared under PM_SLEEP.
Defined under SUSPEND.
-Chris
