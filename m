Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A8533EB0C
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 09:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhCQIGX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 04:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbhCQIGM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 04:06:12 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D192C06174A;
        Wed, 17 Mar 2021 01:05:58 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so4908337pjb.0;
        Wed, 17 Mar 2021 01:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ss75TIumqDPMeNHZ5WT61drGkRFSqdjxFvxpRIvRpAw=;
        b=sriJy73Mhxxe8AcU7mojGw36Y2KgO/wmFaVqjVphOyZnyS4fUl/IbwEaOKFmz4bVPH
         zdnazhoR1N+B2fSM6/SvbDn8EY7EuR7nM0iFNv9RJ/Dw/XShGQE+Nbz1H6dH8o74OhSP
         1R/V6aPAJHG2jmFjQjX4zn4m8INowjRfCFC/EtyAcwPDlOQSOh9CaSra8i0etXPnxy9b
         zUVJgvfLQMu0g2M6eOxLFjJVZkQALje51PsM84wHeAg2780mUZjJwuFoC2jtWM/00jnr
         wUu7uP4JFho8VEan84rFAF7Sfqow50Hi0d8KhOV+PLzLW7l0DeuRiqgctlyquVcto4qB
         CxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ss75TIumqDPMeNHZ5WT61drGkRFSqdjxFvxpRIvRpAw=;
        b=Iob2puVwQOxmhACWAPZNoPRbpB18ldZfWM47Z+Vo+30jR8QULNfI5gjek0SrJJhyKR
         kUMW8KKhn+hUtzupgaNR3FAkmTJ01F5EeUF6FzVw7vCAoqy4PZXOKfecPnmawaDuMKJ0
         0cl4zT+cSE7+Glz8mhkAv/c1/aIACxL7AEJoQmvvzIQAGKbUg6t3gVE1vtZ3VGwdPFSH
         AwtYPyEhszKFePDwSLkh6oGfWLJ1qVmw57P8XUAwMOnrBe8xrDspBk801ZHtesd6nfCa
         qMwilqQnkqQE/el1satTtHpybgl8NXIH4PM/eis2SbcMVGf/U5XvjmTfbx8/YX/QYfwA
         wClA==
X-Gm-Message-State: AOAM530d1IyBWhoPys+bUON3RrIe+iNPNbNQU8hRN429fEX5h84WR006
        8PfZQYh0jvN+0UbrugWR2Ac=
X-Google-Smtp-Source: ABdhPJwlBmAW+1xdFK0gLkeJA5pr9AyDal62ZflETkJmd2W5IXa/zYn4aj4PFFC3gn599f9m9a448g==
X-Received: by 2002:a17:90b:1490:: with SMTP id js16mr3173605pjb.131.1615968357965;
        Wed, 17 Mar 2021 01:05:57 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b48f:f050:bdc5:eb89])
        by smtp.gmail.com with ESMTPSA id c25sm17729698pfo.101.2021.03.17.01.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 01:05:57 -0700 (PDT)
Date:   Wed, 17 Mar 2021 17:05:52 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steve French <smfrench@gmail.com>,
        Steve French <stfrench@microsoft.com>,
        Hyunchul Lee <hyc.lee@gmail.com>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cifsd tree
Message-ID: <YFG4YHFmBfFzu+MR@google.com>
References: <20210317185304.6b92290c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317185304.6b92290c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (21/03/17 18:53), Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cifsd tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> ld: fs/cifsd/misc.o:(.opd+0xc0): multiple definition of `extract_sharename'; fs/cifs/unc.o:(.opd+0x18): first defined here
> ld: fs/cifsd/misc.o: in function `.extract_sharename':
> misc.c:(.text.extract_sharename+0x0): multiple definition of `.extract_sharename'; fs/cifs/unc.o:unc.c:(.text.extract_sharename+0x0): first defined here
> 
> Caused by commit
> 
>   cabcebc31de4 ("cifsd: introduce SMB3 kernel server")
> 
> I applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Mar 2021 18:35:55 +1100
> Subject: [PATCH] cifsd: uniquify extract_sharename()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks!
