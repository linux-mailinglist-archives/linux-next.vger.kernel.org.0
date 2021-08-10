Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA8E3E537E
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 08:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237813AbhHJG1v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 02:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237808AbhHJG1u (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 02:27:50 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF11C061796
        for <linux-next@vger.kernel.org>; Mon,  9 Aug 2021 23:27:29 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id h14so24696261wrx.10
        for <linux-next@vger.kernel.org>; Mon, 09 Aug 2021 23:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=GiCRq9oiIUoYtaK/RUZid1gDex+gXMLXotTaeNIUmiA=;
        b=TSLt8sQv3KMNzzPS3fSD/gdF+b63+EbUkwUJzjp0hhlGdZUZ7Rd/AoOvp0uJmLSyth
         idWsFEWNxLZHMkE7N0Us6P8gpIMwEjBGSYsiiNKmOb86eZDu77SO4PLc1ir83QOgXCk1
         f5jZQSvinIlEibg/HrnX+nJfX9P07P/P7Zz7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=GiCRq9oiIUoYtaK/RUZid1gDex+gXMLXotTaeNIUmiA=;
        b=Qt1EhPmx3J1N974dD7tGs/V8VTwoatAeQ7NEPwnJ8JNASMtn8XTkrbdCRRSzWJUT0A
         Spwo/uDLSu0XdanvsJpZLh2/voi3dsstwQblE/9y7delWjpvA7ZmqC6qp0vP2b5fDVv+
         fbXLOTIh0F1d3HaT3e0Npoc2ks1DMyuGKK58xZ1LOOimTln4qpl34IWn5vi8TguUbs3C
         kNf61zy0u8aS3lbrK+Km+X5gq4MC66a1DoECFVWeM2ETDmGBCivfocMDRH5WVmqi5VDP
         wCSqUjFJIXL7x1Fse45bFOqBQeuHEltxeRTArwyePLyBU4iCLlPw+tTeHiGScs/Mp050
         +/Tw==
X-Gm-Message-State: AOAM5337ocxbDcHF5SiHa8qkMTTKshs0dVHK0Q5fphZmcfV/NjvATPfK
        ny+Exh0Xpx73zi674ghEcVQfZw==
X-Google-Smtp-Source: ABdhPJzwYtfos5qmwNgPH3qxN41P8KJZR3M++G+4LLPpLcVuvruDMmm0ZBtRneBZ640axXBl0KJ93g==
X-Received: by 2002:a5d:6948:: with SMTP id r8mr15347886wrw.136.1628576847772;
        Mon, 09 Aug 2021 23:27:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g16sm26620083wro.63.2021.08.09.23.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 23:27:27 -0700 (PDT)
Date:   Tue, 10 Aug 2021 08:27:25 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Matt Roper <matthew.d.roper@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the
 drm-intel tree
Message-ID: <YRIcTTsEF0Kg7F8K@phenom.ffwll.local>
Mail-Followup-To: Matt Roper <matthew.d.roper@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210715141854.1ad4a956@canb.auug.org.au>
 <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
 <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
 <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 09, 2021 at 09:19:39AM -0700, Matt Roper wrote:
> On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
> > On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> > > Hi Matt,
> > > 
> > > Always use the dim tooling when applying patches, it will do the right
> > > thing with regards to adding the S-o-b.
> > 
> > fd.o server rejects any pushes that haven't been done by dim, so how did
> > this get through?
> 
> I definitely used dim for all of these patches, but I'm not sure how I
> lost my s-o-b on this one.  Maybe when I edited the commit message after
> 'dim extract-tags' I accidentally deleted an extra line when I removed
> the extract-tags marker?  It's the only patch where the line is missing,
> so it's almost certainly human error on my part rather than something
> dim did wrong.

Yeah that's an expected failure model, and dim is supposed to catch that
by rechecking for sobs when you push. See dim_push_branch ->
checkpatch_commit_push_range in dim. So you can hand-edit stuff however
you want, dim /should/ catch it when pushing. That it didn't is kinda
confusing and I'd like to know why that slipped through.

> > Matt, can you pls figure out and type up the patch to
> > plug that hole?
> 
> Are you referring to a patch for dim here?  The i915 patch has already
> landed, so we can't change its commit message now.

Yeah dim, not drm-intel, that can't be fixed anymore because it's all
baked in.
-Daniel

> 
> 
> Matt
> 
> > 
> > Thanks, Daniel
> > 
> > > 
> > > Regards, Joonas
> > > 
> > > Quoting Stephen Rothwell (2021-07-15 07:18:54)
> > > > Hi all,
> > > > 
> > > > Commit
> > > > 
> > > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> > > > 
> > > > is missing a Signed-off-by from its committer.
> > > > 
> > > > -- 
> > > > Cheers,
> > > > Stephen Rothwell
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
