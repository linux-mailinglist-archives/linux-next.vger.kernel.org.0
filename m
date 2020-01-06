Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E81130DBA
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 07:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgAFGxv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 01:53:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55468 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbgAFGxv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 01:53:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so13932360wmj.5;
        Sun, 05 Jan 2020 22:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b9tBBunsWX4vmu6ZQ3cKhGspbAtWJGC3UVGHOJzfXH0=;
        b=qtZZb9jtRCrF7yQntqQigPv2EIi7MbqQ8L6DMWeo7f1Yw/2f9HYJupJ/6S8jaX2BxJ
         Nxle72+OCiV2FNy1cohzTzkh73IhoJpQ2yQF56OxzSZ8JTseK1Vq3nvkPnS3cIIv+//H
         nUHOOUbKZewCcXZczWx9V4UvgMwb0C+VbIEgyrQK6OMqAl/XedzijzKXuLXk1ehBnK8Q
         4iqVQIKxnK5rdUGr007M4ghljH1PrKK8YMXacxwmYZtzqKG9dVY4cFAQMMFwCIrQOB6N
         ZKP9NTTC/fX/ZHE83pt3j1GGW/Q8Y3NHOJz668Np9ynnokZkHYTgnyHgwe6Ym1lvD0qE
         2L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=b9tBBunsWX4vmu6ZQ3cKhGspbAtWJGC3UVGHOJzfXH0=;
        b=cI1j/jfqpWqlN6gZ8Z/tkt+J9DqMpujV6+Fm0wV92x+Al+nKMjO5Pbv990E9+oB2P4
         5pl6yRVgkpfRfshzfz4K5KqDt2QcbN2s0D7fFEx2kn8orDY9dQ6g28QYru7Dhv3ulhjU
         3EpykfkHcyC6v3F0xl+YDlsD1IMsdItl/2bLHSVH+6u7rLned7xxyrABPphYfsPBS6uY
         Gk8xyvVcgWIpCEWgSYhuvLV3kQhSl5Nj5scA7yLkupgAwBnRUb9G0omk5viZSvlip96G
         MIaUZyMswSmJMJkxBbrGn7bTuqT1NP1YOtUSy1m9iXax9Jf0180BZCD6k4EAzA/DVs4J
         GH1w==
X-Gm-Message-State: APjAAAVFQXsrth64/NQsxn0zGkROkgBx7QHKglG4Fm7/uUF3nD6lc1yn
        8DMeFLLmT9tv237To6+NpRA=
X-Google-Smtp-Source: APXvYqxwf1zNb0IvPQOprVPZkwKkekwBc4EorSEB4RKpFSAIU0R1cYeElHu1KpH7OAO34BEICCSjiw==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr33689168wmc.171.1578293629097;
        Sun, 05 Jan 2020 22:53:49 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id v62sm21936097wmg.3.2020.01.05.22.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 22:53:48 -0800 (PST)
Date:   Mon, 6 Jan 2020 07:53:46 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200106065346.GA34594@gmail.com>
References: <20200106131716.3cb701e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106131716.3cb701e4@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   init/main.c
> 
> between commit:
> 
>   74f1a299107b ("Revert "fs: remove ksys_dup()"")
> 
> from Linus' tree and commit:
> 
>   dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc init/main.c
> index 2cd736059416,919f65faeb7e..000000000000
> --- a/init/main.c
> +++ b/init/main.c
> @@@ -93,6 -93,8 +93,7 @@@
>   #include <linux/rodata_test.h>
>   #include <linux/jump_label.h>
>   #include <linux/mem_encrypt.h>
>  -#include <linux/file.h>
> + #include <linux/kcsan.h>

I've resolved this conflict in -tip as well, so this should go away on 
the next integration of -next.

Thanks,

	Ingo
