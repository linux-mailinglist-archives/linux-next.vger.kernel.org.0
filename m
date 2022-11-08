Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7BF621F64
	for <lists+linux-next@lfdr.de>; Tue,  8 Nov 2022 23:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiKHWjg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Nov 2022 17:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiKHWje (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2022 17:39:34 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF8360355
        for <linux-next@vger.kernel.org>; Tue,  8 Nov 2022 14:39:34 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-13b23e29e36so17848483fac.8
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2022 14:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/iT2V0+tQxLZsJICdQg59XlFu2/MLGUwh4giryzJ2M0=;
        b=ICm23jsQ4wdOkSkDuvly1QVqoPytp9haz2v1LjvoeGLVJH9FIR4AyyOH/NFjOrtxi1
         B/H6EBQqzG7LanFT66euegYuzZFZZiTmk/DcaMWZtl1n4lK6Az2iCmQ3HxD++xJOx8Qd
         HkOMIF1ZZ2Ohq0FCllMqc2J4z135+5BpkMihQLi5XuVlfDhicgi3lxbE3h/5TDttK7Mf
         pOfN3kaFDtIlLyD4sozk8RI1jslvNTObnkLpfycgwiQEQPAL6l/HZpE1jjEHhgip8JzZ
         3gs8i7tZ2V56xO1OCuHRfEKQ/oxejvmnKNz9oY57bkozIMB8nOzi/d5oLykBS2UpRcNp
         pq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iT2V0+tQxLZsJICdQg59XlFu2/MLGUwh4giryzJ2M0=;
        b=of689iD/ML8o+BJlW7IqDdOftrawDIvlC6lOwfLuQqbMHT2RE64WLRGqq3lHDNYxUm
         xUMGnFk6uPoMD+usKtQWRZCoIBQ8boElrdtLN9iOSvgkKa4kGpu9tWs+BG0fd5kq7RTS
         U9DC4l67yv0Pt40WvE7Cn/yXqcF7qUKEPMW74ituIm1wEj6darsfr0nTDXmaGyAcbcK5
         tY3bGHywU5588MJX8v1tXP7oS5CkuDilKHhYawlrYPKzpkPviivrYDxp3yfxWjgraaNw
         nnWHRueLlxYC/1Tkt6qvC+BTc8zEKN/XJWLgD4H9uFDzmOFuZpQ+GWfN/VQKLbtJt3uK
         mr3Q==
X-Gm-Message-State: ACrzQf3LNK2tN9+fZT7pCcS61RFy8W2pbKhT6heJToj6ALsxNEMMUzip
        WQSGTNrvgnrm65E52uxuW08lajW2xVzzu00bq+5CwA==
X-Google-Smtp-Source: AMsMyM4IufYTlvc6thSOGbvJFOSUOuyMiyKKIhnuNmYNTwpkUcVkstkGJdDySVWlN34cPCqWVOREmvOavwxL3Nc1Ajs=
X-Received: by 2002:a05:6870:b6a3:b0:13b:f4f1:7dec with SMTP id
 cy35-20020a056870b6a300b0013bf4f17decmr34481709oab.282.1667947173215; Tue, 08
 Nov 2022 14:39:33 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e915eb05ecf9dc4d@google.com> <Y2qjerZigLiO8YVw@zx2c4.com>
In-Reply-To: <Y2qjerZigLiO8YVw@zx2c4.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 8 Nov 2022 14:39:22 -0800
Message-ID: <CACT4Y+a3bJmMf8JNm=SZYOKtgSVnOpY4+bgdT4ugLLhVV-NCEA@mail.gmail.com>
Subject: Re: [syzbot] linux-next boot error: WARNING in kthread_should_stop
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     syzbot <syzbot+25aae26fb74bd5909706@syzkaller.appspotmail.com>,
        herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linux@dominikbrodowski.net, olivia@selenic.com,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 8 Nov 2022 at 10:44, 'Jason A. Donenfeld' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> Already fixed in the tree.

Hi Jason,

The latest commit touching this code in linux-next is this one. Is it
the fixing commit?

commit e0a37003ff0beed62e85a00e313b21764c5f1d4f
Author:     Jason A. Donenfeld <Jason@zx2c4.com>
CommitDate: Mon Nov 7 12:47:57 2022 +0100
    hw_random: use add_hwgenerator_randomness() for early entropy
