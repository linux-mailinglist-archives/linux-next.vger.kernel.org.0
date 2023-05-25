Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2CD9710B97
	for <lists+linux-next@lfdr.de>; Thu, 25 May 2023 14:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240828AbjEYMBf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 May 2023 08:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239928AbjEYMBf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 May 2023 08:01:35 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5232E99;
        Thu, 25 May 2023 05:01:34 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-561d5a16be0so6508877b3.2;
        Thu, 25 May 2023 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685016093; x=1687608093;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wzjXUs7hQMg4YnTSQBBTOV9Px0ea6Z5OIL5Ul9L3HtM=;
        b=qslfBorePk4sEMwlJxSs+2CvZubmE9HsGmyLKXanyypE0uNCxG5B2+OTuE/wjHKRsN
         7+ywINy+o4uA+3/q4CeE+4ajhm9HIOj2YlTWoZ+SgLRj/DPTcO/EYbPA6judbz7G19Fn
         Y6leI7H/7coiJMdlvU5zSp0O1kWVlktcqJCpGVtWmSWmOQmXzldqUjRKChhwF0xT89r5
         unxjblF1d5bs3hDGqRCZREH7rrCDv6bD8wYR70UQt998crosqq1ykC8xR+XaJvQ78a8r
         lidF9SCOpwbwU5FTUYU3L+DXhU/MYyO85/IaJ9zoWWA39okGp4gWABqYtjq9ZTL2k/yf
         kwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685016093; x=1687608093;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzjXUs7hQMg4YnTSQBBTOV9Px0ea6Z5OIL5Ul9L3HtM=;
        b=M0x3pDGV6OdsGWpekkPWMiQ4IVnscxJW9DBI8erEYO4atoxQ9ii1HtXWSrcKBTVmns
         8RrVIBZIbcT7eiP8lFML6V+JFEgq7qYoQOkAH38dFtGhxAmmvBAnyoTlwDfK52rfAas4
         oUo4aprxbVyPeMckw1WABCdVEGt/laccooljTKmaUTSfJJwEWcu3erZcgt2gm/9oIg5R
         9B1PKjVKYNCDYLkC/Ag1d+OexxzYMK0/9uwe1FTize8y1ZZJhF/aDzMOuzs8SWCBr2QJ
         6Jwu0yhE5bTahLe08mLuKHHw0ikzaMi2CgC3b4NXz5/ZVd4/G2mE8zTahtRtSAFbHz9c
         qbGw==
X-Gm-Message-State: AC+VfDwKTb61GVpUdf8t4schsnqvk+bM/Ust2linR+FJtEdGKdkmKb6b
        NAbwIDzTw2DwE2izJrJs1zarCmY8GkAWMOslsd2Z3L0gxsoqtw==
X-Google-Smtp-Source: ACHHUZ7PSqNM4uSLtY7h6h9M4+h+zxTzZ7WFMg9s5g8zeJjjwEjf2VrsenLJX6tgVIWpw53Kys5LruHllqLTviPNyeg=
X-Received: by 2002:a81:7105:0:b0:561:a41d:61cd with SMTP id
 m5-20020a817105000000b00561a41d61cdmr22435505ywc.46.1685016093347; Thu, 25
 May 2023 05:01:33 -0700 (PDT)
MIME-Version: 1.0
From:   Murphy Zhou <jencce.kernel@gmail.com>
Date:   Thu, 25 May 2023 20:01:22 +0800
Message-ID: <CADJHv_ujo+QUE7f420t4XACGw4RvVpckKSJcJ_9_Z0b2gdmr+g@mail.gmail.com>
Subject: 
To:     Linux-Next <linux-next@vger.kernel.org>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Christoph,

The linux-next tree, since the next-20230522 tag, LTP/writev07[1]
starts to fail on xfs, not on other fs. It was pass on the previous
tag next-20230519.

After those 2 commits reverted on the top of 0522 tree, it passed.

    iomap: update ki_pos in iomap_file_buffered_write
    iomap: assign current->backing_dev_info in iomap_file_buffered_write

(the second one was reverted because the first one depends on it)

The test case writev07 forms an iovec with a bad address in the middle,
then writes to the file, expecting a fault return and file not being written.
Now it fails with a fault return but the file has been written.

Looks like it is related to the pos update, could you help to take a look ?

Thanks,
Murphy


[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/writev/writev07.c
