Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D73231F51
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 15:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2N2x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 09:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2N2w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 09:28:52 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD72C061794;
        Wed, 29 Jul 2020 06:28:52 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t6so14261763pgq.1;
        Wed, 29 Jul 2020 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cULnoqyNJJnXVuC40A9E1u8TE8EnnT1/19zUse3T/VI=;
        b=XEmLoBDrinHYCFTcJcW+UOEZ8KxuIKH9iTnRDN5wudpntw9HVcVp37oW3GiBezImF9
         gEZBQs9DDbA0/95nTc4Gd6FmmziJUv3u/YorcpXTOUvSqDagORo+Z2H96c01C1dvgx8n
         GqHae3pyM2+c4BMUIkH0+brnn2PfqjE/SGphKQqlnmTSNhiPe6Ss9hMPjfHA+Y88odFD
         2rTz0YHu7nImtxBcBOeNazkuGfTCi49mBN7dP5QBCvIzK4gFs8273xYam97GIBaV+jZd
         RnTjN+xRr2gIETgcw2oh+N1/t8wuivIniMttocLAu8Y2ak4bBDvfP9P7IrHR7Ky1CSnF
         sJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cULnoqyNJJnXVuC40A9E1u8TE8EnnT1/19zUse3T/VI=;
        b=dT7lS7KHKCyCQH9WhXUvEA/3Yp9TcJLiE2eu3n1Qgu1Ubbx9dTfKXk8AEKIbPdliEo
         Ejb8PkTg6McBfVIxufoKm/LVNUdYvxxupZXYPjO6sJdbZFOGvFod0pgLPeQwafv4oWZo
         AEnBJ3UnixYPFhZQ/5hFGk2hLPE0ZvlVfQtPtfARz+FgBVRqovPeXxzfPlbseqwP/2Bu
         7TaI6/Df5GGDECRg5EEbmMfVBKFrJahU6OGsLb7JlSo+80s2oNUSMln2/kLf5ZbSJL89
         DjaxLadrrKLlULeJx/gT/4VxVsZDNUrMazNvWPj/FUN5NHZKP5NGOZgnbow4ZAyYFMq5
         29vg==
X-Gm-Message-State: AOAM530sv6/gQCU2Mw2agFPYhLp34xoEs6v8NzetUHGapW2AQAH3ObxF
        6CPH+gY/UeUTAD63hzNHY8s=
X-Google-Smtp-Source: ABdhPJzGy/nO7aDpLYUGwmJgQbgVB6LKzJ+sGz8VEuSG3KJsjQseU5I9sMmRLzMNwC1mHwfcKS7KFA==
X-Received: by 2002:a65:484c:: with SMTP id i12mr30697513pgs.145.1596029331998;
        Wed, 29 Jul 2020 06:28:51 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id o128sm2491688pfg.127.2020.07.29.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 06:28:51 -0700 (PDT)
Date:   Wed, 29 Jul 2020 22:28:49 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     peterz@infradead.org
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Message-ID: <20200729132849.GA1160@jagdpanzerIV.localdomain>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <20200729124744.GC2638@hirez.programming.kicks-ass.net>
 <20200729125144.GA7184@gondor.apana.org.au>
 <20200729130000.GA2655@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729130000.GA2655@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/07/29 15:00), peterz@infradead.org wrote:
> On Wed, Jul 29, 2020 at 10:51:44PM +1000, Herbert Xu wrote:
> > On Wed, Jul 29, 2020 at 02:47:44PM +0200, peterz@infradead.org wrote:
> > >
[..]
> > > Anyway, the patches look sane enough, I'll go stick them in
> > > tip/locking/core or somesuch.
> > 
> > Perhaps add them on top of the other two patches in locking/header?
> 
> Can do,

locking/header would be better

	-ss
