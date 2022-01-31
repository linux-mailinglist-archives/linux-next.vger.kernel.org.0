Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568BC4A3D91
	for <lists+linux-next@lfdr.de>; Mon, 31 Jan 2022 07:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235253AbiAaGTW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jan 2022 01:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbiAaGTV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jan 2022 01:19:21 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F5FC061714
        for <linux-next@vger.kernel.org>; Sun, 30 Jan 2022 22:19:21 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id l13so2881990plg.9
        for <linux-next@vger.kernel.org>; Sun, 30 Jan 2022 22:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RWO002SpFOd8uawnx2ITIWsWY5Ybr4ZPMY6ndLr8PcI=;
        b=MT6bztnDkA7L14dyGihT+ldI3f1g0uJWTia61QuIISZX6y3AkQ3aBfoNJZqDiXW0fK
         zX7a8bAzW0zfygJqbUkkBsYW+9CCV6vsbzUrsW5MfjdsunoudNsZmmaN55pU8i0rjqyF
         NZbf5/2nd4WgI00EcN5TfV/hJzYj5ioDnqdC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RWO002SpFOd8uawnx2ITIWsWY5Ybr4ZPMY6ndLr8PcI=;
        b=zSAC0M3N1Mws+VqHloEzXK/SpD33TqB2CHVv3dFujkRrmwPS3cvaqU2DdXJmjNfWI9
         2P8DqdeCBeP5zxJj/iEon/y1jGcBHKDJ1zmIWVTAODwW2NMWnnnAfP7QC4qVvfYtqbM1
         14I8EgP6kLqe4+d26fTxrMLeyAWXCOcxeTllb0AbQI1kRUwbRec5a0nSghi56ChSFpPN
         H0jEO9SgQuTifoE9l+ZE/Uqv+1dMZ9wZVNJCxixEqvzCULJGam3Syb6Pi/wW5RrrG0r5
         ECfDe2Na6olhc0YcT6YCbnrHl0+CHmi26TNpTWdMEvfUMnJMhN6k/sVx+gRN4hJFGR7M
         4ygg==
X-Gm-Message-State: AOAM53070hxGRb2Ycmno/OKyfHaiQ/cQgMnyrOyhXB2MzCdnQHC3ETqJ
        5SWeAqAfHw9bqYNvzw7glnWr7Q==
X-Google-Smtp-Source: ABdhPJx8uGhOx1N/0k+W4QxJSBGwbWBu/Qs5b8SdFyJXSSt1A+89LnUjeSPlLcDKWbauV7DQrWwWqQ==
X-Received: by 2002:a17:90b:1bc9:: with SMTP id oa9mr22590195pjb.217.1643609961066;
        Sun, 30 Jan 2022 22:19:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f9sm27092957pgf.94.2022.01.30.22.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 22:19:20 -0800 (PST)
Date:   Sun, 30 Jan 2022 22:19:19 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Leon Romanovsky <leon@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202201302216.97F2691@keescook>
References: <20220131100954.74a2034f@canb.auug.org.au>
 <202201302002.41A8DDA2@keescook>
 <20220131155932.3f88ec71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131155932.3f88ec71@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 31, 2022 at 03:59:32PM +1100, Stephen Rothwell wrote:
> On Sun, 30 Jan 2022 20:04:00 -0800 Kees Cook <keescook@chromium.org> wrote:
> >
> > This should be fixed by:
> > https://lore.kernel.org/linux-hardening/20220124172242.2410996-1-keescook@chromium.org/
> > (I was expecting this to be in netdev by now.)
> > 
> > This should be fixed in:
> > https://lore.kernel.org/linux-hardening/20220124172028.2410761-1-keescook@chromium.org/
> > (Again, this was expected to be in netdev by now.)
> > 
> 
> yeah, neither has made it yet.  However, it would not have helped as I
> am merging the kspp tree very early so that new bugs get fixed in the
> trees that introduce them.  These 2 are in Linus tree (for a long time)
> and so it would be better if these fixes went int the net tree and then
> Linus' tree as bug fixes.

Okay, understood. I'll leave them in my tree until I see them duplicated
in their respective trees (or in Linus's tree).

> I will use these in the merge of the kspp tree from tomorrow until they
> appear earlier (or you could put them back in your tree).  Cross tree
> dependencies are a pain :-(   BTW Linus would have the same problem I
> am having if he merges your tree during the merge window before he
> merges the net-next tree ...

Yeah, I'm used to going "late" in the -rc1 from these kinds of things. :)

Thanks!

-- 
Kees Cook
