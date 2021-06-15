Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F873A841B
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 17:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhFOPjD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 11:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFOPjC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 11:39:02 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF03C061574
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 08:36:58 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id w31so9279267pga.6
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1DPucRFAeorZjnPTe1o61We/n0wdasm18ByDS7A0W6A=;
        b=CEHmIOod2G6jvGxHbD9CADgZUgOPqr/v4FCQIOGlubiU0GN1JkV3vR5dJyvlapKhkp
         9mCp24EqBHBYbvnTBCQhMZGFoTgSIZ+1nMdqxiBMJIg0JxI0592JRvoJ71k0tKyMkgYz
         7q9ePHJv00vsCUEDSPeEjWt7gL7xacWT1L4vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1DPucRFAeorZjnPTe1o61We/n0wdasm18ByDS7A0W6A=;
        b=hXuAC89lwp6ZTzt049gyb4x2Ep7OntUWkV9CMiwRjNl7GIbwbGFBjZXj5dRURXBNHJ
         w/LASRG4pAYlsoAZTzPJoOsPUK4s6a6jgYnGQI75LTGc+Daf5izzykeYJBpSHNKdonuk
         NtzH/8hHhlscTTYJDplDwwg0eC2Mwp5uqy1Clw0FPmBiUvZUbmNBvl+s7I1Cx/uSO7V0
         NkaKN3G08DvXkl9RTbUnIALw/ax9IF7cNkJWZ2WhvgIIermju1QV7Y6WwgokrwU+gQZn
         QrtzrQmBjunV75974MOLL7hzPpsqVemXPs5e/18yHpUEj6NBWp/mkwpXg7LszNagT2cS
         +Yeg==
X-Gm-Message-State: AOAM530z5z85/Y6WX+TS/IlpsYVz19HvmMzWyZ7VAbwOKscPJqB1Bnnw
        TcWEccPppMq+AjnBcmehXihlGg==
X-Google-Smtp-Source: ABdhPJzjtgmxbjTP794D3SrN3M/72ebuMs/8fNCvG8pAk8JDarCWD4hWeWsXcVrFUhejbrM4+bNpGQ==
X-Received: by 2002:a63:d45:: with SMTP id 5mr150540pgn.72.1623771418068;
        Tue, 15 Jun 2021 08:36:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u38sm5545858pgm.14.2021.06.15.08.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 08:36:57 -0700 (PDT)
Date:   Tue, 15 Jun 2021 08:36:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pstore tree
Message-ID: <202106150833.1F1D7E5A@keescook>
References: <20210615201516.56c760fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615201516.56c760fa@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 15, 2021 at 08:15:16PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pstore tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> fs/pstore/blk.c:1: warning: no structured comments found
> 
> Introduced by commit
> 
>   38c18fec13fb ("pstore/blk: Use the normal block device I/O path")
> 
> The last kernedoc comment in this file is removed by this commit.

I was briefly quite confused by this. I see now it's the
:internal: not the :export: use of blk.c. If it's possible to
improve this error report email with more details in the future,
that would be nice. For example, "blk.c:1" isn't helpful, but
"Documentation/admin-guide/pstore-blk.rst:230" would be. :)

I'll get this fixed up; thanks!

-Kees

-- 
Kees Cook
