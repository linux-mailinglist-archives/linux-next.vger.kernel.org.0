Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44C34663A6
	for <lists+linux-next@lfdr.de>; Thu,  2 Dec 2021 13:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346792AbhLBMcW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Dec 2021 07:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346766AbhLBMcV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Dec 2021 07:32:21 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F08C061758
        for <linux-next@vger.kernel.org>; Thu,  2 Dec 2021 04:28:59 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id g14so115307751edb.8
        for <linux-next@vger.kernel.org>; Thu, 02 Dec 2021 04:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yIHJduGhi+IgJjblRtFiKjHLP7Ao4GSCzCbgjV6AI0g=;
        b=bEYsv4wF853W8UKT+8STBH1C/eBQtC+ON3Re4sV3zlkHai540cHzD6xE96e+vYUGZi
         UiohbLIkxHnwTZfDMk8iBLuuZC1mkyxp+elc2Tf9JiPj9KoORf+AfZ+2kv8le9J9oo7X
         lm/NBTxhXW4+XeCD2V/KGi9weCBYzO1T6Rc+PzBInJF1bevBYSVqQO7J3gCUriljU9nr
         FAHXa71KoufMw1NkUz2bQnW9uZUm+9EdfJHuxCZwSpEaKB6GCghqJGU8t4DAgaKVsEJ9
         pGJ8mZC7zq3UTM1ntOtki3tLCO0ktvnYf0xTP8MdHcy821ym/i1+0j6sccsMWHLCfqAL
         4huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yIHJduGhi+IgJjblRtFiKjHLP7Ao4GSCzCbgjV6AI0g=;
        b=eFkGd8eEsAVKxMcFFlsnRnsm5u/bsBa4wQapDXQdXMphUmWhl0CXzwABNr14K1o32h
         QV+jdMiS66ZUHxEkLoKNE/fIj/GgZPEZiaCMJW2dEkIbKMV8qa4EAon6cZCgmFvMWRtE
         aZyEkIiMCkWG0uiaP8PSK9ZyIncB26/EmH4PcQyDczapODRDT1mVz1cggko0gvFS4v2Q
         4N5mrwzfRquoqDuFS33kc9yWtAvwRzRpAhF6RVxYCsBXGruF6/bmvxjHAaz+lJEUBv3o
         gYgIKaGagyfWxGIQX+exTgFHkcrBa4qi3X+5L8+QNm7OKAkXbqfdKSNzjsgiS1ysSccD
         ZH+Q==
X-Gm-Message-State: AOAM530Iw9nVHkBiJEkrMvQv1eibpVTHG6iQY0v5f+yfqkjVSd1A8Oun
        hEC+Zbov6i8G6CjAQOCqMigZkTWHXpp3IR2whdRtJA==
X-Google-Smtp-Source: ABdhPJwVLTfOeFrJH1vtaO5VgCmVt8kl/7m1GwfsGdFPILzfElCaVjFePEsuiYfj32fzPRUhQkb9mSEvHSNwJ50Wmo0=
X-Received: by 2002:a05:6402:4389:: with SMTP id o9mr17620193edc.138.1638448137066;
 Thu, 02 Dec 2021 04:28:57 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuupqqemLbgoVL2kYL4d2AtZLBo1xcshWWae7gX5Ln-iA@mail.gmail.com>
In-Reply-To: <CA+G9fYuupqqemLbgoVL2kYL4d2AtZLBo1xcshWWae7gX5Ln-iA@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Thu, 2 Dec 2021 13:28:46 +0100
Message-ID: <CADYN=9KeKhZ-OSbx1QHKYfXu+p-nXVjubbay1sXd_g75LLSZRg@mail.gmail.com>
Subject: Re: [next] WARNING: CPU: 2 PID: 66 at kernel/locking/rwsem.c:1298 __up_read
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        sean@geanix.com, Miquel Raynal <miquel.raynal@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-block <linux-block@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 30 Nov 2021 at 18:01, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> [Please ignore this email if it is already reported]
>
> Regression found on qemu_arm64.
> Following kernel warnings reported on Linux next-20211130 while booting.

I bisected down to 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT")

and when I reverted 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT") and the
3 releated patches so patch 1ebe2e5f9d68 was reverted cleanly I
managed to boot without
a warning.

Related patches from next-20211130:
9f18db572c97 ("block: don't set GENHD_FL_NO_PART for hidden gendisks")
430cc5d3ab4d ("block: cleanup the GENHD_FL_* definitions")
a4561f9fccc5 ("sr: set GENHD_FL_REMOVABLE earlier")

With this said, if I revert 9d6abd489e70 ("mtd: core: protect access
to MTD devices while in suspend")
I didn't see the warning either.

Any idea what can be wrong here or what a fix could be?

Only apply this patch from Geert
https://lore.kernel.org/lkml/c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be/
makes the warning go away too.

Cheers,
Anders
