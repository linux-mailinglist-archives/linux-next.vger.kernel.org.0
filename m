Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EE622FEDB
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 03:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgG1BXA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 21:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG1BXA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 21:23:00 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D989C061794;
        Mon, 27 Jul 2020 18:23:00 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so10985425pgf.0;
        Mon, 27 Jul 2020 18:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jGzRITWnnLVmrJ4L8IGgC61oBoAO/ViNb6Y3fK7a/wM=;
        b=q+Z190UC8aYsC6knnBXL/JC3AXJP1cutHbFkCohUdaIp8bO8lhmzJxhVmJzEbLg8tQ
         QQFw6Yb2cLaxe/VQE7SZn0yxS5p87IMoFZtjex8JqZBcA+Lc5H5LaAP4dhJ3Gzsy3KlO
         0yqLsHNYkqPK2V/EY77dqTmkiIvc9cU0JFQvthBxG3JyG+244z88yRuxlrTkX/20+SUx
         rpuVBoKmlyspm6jQx/YascK6F+fBN/7mUn7npiDnYcwA4d5Or2vOfhU9/pX0+Vc7G273
         D3aet+cP1ZFSWlsUW4xmmCrfpwvydhdUVSLVHR0qd7u9uFxXvlyIwJnk8uLql1U4Va5n
         ozbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jGzRITWnnLVmrJ4L8IGgC61oBoAO/ViNb6Y3fK7a/wM=;
        b=SXJpYFhcNZ2S6A1htpef/uJCKJRl4pbjn1hcH03+Tbc6anRUYjcSKsX6p3KJDOCcvo
         m6CXBZ0YYYLu+YqE+flBLyXSF+eEdHQF44anCohkFEqXLDaFHLtZCuegZrYz4wOMqnbn
         JEaUG6CawUXY4qd1OMW/FaF1Dq39FDQtQ/8Wu5g0Ix/ehb/9kKpI+f8k+GCPb2wyPlHq
         WiCU06DTmpUF7PXS/+ACFOA/Hc1Jy2DpgA0sid0SQ4NulbT4h49mtBXrJM7xCj+vKyXQ
         Kno38mJT6uhuJ4qHnqdfG7ZWpoCUcwwPNUiHmcbVt8NY+MAd49xsT1HPp2AGMAapE/eX
         xreA==
X-Gm-Message-State: AOAM532R5ysun6mUCL5o7zn/oKzk6TT6Y4pY/50z6MbMJFY4WCAqqrdt
        fKsTWxKia/Kur3T3LCFupDU=
X-Google-Smtp-Source: ABdhPJwj1JpuN7EtAiiRfk9N4l+GbcXt+wr++YyB8k0pSk2o5JjZDPpGnxPpQgdprVYLL38Lai8z3g==
X-Received: by 2002:a62:be04:: with SMTP id l4mr22396155pff.323.1595899379541;
        Mon, 27 Jul 2020 18:22:59 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id q16sm6048922pfg.153.2020.07.27.18.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 18:22:58 -0700 (PDT)
Date:   Tue, 28 Jul 2020 10:22:57 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     John Ogness <john.ogness@linutronix.de>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the printk tree
Message-ID: <20200728012257.GA1282472@jagdpanzerIV.localdomain>
References: <20200727234612.3037c4a5@canb.auug.org.au>
 <87tuxt3sjj.fsf@jogness.linutronix.de>
 <20200728081959.2df754d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728081959.2df754d0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/07/28 08:19), Stephen Rothwell wrote:
> On Mon, 27 Jul 2020 17:13:44 +0206 John Ogness <john.ogness@linutronix.de> wrote:
> >
> > On 2020-07-27, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
[..]
> > > Maybe you meant
> > >
> > > Fixes: 896fbe20b4e2 ("printk: use the lockless ringbuffer")  
> >
> > Yes, sorry. I did not think linux-next SHA1 hashes were used in commit
> > logs.

Neither did I. The tag made sense to me, because it fixes a regression
after all.

> Well, it makes sense to use them if they are stable (i.e. the tree they
> are in does not rebase) which, by this part of the cycle, I would
> *hope* would be true (but sometimes isn't :-().

So we probably should not have Fixes tags in linux-next commits
(printk rework branch) then, for the time being. I'll keep an eye
on that.

	-ss
