Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB45B123118
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 17:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfLQQG0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 11:06:26 -0500
Received: from mga12.intel.com ([192.55.52.136]:46895 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727737AbfLQQGZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 11:06:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 08:06:25 -0800
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; 
   d="scan'208";a="209748794"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 08:06:21 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Steven Price <steven.price@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [Intel-gfx] linux-next: Tree for Dec 16 (drm_panel & intel_panel)
In-Reply-To: <CAHp75Vd28j5_xexHyXacRaSv=VRkmBLrSh=w2FE8nmAGWdAo6A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191216162209.5b5256dd@canb.auug.org.au> <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org> <20191217054255.GA26868@ravnborg.org> <65c9dc7b-3c61-8204-07da-212632732791@infradead.org> <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com> <CAHp75VfmGo1LzsHiq_UvWbhvRGovtaLVnRPZJ=40arrJWq6HvA@mail.gmail.com> <87d0cnynst.fsf@intel.com> <CAHp75Vd28j5_xexHyXacRaSv=VRkmBLrSh=w2FE8nmAGWdAo6A@mail.gmail.com>
Date:   Tue, 17 Dec 2019 18:06:18 +0200
Message-ID: <87a77rym11.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 17 Dec 2019, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Dec 17, 2019 at 5:28 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Tue, 17 Dec 2019, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>> > On Tue, Dec 17, 2019 at 1:56 PM Steven Price <steven.price@arm.com> wrote:
>
>> > I think the proper one is to have s/IS_ENABLED/IS_REACHABLE/.
>> > It fixes issue for me.
>>
>> As discussed off-line, this will allow silently building and linking a
>> configuration that's actually broken. (No backlight support despite
>> expectations.)
>
> In my case I have deliberately compile backlight as a module to be
> used exclusively with backlight-gpio which has nothing to do with
> i915. I dunno if backlight is a MUST dependency for i915.

It's not a required dependency, all combinations of i915 and backlight
are fine, *except* i915=y, backlight=m. This can be achieved with:

	depends on BACKLIGHT_CLASS_DEVICE || BACKLIGHT_CLASS_DEVICE=n

BR,
Jani.

>
> From my perspective the original commit, with all good that it
> provides, should not break previously working configurations. Though
> we might argue if my "working" kernel configuration had been broken in
> the first place...
>
> Just my 2 cents, though.
>
>> IMO deep down the problem is that we "select" BACKLIGHT_CLASS_DEVICE all
>> over the place, while we should "depends on" it. Everything else is just
>> duct tape that allows configurations where built-in code calls backlight
>> symbols in modules. It used to be more about an interaction with ACPI,
>> now we've added DRM_PANEL to the mix.
>>
>> I've proposed a fix five years ago [1]. That's what it takes to fix
>> these recurring failures for good. I'm not really all that interested in
>> the whack-a-mole with the hacks.
>
> Agree with this. The root cause must be fixed once and for all.
> I guess it should be a logical continuation of Sam's series.
>
>> [1] http://lore.kernel.org/r/1413580403-16225-1-git-send-email-jani.nikula@intel.com

-- 
Jani Nikula, Intel Open Source Graphics Center
