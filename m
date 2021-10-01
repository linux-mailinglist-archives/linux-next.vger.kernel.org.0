Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4057341ED31
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 14:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354292AbhJAMRN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 08:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhJAMRM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 08:17:12 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF61C061775;
        Fri,  1 Oct 2021 05:15:26 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id x124so11163576oix.9;
        Fri, 01 Oct 2021 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=TjUVHTJjAzGJMmv8jrIbahfJghLiBpbmkBoQ41RcfXk=;
        b=cIk8P8Q5SliLeEO+YVlkoDVHv0nUGkSMFLyyfRIZtICkdHP6VEX47pgNk6fJWCzRVn
         f3ZhDOPQp+B8/WFdxqxJV9kmlSFkmjvxqmwh33tAylTndgz6DWXdAx6CzAfW82auoe7h
         AJp+XR6TShc27ZABZsc7tena62g1rEwcOFFPVszrY85DuyMrHWxUDd+ug/qFVcCc1OyF
         3PitOdY7PAhRQUJVc8+p9uJxTEWnzwyNYMgufdpZ4DgZiq0GeGx5vLQSHC23Js+3CKtB
         3B1nP8nGLduT81FrJ3qYSOORY6lfkIXPV4URDSG34TQSDVGeSogdfdmlOkLSJWfgbnK2
         qBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=TjUVHTJjAzGJMmv8jrIbahfJghLiBpbmkBoQ41RcfXk=;
        b=GuR7LBK+zTfdkVzXoct8xUHCAiWh1vvdajR3HTzQyFb3r4wXuGF765c/hcjIw7F+U9
         VayU8rG3V9DuVQjfWV9HjbKEFhG000yWFgxy11044hpmMe3DfNt0AdHtU7rKx+j+MxHc
         g9sSQbTgEao8aQZLagQF7s9fyTZv4EkY1aP0Ldf6K4ySP9d2hw1keF6p1JCMVX5ajQxT
         Q4mMHwFAkp/F25k+3bsPH+nhNahwNrva42si0TVpDPirHQZ+8HzEVzo9/gvEUj0g4cxJ
         BB/gSc/rgIOfrQ2YPUq+MKCBnFfSuDJ9S3eN4GZBzyaa1bt3DwSshyB7Ybp9WnGimP+V
         wdkQ==
X-Gm-Message-State: AOAM532bmUU3S5eTy7FTRa/eThIxI0a1Gui6TpCEbaIJOSdNFP0HUn2X
        6ddftiw62FO/CX/PRXgTLL3Lcf4hpw==
X-Google-Smtp-Source: ABdhPJwlRTl/hZyr75BIi48UKqOsdWLpP2HpniDc44cZAoz2jDLHrGqStrVC1OLRZSqx1yZVxr3vMQ==
X-Received: by 2002:a05:6808:17a4:: with SMTP id bg36mr3729514oib.49.1633090525804;
        Fri, 01 Oct 2021 05:15:25 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id k3sm243224otn.16.2021.10.01.05.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 05:15:23 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:dcd4:c733:b801:5a91])
        by serve.minyard.net (Postfix) with ESMTPSA id 3CA6E1800EF;
        Fri,  1 Oct 2021 12:15:22 +0000 (UTC)
Date:   Fri, 1 Oct 2021 07:15:21 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Corey Minyard <cminyard@mvista.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ipmi tree
Message-ID: <20211001121521.GP5419@minyard.net>
Reply-To: minyard@acm.org
References: <20211001125248.30adbdf3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001125248.30adbdf3@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 01, 2021 at 12:52:48PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the ipmi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/char/ipmi/ipmi_msghandler.c: In function 'bmc_device_id_handler':
> drivers/char/ipmi/ipmi_msghandler.c:2376:3: error: label 'out' used but not defined
>  2376 |   goto out;
>       |   ^~~~

I botched a cherry pick, it should be fixed now.  Sorry about that.

Thanks for the work you do.

-corey

> 
> Caused by commit
> 
>   2d7a6d8467f9 ("ipmi: Check error code before processing BMC response")
> 
> I have used the ipmi tree from next-20210930 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


