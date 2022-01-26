Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E167B49C202
	for <lists+linux-next@lfdr.de>; Wed, 26 Jan 2022 04:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237038AbiAZDSz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 22:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbiAZDSy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jan 2022 22:18:54 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2A0C06161C
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 19:18:54 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so4870247pjb.1
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 19:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ms93Tf5+B1g1bkXUooNpnBjjRbW/hUxGhOgw4jO0/o0=;
        b=cb2GBvpT9QSp/lfwe4USjmLrgGBlf6OaZVZjb3jPCbvrOTY3MN6FfrYSvCT8Bvkr79
         lpHdwKuxQoooo3vy/6+7ocZME+hBoPeQQgvrzGmhx3i+ISXSSOYy0JFuMMtRU2G0UiGO
         f71G5mtOHdg0snY9tdfuxOs7/vQjtydHqE24Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ms93Tf5+B1g1bkXUooNpnBjjRbW/hUxGhOgw4jO0/o0=;
        b=gy9++EkFT+6tG8KDX7AbeLLdbrrbVAagYCUhGbXVVUhtJvzVjjtoysiwzghtptd7y9
         Upg60fHMRS1TBJnGUERumc903PZz1UQ4kv2HDdyj7vgSnV9GSvB4Sd6xC18qb6cMdoGo
         YessBxJnjRHeXFIeWafAcY2G0bKLyxKljxECel5fHc6kYpDuD0o0n9zCzeAZBEiFzB7y
         hW9XECgMv2KBH5JQ5P6/HH3Wjyexw6pzhHQ2dbmUVE+pZNhsHUFMrory0j6/NI9mPgDw
         5QmLvk87UOrScVafHZNnkqmDM/84zMPEisqDEfUSbIY/lccpEIwBpGMVoyvvydbXr8vd
         I8hA==
X-Gm-Message-State: AOAM533KGhwXrfMev57Wkw40Wp2D/1YhJAkRMf1s8HiYy6nOZkLgGudA
        Ok1ey/uVCPkGtyPwD6JkVYYSG3ojNPDaeA==
X-Google-Smtp-Source: ABdhPJypF8yyN/J8h6AC4bMd7Z0bQIlCgxeESRc5f2MsbX0nCbQ1RbZZEDaV3xOEfNN2tWUwvmkAwg==
X-Received: by 2002:a17:903:41c9:b0:14b:54e6:c6b7 with SMTP id u9-20020a17090341c900b0014b54e6c6b7mr11297322ple.36.1643167134144;
        Tue, 25 Jan 2022 19:18:54 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c2sm16001201pgi.55.2022.01.25.19.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 19:18:53 -0800 (PST)
Date:   Tue, 25 Jan 2022 19:18:53 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Beau Belgrave <beaub@linux.microsoft.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202201251917.18361B4F6@keescook>
References: <202201242230.C54A6BCDFE@keescook>
 <20220125222732.98ce2e445726e773f40e122e@kernel.org>
 <20220125233154.dac280ed36944c0c2fe6f3ac@kernel.org>
 <202201251256.CCCBE9851E@keescook>
 <20220125162326.3d1ca960@gandalf.local.home>
 <20220125162859.2b3cc8a0@gandalf.local.home>
 <202201251402.0FB08DB@keescook>
 <20220125172114.6807ed8f@gandalf.local.home>
 <20220126093538.893fb44a7cb0a7cd840c7fdb@kernel.org>
 <20220125201634.698cc777@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125201634.698cc777@gandalf.local.home>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 25, 2022 at 08:16:34PM -0500, Steven Rostedt wrote:
> On Wed, 26 Jan 2022 09:35:38 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > I think Kees' idea seems better. If you and Beau are good, I will update
> > the macros for __rel_loc. (This requires to change some user-space
> > application which Beau is making too.)
> 
> If Beau is OK with it, I'm OK with it too. I need to release a new version
> of libtraceevent anyway, and I can make the update for that too.
> 
> Who's adding the patch (if Beau says it's OK), you or Kees?

I don't know anything about libtraceevent, so hopefully not me! :) The
patches Masami and I already sent fix the warning, so I leave it you
y'all to decide if you want to make the internals a bit simpler.

-- 
Kees Cook
