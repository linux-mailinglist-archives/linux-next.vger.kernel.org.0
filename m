Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE3A1FD530
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 21:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgFQTJ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 15:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgFQTJ5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2020 15:09:57 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFF5C06174E;
        Wed, 17 Jun 2020 12:09:56 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id i1so840668vkp.8;
        Wed, 17 Jun 2020 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eD4bw0lGQCfL/fgr6hV02m8eAYxz9GB1Zd0qbxDAQJ4=;
        b=XRBe8Rr7OkveXmecDtX/Xwx/BpU5lBwhhcVbrpoalnm1bZ7zPj/mDE+sO9H1fjKm8S
         0WK8Do11W4GOm/hBgpzdfMZkg1HQDYaNifUIEMvH0faExmBNgq9NVV5Vp3yaYGOig8j6
         jvk4u1TeWqnEfqYKYEDLa09ph/KY4QVwdS33iJ0FUQZVnPEKW7vK1LLrwALdWnXjojAx
         4AdUKLFEhhGVjdUxP7Snk/1AGy3g36NJSZK698jDayOsui7sEmAyQ3Z28PN54+hO0JK0
         m6kr8SBA105mxFS2VHnpdRD5nkwMcWCliyVXfhjOY0hltcf+TkKCke2/dgGoamf7fbcb
         AXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eD4bw0lGQCfL/fgr6hV02m8eAYxz9GB1Zd0qbxDAQJ4=;
        b=uXV9pG5S0raJ3R3QTzc190n+CS0wWvFRIlbUQY988JUNzBssDQNLc81NmT4fO6ARPI
         6XLw4PvEhXJz2QjmmfuIXJ+mm57LifzHkBzI/91J2Md+viPryAtRbUbnRfz8pdDecFqP
         kCdWAhIlRAsv8/nfHp0DVkVosLSb5LRC5OJo7uiqRt2pEros/AD8MEnKStgqsfBiChyz
         Iw0w2tDDByUzcDH7h0u3qbVObS/7Uhjk6Lsu1ynP6YAwtJmIRNJRk7US2e7KzNwDUHzD
         YPAOZXfVjyzAyj5B1Z+qrCzo7IClZv7LmYEb3XTC/O4Yn903zqS15SfaBcbg7NdPv8K5
         wMdA==
X-Gm-Message-State: AOAM531Z4/IEQsOse2158oZHn/f14dQb1PS8nFnGVK8zA2KxtMIBMNBq
        vSzsw7lNTcqTF+rBsnl0RN7Z4YgeQbURw/qP+NIe8g==
X-Google-Smtp-Source: ABdhPJwtoKeRVXvgQWYI0FGFEFUVIAQMF4l4PZuS7D/IV4AQqwOs6rxLY7l/5BGZ9tRfwoRr4V6z3VuB3DyHbXX5n8I=
X-Received: by 2002:a1f:ee81:: with SMTP id m123mr762899vkh.51.1592420995496;
 Wed, 17 Jun 2020 12:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200617105929.534edd34@canb.auug.org.au> <c82b9c52-d4e6-9eef-e37d-0a26ee9f1183@suse.de>
 <20200617170307.3c87be5a@canb.auug.org.au>
In-Reply-To: <20200617170307.3c87be5a@canb.auug.org.au>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 17 Jun 2020 20:06:11 +0100
Message-ID: <CACvgo50Ke-7pGqpwEb8y0iYOKv7wep1qUMm8_KJvUp0fV-YHoQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, 17 Jun 2020 at 08:03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Thomas,
>
> On Wed, 17 Jun 2020 08:33:24 +0200 Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > We recently dropped the _unlock() suffix from drm_gem_object_put(). This
> > patch should be ok.
>
> Yes, but what it shows is that the drm-misc tree is still based on
> v5.7-rc1 and v5.8-rc1 has about 16000 more commits for you to get
> conflicts against :-)
>
Being the culprit here - thanks for the patience and report.

I believe that both AMD and drm-misc teams are aware of this lovely
situation I've put them in.
As you mentioned drm-misc is a bit special and doing the usual
backmerge will be fun.

If you have any tips on how to minimise such issues, I'd gladly utilise them.

Thanks again,
-Emil
