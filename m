Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A823E5A17
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 14:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240633AbhHJMjv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 08:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238785AbhHJMju (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 08:39:50 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07719C061799
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 05:39:29 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id f33-20020a4a89240000b029027c19426fbeso5281592ooi.8
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ww4lecu94JFzIEYqvV9wG7CxGy+w0GGJNoOyQcE+rlc=;
        b=ffiSBfSdQpFtWh7sQOjXNBnszBrgvX6rNORPzYxTX+tvrunJaBXxCrum0ZMT5f9l2k
         zyqH+vsUOSNGCL17xPZRTerBTSJYWxCte6Roaedn0wbufD49iFAARtF040ezK7Zgr3iy
         3h8MgKpfFJ+t2iFewQj98iYZOtPAn8i01ALs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ww4lecu94JFzIEYqvV9wG7CxGy+w0GGJNoOyQcE+rlc=;
        b=WbJ2V0NYCYCZsvCd7WQYVbtVvWMm6J10VkjGkl2sLBpzZPSu8pTxKunWxQEL/WLTZH
         nasJ9IHgHfM6JsjkuHZ3oeBvq1mCiqWQ4ErXLwYQKJRJptJN9rAtwVivm9Ry2o1eZT6E
         p+dMb1Ydfl6Gqb5hBPrw8Yxwiq9tdfLhx6dLow90j+lkVg6Vk0zBUxzGebPDveNp/sxH
         z+0bR5JU9jPIZbtd0Z6B9RyBbyuseHJD8XlWyYi2Pr+EbZav/+PNd2Slv+vjk8LM2+L+
         qQ0YOkXOcDKVDmTRzdgMNf6DN1XwI4dV64tRFa0rrvTKD3gVA6SRRKkOxUcwuC3t5c70
         47EQ==
X-Gm-Message-State: AOAM531yCmtD7mFiL1xQ9J53IAvxeBavdZzFbSQLi/kiAJAaUQbYZlNk
        1wpZyUGMAUAdF1OGBNZDXTBnOxv6d5HpAZTSskxlGg==
X-Google-Smtp-Source: ABdhPJzkbH9UZquu28KHT62dWS3UnyJcbbKQgX0h6vB//foTcVEs6gPGNyoiQPrtmrJTNpUd49l4Pb/NsVxqVCikPIY=
X-Received: by 2002:a4a:b402:: with SMTP id y2mr16540156oon.89.1628599168467;
 Tue, 10 Aug 2021 05:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210603193242.1ce99344@canb.auug.org.au> <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au> <YRJRju/zo5YiF1EB@phenom.ffwll.local>
 <20210810203859.128649fc@canb.auug.org.au> <YRJaD51xR8rQ2ga+@phenom.ffwll.local>
 <20210810210129.03b3fba5@canb.auug.org.au>
In-Reply-To: <20210810210129.03b3fba5@canb.auug.org.au>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 10 Aug 2021 14:39:17 +0200
Message-ID: <CAKMK7uHyUbc5StULAgawYZUtZqyYxfud5CMh3MaGJ5KS0FeXRQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 10, 2021 at 1:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Daniel,
>
> On Tue, 10 Aug 2021 12:50:55 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Uh that's not good, I missed that. I'll look into it.
>
> Thanks.

Doc build is taking absolutely forever here, but I think I have the
right patch for you. t-b/ack would be great if you can give it a spin,
I cc'ed you.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
