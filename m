Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6D41A9240
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 07:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389802AbgDOFE0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 01:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389472AbgDOFEY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2020 01:04:24 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031F0C061A0C
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 22:04:23 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id cl8so5090453pjb.3
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gsvhzAYTICdpnZMJaCTeJO6AmyzT9TU4Pb3xpqq5oiM=;
        b=PxULmgnqNny6YFWfOOUOVtVrHM9RjGJGFlDy2Xftlow9qvdiStdegCV5pmbe9/OBsm
         FY8LhhybDngKpozgzCwPmhRpeH8AsXmDy0iBWKnxif9GErLA/0fN4KK6jLOyNqEty1Bt
         P4JHnD4wn0Let8iytBk+JGgQiHlP0StMJi2gxac8J4wipqNNh+l22rMK3Ebhk8h99rKA
         wC5qzTTJLeRabr7k9C2MuUwhsb+ntMbkoRa+HZfOp1X4l54jeJPFhxsaZzyax32WpWgk
         JPn4kEgZZaYLs6qvYIGGeJf8nAPoGFOW8oUd65EcYsN1AUpcDmS/9SL7/wREVOVWzblB
         IfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gsvhzAYTICdpnZMJaCTeJO6AmyzT9TU4Pb3xpqq5oiM=;
        b=htfXEYhxRdf9qKNvvfQNs404U8CokzOzi2TU/nnU+x98lDpwTMrYEPl1R5MCqqP4Bl
         ne4fJEPkTBv+fYZ0ehINdRF+ic6U2oCAmIk2/IqvMEGLSFkyeZNwExpxv9l7GYFSr2yo
         etOSkmHsUwCtnGLfrBpi4agY3CNHZw0b39A6s0Qf8uFSFD1zhMgQXZ6utILcj/1B6Rn9
         0jK336fZ1hno7ICBe4APr13Bh9Y2PYQ2bUy+7L2M6xiyrihp4ctPxK8e0unYI5/l9b0w
         kLAdSrIe1oUIOyCn6m8aPmSbqlNG0GHxS8yMZJbNwFHS0wGpe6040sa4A6PbBSkFP6Zs
         l5gQ==
X-Gm-Message-State: AGi0PuYTIB3X6CQNGEmmIdXlU6NLt8nyTMn3g/Rj3t1dqUWhtPEiAtXv
        KxRFhL3RmK+WkHOsk2/0HYeCLg==
X-Google-Smtp-Source: APiQypLHT3hqd2R5xgQm+zhqokQokSCVxtF2OYRc67SBIEoGnMYtLF8ewhBgG/9b8oC8YYprDgLO0A==
X-Received: by 2002:a17:90a:f0d4:: with SMTP id fa20mr4267514pjb.108.1586927063249;
        Tue, 14 Apr 2020 22:04:23 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n21sm11312923pgd.93.2020.04.14.22.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 22:04:22 -0700 (PDT)
Date:   Tue, 14 Apr 2020 22:04:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the qcom tree
Message-ID: <20200415050420.GA987656@yoga>
References: <20200415102534.6d22a377@canb.auug.org.au>
 <158692631073.105027.12648118734810371009@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158692631073.105027.12648118734810371009@swboyd.mtv.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 14 Apr 21:51 PDT 2020, Stephen Boyd wrote:

> Quoting Stephen Rothwell (2020-04-14 17:25:34)
> > Hi all,
> > 
> > After merging the qcom tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > drivers/soc/qcom/cmd-db.c: In function 'cmd_db_debugfs_dump':
> > drivers/soc/qcom/cmd-db.c:281:30: warning: field width specifier '*' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
> >   281 |    seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
> >       |                             ~^~
> >       |                              |
> >       |                              int
> >   282 |        sizeof(ent->id), ent->id);
> >       |        ~~~~~~~~~~~~~~~        
> >       |        |
> >       |        long unsigned int
> > 
> > Introduced by commit
> > 
> >   d6815c5c43d4 ("soc: qcom: cmd-db: Add debugfs dumping file")
> 
> Thanks. I didn't notice this warning. Looks like we need to cast
> sizeof() to int? Bjorn do you want another patch or does this get
> squashed in?
> 

It's in the middle of the patch stack, so I would prefer an additional
patch.

Regards,
Bjorn

> ---8<----
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index 6c308f92a13c..6b5c440c9dc3 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -280,7 +280,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
>  		ent = rsc_to_entry_header(rsc);
>  		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
>  			seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
> -				   sizeof(ent->id), ent->id);
> +				   (int)sizeof(ent->id), ent->id);
>  
>  			len = le16_to_cpu(ent->len);
>  			if (len) {
