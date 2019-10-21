Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFCADE40A
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 07:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfJUFvr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 01:51:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52058 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfJUFvr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 01:51:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id q70so4532153wme.1;
        Sun, 20 Oct 2019 22:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L/UYn5CrH2at9ULvEJ5IrXOEOZvQjLR7/6mrJJUvTjU=;
        b=H5NpNqC9WwvhLgSpX0Xzaozkt4SvoXDBt41OFlTnC6ovQWpFaPsj4WJnPexT087z50
         tazNOvIhEvzcW7YlQQsVNQcSCA6kUbpsmX60jDErAT8QEvzxWKfMcsIJr1Z2ZJzLyLAR
         Mk1i8s2RMd3WuNdgEFym8PDfkeG68pdTvSMfyG3eCn5wTOxsd72kX4f2FkCQsovDmAeS
         dduhNH/OVMPEl2fO4yVUZLsHKO+HDX0+X4ieSD5SG8dL5JyWTh5T0LuFJgkdKBAs+2Rz
         C2VAM+1FZZbsfGdKCiWfbn6slSrRLB8hIOq4nWQP94rZZBmnL28LCHMsZvN+uqUBOY0H
         ZYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=L/UYn5CrH2at9ULvEJ5IrXOEOZvQjLR7/6mrJJUvTjU=;
        b=BY0M137Nn8V6I4i3cfbfPTR2JwMzHCig1vTO7jQVBa/RuFWbAWXcqGUnOrXfysZ9pL
         QhFgqzXjEuMnxysvV3oXFfMZBxbbI8krvESxVzKj/ahPWmiSWZxL5lVzShEqPF+SH/rh
         Cz8jkU7iiyN+mtufWnI9B91/ELqGnO2uV75G2yTKDrwGhz+47pFjl8kWwdlPnVXMak1e
         Zk8fJm/8im20P4ho66IhL4bVVpGexEUhsQl6AMO6E+6z+wi24DZQBSPCGVp25SKgzSJT
         JWN/ptkNe9qRWsra/la/qfc9D+xgbc3mNEyT4hOZFGzDhVbbs1kLX538Xz4evOqNIIQ9
         zz6Q==
X-Gm-Message-State: APjAAAUQj6u3yfyS28A8AV1iaMU4aH5SiDUBHpjWzaLED/A+Ttm96oot
        VHbzE/wqF0sTUUQV/z/SFq0=
X-Google-Smtp-Source: APXvYqwVgadVQtClL/SxEzlMFAMgO13scenS2Z5MePp084o9rJ3dRJs7X8FFZ/P8PP8wdMzDwQZlMA==
X-Received: by 2002:a05:600c:22ce:: with SMTP id 14mr17055842wmg.71.1571637105185;
        Sun, 20 Oct 2019 22:51:45 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id 74sm23258113wrm.92.2019.10.20.22.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:51:44 -0700 (PDT)
Date:   Mon, 21 Oct 2019 07:51:41 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191021055141.GA2973@gmail.com>
References: <20191021131342.404551d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021131342.404551d7@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (native perf)
> failed like this:
> 
> make: execvp: ./check-headers.sh: Permission denied
> 
> Caused by commit
> 
>   05f2f277053d ("Merge branch 'x86/core'")
> 
> which somehow removed execute permissions from tools/perf/check-headers.sh
> 
> I added a commit to reenable execute permissions.

Hm, that was a weird merge mishap - sorry about that, should go away in 
the next -next iteration.

Thanks,

	Ingo
