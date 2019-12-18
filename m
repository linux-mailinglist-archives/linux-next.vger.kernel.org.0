Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFDF12462C
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 12:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfLRLxf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 06:53:35 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36499 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfLRLxf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Dec 2019 06:53:35 -0500
Received: by mail-ot1-f68.google.com with SMTP id w1so2216051otg.3
        for <linux-next@vger.kernel.org>; Wed, 18 Dec 2019 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxFvtFTUUwA+ohr/zrRpzlWmODeoFm2SoCv2eQrZOew=;
        b=J48SMSEiIFOTZZrDBYTL8471LENC+N0zDlbkFHNuPd/2b+nORHyKXx8d+YGno8LNAG
         NtHMUA/vq9d1ti4k0oikgyLm1T9J0OAssIWOJY5Crw9urZmg41ZGRIRDsPY/zGDMqEhx
         66BavbQBE34xD3VQEIkVDXmLLsvxLewI1nvW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxFvtFTUUwA+ohr/zrRpzlWmODeoFm2SoCv2eQrZOew=;
        b=gPgHMYu+RiloZCzFxGUQ3CPKHfbw3Yraxgnlm84LKkMjmIoTUP2vmnEUnEtxFGmeUS
         DVtlzlsGwmEFveHBkfsgX076pw6ReXXGbHqLhaU9VVJWRvh4GU4ER1FkC3MpIQT/0+HN
         LyCYETnV42uBSc8lhHFmc60X0IQRiY6T7tqxePoM2xVY1JuR6ZX8YO6oE+0rfJ3pauZt
         dKj1TsaE8EfWBEV5sfxhvCBLjOVdscR1nd9H++FaIaIs39qg6k2nBLMXOQgT4YHN00bF
         A1O8uiIfcbF6EduimobUQqitewoXo0PTp5nhlul+M6ZQ0+luHa24jLiOlErAUwRzjvMe
         xojg==
X-Gm-Message-State: APjAAAVCjNj8HnuZxeo16i2w77nq2U0QMDxl93pZgOHAGz9nxEiwzRRl
        +c/mKeSAy8V1j+MYc2HBqbHYXwmnShF9p7la5O5QVsjd
X-Google-Smtp-Source: APXvYqzOWxFUYC1FyvGnADEA9Hj69nxuYFuE8i0P3qMz16x3t8aw/ipFN63K/R08PfO4EqHEfOLYiOtz+OqGLgE1lF4=
X-Received: by 2002:a05:6830:1415:: with SMTP id v21mr2319204otp.188.1576670014731;
 Wed, 18 Dec 2019 03:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20191216122331.43c766f1@canb.auug.org.au> <20191217131937.GZ624164@phenom.ffwll.local>
 <20191218072204.06ca0cd9@canb.auug.org.au>
In-Reply-To: <20191218072204.06ca0cd9@canb.auug.org.au>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 18 Dec 2019 12:53:23 +0100
Message-ID: <CAKMK7uHP2LL=pZA3ppbz-+=wKs6QXY_7360xTjMUc-Qqp1ftrg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 17, 2019 at 9:22 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Daniel,
>
> On Tue, 17 Dec 2019 14:19:37 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Dec 16, 2019 at 12:23:31PM +1100, Stephen Rothwell wrote:
> > >
> > > After merging the drm-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c: In function 'anx6345_i2c_probe':
> > > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:30: error: implicit declaration of function 'i2c_new_dummy' [-Werror=implicit-function-declaration]
> > >   738 |    anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
> > >       |                              ^~~~~~~~~~~~~
> > > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:28: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> > >   738 |    anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
> > >       |                            ^
> > >
> > > Caused by commit
> > >
> > >   6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> > >
> > > interacting with commit
> > >
> > >   2c2f00ab1641 ("i2c: remove i2c_new_dummy() API")
> > >
> > > From Linus' tree.
> > >
> > > I have applied the following fix up patch for today:
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 16 Dec 2019 12:11:19 +1100
> > > Subject: [PATCH] drm/bridge: fix up for removal of i2c_new_dummy()
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >
> > Thanks pulled into drm-next since I just processed the first drm-misc-next
> > pull.
>
> Thanks.  For the future, though, merge fixes like this should be part
> of the actual merge commit to avoid bisection problems.

I flip flop on this one, between retaining your contribution
explicitly and merging them in. Usually I squash them in, but this
felt substantial enough to retain explicitly. Worst case if someone is
unlucky they need to git bisect skip once. I guess next time I should
do a topic branch, apply it there on top of the pull, and then pull
that in so that it's both pretty history and no bisect hole.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
