Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457A11B7127
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 11:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgDXJqQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 05:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgDXJqQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 05:46:16 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745C2C09B045;
        Fri, 24 Apr 2020 02:46:16 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 18so4548303pfx.6;
        Fri, 24 Apr 2020 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ExKZcNy4UT9MAfzU9W5gIALpzWpye1YJM4TUcHlXCDo=;
        b=f496t3LkG/23Ta6UCBN0L5jMBPEmEpxCFIGznyl6mUHfmvl/Rf4p3CAHdRqEyUuNQj
         PG1zA+MOaO+V3N76MPxU53QIkYlDgP0dyqhVhiVTA/LJFwYhv5SHXhf8FnySPkcLSPHo
         ABfKzWEqLqhczhuoS4Py1ScTegygLMTtlh9C2mIfvHqBPovUoaM2OUNFiRsC37wt6cZ4
         3QCFAlAUX/mk15fRBVyiWLKaU1O2A8WAWqcgaY9zM6iJatfPuUcUxmZWMq7AHx+CfCHc
         19vcLR6COIMJQuVYN6X081jQN8O6Ma63ps1MYxLY/qTyiHT7CwUg5QYdaOtPgN846arE
         TLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ExKZcNy4UT9MAfzU9W5gIALpzWpye1YJM4TUcHlXCDo=;
        b=FPpKj9b6wkd+moks2Sknr+/zulGsZNyFJ2OjtEvHqk/2CQQ6POPUPZOZWa0ndGVCSS
         N15QegmovGBL1VfLCpl+yLqLQ4DP1Ukqm5ns43RTZLJZE0+HsSd4OQyHvnSmAMxNbrlx
         aa0UYXj2MHzJlCpBUqLd/fSkWnjCjH9mDkP2CC8gCPByxYSODxL7XvbiFoK6nrkt1zey
         Lv5vkYwWNPpI0rvffWF4mivR7e9wE+w0CpvzJAb/7VV8rS1CeQVM2nbQJiO5B5JASGnM
         KSq+OfD1/V9kthK20tZ54IBRXwxEN4/GBwCenV31HwFKiUyKnyXGrNefjh21vj3ULICk
         9T2Q==
X-Gm-Message-State: AGi0PuagucyOm8/F9fVaCU2tU0gYdibM8RlKK4UDhNJSLOmBRMJUP5Q4
        d6pxdPKyjqsqGgW14bSLFEOxOchWKitOCqwn1bc=
X-Google-Smtp-Source: APiQypKPRijoqzvaLFgVOo1jcs0yYSDYq7L2KiLh6fYX3N9Q0RVZ0J5xQ+CWRUf/6fnbYxSqRWSGBshLvTa+tAwTu/Y=
X-Received: by 2002:a62:f908:: with SMTP id o8mr8528896pfh.170.1587721575071;
 Fri, 24 Apr 2020 02:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200424085315.36876e01@canb.auug.org.au>
In-Reply-To: <20200424085315.36876e01@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Apr 2020 12:46:08 +0300
Message-ID: <CAHp75VcHHQgt-vfGSnxBbHbRvH+zoXeMXkv8GKJNb-uJR+VJbQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Darren Hart <dvhart@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Archana Patni <archana.patni@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 24, 2020 at 1:53 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   92f62e696851 ("platform/x86: intel_pmc_core: Change Jasper Lake S0ix debug reg map back to ICL")
>
> Fixes tag
>
>   Fixes: 16292bed9c ("platform/x86: intel_pmc_core: Add Atom based Jasper Lake (JSL) platform support")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks, fixed now!

-- 
With Best Regards,
Andy Shevchenko
