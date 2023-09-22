Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C408F7AB986
	for <lists+linux-next@lfdr.de>; Fri, 22 Sep 2023 20:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbjIVSph (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Sep 2023 14:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbjIVSpg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Sep 2023 14:45:36 -0400
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F3FCA
        for <linux-next@vger.kernel.org>; Fri, 22 Sep 2023 11:45:30 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3ab27eff294so3854561b6e.2
        for <linux-next@vger.kernel.org>; Fri, 22 Sep 2023 11:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695408330; x=1696013130;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHvNmYe/7oDClcplq/l4st43cibTO0++q9/bZ4CRfVg=;
        b=tO49S16YfMi1Lya9PDv0xnqrh0bguTBh4u+AZ4OhxwtG3F20WkiCEuKKsu1dBsSVUa
         KU2W7bUh3wJRQYmP0t+0h0YjRNP7Ji6oHW4nAgrDLAwQ711IntWBBzyisfAg4NOUcUQf
         ZgoucsTG2waXV33rHpPYXLbR1rFyP3gpd3pbl5ORJYvjF162b7UhtiOL4VN+eFZVWoyZ
         tx4d3r4+XmgjGLc8pce+IR/wT8uLAzwd/c/6pnrtLbUeIuznzuFJkCCDmrPHiM/oHGYT
         Dlkeno8yNEfhYalhSfXRJV8F3TboFh1HKlz62jHWZ68VuRAv9HgFND2F4a3tMJ3QJ8Cb
         m5Hw==
X-Gm-Message-State: AOJu0YyOKCd598v5juH+g3+K0WhE81fsVe6yHNtHRV533cjW9hsCS5Nz
        6hEXWSzGvEDUIVieMO8iqc0kSSpE7GMvJg46GbV1Q7yw7ssS
X-Google-Smtp-Source: AGHT+IFiASI9I+d8YTUCo6Y0vNaIA/fxB263Ct4bKd8VHzbQGqJwkImy0blDArhh27yCdEN8Po8MmPHoyJQnS02bMBtbXz2usie9
MIME-Version: 1.0
X-Received: by 2002:a05:6870:a899:b0:1dc:27f6:79df with SMTP id
 eb25-20020a056870a89900b001dc27f679dfmr101638oab.2.1695408330133; Fri, 22 Sep
 2023 11:45:30 -0700 (PDT)
Date:   Fri, 22 Sep 2023 11:45:30 -0700
In-Reply-To: <CABNemfqP+=-ttkMwLWTQfoio9yQvHS+yBe6n7CJ0jBoWpF907g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004456170605f703e5@google.com>
Subject: Re: [syzbot] [mm?] linux-next test error: WARNING in page_add_anon_rmap
From:   syzbot <syzbot+6ccbcd15a17f3e1cde38@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, david@redhat.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, w1s2d5@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+6ccbcd15a17f3e1cde38@syzkaller.appspotmail.com

Tested on:

commit:         7fc7222d Add linux-next specific files for 20230918
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=79253779bcbe3130
dashboard link: https://syzkaller.appspot.com/bug?extid=6ccbcd15a17f3e1cde38
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
