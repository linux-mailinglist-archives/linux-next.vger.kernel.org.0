Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE18BF798
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 19:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfIZR3z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 13:29:55 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:34075 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbfIZR3z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 13:29:55 -0400
Received: by mail-lj1-f171.google.com with SMTP id j19so3052657lja.1
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=VFcFYcWwpHL0Oho9HxeoU1oGj1fgSa1sn99Foc5xkas=;
        b=f3LI0a1rOC9G6H//RKCxQuCNO3ym+yCzFJBKUs4LHy/3NHU5iJ4Gw/otd7ByI/DIzH
         k9ZwUlZ9s1PRq6uVFrxC7fu7fkbk+lQJLzZ3uZ9Z1MnU5tqAVDQSPgTiyJ9L1PzTAAyI
         I3qspHGkUpzhMw81L1rmuVpT54jIWdyIjVWNscdw2qlpD9fx11WJF35iRq5AP8Teeea3
         5SZcG7GM+8OwxMd25K5Y57bbITdGWCdcbJW3NtHyhaz3hHdXOXJZBjNOxnIGh+QmFb+p
         UU3U61d6bROnqbirNbH8XVwCZoKMoaSqAyQsiL00o5xdKWj38BhtCJTIO1CSRxRPfRnF
         k4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=VFcFYcWwpHL0Oho9HxeoU1oGj1fgSa1sn99Foc5xkas=;
        b=ecfpQCDy1THE2oCTPcj4JOtC/zK7A4WmmL9z75gpyhWLyHHw472RzCOMEujeeJQTpv
         E/xndAsJ4HTdqUARigmSkCOiIGDPTL7Zn2Yoh5nbdxhZ2I7uQ1iKmrj3UH+VdgfQPW6Q
         x2+3/1mEqNFy6QI+8tI1NFHqI9gJ+sfsCRQPUaJvZpTXGGsTHRXE7masGP+wWqcF8Or4
         xVrarHRKdFwHu2RcsPJXloVWxbXjHo3ErmluLEw8qW2c6d/Ugf8Z2K3J9AkLiy2qTPDW
         Je5CO5ZnQrkP+DredrO5LhU18yFso/aTRsS5X01LXz5S4YczWQmLTz4UBOEPBdQgzu4N
         gw3Q==
X-Gm-Message-State: APjAAAVxjYPM18sB6apOnQQPoaKVFL3McTMu+n6TQCpCsUXGI1RgtLvO
        GJXUUtC/IEH6MT/D2MitvS65PUmnz9W017XpCzT83A==
X-Google-Smtp-Source: APXvYqxCfkoodIYkCFn1sFSEjjcZZiio6Uoe3BORK8KOACz9tWMOiafi0paC+PE4FqC1HNVbkYaiak/fzpb1FlSp/Q4=
X-Received: by 2002:a2e:a178:: with SMTP id u24mr3351803ljl.149.1569518992751;
 Thu, 26 Sep 2019 10:29:52 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 26 Sep 2019 22:59:41 +0530
Message-ID: <CA+G9fYu0hkS+NdwX38DNTygV1A7eebvjZvWvFUTfL=f3_4m=Dw@mail.gmail.com>
Subject: perf build failed on linux -next on i386 build
To:     Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        jolsa@redhat.com, namhyung@kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

perf build failed on linux -next on i386 build

build error:
perf-in.o: In function `libunwind__x86_reg_id':
tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
undefined reference to `pr_err'
tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
undefined reference to `pr_err'

- Naresh
