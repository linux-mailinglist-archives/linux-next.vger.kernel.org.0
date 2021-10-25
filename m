Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C2B43A423
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 22:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbhJYUOE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 16:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237788AbhJYUOA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 16:14:00 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28FA4C01F011
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 12:34:56 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id k26so11730811pfi.5
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 12:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l8WxBeCFZH+Iuh9HDEMAn37CAK7cN9j7UfAo07bKu44=;
        b=jqPZCT5CvMMGK6LDj1Fyb7dJMzzqPfpTXJuT9UrndtHzLKEg6y6JuXA2eBcSCYJ1zN
         Zi/Je+RDmbtgL7r0t6mPmOzCxUpzfnPizmiL8Nt+B1K1zEPbjqRZMf/P1phLat0OtDe4
         /ldHfHfXbJWxG4aA/3aZ8l9LQfkFYfIA+vhwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l8WxBeCFZH+Iuh9HDEMAn37CAK7cN9j7UfAo07bKu44=;
        b=wcJHJwDGG8vbZaWz5+DafILoPPzEcaxbNsvXyZAGdGpbeulZl8iOgRkBuwoktbUVuN
         ovOobHAClSWeTsED+si7yOwgXFY039J+nJ4V1E/sPXKUc9yPxb5eYP/S4SyIGkbajCSN
         /Dmdfp4rbYE4X36Z8aF5q/xoVFAWjMbktLdafpWJnT/f7w0cnQYX3CZTKdfRpBEUkzFe
         hYfIQP6a0QE367/5sGyKsfbOJqOU9bhpo7YYbONHmDzVy7AnovV9nxh8+u10fLTFNKma
         dOJWhLGFbhilF0ABZBOW9styxOPQhVc6uzsc6aeODbVmWom+FAHXkAOLz0CLo3UUZWMv
         wSWA==
X-Gm-Message-State: AOAM531z/LRex/ng4GBUpZYKsjO55pmvOtwrt5YUx7BM49j1FBxW+7Jq
        jM30Wynin1KJlbYkETCyJxve/g==
X-Google-Smtp-Source: ABdhPJzF5BYIbx1+bxGMKku0BRAxWgvUsywqYxj2gG3QBFB15hqiC7/jsWrrLF/xsWLKUGUzeSyuEQ==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr15284714pgh.190.1635190495719;
        Mon, 25 Oct 2021 12:34:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w17sm13784510pfu.166.2021.10.25.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 12:34:55 -0700 (PDT)
Date:   Mon, 25 Oct 2021 12:34:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <202110251234.0242EDDDC@keescook>
References: <20211018193048.14517460@canb.auug.org.au>
 <20211025125534.4681416a@canb.auug.org.au>
 <202110251218.EAB410DC22@keescook>
 <20211025193102.GA1436536@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025193102.GA1436536@embeddedor>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 25, 2021 at 02:31:02PM -0500, Gustavo A. R. Silva wrote:
> On Mon, Oct 25, 2021 at 12:19:15PM -0700, Kees Cook wrote:
> > On Mon, Oct 25, 2021 at 12:55:34PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > On Mon, 18 Oct 2021 19:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > Hi all,
> > > > 
> > > > After merging the kspp-gustavo tree, today's linux-next build (sparc64
> > > > defconfig) failed like this:
> > > > 
> > > > sparc64-linux-gcc: error: unrecognized command line option '-Wcast-function-type'; did you mean '-Wbad-function-cast'?
> > > > 
> > > > $ sparc64-linux-gcc --version
> > > > sparc64-linux-gcc (Custom f51944395b6aa154) 7.3.1 20180130
> > > > 
> > > > Caused by commit
> > > > 
> > > >   21078041965e ("Makefile: Enable -Wcast-function-type")
> > > > 
> > > > I have reverted that commit for today.
> > > 
> > > I am still reverting that commit ...
> > 
> > Gustavo, can you please switch this to using cc-option?
> 
> Yeah; I actually removed all the patches related to -Wcast-function-type
> from my -next branch a few minutes ago:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/kspp
> 
> I'm currently working on resolving all these conflicts in a separate branch
> before merging them again in my -next tree.

Great; that sounds ideal. :) Thank you!

-Kees

-- 
Kees Cook
