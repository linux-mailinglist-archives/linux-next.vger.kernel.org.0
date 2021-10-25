Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9ECC438D83
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 04:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhJYCkQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 22:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbhJYCkP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 22:40:15 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9C9C061745
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 19:37:54 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id v77so13591833oie.1
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 19:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IwN99OfY/bxm/QeMkx5/SdLoA3HcDZGPBi95jv3c8Qw=;
        b=LK4+jmghG0mSGT3l7Bg7yvtpwp1jedwLgp7SYckRy9VNcfROh6vKUBzNGeqdHtXkWP
         kCUIsJb4sdpbKF+9v5+2Yz4oruhHs9V5EHsyCrzEUPTucCtPZF/8aL4sqdgM78Z7lKj6
         91tQSpA6/R3SAqZfratxs/PNDQJNGyvy1hGr32jDDm6PwpujdfaTS6ODFA3htsbOM/3I
         FLbGKIqaaJoWJXBQO7Y22xvKljEvAYBmgYeyDqEPiZvXEncV/61xiqvMrTCDzeAa5ncI
         20QnGq1PkxBDULTEuNQxrhf9Z8rpyxVboElbafvEXTkPXlPbe1UF47a8Zxdksab/NWMT
         5bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IwN99OfY/bxm/QeMkx5/SdLoA3HcDZGPBi95jv3c8Qw=;
        b=IqpvM2YAeI/dvWZyZpkdCdMSCV4WiF9f+oIV6smch5pOsWf6pk4fxBOkCysBGoNgkm
         Q34vyloXwFsqqEziP+YfP41BAagmAM/VLzzSKaYAJ/XZXIILZhs0hVfhpsWPtO/VYltP
         KO1lOCgGoisDaZ8bjUHuY0UUZY7BLtdAk4muRMEtAG5fIgIW0SGg0zW37caeXFQlHaSI
         JrhpLMXfNBxxb8002rqoU/Obbj17yMScBPu1d98oZTbhwBhXlfzW33DeAYXK6oXITBeI
         lduBcaGO/NBbwDP/QYxiRzgl2TXePmYToSmHk7HruobJCrVvpRYgzOm080HV/fGuY4Um
         AzWg==
X-Gm-Message-State: AOAM532MYvjpC/z3b6wCLxGA1yzgEhcLlBdkP8ZlvG7dk++CyWZzvjrL
        NWGN0xZiRehOsxnX4cyzLvdhBA==
X-Google-Smtp-Source: ABdhPJwYcUSFkCXObXggQ5HmkUdSuJPtLFWzc/Xa7+X5NJ1hByMgjGcviCFAbBkFruYK87VP9dNjsA==
X-Received: by 2002:a05:6808:120e:: with SMTP id a14mr19694590oil.122.1635129473494;
        Sun, 24 Oct 2021 19:37:53 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:40c7:d4ff:fe65:a72c])
        by smtp.gmail.com with ESMTPSA id j8sm3424138otu.59.2021.10.24.19.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 19:37:53 -0700 (PDT)
Date:   Sun, 24 Oct 2021 21:37:51 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
Message-ID: <YXYYf9TveqwZRUNp@yoga>
References: <20211025104333.4a3dfb09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025104333.4a3dfb09@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun 24 Oct 18:43 CDT 2021, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the qcom tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/firmware/qcom_scm.c:20:10: fatal error: asm/smp_plat.h: No such file or directory
>    20 | #include <asm/smp_plat.h>
>       |          ^~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   55845f46df03 ("firmware: qcom: scm: Add support for MC boot address API")
> 

Thanks for the report Stephen, I will take a look at this.

> I have used the qcom tree from next-20211022 for today.
> 

Thanks,
Bjorn
