Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F23522FF26
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 03:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgG1ByK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 21:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG1ByK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 21:54:10 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FECC061794;
        Mon, 27 Jul 2020 18:54:10 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k13so1280183plk.13;
        Mon, 27 Jul 2020 18:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m2ea3+R1S5kPZb5AV5bSF6B2MxbIDLdQ7d/mAIo8LIY=;
        b=R8kMpQVXOXmB8kMBJMdrq87r3DHILHZEjX2LldIxtaj7QoDScBF3+4paR8zB5ZnDmr
         bVDdMYgwzvcHi/vyHYcdEj/wDuYkXB/12N9anHYB3C+D1YHUGdV0Nv7KG/qA3PrwkRvn
         dJkDoikO2Ac3ggmswmvhjqMlidPLiHjohRMcmQOueu5qeJDV9JNI2kCdkHNeqUXEtc5x
         yWAaUwzXS2yrt4CpkGfD1noXruvVtxf+CHDzB+OfWskiXVu8+5ZjJ1JNCYRNP++CFDGF
         C8/F9lw0yiZEqJWMpe+DDP9+jqTkzQrlFTEBsjS2/itB/RYuM5tubfNbNuRXlUl45csr
         LybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m2ea3+R1S5kPZb5AV5bSF6B2MxbIDLdQ7d/mAIo8LIY=;
        b=X5MJ8sL5/H8l1rnCw/d9qRQNMXlp+0EJWKAnUbLXtuF5BlG98N87VvMVImofGRIBuR
         dz8vAYKv0egcEe0qqDc2ajjg6q1mUzu+dZFTWTqkrGdwwlU+LIq39RcdEls4YwslDwJN
         T3a5jaajVcRWUowINM9qBFRDciNBszhPO3ejYK5UteqRgb3e3tqBqA9mW6T3GNlFIj00
         wgeEN220ksW75oCZtHVdo3iw67vj/km7Pfv/TtGZMvr7cgUsTXZcmpmv1S0U+kWsYp4+
         5jrjqmXZvPm0vMTcmMCtCPruuTm9h665iuiMEfxZ3UYmrJndkw1A+n8J4a7voUYxp4D3
         dbsw==
X-Gm-Message-State: AOAM532TN5M+g82m7NqBnoE358YOMhR72DrplNV3In0aLoGNPyn5I0sb
        waK7to/R9f6+16kSlL2v8z4=
X-Google-Smtp-Source: ABdhPJz1wVdKmFeSV2Sh85lHePfMFtCaS+15EYZRzY0DNLsjwy+SPTseKklHrqG5eZK904qWoRhH5A==
X-Received: by 2002:a17:90a:d314:: with SMTP id p20mr1762455pju.99.1595901249420;
        Mon, 27 Jul 2020 18:54:09 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id q16sm6102376pfg.153.2020.07.27.18.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 18:54:08 -0700 (PDT)
Date:   Tue, 28 Jul 2020 10:54:08 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200728015408.GA1296462@jagdpanzerIV.localdomain>
References: <20200728114927.4590731f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728114927.4590731f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/07/28 11:49), Stephen Rothwell wrote:
[..]
> Caused by commit
> 
>   b4a461e72bcb ("printk: Make linux/printk.h self-contained")
> 
> This *may* be interacting with other include file changes in linux-next.
> 
> I have reverted that commit for today.

Hi Stephen,

Sorry about that. This will be fixed for tomorrow's build. The problems
is that we have commit dependency between printk and locking tree. So I
pulled the
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=locking/core&id=c935cd62d3fe985d7f0ebea185d2759e8992e96f

into printk/for-next.

	-ss
