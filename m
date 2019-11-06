Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A845F1035
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 08:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbfKFH2h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 02:28:37 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43340 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbfKFH2h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2019 02:28:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id y23so13939699ljh.10;
        Tue, 05 Nov 2019 23:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tL7GGhFlW5adac2tYoxQS+JgkXCcxkJj9jtno9t3BBU=;
        b=f2xpuM4bvsGPnXJ9o/Ja6C1QUuH8QyWDCU0F9wwcy819GFZu6Ms/cQLD5f+PD8Y6vm
         92hMxXUNBoq+QPgS35WGy/49yDzEO74YWLKUauvrrmEdaidWzid6KjTsQCDfUtewh+qd
         tkcgAUGMmmwvfL2wsA/rm5mjdnA3pNgRkzMXgc5+DRI24BbvrgEaVTwRlzui0DhWHKWf
         D9Ne0LcxuAA/UEMAo1Y46KbBq/aKuL10z6NhMaFseuhoKaRG+XC5g2Tg74VmVoPRiU3E
         EwSt+Ro4I2bcUWgazmeyHIJkMYeJIfpq+cPMNk21yhOFUNi1yRZjFcRWs1TEhukrcWUV
         092A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tL7GGhFlW5adac2tYoxQS+JgkXCcxkJj9jtno9t3BBU=;
        b=mR4aiv0oNjO2CzYH4AWB4LBZipkVdtsmgIVtMNYekEz4RvreHKF383gB8r1KXBQ98Q
         eIENu/LeN0wkpO4set2I656l4uhP9MrCc6NMALx7cESc+yrBZeXwUvXkBaYcNrk70gms
         2TKwgRz3sDZIoLNpydKoKTf+C/j1tpC3dALVoxCdECq9TnrlpcxetFjYx6lFy0TVvd0W
         olDb4rcHFBuqzwnq7Mw/sDBJTyeenOg9RjvSG23BsGDw/uGIeodfSeV42MAOWe5gMKYD
         4pDw34Oy1PcaTWBiM3euzwuwQdhqwuO0hUDJvyPDvkW55vYdQA1je37km6RUYPBo3yVT
         8t0w==
X-Gm-Message-State: APjAAAWun2RvvsIaMkFcWD/D0KtOtFpw8Rho9IaQ4dSepeVewDSDwugH
        z7quKUm2P3Bm8I81uqKtoQU=
X-Google-Smtp-Source: APXvYqz+tpZFUNF/7rn+2RUfKd3T7lYwDMCYKra/BDGVwKOBvZr394OswIiHuhQNw9nekIFFYsYBCw==
X-Received: by 2002:a2e:91c7:: with SMTP id u7mr678244ljg.249.1573025314830;
        Tue, 05 Nov 2019 23:28:34 -0800 (PST)
Received: from uranus.localdomain ([5.18.102.224])
        by smtp.gmail.com with ESMTPSA id w21sm1148384ljg.91.2019.11.05.23.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 23:28:33 -0800 (PST)
Received: by uranus.localdomain (Postfix, from userid 1000)
        id 4BF074612CA; Wed,  6 Nov 2019 10:28:33 +0300 (MSK)
Date:   Wed, 6 Nov 2019 10:28:33 +0300
From:   Cyrill Gorcunov <gorcunov@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: linux-next: manual merge of the kspp tree with the tip tree
Message-ID: <20191106072833.GC2560@uranus.lan>
References: <20191106160331.016b2521@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106160331.016b2521@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 06, 2019 at 04:03:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   arch/x86/kernel/fpu/xstate.c
> 
> between commit:
> 
>   446e693ca30b ("x86/fpu: Use XFEATURE_FP/SSE enum values instead of hardcoded numbers")
> 
> from the tip tree and commit:
> 
>   ec2f877856e0 ("treewide: Use sizeof_member() macro")
> 
> from the kspp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Since these macros are just the same the fix is fine. Thank you!
