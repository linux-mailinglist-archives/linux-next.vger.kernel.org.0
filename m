Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BDF3E5896
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 12:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbhHJKvW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 06:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbhHJKvV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 06:51:21 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6B4C061798
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 03:50:59 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b13so25670608wrs.3
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=UjcQ833lT/aJptZfrw9hQKL4FPcGR8PiWebdUPXSJeU=;
        b=QLICahorFCqZb0nwa/xfPxgp+SwqjwsduDVvp68ONCB2q6tuwCIRyOGTql2Nk/jdXu
         cGzQbkIuCSFKMAt4wQMY8EJCFiX0yc7BbbCuEytkC1Du4B4JKGFLqwBQk1hkkxo9bPfT
         tHGsUQO7bOG8O/l4hizs6CK9uhwNwkobBYvbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=UjcQ833lT/aJptZfrw9hQKL4FPcGR8PiWebdUPXSJeU=;
        b=btIw9aOhtIHKSX73Fo08GQuEsOA5hapj4tbOe7To8qsXlOU+Q41Mwk4lgaggUWvX+y
         /PiIVuCsAuuZEuQ6j56YtLrxWETWlal3LY6BShJgxKjcas9XnJDQs6hcb/SS+hzZRQED
         5abZZfl2Ife8iNkQTCbX9gRMzDpcVfFIqWnclO2v9mPuy0tZmsqklkpaAHF3sCDy7m6r
         MSNJ5r+xSazBFqugJEOMzBwTq1V/m5OBdDzHW2wIXWQYOeJ4MJ2xAl2YC9Kddhuc12pu
         ZcTqJOPHi1QNBIR8aypsjg9MhbjcVdxfP9R1T3y8Nb/aGan/U2mB/MeOQqDyOJbUEEqX
         hINg==
X-Gm-Message-State: AOAM531vrrD1Nugx9e7IgNMQz4huRUGlX/Q9FwRU6td7DhcwDkqi9Gb/
        K37TB3QVqcZk7XASi8GaDyvYExIB5544mw==
X-Google-Smtp-Source: ABdhPJwadDDSepM4dFIctzwo2oVmdlLip3FAYIKQ7XOeRTJbsc/eSjnn053RxVvmreoH9uiYszl70Q==
X-Received: by 2002:a05:6000:2c6:: with SMTP id o6mr30300055wry.241.1628592658369;
        Tue, 10 Aug 2021 03:50:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x9sm2432255wmj.41.2021.08.10.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:50:57 -0700 (PDT)
Date:   Tue, 10 Aug 2021 12:50:55 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <YRJaD51xR8rQ2ga+@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au>
 <YRJRju/zo5YiF1EB@phenom.ffwll.local>
 <20210810203859.128649fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810203859.128649fc@canb.auug.org.au>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 10, 2021 at 08:38:59PM +1000, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Tue, 10 Aug 2021 12:14:38 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Matt Auld is on vacation, and the other issue is that the tree where this
> > is from isn't in linux-next. So will take a bit to get sorted in
> > linux-next.
> 
> Those warnings are now coming from Linus' tree (some time before
> v5.14-rc1).  I first mentioned them on June 3.

Uh that's not good, I missed that. I'll look into it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
