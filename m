Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E008244AA64
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 10:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244765AbhKIJTV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 04:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244738AbhKIJTU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 04:19:20 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5396C06120A
        for <linux-next@vger.kernel.org>; Tue,  9 Nov 2021 01:16:30 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so1725065wmb.5
        for <linux-next@vger.kernel.org>; Tue, 09 Nov 2021 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yjma5mRrb82FaHeqwEGkttg2XiFg5zhxGRY3Wmkbjxk=;
        b=fKFTVCySyPMePSh7mhupGnzSoJoGvjq1KyxBEzABecEN+XHEN+WMQOhWsEzkGtRmid
         9iqVwP//G3abSfqk+rIgkTn5yXuk0Mo3f5OlFYwtq9LaFWTjU8N9nNL55Cz3Nf/+UZuI
         ZcQxS2ta7waGRCAMMNIigaBfF2L2we8y7YaxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Yjma5mRrb82FaHeqwEGkttg2XiFg5zhxGRY3Wmkbjxk=;
        b=GXmuVb+HBJSTyksgNK4DYS1Zb6B8njTKGMS7q2HQRQBPznS9P8EMK4WOg1gVy6gfbt
         gAoXivFsRa9Lwc1WPaSijTDHjBcxogyhjVBqlK1FIKXtD8kFYdOzoztZ00urf8Ovt3yu
         GwZm2Z02ty9av4YIDqKlkszHwfqgXd8it6nbRDLSTCfzf79ADv73RrGNrcvwgOx8vSBa
         Bq/yYTjZfpgKeGWkiCefqmFzwCY7EKkQMac7d0F0KVgGt9zV6HtAvVWqVMh2oubNno14
         Ck/52p8bToIupqYDz/wwduPhxZrQnXDxHCCS5mVtZDpKsaNHp440YrAOFnb+/2bQqx9G
         /JnA==
X-Gm-Message-State: AOAM530cCKchL5e/wDAS8wXlXkO+7PLBNSUV5L58DzOdPR8zvhc5cFcQ
        pDKxaoXd+9v0oeG3lrx3vD0aXQ==
X-Google-Smtp-Source: ABdhPJz7q+uhfnvfEH4DwVgZJaCEKFC1hKgEx5TjbsATOUhrI19DS7lgDXeUqtwj6dIwUW3QWcXnJA==
X-Received: by 2002:a05:600c:3b83:: with SMTP id n3mr5338933wms.116.1636449389206;
        Tue, 09 Nov 2021 01:16:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h13sm19842564wrx.82.2021.11.09.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 01:16:28 -0800 (PST)
Date:   Tue, 9 Nov 2021 10:16:27 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
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
Message-ID: <YYo8axRhW/zFQUgW@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20211015202648.258445ef@canb.auug.org.au>
 <20211101194223.749197c5@canb.auug.org.au>
 <20211105171517.287de894@canb.auug.org.au>
 <874k8qampc.fsf@intel.com>
 <20211106133314.42e3e308@canb.auug.org.au>
 <87zgqd6alj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgqd6alj.fsf@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 09, 2021 at 09:40:08AM +0200, Jani Nikula wrote:
> On Sat, 06 Nov 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Jani,
> >
> > On Fri, 05 Nov 2021 13:03:43 +0200 Jani Nikula <jani.nikula@intel.com> wrote:
> >>
> >> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
> >> __stack_depot_* name conflict") to drm-misc-next-fixes.
> >
> > Please do so as builds will start failing otherwise :-(
> 
> Thomas/Maxime/Maarten, okay to cherry-pick that to drm-misc-next-fixes?

Yeah just do, for drm-misc this is considered in committer purview. I
think we should add a section to the docs about "What if a patch is in the
wrong branch" which tells you to just cherry-pick -x or whatever.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
