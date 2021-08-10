Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D287A3E5811
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 12:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239776AbhHJKPE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 06:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239755AbhHJKPE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 06:15:04 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE5CC0613D3
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 03:14:42 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b13so25535558wrs.3
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y3QS1FCrYdlmaqXiG1OJXl7lfED7PyktVQVwB2bvr8I=;
        b=BmXmFejb/qK7hA260JrWvlGX/gLQXJ9JOd6a76DvoRbbGZE0g593TmqcZzU/wU5IIu
         YLakd4oCkkwGHF+AJfseqjQvDUEvI/IrRrxhJ8/jk+3PQX9Ve3nSU7FqsEQ/W7p29IU2
         Ei5X9ir+BQAqfPiHDoU+SrQot7rpZB1ioEGL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Y3QS1FCrYdlmaqXiG1OJXl7lfED7PyktVQVwB2bvr8I=;
        b=W3WI2Wgm58lQ8ToDntiNA82vpNy7vewSMWU5l0uCC/D0nJjYD74SLyT2ntH9erq+5L
         b+ZPNUE/wxhcqAF6/fRh83elvSrcKff/7PTxhzlUkWAoYd0tu1H8lux2LkKPIQ1OnER+
         zK2B7fNslwmD8+lxNPGZdyvGStWi9MmtB1XQubEBi3ncTAeyW9pqLuZ66M6gxCvtbA3a
         G4LWyeRe3dA26rQsffl2q9pRioF/4oAe8ycqEi+O7X45qsYnHDG4djhSdjXAvY9XOsXg
         RmA0lotf9qraPkKxg0uwWED7OygFQbTc1sgzEVsX/xEZ1O1PGK1f+svwT2By5m82B3ln
         ePxg==
X-Gm-Message-State: AOAM532pRIqSC5u8PMK1VBRdB/HrpGywKKGaf/T7zuhJGxO38gkmUjVE
        IX5hzxZu81xJe6/35gszd45Qbg==
X-Google-Smtp-Source: ABdhPJxvdfIs0xvibG7SFc6t4/K9jAdA0Rjh5XE53jIDVKUe4LIjSEvpazKK2sTVLHBfF9e8ZU0rQg==
X-Received: by 2002:a05:6000:18a5:: with SMTP id b5mr29599858wri.184.1628590480822;
        Tue, 10 Aug 2021 03:14:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 140sm21738829wmb.43.2021.08.10.03.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:14:40 -0700 (PDT)
Date:   Tue, 10 Aug 2021 12:14:38 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <YRJRju/zo5YiF1EB@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810192636.625220ae@canb.auug.org.au>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 10, 2021 at 07:26:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 8 Jul 2021 12:20:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 3 Jun 2021 19:32:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the drm tree, today's linux-next build (htmldocs) produced
> > > these warnings:
> > > 
> > > Documentation/gpu/driver-uapi.rst:2412: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:1393.
> > > Declaration is '.. c:enum:: drm_i915_gem_memory_class'.
> > > Documentation/gpu/driver-uapi.rst:2484: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:2484.
> > > Declaration is '.. c:struct:: drm_i915_gem_memory_class_instance'.
> > > Documentation/gpu/driver-uapi.rst:7: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:7.
> > > Declaration is '.. c:struct:: drm_i915_memory_region_info'.
> > > Documentation/gpu/driver-uapi.rst:2531: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:2531.
> > > Declaration is '.. c:struct:: drm_i915_query_memory_regions'.
> > > Documentation/gpu/driver-uapi.rst:2595: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:1393.
> > > Declaration is '.. c:struct:: drm_i915_gem_create_ext'.
> > > Documentation/gpu/driver-uapi.rst:2615: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:1393.
> > > Declaration is '.. c:struct:: drm_i915_gem_create_ext_memory_regions'.
> > > 
> > > Introduced by (one or more of) commits
> > > 
> > >   0c1a77cbdafb ("drm/doc: add section for driver uAPI")
> > >   2bc9c04ea702 ("drm/doc/rfc: i915 DG1 uAPI")
> > >   727ecd99a4c9 ("drm/doc/rfc: drop the i915_gem_lmem.h header")  
> > 
> > I am still getting these warning.
> 
> Still getting them ...

Matt Auld is on vacation, and the other issue is that the tree where this
is from isn't in linux-next. So will take a bit to get sorted in
linux-next.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
