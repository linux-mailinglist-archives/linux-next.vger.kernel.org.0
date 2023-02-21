Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32AC69DBBE
	for <lists+linux-next@lfdr.de>; Tue, 21 Feb 2023 09:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbjBUIRj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Feb 2023 03:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbjBUIRi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Feb 2023 03:17:38 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C78C2056E
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2023 00:17:36 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id e10so2747127vkm.11
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2023 00:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676967455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EbkGYuipzj4eszkfeMPyhLXMXgTlWC99qfSAvj3EJ4E=;
        b=HteVRIi9KBGcncf84Zy6bziMITbeU1dBpZ+eip8g3lt2ZTAlDAA2lBzP8W9wUnjzfi
         fMBggOgGKGj84Gowy88qs/PEk/xWoPekQKqMZZ7mg6F++fIVS5TNWFKwKmDLk0hWneaj
         8ozgj2ZbJJ+wAiQnHzRID2m4ifV4i9E3h/8Gd7D0B37/u0nPKG9dyf/i9VFXnISmc8nH
         ZnM2PpuIqUZVeYVyogACxIy7fVBURnm6hUuF49baZUlQ/C6X/EoMas+7o+k44CAb10oY
         ZhWqqh9lYzFfFhfSEB0Kf5qoHLC9qkIa+NM3UdACq6rOlHJQDadrOBYYIHrzBSLKwSTI
         MFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676967455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbkGYuipzj4eszkfeMPyhLXMXgTlWC99qfSAvj3EJ4E=;
        b=XwlwpGwKv1HJ1Gv4j7OaK6HcFZq+4B2OnrWU9cT5tv/Sit8pUhAtb2FHzvBv4byiWl
         LJcVmHWVVvAjO7cZHU59oQkYdK33VPqw9POQQSpG7FSlbWDi1SA5Ah0ABmQqrZcqCm8h
         xMC6OUBHaiR/Xjki/sZVSdZvI6ZmzZqOrKAiTxpwkYRv4c9lCT2AbEUOjTxHKaIA6+Nd
         fw6XKIZ0G7wWhXP9/dNDjMPUG6G0dTF6dAr4QBJBFaVNSfiTpBCsbCpYXVIeFwbUaqir
         kwovUwNgTIG0ZAVGjtzDI0goPS1VEMo/+jrqSFm+V1AWiIx7MXeTXNR1M29c2MmM2w4Y
         qxVQ==
X-Gm-Message-State: AO0yUKXoaAwmd1HH/vLAOPqlZOHcOEu1xH3kCS3tQzLRHp4EKAjs0DTO
        mA4o8U/SIUOjTAVja1oiUhDYhIzx+mKWPLvR6hBpymvSzgeDxOlu
X-Google-Smtp-Source: AK7set93akSk3v6i5Uo8IhjBXShhMZBPmho8GivnCfQv3pCtiGouS4Q/+4c8rTilRYQJkm1Lh2HJvtEaqYpvZmX5hS0=
X-Received: by 2002:a1f:2305:0:b0:40e:eec8:6523 with SMTP id
 j5-20020a1f2305000000b0040eeec86523mr321309vkj.43.1676967455155; Tue, 21 Feb
 2023 00:17:35 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsQZrpiLRN1=zW-VRGZ57smV5OW5ZAF4rbLPFA05F5zYg@mail.gmail.com>
In-Reply-To: <CA+G9fYsQZrpiLRN1=zW-VRGZ57smV5OW5ZAF4rbLPFA05F5zYg@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 21 Feb 2023 13:47:24 +0530
Message-ID: <CA+G9fYuijdvK5ikvchj5_XxfimNeTzzWv1DL05458W3C7C0TvQ@mail.gmail.com>
Subject: Re: next: 32-bit: ERROR: modpost: "__aeabi_uldivmod"
 [fs/btrfs/btrfs.ko] undefined!
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        linux-btrfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
        Josef Bacik <josef@toxicpanda.com>, Chris Mason <clm@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 20 Feb 2023 at 16:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> [Please ignore this email if it is already reported]
>
> Following build error noticed on 32bit arm and i386 with kselftest merge
> configs with gcc-10/12 on today's Linux next-20230220 tag.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build regression:
>   - gcc-10-lkftconfig-kselftest
>   - gcc-12-lkftconfig-kselftest
>
> Build error:
> ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> make[2]: Target '__modpost' not remade because of errors.
> make[1]: *** [Makefile:1980: modpost] Error 2

Anders ran the bisect and found the first bad commit,

# first bad commit:
  [4a8c6e8a6dc8ae4ce2adb1f807b61b6d99088293]
  btrfs: replace btrfs_io_context::raid_map with a fixed u64 value

The reported build issues still noticed on today's Linux next-20230221.

Related threads are found in lore,
https://lore.kernel.org/lkml/CAMuHMdVwXB4YsCFEpLoTm8pxyjMty6tAT7joNj2EME4ynY8keQ@mail.gmail.com/

- Naresh
