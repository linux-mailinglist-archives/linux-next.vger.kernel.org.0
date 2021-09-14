Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF52D40A1DC
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 02:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237007AbhINAZr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Sep 2021 20:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236521AbhINAZq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Sep 2021 20:25:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA58C061574
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 17:24:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g1so13304022lfj.12
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 17:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ilht7yuGeza7KxnmHTP+E2966EzjBhfJp58VMsQTPTY=;
        b=OyWldn4cRJVLyXq6LgbpKqWBqxTaQjehON/ag/GIf4HbIUXBoHl9V8OzGKT2Ylw04i
         uUG63w1xUjKTcrlLMVBNRKtBukGdfVoxMaymciw4pdsgxR1SflagLJb66lTfifVfnZuV
         nGyWGAvhm/vMudecgclcQqVLBtG8dwi+c08xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ilht7yuGeza7KxnmHTP+E2966EzjBhfJp58VMsQTPTY=;
        b=LpfMjFlzrvUAK2CDY78qGhkrnhETUIbfwR8KmLya1U9mKUWaEGX/Rm7I/A1UtxRfIC
         mFfgYtxjS3KO4p+D5e28hqbNeQSP8nDb5rB7iWxaagv5Xx1eC+2SX/D+NPUFhXTQTO7w
         idfrxXYaIa/a925dOA9hezCWLoAx39XTGP9PoV4WJwxXUrRH6TTY5+nl6rKgaRCXGV95
         yYVQ5YsVt4uwzCQYtKfDNZnRPklCEy7yQRetwFs8thnjT1Z/cFNarf+C+QQBD8UgK42W
         UofzQu/IJW+nSEoMSAMH4vRY5wrxthXTRU2+b/I5twmB/sU7xYmSgv246RmMfxH3lHKd
         rb3Q==
X-Gm-Message-State: AOAM530URFuOpsKcpKJYHadEWhjoOt1pHLfTZUUwK3iHkgnmh+hPhbOO
        6MhRoR5vGDklR4f2xNCmg9T4xH3BAvfqD4CR2/w=
X-Google-Smtp-Source: ABdhPJznJ174iLPotlnBg5vQMIbv5CCUfmpY1W8eeUj5NhwCq36Gvu9Pdh+56d43ZuCUI+dfOP5Orw==
X-Received: by 2002:a05:6512:c12:: with SMTP id z18mr1133084lfu.335.1631579068174;
        Mon, 13 Sep 2021 17:24:28 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id o4sm303244lfi.16.2021.09.13.17.24.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 17:24:27 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id g1so13303909lfj.12
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 17:24:27 -0700 (PDT)
X-Received: by 2002:a05:6512:94e:: with SMTP id u14mr5107509lft.173.1631579067472;
 Mon, 13 Sep 2021 17:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au> <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
In-Reply-To: <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 13 Sep 2021 17:24:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
Message-ID: <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 13, 2021 at 5:19 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What version of gcc is this? Are you maybe on gcc-4.9 and we just
> didn't check that properly?

Hmm. That version check works for me (tested by just arbitrarily
making min-tool-version return version 15 for gcc ;)

So you got far enough that I don't believe you have gcc-4.

I have no idea why it then complains about removal of the GCC4 macros.

Can somebody hit me with the clue-bat?

            Linus
