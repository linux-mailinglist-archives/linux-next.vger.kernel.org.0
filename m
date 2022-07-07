Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B52CA56A766
	for <lists+linux-next@lfdr.de>; Thu,  7 Jul 2022 18:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbiGGQGm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Jul 2022 12:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbiGGQGl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2022 12:06:41 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFE731374
        for <linux-next@vger.kernel.org>; Thu,  7 Jul 2022 09:06:40 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id e4-20020a92de44000000b002dab11299d9so9561824ilr.9
        for <linux-next@vger.kernel.org>; Thu, 07 Jul 2022 09:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=Ef6EaxbhRWWl9yGrcwKYUAdX/pBweihX45OfiVsisKs=;
        b=dw0MaNJS4hVZWBHl1ep/6KwMcL0gHuINPS6ziZQ2Wixt9jmvr6E3DSbDwGRn/0RysL
         YUbj7gpqqlGOSZyHl2Jqv1tvLtwYSM1bwNJcKxZM9uUtlhrtTpHJgI4KX41fWk2AL1mt
         wPsOmWMGXEsTovuWWe4ccwoZn1S5oaGVRBlTi0iNfojpRebtIj36xWjT4nHPT7eLB1fy
         M9ULoR7RDCMgF4Jm5RTtntg2L9fiLe6dmnra4VejWjhiU5KvMcvkZhj32ShCweOSyFTz
         s2vQkMFsgXYlLIWMoNJ3C7XqsAcbusg2LXS2dJD6oePoLGETSgAU9uMiPImf/oTHGrrR
         Somg==
X-Gm-Message-State: AJIora9urOWN58tkPqY9NLGcdplKDcorKnT4s9dZlD+BrzfOS3Apk2Pu
        naJi1sSTS7S7Q9cTew95xllrxOQbNZWPS4yZdRdX+rJnpzGV
X-Google-Smtp-Source: AGRyM1vkNnDgKntPM6HUPetN4DNdMynXMRpG/oOB+J/sKZ78p6g+lQqAwILEx+ChV3Fpo28F7D7DSvqk9IFongu276gGFPQ8e6Fl
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1310:b0:33f:1f49:26be with SMTP id
 r16-20020a056638131000b0033f1f4926bemr1563287jad.141.1657210000099; Thu, 07
 Jul 2022 09:06:40 -0700 (PDT)
Date:   Thu, 07 Jul 2022 09:06:40 -0700
In-Reply-To: <20220707160545.7731-1-code@siddh.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005fcfa605e339458c@google.com>
Subject: Re: [syzbot] linux-next boot error: general protection fault in add_mtd_device
From:   syzbot <syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com>
To:     Siddh Raman Pant <code@siddh.me>
Cc:     code@siddh.me, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-next@vger.kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> #syz test linux-next master

"linux-next" does not look like a valid git repo address.

>
