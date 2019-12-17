Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA95123042
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 16:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfLQP2L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 10:28:11 -0500
Received: from mga04.intel.com ([192.55.52.120]:55880 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727039AbfLQP2L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 10:28:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 07:28:10 -0800
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; 
   d="scan'208";a="209736160"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 07:28:05 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Steven Price <steven.price@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
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
In-Reply-To: <CAHp75VfmGo1LzsHiq_UvWbhvRGovtaLVnRPZJ=40arrJWq6HvA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191216162209.5b5256dd@canb.auug.org.au> <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org> <20191217054255.GA26868@ravnborg.org> <65c9dc7b-3c61-8204-07da-212632732791@infradead.org> <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com> <CAHp75VfmGo1LzsHiq_UvWbhvRGovtaLVnRPZJ=40arrJWq6HvA@mail.gmail.com>
Date:   Tue, 17 Dec 2019 17:28:02 +0200
Message-ID: <87d0cnynst.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 17 Dec 2019, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Dec 17, 2019 at 1:56 PM Steven Price <steven.price@arm.com> wrote:
>> On 17/12/2019 06:37, Randy Dunlap wrote:
>> > On 12/16/19 9:42 PM, Sam Ravnborg wrote:
>> >> On Mon, Dec 16, 2019 at 08:25:11AM -0800, Randy Dunlap wrote:
>> >>> On 12/15/19 9:22 PM, Stephen Rothwell wrote:
>
>> >>> on x86_64:
>> >>>
>> >>> ld: drivers/gpu/drm/drm_panel.o: in function `drm_panel_of_backlight':
>> >>> (.text+0x2ee): undefined reference to `devm_of_find_backlight'
>> >>>
>> >>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_register':
>> >>> intel_panel.c:(.text+0x593e): undefined reference to `backlight_device_register'
>> >>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_unregister':
>> >>> intel_panel.c:(.text+0x5a04): undefined reference to `backlight_device_unregister'
>> >>>
>> >>> CONFIG_DRM_PANEL=y
>> >>> CONFIG_BACKLIGHT_CLASS_DEVICE=m
>> >>> CONFIG_DRM_I915=y
>> >>>
>> >>> Full randconfig file is attached.
>> >>
>> >> Can you please verify if you have:
>> >> 907aa265fde6589b8059dc51649c6d1f49ade2f3
>> >> ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
>> >>
>> >> This commit is supposed to fix it.
>> >>
>> >>      Sam
>> >>
>> >
>> > Hi Sam,
>> > I don't have the linux-next.git tree so I can't check that.
>> > I just built whatever is in linux-next of 20191216.
>> >
>>
>> 907aa265fde6589b8059dc51649c6d1f49ade2f3 ("drm/drm_panel: fix EXPORT of
>> drm_panel_of_backlight") is fixing drm_panel_of_backlight(), but the
>> error above is for backlight_device_register().
>>
>> From what I can tell, that commit is actually the cause of the error -
>> now intel_backlight_device_register() is being included in the kernel
>> even though it calls backlight_device_register() which is in a module.
>> Of course it also fixed the original error, so reverting it isn't any
>> use.
>>
>> The below Kconfig change fixes the build for me, but I've no idea
>> whether this is the correct fix.
>
> I think the proper one is to have s/IS_ENABLED/IS_REACHABLE/.
> It fixes issue for me.

As discussed off-line, this will allow silently building and linking a
configuration that's actually broken. (No backlight support despite
expectations.)

IMO deep down the problem is that we "select" BACKLIGHT_CLASS_DEVICE all
over the place, while we should "depends on" it. Everything else is just
duct tape that allows configurations where built-in code calls backlight
symbols in modules. It used to be more about an interaction with ACPI,
now we've added DRM_PANEL to the mix.

I've proposed a fix five years ago [1]. That's what it takes to fix
these recurring failures for good. I'm not really all that interested in
the whack-a-mole with the hacks.


BR,
Jani.


[1] http://lore.kernel.org/r/1413580403-16225-1-git-send-email-jani.nikula@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
