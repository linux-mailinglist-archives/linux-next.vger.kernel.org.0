Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB69331B6CC
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 10:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhBOJ5g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 04:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhBOJ5f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 04:57:35 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82ADBC061574;
        Mon, 15 Feb 2021 01:56:55 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id jj19so10171157ejc.4;
        Mon, 15 Feb 2021 01:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bY7m25ZVeWy0RWxqayXMpdGxKqC+fwIQk1tUVdalj2I=;
        b=LHkAY749Kd43D7spoZSHGOz96FLgJrSJ8WrBDwPTcGw29s2IrUka3qCCbDk7VM8Stg
         MQeMkZSfZYoiFLwOv7NJ6KLwwlzwj+zIaCJVgQ0TkL6L3TiYEkKNWhPv3SrSJrjICbXw
         IUEesaDT6xCJjItBXqq2shRWowyiRdFDRJwkUSmcDBJdSbCBzUFq70WQafeBbROTTvfq
         yfNxDSdE2vuN5Hjz2NOg6JXyx0fY8GzpwjSWgXFlXAL1Rzg6HpC34MIUPKIccQA0MIOX
         7VQt4ozSEAdHx11EnVSz8fO4uk5gJEp5vqpPVbjFSuiWb6R2YHMrQwS/NO9/8BsyO2Vp
         MeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bY7m25ZVeWy0RWxqayXMpdGxKqC+fwIQk1tUVdalj2I=;
        b=pUNXcW5pmttDkEfVrA67fI+ONa/GHqUDonBwxqLzCeDwpwKBznt109khT6qM8vhJ12
         972xoXdJ9t5WLbmtrZYv0m0iEYxKMPJux1jDHOvazaXabpgR5rALy7lNdBe8A+bF6P/A
         9ll0YBQ81rqQ47V841Je3CW84ce39CVOOds3po7oT9Y3iCx6yHObrX9+k49f9LlZgrag
         AMnLKUJjnlLHWpPmOaJemMHfoexPY0ru58Eq4gjV6jd/JfM4VHkplxB3cGaFRQ2VSowZ
         iYfiaRxnVOpKyNNPftbJjaI/I+Z1RA1nBvl6x+fuohqYmKylhZee4IvYvEIvGOYtWnAX
         ZAnQ==
X-Gm-Message-State: AOAM533DSLYKE4yOum26wqJkPW+o3yBbN/g1ugJUotqElXhAniL6nM9X
        hIrNxGmHAFd+eh+CPrILkDg=
X-Google-Smtp-Source: ABdhPJwuZXHgTI2yf2Bf/NJeBrgxC1znLfXsW1wpaES4PKB0rpHPQs0V+3dQQAPfXSwHYN32twMRCw==
X-Received: by 2002:a17:907:2159:: with SMTP id rk25mr15177523ejb.551.1613383014281;
        Mon, 15 Feb 2021 01:56:54 -0800 (PST)
Received: from gmail.com (20014C4E1C814B00E3E7080063F66787.dsl.pool.telekom.hu. [2001:4c4e:1c81:4b00:e3e7:800:63f6:6787])
        by smtp.gmail.com with ESMTPSA id hy24sm10376931ejc.40.2021.02.15.01.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 01:56:53 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Mon, 15 Feb 2021 10:56:51 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: qemu boot failure after merge of the tip tree
Message-ID: <20210215095651.GC2185387@gmail.com>
References: <20210201200918.386682c5@canb.auug.org.au>
 <jhjv9bcym5d.mognet@arm.com>
 <YBgSzPcVILEtk4Yy@hirez.programming.kicks-ass.net>
 <20210210155339.49415f2e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210155339.49415f2e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Peter,
> 
> On Mon, 1 Feb 2021 15:40:12 +0100 Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Feb 01, 2021 at 01:04:30PM +0000, Valentin Schneider wrote:
> > > On 01/02/21 20:09, Stephen Rothwell wrote:  
> > > > Hi all,
> > > >  
> > > 
> > > Hi Stephen,
> > >   
> > > > After merging the tip tree, today's linux-next qemu boot test (powerpc
> > > > pseries_le_defconfig) failed like this:  
> > > 
> > > In case you haven't seen it, Dietmar did the dirty work and fixed my fail
> > > at
> > > 
> > >   http://lore.kernel.org/r/6000e39e-7d28-c360-9cd6-8798fd22a9bf@arm.com  
> > 
> > Right, picked that up, I'll try and push it before the next next ;-)
> 
> This fix has not reached the tip auto-latest branch yet and so is not in 
> linux-next.

This fix should be there now as:

  e972d92d52a1: ("sched/topology: Fix sched_domain_topology_level alloc in sched_init_numa()")

Thanks,

	Ingo
