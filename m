Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119092306EC
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 11:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgG1Jul (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 05:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgG1Jul (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2020 05:50:41 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CF8C0619D2
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2020 02:50:40 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id u24so7051952oiv.7
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2020 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p7WqU0daqgPYKzDM4wJY4PZYJHbY5NF/mgj6Y17PepM=;
        b=OrOtLw5EOmkRhXXIcYsw9TDIuzBhVZKGqOJAH/isn+0lcdD3Jrl499FjT3FlPrptex
         inWX7gaza/tr3nXnYkuumtjJl53aQwwmbqWksLtYZ7tdsYRpLvnK2XTYCv/8m+65Ufa+
         7DFk3TRCPt90E+tgIzUao4sOasvA27ToklnoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7WqU0daqgPYKzDM4wJY4PZYJHbY5NF/mgj6Y17PepM=;
        b=haGwu0eIQtr5SkQwoDOsB/nQXQr+tZreWszZS5P/4aT5RlGCALSRuB7c+5TwQEQ2r3
         UR8+RjgQt4TBMXhvycR6HnikxC49b1TRX6XyPYcFGdoWWbc5+yuv/6j921XgSeLGwlUj
         KetFng3cOK4VBJYbDypMN/zTZ9MGZjj+0EC9IABm2D7+NFHP7VU04U28+Zkgr2neHX1Q
         /JPN94AyZGvlsNBISzmEn1RdQkl3gNBls534oTh+QQMlLd6y4B3eTcJiEqSXLrIgy+Lk
         /x0Zjy1SyshJsm46jBTkDgVR5QJclDFjW4xEaNFLgleL3DDfwDP9AxIeANhN2FLUt3d8
         6/Pg==
X-Gm-Message-State: AOAM531baGW3UdPVte+BRTtWMCpsxuVolB9IIb3P5KtNerayWYFZbSNJ
        ZTMN+K9127aBPPILj+DW8mdhHnvFjD++/YJCMh7JT8YO
X-Google-Smtp-Source: ABdhPJyZW+bp+9Nwgfg/xN8qMPQYWscCoqwnaoL0A0n3guJlRQVVgay29L57+3LBo5ONHbZ3iemXiiHIVW0XxKZO5vY=
X-Received: by 2002:a05:6808:88:: with SMTP id s8mr2583624oic.101.1595929840005;
 Tue, 28 Jul 2020 02:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200727233833.05e48968@canb.auug.org.au>
In-Reply-To: <20200727233833.05e48968@canb.auug.org.au>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 28 Jul 2020 11:50:29 +0200
Message-ID: <CAKMK7uH773DCGvU92i1R-cexnsfYoxM=wrPZOYY6i1j+-xOBMA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drm-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 27, 2020 at 3:38 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   163d5446c37a ("drm/nouveau/disp/gm200-: fix regression from HDA SOR selection changes")
>
> Fixes tag
>
>   Fixes: 9b5ca547bb8 ("drm/nouveau/disp/gm200-: detect and potentially disable HDA support on some SORs")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Hm dim (our scripting) should be checking for this already, I've added
that after the last big round of malformed Fixes lines we've had ...
Dave, overuse of dim -f in your history?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
