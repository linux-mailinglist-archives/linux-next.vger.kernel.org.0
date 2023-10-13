Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0DE07C8422
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 13:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjJMLMq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Oct 2023 07:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjJMLMp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2023 07:12:45 -0400
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0003091
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 04:12:38 -0700 (PDT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1d5f4d5d848so2621666fac.0
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 04:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697195558; x=1697800358;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=by43HP5P2wCaYE3AXTk6u5hvUascQ0ivlvkmhO35+tQ=;
        b=a+VSEzDcYXQjhYS8IJZL31ZCGiM4/1zCuybexPJT1KV+TaJizKi7WEyoSkYmT7QUYx
         5YikVrVN21rE9O4q36SEBDXk0s7gkJcJQPDhUe7lJZNeOx/6Wudq6H+LidOlQE5QqEIC
         hm6XQ79tBwNtRPjVUfqrX35NxDjNO74FtEcFrzMCSw/rBlLyYw7NIVN3/52tOdtu9JCb
         BxvOY1PkgfKqbZWJQd3PIHVSPQ3uwovSFu1l6C14Sos3cl/L7En+tA6luMODfilN9i3U
         T9vdnYLsG5DRQ7AadxcTiCBxh4Y99WomY2jE1Uz9MpLYM0KRkiwddqho63JooBwC/ICL
         w9gA==
X-Gm-Message-State: AOJu0YwlCXmvCIAGaYysFJ+Me1U1ipjnK5shqbm6/1pxeyYqGqvPNjrj
        kObOmrRDuw2vKgmyfK01PjpX70X9sUVQqQnl3MJVvciF5XeL
X-Google-Smtp-Source: AGHT+IGCzZxj4XP2AxDCBDfmXmKwgKGpaekW5mC0xmrgaIW7jCHJRwL8dDP2+4EGDMrZuT2UDhNy6IwuunhEZfEcajfHoYvbemzp
MIME-Version: 1.0
X-Received: by 2002:a05:6870:b782:b0:1dd:3076:9dfd with SMTP id
 ed2-20020a056870b78200b001dd30769dfdmr10505799oab.8.1697195556923; Fri, 13
 Oct 2023 04:12:36 -0700 (PDT)
Date:   Fri, 13 Oct 2023 04:12:36 -0700
In-Reply-To: <ZSklqKDnv9OAGMC3@Sun>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000048edd60607972229@google.com>
Subject: Re: [syzbot] [usb?] linux-next boot error: KASAN: slab-out-of-bounds
 Write in vhci_setup
From:   syzbot <syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, i@zenithal.me,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linux-usb@vger.kernel.org, sfr@canb.auug.org.au, shuah@kernel.org,
        syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git@github.com:ZenithalHourlyRate/linux.git/usbip-fix-wrong-platform-data: failed to run ["git" "fetch" "--force" "a8488ce2ff9e416d20038a4d32925ba1057cfba2" "usbip-fix-wrong-platform-data"]: exit status 128
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.



Tested on:

commit:         [unknown 
git tree:       git@github.com:ZenithalHourlyRate/linux.git usbip-fix-wrong-platform-data
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e549f76cbaa1b13
dashboard link: https://syzkaller.appspot.com/bug?extid=6867a9777f4b8dc4e256
compiler:       

Note: no patches were applied.
