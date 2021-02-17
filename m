Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3984731D766
	for <lists+linux-next@lfdr.de>; Wed, 17 Feb 2021 11:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbhBQKRy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 05:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbhBQKQ2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2021 05:16:28 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1713FC061574;
        Wed, 17 Feb 2021 02:15:48 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id z21so8202940pgj.4;
        Wed, 17 Feb 2021 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PWMDkLyuoQFnyVhCDSKForjRIrCz/CYTz/aboHVEpC0=;
        b=eXnnMZ0G51shDdPz9jSetL9ouwoklyGpi6GXDgzmGA/IhXc3e0OLuOhL/3RprTM9zl
         v5qQysQaMy8cc53O1uOSFAPyWH6/la5kQdmLn3vh6Kkrc6kFsU5f6kkEwozSrYtzSjsV
         NK9FU8EHz+lkksLxqGlskgn2lEwGKoCQ40jyS4FcvcojLCnf/FBvisns/8x/YbxxVfh2
         FJPr2ZKubgsMStm3/zjyW4qdrTo685KTLHDTwRR6/mTPiU8RlnNjZIDTY0k3mYGOWEtg
         /YBeazO9MCdIiTrlM23bAuQQM2cGQlnsSTxJIt3jQqf/W8Vq4SiRgwwUTBNN3Xmwk97x
         W6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PWMDkLyuoQFnyVhCDSKForjRIrCz/CYTz/aboHVEpC0=;
        b=qhvcHOUdi5J/i/fQIKaE79pkksCerJplUAMT/IIiTR6mWy+Q4kfgf5Gwyr+CPs4w3I
         q7Sw8RFWiRphtqDaZFlGTyQg7OPeETzaXyfuzftMe9RLpUGqom15OSIfh9fMQhhzE07p
         i0Gpui5fHcitWRjr9LjehiguVxc/bGGtBQj3Ic61pPDi+huyTcDcKClmw9NHMzrK8qcL
         WANaO8otCZVypBd1zRVrVABToFlddqPX3rra6EUon5JJxA7Xy74rYlnbh3E4sCg4e7YJ
         7oQbgqXcLZFPcXwnZH85D5HfvYYS8hIi9zLC36grrVdxR3BrVBVQKXMPW77kkb7d1EQg
         4P/Q==
X-Gm-Message-State: AOAM533p2zJGbED0E/sB8AxNO6DcU7AS7CyrOZNbE9npCdRrGpfhlE4r
        lAmDr0Pg+5P1h2Ha11fKDtyaFO5OsWW+3OFWWRU=
X-Google-Smtp-Source: ABdhPJwHxbyGWzMtxJ7ItogY45paozuwlLwLEJTb3PI0WJC3v/QIzWFZMZLh+4YKBsP/k03seyM7MK3flJOTxz74IU0=
X-Received: by 2002:a62:384c:0:b029:1e3:8bca:5701 with SMTP id
 f73-20020a62384c0000b02901e38bca5701mr23579306pfa.7.1613556947563; Wed, 17
 Feb 2021 02:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20210217160714.7c1fcaac@canb.auug.org.au>
In-Reply-To: <20210217160714.7c1fcaac@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Feb 2021 12:15:31 +0200
Message-ID: <CAHp75VdhLLWFm414G8TQUnkaXbsi0DcF1v1fZpsAa1_rtoBS3g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 17, 2021 at 7:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   arch/x86/platform/intel-mid/device_libs/platform_bt.c
>
> between commit:
>
>   4590d98f5a4f ("sfi: Remove framework for deprecated firmware")
>
> from the pm tree and commit:
>
>   bdb154f074a6 ("x86/platform/intel-mid: Convert comma to semicolon")
>
> from the tip tree.
>
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Yes, the file removal is the right thing to do.
Thanks!

-- 
With Best Regards,
Andy Shevchenko
