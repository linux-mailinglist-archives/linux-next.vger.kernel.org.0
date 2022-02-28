Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CCA4C634E
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 07:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbiB1GpN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 01:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbiB1GpM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 01:45:12 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BCA443E6
        for <linux-next@vger.kernel.org>; Sun, 27 Feb 2022 22:44:31 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id c14so9276056ilm.4
        for <linux-next@vger.kernel.org>; Sun, 27 Feb 2022 22:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=naa1bQQ3wDALov45zcQaVdVKBgdT17zOTWl4QEhFOG8=;
        b=Dbne3WMFHDtIsMbCcNHhvP6hJYwPDEankTOHAl9Tg7kaRbjbEsHF7WjmOFDdBlripu
         CLjLXpoITQsy6gmj4s9X9GHXD8/+ice0DuAt9R2gd2F0lXPbpsYSnFcOoowdu2jI2qlg
         tPO1YQyXD3ZdmVhew0XzDvM5Sazn+S1KCjKrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=naa1bQQ3wDALov45zcQaVdVKBgdT17zOTWl4QEhFOG8=;
        b=mLoeUZ0RqPdbqVdWTw9NIm53Gby7cNBUyy3xKWie0WDG4KFxZeAU3d6YEw1g0mLAk0
         gfp+7ro3dWa3e+L/wifHUIemWfLdFt1zWfIQIOBrLiEzgZUReg9383mtE3kvIicjWtqv
         tJ44rMIhXRUBgEPWGgQFj2+8CJ0aBxYztKtuP+vG3lm6PsXuXtl8+rkuezIEkPDhR2B+
         POJ6rkmcWJYVrN9wzvQxaSSlxctffkI/yl+RL06qLEAB2GlbYr7tOsurFfrU+M06jND+
         uPchE1adLTyT8XICZyatDVHvEob/wF8hWmaGN9shEEdGVu4wyVhlxOA+uISomJkoMI2t
         2vjQ==
X-Gm-Message-State: AOAM531kGuXEJUtEaU8Hi3LEZkv4mXgATgapj5+6i+UvuKPYrR0ff1qC
        QfCtaanKAduV9aoXNLpjpMapuAEIHx8jcCZ2ksRqsA==
X-Google-Smtp-Source: ABdhPJxzzDQSWbH2ghhnUuIFIexqihxzGnBtqJqBe+e8bxF2gAEQoJIdhXmDkJE+CKWZpxU2vLu57zbsn/qJOMx7y6A=
X-Received: by 2002:a92:7102:0:b0:2c2:e590:9707 with SMTP id
 m2-20020a927102000000b002c2e5909707mr4456960ilc.10.1646030671243; Sun, 27 Feb
 2022 22:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20220225164231.904173-1-broonie@kernel.org>
In-Reply-To: <20220225164231.904173-1-broonie@kernel.org>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Mon, 28 Feb 2022 14:44:05 +0800
Message-ID: <CAJMQK-jGCX6Zp0gkfgqeA6=0zuWiSbWbytUixH3VFiwX9wtLNQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     broonie@kernel.org
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Allen Chen <allen.chen@ite.com.tw>,
        Hermes Wu <Hermes.Wu@ite.com.tw>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <robert.foss@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Feb 26, 2022 at 12:43 AM <broonie@kernel.org> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86 allmodconfig)
> failed like this:
>
> lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x10b: call to do_strncpy_from_user() with UACCESS enabled
> lib/strnlen_user.o: warning: objtool: strnlen_user()+0xbb: call to do_strnlen_user() with UACCESS enabled
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c: In function 'receive_timing_debugfs_show':
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   b5c84a9edcd418 ("drm/bridge: add it6505 driver")
>
> I have used the drm tree from yesterday instead.

hi all,

The following fix should be able to address the errors. Should it be
squashed into b5c84a9edcd418 ("drm/bridge: add it6505 driver")?

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
b/drivers/gpu/drm/bridge/ite-it6505.c
index fb16a176822d81..f2f101220ade94 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -289,7 +289,7 @@
 #define WORD_LENGTH_20BIT 2
 #define WORD_LENGTH_24BIT 3
 #define DEBUGFS_DIR_NAME "it6505-debugfs"
-#define READ_BUFFER_SIZE 200
+#define READ_BUFFER_SIZE 400

 /* Vendor option */
 #define HDCP_DESIRED 1
@@ -3074,7 +3074,7 @@ static ssize_t
receive_timing_debugfs_show(struct file *file, char __user *buf,
        struct it6505 *it6505 = file->private_data;
        struct drm_display_mode *vid = &it6505->video_info;
        u8 read_buf[READ_BUFFER_SIZE];
-       u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
+       u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
        ssize_t ret, count;

        if (!it6505)
