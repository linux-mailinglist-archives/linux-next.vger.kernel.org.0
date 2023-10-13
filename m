Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B777C84D0
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 13:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjJMLqd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Oct 2023 07:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjJMLqc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2023 07:46:32 -0400
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1952D6
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 04:46:30 -0700 (PDT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3ae65ecb25aso3013306b6e.2
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 04:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197590; x=1697802390;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zn0uxRkOLG48mJwkz4jaxTqBOa7f3UFb3XgrawfYgSs=;
        b=tYS04lf6IfHPQRy+fWpZA+AgGWAhyzfXdpDmQ0oe4qujuA4/f1mknjO6N3127+8Ica
         gt9xoi6TClI2yV5Tkk3i8A1MoVuSj3b8CHH1KAM/zy5OCOBd6PARdrry+rpw+AhMpNpv
         kHp2zoA7xJj2s84oXaIKHuUAwDSYFRTHt949s3OnL0UmFU4l9JsuFUYziNOlWrEBJAag
         TJmVqx9zKCNPE5jguYxWK1tYpgWpW4guxQsiGhHU2tiya1IZ6KbYhjkhI5tFbp1wOKfa
         UBfn8A3UNlBTXkehPGzzOghOKNmv7J86LtpLYg98X2BpYu5ZZuFGx6HsFULkszE8OHzv
         2kAA==
X-Gm-Message-State: AOJu0Yyam1ue569YQe/NXBnlSKhvPR7IzPwG/Ditpq1bUmVxBMPXwazS
        izHkRm5LShmUdK0sOHUaxjw29hiaW/0DqO4+3pPJDluJwldr
X-Google-Smtp-Source: AGHT+IEcFSzxJ1KG+9A0ZTvasljz8aZoRl7nJi7R/AFkCoSGaSxjFq0AZu7CaX/6w7mOH2NJC4qbuEQd0hTSXzm0IuMb8h5tIabv
MIME-Version: 1.0
X-Received: by 2002:a05:6808:18a3:b0:3a4:3c6c:27a1 with SMTP id
 bi35-20020a05680818a300b003a43c6c27a1mr13323007oib.5.1697197590233; Fri, 13
 Oct 2023 04:46:30 -0700 (PDT)
Date:   Fri, 13 Oct 2023 04:46:30 -0700
In-Reply-To: <ZSknFd3ywz6e+wNg@Sun>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007ac87d0607979b6b@google.com>
Subject: Re: [syzbot] [usb?] linux-next boot error: KASAN: slab-out-of-bounds
 Write in vhci_setup
From:   syzbot <syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, i@zenithal.me,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linux-usb@vger.kernel.org, sfr@canb.auug.org.au, shuah@kernel.org,
        syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com

Tested on:

commit:         e61eb79d usb/usbip: fix wrong data added to platform d..
git tree:       https://github.com/ZenithalHourlyRate/linux.git usbip-fix-wrong-platform-data
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e549f76cbaa1b13
dashboard link: https://syzkaller.appspot.com/bug?extid=6867a9777f4b8dc4e256
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
