Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973F849BAB2
	for <lists+linux-next@lfdr.de>; Tue, 25 Jan 2022 18:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242962AbiAYRzK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 12:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379766AbiAYRyQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jan 2022 12:54:16 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198FFC061748
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 09:54:16 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id g9-20020a17090a67c900b001b4f1d71e4fso3550996pjm.4
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 09:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aIV6eSMSODWibmjbStB+qKd/AvnMQkOZd3vv2gOpFy0=;
        b=ll5W9H/HRJqzopdwRXtU8gikl/FzPb+JXHP6WmoFVz4eH+wYbfNK3NFW0z7VTdIBq9
         EJVs1deIsktmrWw9xQmoZgXGVfzBPaQ2A0sZlswVlxRAEb2HScQTId1k4gUcewwFOebp
         zNAvgfpHfR/qQKwfpLwRVCFbIv2I5VP3Q5RG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aIV6eSMSODWibmjbStB+qKd/AvnMQkOZd3vv2gOpFy0=;
        b=sEX7Vb36+LT0gc4zf+TnTjb6umxJu7i2g+ItwG0KzGFWWRt7mwTv209tDeViWipgno
         jbV1YWxXJXZQJw5RBYNF0jc0zl4g7n/ACTdDBCIAgxPvam17Y5B6IyQKWdM8ox2wexJ0
         HadElSz94YF+AYpj9vy6XFtp5fsa8Uzi7Ye5TIHdnuhPBkNYTB3QATkN8YpJojw0cEwV
         cR9P0p5F7U90KSoFC2WPFCd4gQatRLVl0Ttnw516hfFXHT1U//wTisfQOlJbPrp6I15r
         bUS44TbrERpFZk9wJ4ovxDFHfNmvzwTFsAET1rW4hpw4cI7dqo99nAlMrONPF1qQ45vM
         Vkhg==
X-Gm-Message-State: AOAM531M8ob8sd01ovlDftctgX5FDk8wa3Mp9UpjnrZqAHmnjUrgseAh
        mBJ0YWImqP8f/YdVHorCwcAYYciMMr8CCQ==
X-Google-Smtp-Source: ABdhPJzyT4Nwg0+TTagvzVcv7RVSYSao1rl+8zt3eBqdMaUdgBlFntA35C+9SFj740GOzoDpEiJr4Q==
X-Received: by 2002:a17:90a:f283:: with SMTP id fs3mr4595049pjb.173.1643133255559;
        Tue, 25 Jan 2022 09:54:15 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 13sm19569673pfm.161.2022.01.25.09.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:54:15 -0800 (PST)
Date:   Tue, 25 Jan 2022 09:54:14 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202201250953.3F4D0499@keescook>
References: <20220125145006.677e3709@canb.auug.org.au>
 <202201242230.C54A6BCDFE@keescook>
 <20220125222732.98ce2e445726e773f40e122e@kernel.org>
 <20220125233154.dac280ed36944c0c2fe6f3ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125233154.dac280ed36944c0c2fe6f3ac@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 25, 2022 at 11:31:54PM +0900, Masami Hiramatsu wrote:
> On Tue, 25 Jan 2022 22:27:32 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > > /*
> > >  * struct trace_event_data_offsets_<call> {
> > >  *      u32                             <item1>;
> > >  *      u32                             <item2>;
> > >  *      [...]
> > >  * };
> > >  *
> > >  * The __dynamic_array() macro will create each u32 <item>, this is
> > >  * to keep the offset of each array from the beginning of the event.
> > >  * The size of an array is also encoded, in the higher 16 bits of
> > >  * <item>.
> > >  */
> > > 
> > > So, I think -Warray-bounds is refusing to see the destination as
> > > anything except a u32, but being accessed at 4 (sizeof(u32)) + 8
> > > (address && 0xffff) (?)
> > 
> > Ah, I got it. Yes, that's right. __data_loc() will access the data
> > from the __entry, but the __rel_loc() points the same address from
> > the encoded field ("__rel_loc_foo" in this case) itself.
> > This is introduced for the user application event, which doesn't
> > know the actual __entry size because the __entry includes some
> > kernel internal defined fields.
> > 
> > > But if this is true, I would imagine there would be plenty of other
> > > warnings? I'm currently stumped.
> > 
> > That is because __rel_loc is used only in the sample code in the kernel
> > for testing. Other use-cases comes from user-space.
> > Hmm, can we skip this boundary check for this example?
> 
> If the -Warray-bounds determines the destination array size from
> the type of given pointer, we can just change the macro as below;
> 
> #define __get_rel_dynamic_array(field) 
> 			((void *)__entry +                                 \
> 			 offsetof(typeof(*__entry), __rel_loc_##field) +   \
> 			 sizeof(__entry->__rel_loc_##field) +              \
> 			 (__entry->__rel_loc_##field & 0xffff))
> 
> This must works same as __get_dynamic_array() macro.
> 
> Could you try this patch?

Thanks, I'll give this a spin. I need to reproduce sfr's warning first,
but now that I've fetched next-20220125, it should be easy. *famous last
words*

-- 
Kees Cook
