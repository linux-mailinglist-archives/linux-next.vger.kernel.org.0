Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA6D49BAA4
	for <lists+linux-next@lfdr.de>; Tue, 25 Jan 2022 18:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348467AbiAYRxn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 12:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243299AbiAYRxP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jan 2022 12:53:15 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1B0C06173B
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 09:53:14 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id h14so3224476plf.1
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 09:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TdEpPt26Kd5ANAoShc8sbb2YgnlITBWoslxb5vWIwEY=;
        b=YzgYg9UDALgHKyWstuZhVyuAwx51TXB1k3kl+r9JbhLEv9o5u0Znx7TJiFssZ5VvSH
         qa+/jjs1oRx5XNbHLM5RkVGqX3YfJ2qwlh6Cs+H+WP+GpCRVf2bI7P5k5g0xjwHPJ3U+
         tWtTDd8//8grF1A1PYoLrjaRlfST5DAEPJlmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TdEpPt26Kd5ANAoShc8sbb2YgnlITBWoslxb5vWIwEY=;
        b=UBKqZRSZf8IN58gvL/74tQfxlxZvb9qcdiVR6wU+J5Ljo0pAjCry6J0WQKmE/yKzcD
         Yo2vRylyOwO+tSyQuoUl8wSv0uBH/T3S9BR5qvDqb3BJV9znkxVMPlwzsAft0Gp78J3I
         bG+L6XMFugPOavnlaR7IME1w0UTwzsRaRpPywpMmz+rFXW0ZskalE5d3YqtbkroN/hUd
         S/I5LqrbjMOprmci3b+t0YW0mKJcwmNR0gHnpmnzOsKX0LlAgh3b/vgCP7PTEPw1OFPp
         tjh87ZiwuX3lxAsuJC1eJc5Fcg6tgqwi1JTFcAseHNkAraKktjane6Lnbubv0cA1ZE1Z
         1bVg==
X-Gm-Message-State: AOAM532EMqphFckN41si/JQ00CqtX/wTYHomQm9NC8VMssubNOsJj1xP
        6TJwakYibB3o27Nbsq5o86/KbA==
X-Google-Smtp-Source: ABdhPJwNGoJh0Y7zhQk0/VKPgKclIQQBKnQecn44cSa8KoSPv8nXiehDcI7fK/eKC+dpURSfjOIW/A==
X-Received: by 2002:a17:902:7143:b0:14a:62ed:c2a7 with SMTP id u3-20020a170902714300b0014a62edc2a7mr19990530plm.80.1643133194479;
        Tue, 25 Jan 2022 09:53:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p38sm14430104pgb.36.2022.01.25.09.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:53:14 -0800 (PST)
Date:   Tue, 25 Jan 2022 09:53:13 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202201250952.2C89D08@keescook>
References: <20220125145006.677e3709@canb.auug.org.au>
 <202201242230.C54A6BCDFE@keescook>
 <20220125222732.98ce2e445726e773f40e122e@kernel.org>
 <20220125090152.0c457aae@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125090152.0c457aae@gandalf.local.home>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 25, 2022 at 09:01:52AM -0500, Steven Rostedt wrote:
> On Tue, 25 Jan 2022 22:27:32 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > > But if this is true, I would imagine there would be plenty of other
> > > warnings? I'm currently stumped.  
> > 
> > That is because __rel_loc is used only in the sample code in the kernel
> > for testing. Other use-cases comes from user-space.
> > Hmm, can we skip this boundary check for this example?
> 
> Is this only checked when __CHECKER__ is defined? If so, would this work?

__CHECKER__ is only for sparse. This is from re-enabling -Warray-bounds
for gcc.

-- 
Kees Cook
