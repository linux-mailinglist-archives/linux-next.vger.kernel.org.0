Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E97122DE6
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 15:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfLQOCn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 09:02:43 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35982 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbfLQOCn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 09:02:43 -0500
Received: by mail-pf1-f194.google.com with SMTP id x184so7619236pfb.3;
        Tue, 17 Dec 2019 06:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZbdI1oTJhgNR2q16NaU/ih7Yhw7j92Blaz0d9EbKf0=;
        b=VufgDlRLvUqcDhaN+aqsmpUSpMUEO+5eGXxtaMmiB+cLPuEIANj2BqRFbg41NZStda
         ek5yjrcLaHyy6fz0j9cGKpRd4ZmWrpCKP8qZLrN4FkIi40zDb+URhQt10vXmZR204wHk
         ondoEsn1mZAMYuC5XDdYhlta4Uq6iJsN+AiE8auO3rrkbiB9gdE4nKWlovMytl4nXsaR
         NOwmYv23kXk9CYciQVrLVYxBP1vKQdJW4aD0S+zwQytPQxLPqaibsXwhZ1aLwBRs/Txl
         5NNofTyb1ZdA9my8h0kjpZatEPUICBMzHatfFSJHhhCkyKuPlQunIAukKI/FfzCMnIPd
         U3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZbdI1oTJhgNR2q16NaU/ih7Yhw7j92Blaz0d9EbKf0=;
        b=SUfP/pceyuO5zCNtT8VpTsJITh8zYeduroweIfbR+NGGL9TNsDDgONz6qGhuA+byil
         CB+aPiIMZTOSBse5ENsY360wmDhdI+p0O8DCqN1H35NavndFP7ktfsh4PNlpu5GpmEBl
         6Gv3C3sMNAGUtGvgRVkcZJj7/5ShbXFek4JhaAevbSCUPRjoJQK04XXFw18+SBshsHSp
         FwtPL26Jw8HZFJSJiCWxYzqYDvWRmvQO7dia/CW8IfLp3gwBlXOn+iw4QWM5Lk8PZBx4
         QdYqMcqBQAI/AHdVFRCweQ2p3ZybV5InMy6qEivJ85rsWacIrdgq4W5bWHeEQcCjOHoi
         T9AQ==
X-Gm-Message-State: APjAAAXiYekgz6kKrkaOQTQx1W2uAR5wKrpJFkT80YJYq14ZpYBGJ2Wx
        EXgp7XhUlc5Q2IipsjEkhDGepIPpIbbPapKLo8k=
X-Google-Smtp-Source: APXvYqy/xM6reHHq0RiuWT+LpcRLnjrMc7GzR7AnrNUS1AegdjlgvuOx6jBTvvKmZlo6TyMcdNVND3QExbOT1QWstfI=
X-Received: by 2002:a62:7590:: with SMTP id q138mr21861326pfc.241.1576591362762;
 Tue, 17 Dec 2019 06:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20191216162209.5b5256dd@canb.auug.org.au> <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
 <20191217054255.GA26868@ravnborg.org> <65c9dc7b-3c61-8204-07da-212632732791@infradead.org>
 <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com>
In-Reply-To: <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 17 Dec 2019 16:02:32 +0200
Message-ID: <CAHp75VfmGo1LzsHiq_UvWbhvRGovtaLVnRPZJ=40arrJWq6HvA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 16 (drm_panel & intel_panel)
To:     Steven Price <steven.price@arm.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 17, 2019 at 1:56 PM Steven Price <steven.price@arm.com> wrote:
> On 17/12/2019 06:37, Randy Dunlap wrote:
> > On 12/16/19 9:42 PM, Sam Ravnborg wrote:
> >> On Mon, Dec 16, 2019 at 08:25:11AM -0800, Randy Dunlap wrote:
> >>> On 12/15/19 9:22 PM, Stephen Rothwell wrote:

> >>> on x86_64:
> >>>
> >>> ld: drivers/gpu/drm/drm_panel.o: in function `drm_panel_of_backlight':
> >>> (.text+0x2ee): undefined reference to `devm_of_find_backlight'
> >>>
> >>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_register':
> >>> intel_panel.c:(.text+0x593e): undefined reference to `backlight_device_register'
> >>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_unregister':
> >>> intel_panel.c:(.text+0x5a04): undefined reference to `backlight_device_unregister'
> >>>
> >>> CONFIG_DRM_PANEL=y
> >>> CONFIG_BACKLIGHT_CLASS_DEVICE=m
> >>> CONFIG_DRM_I915=y
> >>>
> >>> Full randconfig file is attached.
> >>
> >> Can you please verify if you have:
> >> 907aa265fde6589b8059dc51649c6d1f49ade2f3
> >> ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
> >>
> >> This commit is supposed to fix it.
> >>
> >>      Sam
> >>
> >
> > Hi Sam,
> > I don't have the linux-next.git tree so I can't check that.
> > I just built whatever is in linux-next of 20191216.
> >
>
> 907aa265fde6589b8059dc51649c6d1f49ade2f3 ("drm/drm_panel: fix EXPORT of
> drm_panel_of_backlight") is fixing drm_panel_of_backlight(), but the
> error above is for backlight_device_register().
>
> From what I can tell, that commit is actually the cause of the error -
> now intel_backlight_device_register() is being included in the kernel
> even though it calls backlight_device_register() which is in a module.
> Of course it also fixed the original error, so reverting it isn't any
> use.
>
> The below Kconfig change fixes the build for me, but I've no idea
> whether this is the correct fix.

I think the proper one is to have s/IS_ENABLED/IS_REACHABLE/.
It fixes issue for me.

Should I send a patch?

-- 
With Best Regards,
Andy Shevchenko
