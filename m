Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D4E16B3E9
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2020 23:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgBXW1m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 17:27:42 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:46331 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbgBXW1m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Feb 2020 17:27:42 -0500
Received: by mail-io1-f65.google.com with SMTP id e7so1865871ioe.13;
        Mon, 24 Feb 2020 14:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=okoEokk8koFi0gbrNVrs/CtK734/+xWplYEPxW27+Gc=;
        b=Wci2Ct75KDbCFUhLx2OoDlxXrlzD6YzLomd/+CaJKS7ovaUCAfTfeP+SKU3NDEQBKG
         X5UJJrKhPzn5aPiK0tCRQJAOx6GCV3NJsv3ahtsP55qKWaBjuwD0lhuhZ7DUAnzH2Bqi
         xTdlPhbbBl8o0UjlB3xFGoTkKtSRVV4p9yrPaPR5H7gbe9K3tQbQ7wWiI5CqXlpdFWM8
         f/0JJGm1fMj8xFUACo8xRr+jXCzDwQolfdJxkynDJdkQ2UF4Th9PtcXeaVPYfqoswlV8
         Aq/PVHB7koAmFnt/R7pFT6gZpoWuv9XuLOvXP3EaArqfs7jj/mUGLbxUcDBhuwbfpng2
         nQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=okoEokk8koFi0gbrNVrs/CtK734/+xWplYEPxW27+Gc=;
        b=LtWhOWBg4FDJdDjGaBzQcYApdIoX3PqBiDtIm0Ep0iiiCPLZbI8IyYxqipMOdAG5JR
         9dolEYQFgoDlv4mwB9r8WOtROuI2CA9Q4owI7dl6GMTmDQXqcMoLNAMoP1uDNwpJMX1x
         SdnBKtSOWhNxG1NWCZXw7NryMDmQ8byxe7ys7RKIc02ZojMlww67PFqfAeauTfvOd6Gk
         loh2OxHtlfdfpedbQn/N9l8d/nNfZGKH3VOer9uq+QwzsPK7PDnW+9uo/SOQV+66HIV9
         AT4c4ZHoHHF4pfJ2ZtFZLiwod1sbFzEK7dgqKO84zn0sK3yUnr6m5WB9ODPBm8vWckoB
         XStQ==
X-Gm-Message-State: APjAAAVhnCJuCe9ahEuCTNDMUud4ybPsTlHvgchbSOvykSEwUTFhzr+K
        ytyJ3tiH8kua+UseiGXtrq9uS8jpZItF3q1wtqeBQA==
X-Google-Smtp-Source: APXvYqyvB53aFrIiMdZSK+Pyl7Sam7svWwN4rs//H5xeSV3qfK+PHY59oqCwhlbWovNG9LjrT85SyFgM+QyFjzuDSKs=
X-Received: by 2002:a02:5b8a:: with SMTP id g132mr2106136jab.78.1582583261895;
 Mon, 24 Feb 2020 14:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20200225075237.61e103e4@canb.auug.org.au>
In-Reply-To: <20200225075237.61e103e4@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Mon, 24 Feb 2020 16:27:31 -0600
Message-ID: <CAH2r5mv0YhqRNYogxo4TkK9FdzG1JrDz1SBfQt2+91RgdiAEfg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

On Mon, Feb 24, 2020 at 2:52 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   39452a5239bb ("cifs: call wake_up(&server->response_q) inside of cifs_reconnect()")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
