Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3701B0715
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 13:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTLNv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 07:13:51 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38519 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgDTLNv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Apr 2020 07:13:51 -0400
Received: by mail-ot1-f68.google.com with SMTP id q9so1065061otf.5;
        Mon, 20 Apr 2020 04:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K4XjsUvESAD3EDgKfZjMXyLx/uY6RXBIRC7F4v06agM=;
        b=Nkxynw8+9b3MQdIObL2JbN6bcQHEv5QrYLnkRgKMtor8x4xmNHaaiVr4c3YGo+B7ma
         yvSlDXtLchm78lQeFb6pR7AwDAK4suwELLUzfWQOErep1Z+kvPNHlNsgJwNpt4dVTPYr
         XFC4TQ8oyrLaQpVJbXaM138rTl7+rdT5R4rypba37SN5fwP8DQpKKfDQhuIRnvlztAvh
         1GBFji6CQStY8IVgekLP3dO/VnvHnoGCDlQF7fIjcLvyRwlbnyetCqeIBW2W1YDmdKNC
         7rdsM6XOozfl6pwXcqYaY+7NW6Hb+bHnEN/wHCDgzD5zZkvdeFy5Jmj6l9URr5MUwhK6
         DfQA==
X-Gm-Message-State: AGi0Pua9LbxSb21rjIBRzXXe1oTUfJE5dApp+n3Dc6wKpeeMsxGZKFen
        +0/fLQLIwAksmIPIKtTmhUtPjqdjL1JyZ0/FeqY=
X-Google-Smtp-Source: APiQypJJD78NrfsIlkNBCE8XdntQKmXswe3oYzWI4Nfrc4fca+90XQb3cLOc7nsFvj6mM5VvrwY2MbOjNd+7IZTEQLY=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr6317048otn.107.1587381230603;
 Mon, 20 Apr 2020 04:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200420210358.4c092dbc@canb.auug.org.au>
In-Reply-To: <20200420210358.4c092dbc@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Apr 2020 13:13:39 +0200
Message-ID: <CAMuHMdX8t=nQmBhNVadjV8PCOMhZP6BYZvo=zf5zZPrRSDwPgQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the renesas tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Apr 20, 2020 at 1:04 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Commit
>
>   dc7bf14a0895 ("arm64: dts: renesas: r8a77980: Fix IPMMU VIP[01] nodes")
>
> is missing a Signed-off-by from its committer.

Thank you, fixed in the fixes branch, but not in the next branch (the former
goes upstream as-is, the latter doesn't).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
